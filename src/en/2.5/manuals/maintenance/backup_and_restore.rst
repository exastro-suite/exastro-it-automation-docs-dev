============================
Data backup/restore
============================

Goal
====

| This document aims to describe how to backup and restore persistent data used by the Exastro system.
| If the user has access to databackup options from a public cloud, they can use that as well.


Pre-requisites
========

| The backup/restore process described in this document requires that the following conditions are met,

Conditions
----

- | The user must be able to run the following commands.

  - :command:`tar`
  - :command:`kubectl`

- | The environment server must have enough disk space.

.. _backup_encrypt_key:

Encrypt key backup
------------------------

.. include:: ../../include/backup_encrypt_key_k8s.rst

Overview
====

| The following data can be Backuped/Restored.

- | Backup/Restore target

  - Exastro Platform database
  - Exastro IT Automation database
  - Exastro IT Automation shared files

| The user will use the :command:`kubectl` command to backup/restore said data.

| The process will pause the reverse proxy in order to prevent the user from writing data.
| After that, the backyard process will be paused before the data will be backed up.
| Lastly, the Pod number will be returned to the numbers between the backup process started.

| The restore process will be the undergo the same process.

.. danger::
  | This procedure will stop the service.

Backup
============

Stop service
------------

.. include:: ../../include/stop_service_k8s_backup.rst

Backup
------------

| The procedure depends on if the Exastro Platform and Exastro IT Automation shares database or if they are divided.


#. Creating container for maintenance

   | Create a container for backups.

   .. code-block:: bash
      :caption: Command
      :linenos:

      cat <<_EOF_ | kubectl apply -f - --namespace exastro
      apiVersion: v1
      kind: Pod
      metadata:
        name: exastro-maintenance
        namespace: exastro
      spec:
        containers:
        - command:
          - sh
          - -c
          args:
          - |
            #!/bin/bash
            sleep 3600
          env:
          - name: PF_DB_DATABASE
            valueFrom:
              configMapKeyRef:
                key: DB_DATABASE
                name: platform-params-pf-database
          - name: PF_DB_HOST
            valueFrom:
              configMapKeyRef:
                key: DB_HOST
                name: platform-params-pf-database
          - name: PF_DB_PORT
            valueFrom:
              configMapKeyRef:
                key: DB_PORT
                name: platform-params-pf-database
          - name: PF_DB_ADMIN_PASSWORD
            valueFrom:
              secretKeyRef:
                key: DB_ADMIN_PASSWORD
                name: platform-secret-pf-database
          - name: PF_DB_ADMIN_USER
            valueFrom:
              secretKeyRef:
                key: DB_ADMIN_USER
                name: platform-secret-pf-database
          - name: ITA_DB_DATABASE
            valueFrom:
              configMapKeyRef:
                key: DB_DATABASE
                name: ita-params-ita-database
          - name: ITA_DB_HOST
            valueFrom:
              configMapKeyRef:
                key: DB_HOST
                name: ita-params-ita-database
          - name: ITA_DB_PORT
            valueFrom:
              configMapKeyRef:
                key: DB_PORT
                name: ita-params-ita-database
          - name: ITA_STORAGEPATH
            valueFrom:
              configMapKeyRef:
                key: STORAGEPATH
                name: ita-params-ita-global
          - name: ITA_DB_ADMIN_PASSWORD
            valueFrom:
              secretKeyRef:
                key: DB_ADMIN_PASSWORD
                name: ita-secret-ita-database
          - name: ITA_DB_ADMIN_USER
            valueFrom:
              secretKeyRef:
                key: DB_ADMIN_USER
                name: ita-secret-ita-database
          image: mariadb:10.9
          imagePullPolicy: IfNotPresent
          name: exastro-maintenance
          resources: {}
          securityContext:
            allowPrivilegeEscalation: false
            readOnlyRootFilesystem: false
            runAsGroup: 1000
            runAsNonRoot: true
            runAsUser: 1000
          volumeMounts:
          - mountPath: /storage
            name: volume-ita-backup-storage
        volumes:
        - name: volume-ita-backup-storage
          persistentVolumeClaim:
            claimName: pvc-ita-global
        restartPolicy: Always
        securityContext: {}
        serviceAccount: default
        serviceAccountName: default
      _EOF_

#. Acquiring Database backup

   | Acquire the :command:`mysqldump` backup to the Database.
   | The process differs depending on if the Exastro Platform and Exastro IT Automation database server is shared or divided.

   .. tabs::

      .. group-tab::Shared database

          .. code-block:: bash
             :caption: Database backup command for application

             kubectl exec -it exastro-maintenance --namespace exastro -- sh -c 'mysqldump -h ${PF_DB_HOST} -P ${PF_DB_PORT} -u ${PF_DB_ADMIN_USER} -p${PF_DB_ADMIN_PASSWORD} --all-databases --add-drop-table' | gzip > exastro_mysqldump_platform_db_`date +"%Y%m%d-%H%M%S"`.sql.gz

          .. code-block:: bash
             :caption: Database backup command for user

             kubectl exec -it exastro-maintenance --namespace exastro -- sh -c 'mysqldump -h ${PF_DB_HOST} -P ${PF_DB_PORT} -u ${PF_DB_ADMIN_USER} -p${PF_DB_ADMIN_PASSWORD} --allow-keywords mysql' | gzip > exastro_mysqldump_platform_user_`date +"%Y%m%d-%H%M%S"`.sql.gz

      .. group-tab:: Divided database

          .. code-block:: bash
             :caption: Database backup command for Exastro platform application

             kubectl exec -it exastro-maintenance --namespace exastro -- sh -c 'mysqldump -h ${PF_DB_HOST} -P ${PF_DB_PORT} -u ${PF_DB_ADMIN_USER} -p${PF_DB_ADMIN_PASSWORD} --all-databases --add-drop-table' | gzip > exastro_mysqldump_platform_db_`date +"%Y%m%d-%H%M%S"`.sql.gz

          .. code-block:: bash
             :caption: Database backup command for Exastro platform user

             kubectl exec -it exastro-maintenance --namespace exastro -- sh -c 'mysqldump -h ${PF_DB_HOST} -P ${PF_DB_PORT} -u ${PF_DB_ADMIN_USER} -p${PF_DB_ADMIN_PASSWORD} --allow-keywords mysql' | gzip > exastro_mysqldump_platform_user_`date +"%Y%m%d-%H%M%S"`.sql.gz

          .. code-block:: bash
             :caption: Database backup command for Exastro IT Automation application

             kubectl exec -it exastro-maintenance --namespace exastro -- sh -c 'mysqldump -h ${ITA_DB_HOST} -P ${ITA_DB_PORT} -u ${ITA_DB_ADMIN_USER} -p${ITA_DB_ADMIN_PASSWORD} --all-databases --add-drop-table' | gzip > exastro_mysqldump_ita_db_`date +"%Y%m%d-%H%M%S"`.sql.gz

          .. code-block:: bash
             :caption: Database backup command for Exastro IT Automation user

             kubectl exec -it exastro-maintenance --namespace exastro -- sh -c 'mysqldump -h ${ITA_DB_HOST} -P ${ITA_DB_PORT} -u ${ITA_DB_ADMIN_USER} -p${ITA_DB_ADMIN_PASSWORD} --allow-keywords mysql' | gzip > exastro_mysqldump_ita_user_`date +"%Y%m%d-%H%M%S"`.sql.gz

#. Acquire backup files

   | Acquire Exastro IT Automation's file backup.

   .. code-block:: bash
      :caption: command

      kubectl exec -i exastro-maintenance --namespace exastro -- sh -c 'tar zcvf - ${ITA_STORAGEPATH}' > exastro_storage_backup_ita_`date +"%Y%m%d-%H%M%S"`.tar.gz

#. Delete container for maintenance

   | Create container for Backup operations

   .. code-block:: bash
      :caption: Command

      kubectl delete pod exastro-maintenance --namespace exastro

Restart service
------------

.. include:: ../../include/start_service_k8s_backup.rst


Restore
========

.. _check_replica_count_restore:

Stop service
------------

.. include:: ../../include/stop_service_k8s_backup.rst

Restore
--------

| The process differs depending on if the Exastro Platform and Exastro IT Automation database server is shared or divided.

#. Create container for maintenance

   | Create container for restoration operation

   .. code-block:: bash
      :caption: Command
      :linenos:

      cat <<_EOF_ | kubectl apply -f - --namespace exastro
      apiVersion: v1
      kind: Pod
      metadata:
        name: exastro-maintenance
        namespace: exastro
      spec:
        containers:
        - command:
          - sh
          - -c
          args:
          - |
            #!/bin/bash
            sleep 3600
          env:
          - name: PF_DB_DATABASE
            valueFrom:
              configMapKeyRef:
                key: DB_DATABASE
                name: platform-params-pf-database
          - name: PF_DB_HOST
            valueFrom:
              configMapKeyRef:
                key: DB_HOST
                name: platform-params-pf-database
          - name: PF_DB_PORT
            valueFrom:
              configMapKeyRef:
                key: DB_PORT
                name: platform-params-pf-database
          - name: PF_DB_ADMIN_PASSWORD
            valueFrom:
              secretKeyRef:
                key: DB_ADMIN_PASSWORD
                name: platform-secret-pf-database
          - name: PF_DB_ADMIN_USER
            valueFrom:
              secretKeyRef:
                key: DB_ADMIN_USER
                name: platform-secret-pf-database
          - name: ITA_DB_DATABASE
            valueFrom:
              configMapKeyRef:
                key: DB_DATABASE
                name: ita-params-ita-database
          - name: ITA_DB_HOST
            valueFrom:
              configMapKeyRef:
                key: DB_HOST
                name: ita-params-ita-database
          - name: ITA_DB_PORT
            valueFrom:
              configMapKeyRef:
                key: DB_PORT
                name: ita-params-ita-database
          - name: ITA_STORAGEPATH
            valueFrom:
              configMapKeyRef:
                key: STORAGEPATH
                name: ita-params-ita-global
          - name: ITA_DB_ADMIN_PASSWORD
            valueFrom:
              secretKeyRef:
                key: DB_ADMIN_PASSWORD
                name: ita-secret-ita-database
          - name: ITA_DB_ADMIN_USER
            valueFrom:
              secretKeyRef:
                key: DB_ADMIN_USER
                name: ita-secret-ita-database
          image: mariadb:10.9
          imagePullPolicy: IfNotPresent
          name: exastro-maintenance
          resources: {}
          securityContext:
            allowPrivilegeEscalation: false
            readOnlyRootFilesystem: false
            runAsGroup: 1000
            runAsNonRoot: true
            runAsUser: 1000
          volumeMounts:
          - mountPath: /storage
            name: volume-ita-backup-storage
        volumes:
        - name: volume-ita-backup-storage
          persistentVolumeClaim:
            claimName: pvc-ita-global
        restartPolicy: Always
        securityContext: {}
        serviceAccount: default
        serviceAccountName: default
      _EOF_

#. Start Database restoration

   | Restore :command:`mysqldump` to database
   | The process differs depending on if the Exastro Platform and Exastro IT Automation database server is shared or divided.

   .. tabs::

      .. group-tab:: Shared database

          .. code-block:: bash
             :caption: Database restore command for user

             gzip -dc exastro_mysqldump_platform_user_YYYYMMDD-HHmmss.sql.gz | kubectl exec -i exastro-maintenance --namespace exastro -- sh -c 'mysql -h ${PF_DB_HOST} -P ${PF_DB_PORT} -u ${PF_DB_ADMIN_USER} -p${PF_DB_ADMIN_PASSWORD} mysql'

          .. code-block:: bash
             :caption: Database restore command for application

             gzip -dc exastro_mysqldump_platform_db_YYYYMMDD-HHmmss.sql.gz | sed -e 's/DEFINER[ ]*=[ ]*[^*]*\*/\*/'| kubectl exec -i exastro-maintenance --namespace exastro -- sh -c 'mysql -h ${PF_DB_HOST} -P ${PF_DB_PORT} -u ${PF_DB_ADMIN_USER} -p${PF_DB_ADMIN_PASSWORD}'

      .. group-tab:: Divided database

          .. code-block:: bash
             :caption: Database restore command for Exastro Platform user

             gzip -dc exastro_mysqldump_platform_user_YYYYMMDD-HHmmss.sql.gz | kubectl exec -i exastro-maintenance --namespace exastro -- sh -c 'mysql -h ${PF_DB_HOST} -P ${PF_DB_PORT} -u ${PF_DB_ADMIN_USER} -p${PF_DB_ADMIN_PASSWORD} mysql'

          .. code-block:: bash
             :caption: Database restore command for Exastro Platform application

             gzip -dc exastro_mysqldump_platform_db_YYYYMMDD-HHmmss.sql.gz | sed -e 's/DEFINER[ ]*=[ ]*[^*]*\*/\*/'| kubectl exec -i exastro-maintenance --namespace exastro -- sh -c 'mysql -h ${PF_DB_HOST} -P ${PF_DB_PORT} -u ${PF_DB_ADMIN_USER} -p${PF_DB_ADMIN_PASSWORD}'

          .. code-block:: bash
             :caption: Database restore command for Exastro IT Automation user

             gzip -dc exastro_mysqldump_ita_user_YYYYMMDD-HHmmss.sql.gz | kubectl exec -i exastro-maintenance --namespace exastro -- sh -c 'mysql -h ${ITA_DB_HOST} -P ${ITA_DB_PORT} -u ${ITA_DB_ADMIN_USER} -p${ITA_DB_ADMIN_PASSWORD} mysql'

          .. code-block:: bash
             :caption: Database restore command for Exastro IT Automation application

             gzip -dc exastro_mysqldump_ita_db_YYYYMMDD-HHmmss.sql.gz | sed -e 's/DEFINER[ ]*=[ ]*[^*]*\*/\*/'| kubectl exec -i exastro-maintenance --namespace exastro -- sh -c 'mysql -h ${ITA_DB_HOST} -P ${ITA_DB_PORT} -u ${ITA_DB_ADMIN_USER} -p${ITA_DB_ADMIN_PASSWORD}'

#. Start file restoration

   | Acquire Exastro IT Automation file back up.

   .. code-block:: bash
      :caption: Command

      kubectl exec -i exastro-maintenance --namespace exastro -- sh -c 'tar zxvf - -C ${ITA_STORAGEPATH}' < exastro_storage_backup_ita_YYYYMMDD-HHmmss.tar.gz

#. Delete maintenance container

   | Create container for backup operations.

   .. code-block:: bash
      :caption: Command

      kubectl delete pod exastro-maintenance --namespace exastro

Restart service
------------

.. include:: ../../include/start_service_k8s_backup.rst


Troubleshooting
======================

Error 500 occurs after restore
-------------------------------

- Error

| Error 500 occurs after the restore process has finished.

- Solution
 
| Delete all resources and rerun :command:`helm install` command to re-install the system.