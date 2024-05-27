.. raw:: html

   <script>
   $(window).on('load', function () {
      setTimeout(function(){
        for (var i = 0; i < $("table.filter-table").length; i++) {
          $("[id^='ft-data-" + i + "-2-r']").removeAttr("checked");
          $("[id^='select-all-" + i + "-2']").removeAttr("checked");
          $("[id^='ft-data-" + i + "-2-r'][value^='可']").prop('checked', true);
          $("[id^='ft-data-" + i + "-2-r'][value*='必須']").prop('checked', true);
          tFilterGo(i);
        }
      },200);
   });
   </script>

=======================
Helm chart (Kubernetes)
=======================

Introduction
====

| This document aims to explain how to install Exastro Platform and/or Exastro IT Automation on Kubernetes.

Features
====

| This method allows the user to install Exastro IT Automation with the highest level of availability and service.
| For a more simple installation for testing and temporary usage, we recommend the :doc:`Docker Compose version<docker_compose>`.

Prerequisites
========

- Client requirements

  | The following describes confirmed compatible client application as well as their versions.

  .. list-table:: Client requirements
   :widths: 20, 20
   :header-rows: 1

   * - Application
     - Version
   * - Helm
     - v3.9.x
   * - kubectl
     - 1.23

- Deploy environment

  | The following describes confirmed compatible operation systems as well as their versions.

  .. list-table:: Hardware requirements (minimum requirements)
   :widths: 20, 20
   :header-rows: 1

   * - Resource type
     - Required resource
   * - CPU
     - 2 Cores (3.0 GHz, x86_64)
   * - Memory
     - 4GB
   * - Storage (Container image size)
     - 10GB
   * - Kubernetes (Container image size)
     - 1.23 or later

  .. list-table:: Hardware requirements (Recommended requirements)
   :widths: 20, 20
   :header-rows: 1

   * - Resource type
     - Required resource
   * - CPU
     - 4 Cores (3.0 GHz, x86_64)
   * - Memory
     - 16GB
   * - Storage (Container image size)
     - 120GB
   * - Kubernetes (Container image size)
     - 1.23 or later

  .. warning::
    | The required resources for the minimum configuration are for Exastro IT Automation's core functions. Additional resources will be required if you are planning to deploy external systems, such as GitLab and Ansible Automation Platform.
    | Users will have to prepare an additional storage area if they wish to persist databases or files.
    | The storage space is only an estimate and varies based on the user's needs. Make sure to take that into account when securing storage space.

- Communication Protocols

  - The client must be able to access the deploying container environment.
  - The user will need 2 ports. One for the Platform administrator and one for normal users.
  - The user must be able to connect to Docker Hub in order to acquire the container image from the container environment.

- External components

  - MariaDB or MySQL server
  - Must be able to create Gitlab accounts and repositories.

  .. warning::
    | If the user is construcing the GitLab environment on the same cluster, the GitLab's minimum system requirements changes in order to support the additional load.
    | If the user is construcing the Database environment on the same cluster, the Database's minimum system requirements changes in order to support the additional load.


Preparation
==================

Register Helm repository
---------------------

| The Exastro system is constructed by the following 2 applications.
| All the Exastro tools exists on the same Helm repository.

- Shared Platform (Exastro Platform)
- Exastro IT Automation

.. csv-table::
 :header: Repository
 :widths: 50

 https://exastro-suite.github.io/exastro-helm/

.. code-block:: shell
   :linenos:
   :caption: Cmmand

   # Register Exastro system's Helm repository.
   helm repo add exastro https://exastro-suite.github.io/exastro-helm/ -n exastro
   # Update repository information
   helm repo update

Gather default setting values
----------------------

| The following command outputs the values.yaml default values. This makes it easier to manage the input parameters.

.. code-block:: shell
   :caption: Command

   helm show values exastro/exastro > exastro.yaml

.. raw:: html

   <details>
     <summary>exastro.yaml</summary>

.. code-block:: yaml
   :linenos:

   # Default values for Exastro.
   # This is a YAML-formatted file.
   # Declare variables to be passed into your templates.
   global:
     itaGlobalDefinition:
       config:
         DEFAULT_LANGUAGE: "ja"
         LANGUAGE: "en"
         TZ: "Asia/Tokyo"
       secret:
         ENCRYPT_KEY: ""
       persistence:
         reinstall: false
         accessMode: ReadWriteMany
         size: 10Gi
         volumeType: hostPath # e.g.) hostPath or AKS
         storageClass: "-" # e.g.) azurefile or - (None)
         # matchLabels:
         #   release: "stable"
         # matchExpressions:
         #   - {key: environment, operator: In, values: [dev]}
     itaDatabaseDefinition:
       config:
         DB_VENDOR: "mariadb"
         DB_HOST: "mariadb"
         DB_PORT: "3306"
         DB_DATABASE: "ITA_DB"
       secret:
         DB_ADMIN_USER: ""
         DB_ADMIN_PASSWORD: ""
         DB_USER: ""
         DB_PASSWORD: ""
     pfGlobalDefinition:
       config:
         DEFAULT_LANGUAGE: "ja"
         LANGUAGE: "en"
         TZ: "Asia/Tokyo"
       secret:
         ENCRYPT_KEY: ""
     pfDatabaseDefinition:
       config:
         DB_VENDOR: "mariadb"
         DB_HOST: "mariadb"
         DB_PORT: "3306"
         DB_DATABASE: "platform"
       secret:
         DB_ADMIN_USER: ""
         DB_ADMIN_PASSWORD: ""
         DB_USER: ""
         DB_PASSWORD: ""
     keycloakDefinition:
       secret:
         SYSTEM_ADMIN: ""
         SYSTEM_ADMIN_PASSWORD: ""
         KEYCLOAK_DB_USER: ""
         KEYCLOAK_DB_PASSWORD: ""
     gitlabDefinition:
       config:
         GITLAB_PROTOCOL: "http"
         GITLAB_HOST: "None" # "gitlab" if use container.
         GITLAB_PORT: "8080"
       secret:
         GITLAB_ROOT_PASSWORD: ""
         GITLAB_ROOT_TOKEN: ""
     mongoDefinition:
       config:
         MONGO_PROTOCOL: "http"
         MONGO_HOST: "mongo" # "mongo" if use container.
         MONGO_PORT: "27017"
       secret:
         MONGO_ADMIN_USER: ""
         MONGO_ADMIN_PASSWORD: ""

   exastro-it-automation:

     ita-api-admin:
       replicaCount: 1
       image:
         repository: "docker.io/exastro/exastro-it-automation-api-admin"
         tag: ""
         pullPolicy: IfNotPresent
       extraEnv:
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"

     ita-api-organization:
       replicaCount: 1
       image:
         repository: "docker.io/exastro/exastro-it-automation-api-organization"
         tag: ""
         pullPolicy: IfNotPresent
       extraEnv:
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"

     ita-api-oase-receiver:
       replicaCount: 1
       image:
         repository: "docker.io/exastro/exastro-it-automation-api-oase-receiver"
         tag: ""
         pullPolicy: IfNotPresent
       extraEnv:
         LISTEN_PORT: "8000"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"

     ita-by-ansible-execute:
       replicaCount: 1
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-ansible-execute"
         tag: ""
         pullPolicy: IfNotPresent
       extraEnv:
         EXECUTE_INTERVAL: "10"
         ANSIBLE_AGENT_IMAGE: "docker.io/exastro/exastro-it-automation-by-ansible-agent"
         ANSIBLE_AGENT_IMAGE_TAG: ""
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       serviceAccount:
         create: false
         name: "ita-by-ansible-execute-sa"

     ita-by-ansible-legacy-role-vars-listup:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-ansible-legacy-role-vars-listup"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-ansible-legacy-vars-listup:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-ansible-legacy-vars-listup"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-ansible-pioneer-vars-listup:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-ansible-pioneer-vars-listup"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-ansible-towermaster-sync:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-ansible-towermaster-sync"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-cicd-for-iac:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-cicd-for-iac"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-collector:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-collector"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-conductor-regularly:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-conductor-regularly"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-conductor-synchronize:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-conductor-synchronize"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-excel-export-import:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-excel-export-import"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-execinstance-dataautoclean:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-execinstance-dataautoclean"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-file-autoclean:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-file-autoclean"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-hostgroup-split:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-hostgroup-split"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-menu-create:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-menu-create"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-menu-export-import:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-menu-export-import"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-oase-conclusion:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-oase-conclusion"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-terraform-cli-execute:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-terraform-cli-execute"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-terraform-cli-vars-listup:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-terraform-cli-vars-listup"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-terraform-cloud-ep-execute:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-terraform-cloud-ep-execute"
         tag: ""
         pullPolicy: IfNotPresent

     ita-by-terraform-cloud-ep-vars-listup:
       replicaCount: 1
       extraEnv:
         EXECUTE_INTERVAL: "10"
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-by-terraform-cloud-ep-vars-listup"
         tag: ""
         pullPolicy: IfNotPresent

     ita-web-server:
       replicaCount: 1
       image:
         repository: "docker.io/exastro/exastro-it-automation-web-server"
         tag: ""
         pullPolicy: IfNotPresent

     ita-migration:
       extraEnv:
         PLATFORM_API_HOST: "platform-api"
         PLATFORM_API_PORT: "8000"
       image:
         repository: "docker.io/exastro/exastro-it-automation-migration"
         tag: ""
         pullPolicy: IfNotPresent

   exastro-platform:
     platform-api:
       image:
         repository: "docker.io/exastro/exastro-platform-api"
         tag: ""

     platform-auth:
       extraEnv:
         # Please set the URL to access
         EXTERNAL_URL: ""
         EXTERNAL_URL_MNG: ""
       ingress:
         enabled: true
         hosts:
           - host: exastro-suite.example.local
             paths:
               - path: /
                 pathType: Prefix
                 backend: "http"
           - host: exastro-suite-mng.example.local
             paths:
               - path: /
                 pathType: Prefix
                 backend: "httpMng"
       service:
         type: ClusterIP
         # http:
         #   nodePort: 30080
         # httpMng:
         #   nodePort: 30081
       image:
         repository: "docker.io/exastro/exastro-platform-auth"
         tag: ""

     platform-job:
       extraEnv:
         # LOG_LEVEL: "INFO"
         # SUB_PROCESS_TERMINATE_REQUEST_SECONDS: "1800"
         # SUB_PROCESS_ACCEPTABLE: "2"
         # SUB_PROCESS_MAX_JOBS: "10"
         # SUB_PROCESS_WATCH_INTERVAL_SECONDS: "1.0"
         # SUB_PROCESS_DB_RECONNECT_INTERVAL_SECONDS: "60"
         # SUB_PROCESS_DB_HEALTH_CHECK_INTERVAL_SECONDS: "5"
         # SUB_PROCESS_MAX_CANCEL_TIMEOUT: "10"
         # JOB_STATUS_WATCH_INTERVAL_SECONDS: "1.0"
         # JOB_CANCEL_TIMEOUT_SECONDS: "5.0"
         # JOB_NOTIFICATION_TIMEOUT_SECONDS: "20"
         # JOB_NOTIFICATION_TEAMS_CONNECTION_TIMEOUT: "3.0"
         # JOB_NOTIFICATION_TEAMS_READ_TIMEOUT: "10.0"
         # JOB_NOTIFICATION_SMTP_TIMEOUT: "10.0"
         # JOB_NOTIFICATION_SMTPS_SSL_VERIFY_ENABLED: "TRUE"
         # JOB_FORCE_UPDATE_STATUS_TIMEOUT_SECONDS: "60"
         # JOB_FORCE_UPDATE_STATUS_INTERVAL_SECONDS: "180"
         # JOB_FORCE_UPDATE_STATUS_PROGRASS_SECONDS: "600"
       image:
         repository: "docker.io/exastro/exastro-platform-job"
         tag: ""

     platform-migration:
       image:
         repository: "docker.io/exastro/exastro-platform-migration"
         tag: ""

     platform-web:
       image:
         repository: "docker.io/exastro/exastro-platform-web"
         tag: ""

     mariadb:
       enabled: true
       image:
         repository: "docker.io/mariadb"
         tag: "10.11"
         pullPolicy: IfNotPresent
       imagePullSecrets: []
       persistence:
         enabled: false
         reinstall: false
         accessMode: ReadWriteOnce
         size: 20Gi
         storageClass: "-" # e.g.) azurefile or - (None)
         matchLabels:
           name: pv-database
         matchExpressions:
           # - {key: name, operator: In, values: [pv-database]}
       dbSetup:
         dbConfInfo:
           name: mysql-server-conf-config
           customCnf: |-
             [mysqld]
             character-set-server=utf8mb4
             collation-server=utf8mb4_bin
             secure_file_priv=/tmp
             lower_case_table_names=1
             [client]
             default-character-set=utf8mb4
       resources:
         requests:
           memory: "256Mi"
           cpu: "1m"
         limits:
           memory: "2Gi"
           cpu: "4"

     keycloak:
       enabled: true
       image:
         repository: "docker.io/exastro/keycloak"
         tag: ""
         pullPolicy: IfNotPresent
       resources: {}
         # requests:
         #   memory: "256Mi"
         #   cpu: "1m"
         # limits:
         #   memory: "2Gi"
         #   cpu: "4"

     gitlab:
       enabled: false
       extraEnv:
         GITLAB_OMNIBUS_CONFIG: |
           postgresql['shared_buffers'] = "2048MB"
           postgresql['work_mem'] = "128MB"
           postgresql['maintenance_work_mem'] = "128MB"
           postgresql['effective_cache_size'] = "128MB"
           postgresql['checkpoint_segments'] = 16
           postgresql['checkpoint_timeout'] = "10min"
           external_url 'http://gitlab:40080'
           nginx['listen_port'] = 40080
           gitlab_rails['initial_root_password'] = "${GITLAB_ROOT_PASSWORD:-}"
           gitlab_rails['registry_enabled'] = false;
           gitlab_rails['db_prepared_statements'] = false;
           gitlab_rails['monitoring_whitelist'] = ['0.0.0.0/0']
           # gitlab_rails['env'] = {'MALLOC_CONF' => 'dirty_decay_ms:1000,muzzy_decay_ms:1000'}
           # puma['worker_processes'] = 0
           prometheus_monitoring['enable'] = false
           # sidekiq['max_concurrency'] = 10
           # gitaly['env'] = {'MALLOC_CONF' => 'dirty_decay_ms:1000,muzzy_decay_ms:1000', 'GITALY_COMMAND_SPAWN_MAX_PARALLEL' => '2'}
         GITLAB_POST_RECONFIGURE_SCRIPT: |
           while ! curl -sfI -o /dev/null http://localhost:40080/-/readiness;
           do
           echo "GitLab service is not ready."
           sleep 1
           done
           echo "GitLab service started normally"
           curl -Ssf -H "PRIVATE-TOKEN: ${GITLAB_ROOT_TOKEN:-}" "http://localhost:40080/api/v4/version" || (
             gitlab-rails runner "token = User.find_by_username('root').personal_access_tokens.create(scopes: [:api, :write_repository, :sudo], name: 'exastro system token'); token.set_token('${GITLAB_ROOT_TOKEN:-}'); token.save!"
           )
           echo "GitLab post reconfigure script ended."
       image:
         repository: "docker.io/gitlab/gitlab-ce"
         tag: "15.11.13-ce.0"
         pullPolicy: IfNotPresent
         # Overrides the image tag whose default is the chart appVersion.
       persistence:
         enabled: false
         volumeName: pv-gitlab
         reinstall: false
         accessMode: ReadWriteMany
         size: 20Gi
         storageClass: "-" # e.g.) azurefile or - (None)
         matchLabels:
           name: pv-gitlab
         matchExpressions:
           # - {key: name, operator: In, values: [pv-gitlab]}
       resources: {}
         # requests:
         #   memory: "256Mi"
         #   cpu: "1m"
         # limits:
         #   memory: "2Gi"
         #   cpu: "4"
       service:
         type: ClusterIP
         name: gitlab
         port: 40080
         # nodePort: 30082

     mongo:
       enabled: true
       replicaCount: 1
       image:
         repository: "docker.io/mongo"
         pullPolicy: IfNotPresent
         # Overrides the image tag whose default is the chart appVersion.
         tag: "6.0"
       persistence:
         enabled: false
         reinstall: false
         accessMode: ReadWriteOnce
         size: 20Gi
         storageClass: "-" # e.g.) azurefile, local-path or - (None)
         matchLabels:
           # release: "pv-mongo"
         matchExpressions:
           # - {key: name, operator: In, values: [pv-mongo]}
       dbSetup:
         dbConfInfo:
           name: mongo-server-conf-config
           customCnf: |
             systemLog:
               verbosity: 0
               # destination: file
               # path: /root/logs/mongod.log
               timeStampFormat: iso8601-utc
             # storage:
             #   directoryPerDB: true
             #   dbPath: /root/data
             #   engine: wiredTiger
             #   wiredTiger:
             #     engineConfig:
             #       cacheSizeGB: 1
             #   journal:
             #     enabled: true
             # processManagement:
             #   fork: true
             # net:
             #   port: 27017
             #   bindIp: 0.0.0.0
             # security:
             #   authorization: enabled
       resources: {}
         # requests:
         #   memory: "256Mi"
         #   cpu: "1m"
         # limits:
         #   memory: "2Gi"
         #   cpu: "4"
       affinity:
         podAntiAffinity:
           requiredDuringSchedulingIgnoredDuringExecution:
           - labelSelector:
               matchExpressions:
               - key: name
                 operator: In
                 values:
                 - mongo
             topologyKey: kubernetes.io/hostname

.. raw:: html

   </details>

| In the next section, the manual will explain how to set the correct parameters to :file:`exastro.yaml` needed to install Exastro.

.. _service_setting:

Service publish settings
------------------

| There are 3 main methods to publish Exastro.

- Ingress
- LoadBalancer
- NodePort

.. note::
  | There are different methods other than the ones introduced in this manual. We recommend that the users uses one that fits their environment.

Parameters
^^^^^^^^^^

| See the following for what parameters can be used.

.. include:: ../include/helm_option_platform-auth.rst

Setting example
^^^^^^

| This sections displays examples of the settings for publishing the service.

.. tabs::

   .. group-tab:: Ingress

      .. _ingress_setting:

      - Features

      | The service can be published if Ingress Controller is usable through Public clouds or other means.
      | This method requires the user to construct a loadBalancer within the cluster and comes with benefits and merits if the user wants to be able to operate it themselves.

      - Setting example

      | The service is published using DNS by registering the Service domain information to Ingress.
      | For checking Domain names in Azure, see :ref:`aks-dns`.
      | Specify the :kbd:`annotations` required by the Cloud provider.
      | The following example uses AKS's Ingress Controller.

      .. code-block:: diff
         :caption: exastro.yaml
         :linenos:
         :lineno-start: 232

          platform-auth:
            extraEnv:
              # Please set the URL to access
         -    EXTERNAL_URL: ""
         -    EXTERNAL_URL_MNG: ""
         +    EXTERNAL_URL: "http://exastro-suite.xxxxxxxxxxxxxxxxxx.japaneast.aksapp.io"
         +    EXTERNAL_URL_MNG: "http://exastro-suite-mng.xxxxxxxxxxxxxxxxxx.japaneast.aksapp.io"
            ingress:
              enabled: true
         +    annotations:
         +      kubernetes.io/ingress.class: addon-http-application-routing
         +      nginx.ingress.kubernetes.io/proxy-body-size: 100m
         +      nginx.ingress.kubernetes.io/proxy-buffer-size: 256k
         +      nginx.ingress.kubernetes.io/server-snippet: |
         +        client_header_buffer_size 100k;
         +        large_client_header_buffers 4 100k;
              hosts:
         -      - host: exastro-suite.example.local
         +      - host: exastro-suite.xxxxxxxxxxxxxxxxxx.japaneast.aksapp.io
                  paths:
                    - path: /
                      pathType: Prefix
                      backend: "http"
         -      - host: exastro-suite-mng.example.local
         +      - host: exastro-suite-mng.xxxxxxxxxxxxxxxxxx.japaneast.aksapp.io
                  paths:
                    - path: /
                      pathType: Prefix
                      backend: "httpMng"

   .. group-tab:: LoadBalancer

      - Features

      | The service can be published using LoadBalancer if it is usable through a public cloud or other means.
      | Different from using Ingress, the LoadBalancer is deployed externally from the cluster (often on the public cloud service). This means that the user don't have to operate it. 

      - Setting example

      | The service is published using LoadBalancer by configuring :kbd:`LoadBalancer` to :kbd:`service.type`.
      | The following example uses LoadBalancer.

      .. code-block:: diff
         :caption: exastro.yaml
         :linenos:
         :lineno-start: 232

          platform-auth:
            extraEnv:
              # Please set the URL to access
         -    EXTERNAL_URL: ""
         -    EXTERNAL_URL_MNG: ""
         +    EXTERNAL_URL: "https://your-exastro.domain"
         +    EXTERNAL_URL_MNG: "https://your-exastro-mng.domain"
            ingress:
         -    enabled: true
         +    enabled: false
              hosts:
                - host: exastro-suite.example.local
                  paths:
                    - path: /
                      pathType: Prefix
                      backend: "http"
                - host: exastro-suite-mng.example.local
                  paths:
                    - path: /
                      pathType: Prefix
                      backend: "httpMng"
            service:
         -    type: ClusterIP
         +    type: LoadBalancer
              # http:
              #   nodePort: 30080
              # httpMng:
              #   nodePort: 30081

   .. group-tab:: NodePort

      - Features

      | The service can be deployed using Nodeport if the user has prepared a LoadBalancer on their own environment or if the user is using a test environment.
      | Different from using Ingress and LoadBalancer, this publication method can be done natively on Kubernetes.

      - Setting example

      | The service can be published with Nodeport by setting :kbd:`NodePort` to :kbd:`service.type`.
      | The following example uses NodePort.

      .. code-block:: diff
        :caption: exastro.yaml
        :linenos:
        :lineno-start: 232

          platform-auth:
            extraEnv:
              # Please set the URL to access
         -    EXTERNAL_URL: ""
         -    EXTERNAL_URL_MNG: ""
         +    EXTERNAL_URL: "http://10.10.10.10:30080"
         +    EXTERNAL_URL_MNG: "http://10.10.10.10:30081"
            ingress:
        -    enabled: true
        +    enabled: false
              hosts:
                - host: exastro-suite.example.local
                  paths:
                    - path: /
                      pathType: Prefix
                      backend: "http"
                - host: exastro-suite-mng.example.local
                  paths:
                    - path: /
                      pathType: Prefix
                      backend: "httpMng"
            service:
        -    type: ClusterIP
        -    # http:
        -    #   nodePort: 30080
        -    # httpMng:
        -    #   nodePort: 30081
        +    type: NodePort
        +    http:
        +      nodePort: 30080
        +    httpMng:
        +      nodePort: 30081

.. _DATABASE_SETUP:

Database link
----------------

| In order to use the Exastro service, the user will need a database for managing CMDB and Organizations.
| This document will describe 3 different setting methods when using databases.

- External database
- Database container

.. tabs::

   .. tab:: External database

      - Features

      | This uses a database external to the Kubernetes cluster.
      | As the database is not on the Kubernetes cluster, it will have to be managed seperately from the environment.

      .. warning::
        | If constructing multiple ITA environments, make sure to unify the "lower_case_table_names" settings.
        | ※If the settings are not unified, the "Menu export/import function might not work properly.

      - Setting example

      | Configure the required connection information in order to operate the external database.

      .. warning::
        | The DB management user specified with :command:`DB_ADMIN_USER` and :command:`MONGO_ADMIN_USER` must have permission to create databases and users.

      .. warning::
        | Authorization information can be all plaintext(Base64 encoding not required).

      1.  Exastro IT Automation database settings

          | Configure the database's connection information.

          .. include:: ../include/helm_option_itaDatabaseDefinition.rst

          .. code-block:: diff
            :caption: exastro.yaml
            :linenos:
            :lineno-start: 39

              itaDatabaseDefinition:
                config:
            -     DB_VENDOR: "mariadb"
            -     DB_HOST: "mariadb"
            -     DB_PORT: "3306"
            +     DB_VENDOR: "mariadb"                # mariadb or mysql
            +     DB_HOST: "your.database.endpoint"   # Database endpoit
            +     DB_PORT: "3306"                     # Database connection port
                  DB_DATABASE: "ITA_DB"               # No change needed
                secret:
            -     DB_ADMIN_USER: ""
            -     DB_ADMIN_PASSWORD: ""s
            +     DB_ADMIN_USER: "your-admin-account"      # Database user with management permissions
            +     DB_ADMIN_PASSWORD: "your-admin-password" # Password for database user with management permissions                                                                        
                  DB_USER: ""
                  DB_PASSWORD: ""

      2.  Exastro platform database settings

          | Configure database's connection information.

          .. include:: ../include/helm_option_pfDatabaseDefinition.rst

          .. code-block:: diff
            :caption: exastro.yaml
            :linenos:
            :lineno-start: 112

              pfDatabaseDefinition:
                config:
            -     DB_VENDOR: "mariadb"
            -     DB_HOST: "mariadb"
            -     DB_PORT: "3306"
            +     DB_VENDOR: "mariadb"                # mariadb or mysql
            +     DB_HOST: "your.database.endpoint"   # Database endpoint
            +     DB_PORT: "3306"                     # Database connection port
                  DB_DATABASE: "platform"             # No change needed
                secret:
            -     DB_ADMIN_USER: ""
            -     DB_ADMIN_PASSWORD: ""
            +     DB_ADMIN_USER: "your-admin-account"      # Database user with management permissions
            +     DB_ADMIN_PASSWORD: "your-admin-password" # Password for database user with management permissions
                  DB_USER: ""
                  DB_PASSWORD: ""

      3.  OASE database settings

          | Configure OASE database's connection information (Not required if not using OASE).

          .. include:: ../include/helm_option_mongoDefinition.rst

          .. code-block:: diff
            :caption: exastro.yaml
            :linenos:
            :lineno-start: 112

              mongoDefinition:
                config:
            -     MONGO_PROTOCOL: "http"
            -     MONGO_HOST: "mongo"
            -     MONGO_PORT: "27017"
            +     MONGO_PROTOCOL: "your.protocol"        # http or https
            +     MONGO_HOST: "your.database.endpoint"   # OASE database endpoint
            +     MONGO_PORT: "your.port"                # OASE database connection port
                secret:
            -     MONGO_ADMIN_USER: ""
            -     MONGO_ADMIN_PASSWORD: ""
            +     MONGO_ADMIN_USER: "your-admin-account"      # OASE database user with management permissions
            +     MONGO_ADMIN_PASSWORD: "your-admin-password" # Password for OASE database user with management permissions

      4.  Deactivating database containers

          | Configure the database container so it does not start.

          .. include:: ../include/helm_option_mariadb.rst

          .. code-block:: diff
            :caption: exastro.yaml
            :linenos:
            :lineno-start: 270

              mariadb:
            -   enabled: true
            +   enabled: false

          | Configure the OASE database container so it does not start.

          .. include:: ../include/helm_option_mongo.rst

          .. code-block:: diff
            :caption: exastro.yaml
            :linenos:
            :lineno-start: 270

              mongo:
            -   enabled: true
            +   enabled: false

   .. tab:: Database container

      - Features

      | This method uses the Database container deployed within the Kubernetes cluster.
      | This database container can be managed as a container on the same Exastro and Kubernetes cluster.

      - Setting example

      | Create a password for the database container's root and configure the root account password to the database so it can be accessed from other containers.
      | Then specify the using storage so the data can be persisted.

      .. warning::
        | The DB management user specified with :command:`DB_ADMIN_USER` and :command:`MONGO_ADMIN_USER` must have permission to create databases and users.

      .. warning::
        | Authorization information can be all plaintext(Base64 encoding not required).

      .. _configuration_database_container:

      1.  Configure Database container

          | Configure password for the Database container's root.
          | Then specify the using storage so the data can be persisted.

          .. include:: ../include/helm_option_mariadb.rst

          .. tabs::

            .. tab:: Using Storage Class

                .. code-block:: diff
                  :caption: exastro.yaml
                  :linenos:
                  :lineno-start: 125

                      mariadb:                                             # Previously databaseDefinition
                        enabled: true
                        image:
                          repository: "docker.io/mariadb"
                          tag: "10.11"
                          pullPolicy: IfNotPresent
                        imagePullSecrets: []
                        persistence:
                          enabled: true
                          reinstall: false
                          accessMode: ReadWriteOnce
                  -       size: 20Gi
                  +       size: XXGi                                       # Change to required storage
                  -       storageClass: "-" # e.g.) azurefile or - (None)
                  +       storageClass: "exastro-suite-azurefile-csi-nfs"  # Specify Storage Class

            .. tab:: Using hostPath

                .. code-block:: diff
                  :caption: exastro.yaml
                  :linenos:
                  :lineno-start: 125

                      mariadb:                                             # Previously databaseDefinition
                        enabled: true
                        image:
                          repository: "docker.io/mariadb"
                          tag: "10.11"
                          pullPolicy: IfNotPresent
                        imagePullSecrets: []
                        persistence:
                          enabled: true
                          reinstall: false
                          accessMode: ReadWriteOnce
                  -       size: 20Gi
                  +       size: XXGi                                       # Change to required storage
                          storageClass: "-" # e.g.) azurefile or - (None)

      2.  Configure Exastro IT Automation database

          | Configure the root acount password created in the :ref:`DATABASE_SETUP` section in order to make the database accessible from the Exastro IT Automation container.

          .. include:: ../include/helm_option_itaDatabaseDefinition.rst

          .. code-block:: diff
            :caption: exastro.yaml
            :linenos:
            :lineno-start: 39

              itaDatabaseDefinition:
                config:
                  DB_VENDOR: "mariadb"
                  DB_HOST: "mariadb"
                  DB_PORT: "3306"
                  DB_DATABASE: "ITA_DB"
                secret:
            -     DB_ADMIN_USER: ""
            -     DB_ADMIN_PASSWORD: ""
            +     DB_ADMIN_USER: "root"                    # Specify root
            +     DB_ADMIN_PASSWORD: "your-admin-password" # root password configured in "1.  Configure Database container".
                  DB_USER: ""
                  DB_PASSWORD: ""

      3.  Configure Exastro platform database

          | Configure the root account password created in "1. Configure Database container" in order to make the database accessible from the Exastro Platform container.

          .. include:: ../include/helm_option_pfDatabaseDefinition.rst

          .. code-block:: diff
            :caption: exastro.yaml
            :linenos:
            :lineno-start: 112

              pfDatabaseDefinition:
                enabled: true
                config:
                  DB_VENDOR: "mariadb"
                  DB_HOST: "mariadb"
                  DB_PORT: "3306"
                  DB_DATABASE: "platform"
                secret:
            -     DB_ADMIN_USER: ""
            -     DB_ADMIN_PASSWORD: ""
            +     DB_ADMIN_USER: "root"                    # Specify root
            +     DB_ADMIN_PASSWORD: "your-admin-password" # root password configured in "1.  Configure Database container".
                  DB_USER: ""
                  DB_PASSWORD: ""

      4.  Configure OASE database

          | Configure OASE database's connection information (Not required if not using OASE).

          .. include:: ../include/helm_option_mongoDefinition.rst

          .. code-block:: diff
            :caption: exastro.yaml
            :linenos:
            :lineno-start: 112

              mongoDefinition:
                config:
            -     MONGO_PROTOCOL: "http"
            -     MONGO_HOST: "mongo"
            -     MONGO_PORT: "27017"
                secret:
            -     MONGO_ADMIN_USER: ""
            -     MONGO_ADMIN_PASSWORD: ""
            +     MONGO_ADMIN_USER: "your-admin-account"      # OASE database user with management permissions
            +     MONGO_ADMIN_PASSWORD: "your-admin-password" # Password for OASE database user with management permissions

.. _installation_kubernetes_Keycloak settings:

App DB user settings
--------------------------------

| Configure DB users in for applications in Exastro.

Setting example
^^^^^^

| Configure DB users for each of the following.

- Exastro IT Automation
- Exastro platform
- Keycloak

.. warning::
  | Authorization information can be all plaintext(Base64 encoding not required).

1.  Configure Exastro IT Automation database

    | Configure DB user that will be used and created by applications.

    .. include:: ../include/helm_option_itaDatabaseDefinition.rst

    .. code-block:: diff
      :caption: exastro.yaml
      :linenos:
      :lineno-start: 39

        itaDatabaseDefinition:
          enabled: true
          config:
            DB_VENDOR: "mariadb"
            DB_HOST: "mariadb"
            DB_PORT: "3306"
            DB_DATABASE: "ITA_DB"
          secret:
            DB_ADMIN_USER: ""
            DB_ADMIN_PASSWORD: ""
      -     DB_USER: ""
      -     DB_PASSWORD: ""
      +     DB_USER: "ita-db-user"                # Exastro IT Automation app user
      +     DB_PASSWORD: "ita-db-user-password"   # Exastro IT Automation app user password


2.  Configure Keycloak database

    | Configure DB user that will be used and created by applications.

    .. include:: ../include/helm_option_keycloakDefinition.rst

    .. code-block:: diff
      :caption: exastro.yaml
      :linenos:
      :lineno-start: 82

        keycloakDefinition:
          enabled: true
          config:
            API_KEYCLOAK_PROTOCOL: "http"
            API_KEYCLOAK_HOST: "keycloak"
            API_KEYCLOAK_PORT: "8080"
            KEYCLOAK_PROTOCOL: "http"
            KEYCLOAK_HOST: "keycloak"
            KEYCLOAK_PORT: "8080"
            KEYCLOAK_MASTER_REALM: "master"
            KEYCLOAK_DB_DATABASE: "keycloak"
          secret:
            KEYCLOAK_USER: ""
            KEYCLOAK_PASSWORD: ""
      -     KEYCLOAK_DB_USER: ""
      -     KEYCLOAK_DB_PASSWORD: ""
      +     KEYCLOAK_DB_USER: "keycloak-db-user"               # Keycloak DB user
      +     KEYCLOAK_DB_PASSWORD: "keycloak-db-user-password"  # Keycloak DB user password


3.  Configure Exastro platform database

    | Configure DB user that will be used and created by applications.

    .. include:: ../include/helm_option_pfDatabaseDefinition.rst

    .. code-block:: diff
      :caption: exastro.yaml
      :linenos:
      :lineno-start: 112

        pfDatabaseDefinition:
          name: pf-database
          enabled: true
          config:
            DB_VENDOR: "mariadb"
            DB_HOST: "mariadb"
            DB_PORT: "3306"
            DB_DATABASE: "platform"
          secret:
            DB_ADMIN_USER: ""
            DB_ADMIN_PASSWORD: ""
      -     DB_USER: ""
      -     DB_PASSWORD: ""
      +     DB_USER: "pf-db-user"           # Exastro platform DB user
      +     DB_PASSWORD: "pf-db-password"   # Exastro platform DB user


.. _installation_kubernetes_gitlablinkage:

GitLab link settings
---------------

| Configure connection information in order to link with GitLab.

- External Gitlab
- GitLab container

.. tabs::

   .. tab:: External GitLab

      - Features

      | Uses the GitLab external from the Managed GitLab and the Kubernetes cluster.
      | As the GitLab is external from the Kubernetes cluster, it will have to be managed seperately.

      - Setting example

      | Configure required connection information in order to operate the external GitLab.

      1.  Configure GitLab database

          | Configure the GitLab so it can connect to the GitLab cotnainer.

      .. include:: ../include/helm_option_gitlabDefinition.rst

      .. warning::
        | The GITLAB_ROOT_TOKEN needs a token that contains permissions for the following:
        | ・api
        | ・write_repository
        | ・sudo

      | The following is an example of GitLab link configurations.

      .. code-block:: diff
        :caption: exastro.yaml
        :linenos:
        :lineno-start: 30

            gitlabDefinition:
              name: gitlab
              enabled: true
              config:
          -     GITLAB_PROTOCOL: "http"
          -     GITLAB_HOST: "gitlab"
          -     GITLAB_PORT: "80"
          +     GITLAB_PROTOCOL: "Connection protocol http or https"
          +     GITLAB_HOST: "Connection destination"
          +     GITLAB_PORT: "Connection port"
              secret:
          -     GITLAB_ROOT_PASSWORD: ""
          +     GITLAB_ROOT_PASSWORD: "GitLab root permission user password"
          -     GITLAB_ROOT_TOKEN: ""
          +     GITLAB_ROOT_TOKEN: "GitLab root permission token"

   .. tab:: GitLab container

      - Features

      | Uses GitLab container deployed within the Kubernetes cluster.
      | Can be managed as a container on the same Kubernetes cluster as Exastro.

      - Setting example

      | Create a password for the database container's root and configure the root account password to the database so it can be accessed from other containers.
      | Then specify the using storage so the data can be persisted.

      1.  Configure GitLab database

          | Configure the GitLab database so it can connect to the GitLab container.

      .. include:: ../include/helm_option_gitlabDefinition.rst

      .. warning::
         | The token is created by the the plain text specified by GITLAB_ROOT_TOKEN.
         | ・api
         | ・write_repository
         | ・sudo

      | The following is an example of GitLab link configurations.

      .. code-block:: diff
          :caption: exastro.yaml
          :linenos:
          :lineno-start: 30

            gitlabDefinition:
                name: gitlab
                enabled: true
                config:
                GITLAB_PROTOCOL: "http"
            -     GITLAB_HOST: "gitlab"
            -     GITLAB_PORT: "80"
            +     GITLAB_HOST: "your.database.endpoint" # GitLab database endpoint（Accessible IP or URL）
            +     GITLAB_PORT: "30082" # GitLab database connection port
                secret:
            -     GITLAB_ROOT_PASSWORD: ""
            +     GITLAB_ROOT_PASSWORD: "GitLab root permission password"
            -     GITLAB_ROOT_TOKEN: ""
            +     GITLAB_ROOT_TOKEN: "Token that will be created with GitLab"

      2.  Activate GitLab container

          | Configure the GitLab so it will start.
          | The following is an example of settings when using NodePort.

          .. include:: ../include/helm_option_gitlab.rst

          .. code-block:: diff
            :caption: exastro.yaml
            :linenos:
            :lineno-start: 270

              gitlab:
              - enabled: false
              + enabled: true
                extraEnv:
                  GITLAB_OMNIBUS_CONFIG: |
                    postgresql['shared_buffers'] = "2048MB"
                    postgresql['work_mem'] = "128MB"
                    postgresql['maintenance_work_mem'] = "128MB"
                    postgresql['effective_cache_size'] = "128MB"
                    postgresql['checkpoint_segments'] = 16
                    postgresql['checkpoint_timeout'] = "10min"
              -     external_url 'http://gitlab:40080'
              +     external_url 'http://your.database.endpoint:30082'
                ～Abbr～
                service:
              -   type: ClusterIP
              +   type: NodePort
                  name: gitlab
                  port: 40080
              -   # nodePort: 30082
              +     nodePort: 30082

   .. _create_system_manager:
   .. _install_helm_v2.2:

Create Exastro system admin
----------------------------

| Configure the infomation that will be used to create the Exastro system admin when setting up Keycloak.

.. include:: ../include/helm_option_keycloakDefinition.rst

.. code-block:: diff
  :caption: exastro.yaml
  :linenos:
  :lineno-start: 82

    keycloakDefinition:
      name: keycloak
      enabled: true
      config:
        API_KEYCLOAK_PROTOCOL: "http"
        API_KEYCLOAK_HOST: "keycloak"
        API_KEYCLOAK_PORT: "8080"
        KEYCLOAK_PROTOCOL: "http"
        KEYCLOAK_HOST: "keycloak"
        KEYCLOAK_PORT: "8080"
        KEYCLOAK_MASTER_REALM: "master"
        KEYCLOAK_DB_DATABASE: "keycloak"
      secret:
  -     KEYCLOAK_USER: ""
  -     KEYCLOAK_PASSWORD: ""
  +     KEYCLOAK_USER: "admin"               # Exastro system admin
  +     KEYCLOAK_PASSWORD: "admin-password"  # Exastro system admin password
        KEYCLOAK_DB_USER: ""
        KEYCLOAK_DB_PASSWORD: ""

.. _persistent_volume:

Configure Persistent volume
--------------------

| In order to persist databases( for container within clusters) and files, the user will have to configure a persistent volume.
| for more information regarding persistent volumes, see `Persistent Volumes - Kubernetes <https://kubernetes.io/docs/concepts/storage/persistent-volumes/>`_.

| This document describes 2 persisting methods for the following:

- Managed disk
- Kubernetes note directory

.. tabs::

   .. tab:: Managed disk

      - Features

      | Storage construction and maintenance is not required if the user is using a storage service provided by a public cloud.

      - Setting example

      | If the user is using storage from Azure, the user can persist data by defining StorageClass as shown below.
      | For more information, see  `Storage options for applications in Azure Kubernetes Service (AKS) <https://learn.microsoft.com/en-us/azure/aks/concepts-storage#storage-classes>`_.

      .. code-block:: diff
        :caption: storage-class-exastro-suite.yaml
        :linenos:

        apiVersion: storage.k8s.io/v1
        kind: StorageClass
        metadata:
          name: exastro-suite-azurefile-csi-nfs
        provisioner: file.csi.azure.com
        allowVolumeExpansion: true
        parameters:
          protocol: nfs
        mountOptions:
          - nconnect=8

      .. code-block:: diff
        :caption: exastro.yaml
        :linenos:
        :lineno-start: 5

          itaGlobalDefinition:
            persistence:
              enabled: true
              accessMode: ReadWriteMany
              size: 10Gi
              volumeType: hostPath # e.g.) hostPath or AKS
        -      storageClass: "-" # e.g.) azurefile or - (None)
        +      storageClass: "azurefile" # e.g.) azurefile or - (None)

      | ※ The following has been configured in :ref:`DATABASE_SETUP`.
      
      .. code-block:: diff
        :caption: exastro.yaml
        :linenos:
        :lineno-start: 39

          mariadb:
            persistence:
              enabled: true
              reinstall: false
              accessMode: ReadWriteOnce
              size: 20Gi
              volumeType: hostPath # e.g.) hostPath or AKS
        -      storageClass: "-" # e.g.) azurefile or - (None)
        +      storageClass: "exastro-suite-azurefile-csi-nfs" # e.g.) azurefile or - (None)

   .. tab:: Kubernetes node directory

      - Features

      | This method uses storage on the Kubernetes node. There is no need to provide seperate storage, but we recommend that this method is only used for testing and developing.

      .. danger::
          | While persisting data is possible, data might be deleted if compute nodes are changed. We strongly recommend against using this method to persist data in production.
          | Note that if AKS clusters created with Azure are stopped, the AKS cluster's node will be released. This means that all saved information will be deleted. 

      - Example

      | The example below uses hostPath.

      .. code-block:: diff
        :caption: pv-database.yaml (Database volume)
        :linenos:

        # pv-database.yaml
        apiVersion: v1
        kind: PersistentVolume
        metadata:
          name: pv-database
        spec:
          capacity:
            storage: 20Gi
          accessModes:
            - ReadWriteOnce
          persistentVolumeReclaimPolicy: Retain
          hostPath:
            path: /var/data/exastro-suite/exastro-platform/database
            type: DirectoryOrCreate

      .. code-block:: diff
        :caption: pv-ita-common.yaml (File volume)
        :linenos:

        # pv-ita-common.yaml
        apiVersion: v1
        kind: PersistentVolume
        metadata:
          name: pv-ita-common
        spec:
          capacity:
            storage: 10Gi
          accessModes:
            - ReadWriteMany
          persistentVolumeReclaimPolicy: Retain
          hostPath:
            path: /var/data/exastro-suite/exastro-it-automation/ita-common
            type: DirectoryOrCreate

      .. code-block:: diff
        :caption: pv-mongo.yaml (OASE volume) ※Not required if not using OASE
        :linenos:

        # pv-mongo.yaml
        apiVersion: v1
        kind: PersistentVolume
        metadata:
          name: pv-mongo
        spec:
          claimRef:
            name: volume-mongo-storage-mongo-0
            namespace: exastro
          capacity:
            storage: 20Gi
          accessModes:
            - ReadWriteOnce
          persistentVolumeReclaimPolicy: Retain
          hostPath:
            path: /var/data/exastro-suite/exastro-platform/mongo
            type: DirectoryOrCreate

      .. code-block:: diff
        :caption: pv-gitlab.yaml (GitLab volume) ※Not required if using external GitLab
        :linenos:

        # pv-gitlab.yaml
        apiVersion: v1
        kind: PersistentVolume
        metadata:
          name: pv-gitlab
        spec:
          capacity:
            storage: 20Gi
          accessModes:
            - ReadWriteMany
          persistentVolumeReclaimPolicy: Retain
          hostPath:
            path: /var/data/exastro-suite/exastro-platform/gitlab
            type: DirectoryOrCreate


.. _Install1:

Install
============

Create Persistent volumes
--------------------

| Apply the manifest file created in :ref:`persistent_volume` and create persistent volume.

.. code-block:: bash

    # pv-database.yaml
    kubectl apply -f pv-database.yaml

    # pv-ita-common.yaml
    kubectl apply -f pv-ita-common.yaml

    # pv-mongo.yaml ※Not required if not using OASE
    kubectl apply -f pv-mongo.yaml

    # pv-gitlab.yaml ※Not required if using external GitLab
    kubectl apply -f pv-gitlab.yaml

.. code-block:: bash

    # 確認
    kubectl get pv

.. code-block:: bash

    NAME            CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM                                  STORAGECLASS   REASON   AGE
    pv-database     20Gi       RWO            Retain           Available                                                                  6s
    pv-gitlab       20Gi       RWX            Retain           Available                                                                  5s
    pv-ita-common   10Gi       RWX            Retain           Available                                                                  6s
    pv-mongo        20Gi       RWO            Retain           Available   exastro/volume-mongo-storage-mongo-0                           5s


Install
------------

| See the following or checking Helm and App version.

.. include:: ../include/helm_versions.rst

| The access method changes depending on which publication method was used during installation.
| This section describes the methods for Ingress, LoadBalancer and NodePort.

.. tabs::

   .. group-tab:: Ingress

      1. Use Helm command to install on Kubernetes environment.

         .. code-block:: bash
            :caption: Command

            helm install exastro exastro/exastro \
              --namespace exastro --create-namespace \
              --values exastro.yaml

         .. code-block:: bash
            :caption: Output results

            NAME: exastro
            LAST DEPLOYED: Sat Jan 28 15:00:02 2023
            NAMESPACE: exastro
            STATUS: deployed
            REVISION: 1
            TEST SUITE: None
            NOTES:
            Exastro install completion!

            1. Execute the following command and wait until the pod becomes "Running" or "Completed":

              # NOTE: You can also append "-w" to the command or wait until the state changes with "watch command"

              kubectl get pods --namespace exastro

            2. Get the ENCRYPT_KEY by running these commands:

              # Exastro IT Automation ENCRYPT_KEY
              kubectl get secret ita-secret-ita-global -n exastro -o jsonpath='{.data.ENCRYPT_KEY}' | base64 -d

              # Exastro Platform ENCRYPT_KEY
              kubectl get secret platform-secret-pf-global -n exastro -o jsonpath='{.data.ENCRYPT_KEY}' | base64 -d

              !!! Please save the output ENCRYPT_KEY carefully. !!!

            3. Run the following command to get the application URL and go to the URL or go to the displayed URL:
              *************************
              * Service Console       *
              *************************
              http://exastro-suite.example.local/

              *************************
              * Administrator Console *
              *************************
              http://exastro-suite-mng.example.local/auth/


            # Note: You can display this note again by executing the following command.

         | Use the output results from the last step for the following steps.

      2. | Check install status

      .. include:: ../include/check_installation_status.rst

      1. Backup encrypt key

         .. include:: ../include/backup_encrypt_key_k8s.rst

      2. Check connection

         | Follow the output results and access the :menuselection:`Administrator Console` URL.
         | The following is an example. Please change the host name with the one set in :ref:`service_setting`.

         .. code-block:: bash
            :caption: Output results(Example)

            *************************
            * Service Console       *
            *************************
            http://exastro-suite.example.local/

            *************************
            * Administrator Console *
            *************************
            http://exastro-suite-mng.example.local/auth/

         .. list-table:: Connection check URL
            :widths: 20 40
            :header-rows: 0
            :align: left

            * - Managment console
              - http://exastro-suite-mng.example.local/auth/

   .. group-tab:: LoadBalancer

      1. Use Helm command to install on Kubernetes environment.

         .. code-block:: bash
            :caption: Command

            helm install exastro exastro/exastro \
              --namespace exastro --create-namespace \
              --values exastro.yaml

         .. code-block:: bash
            :caption: Output results(Example)

            NAME: exastro
            LAST DEPLOYED: Sat Jan 28 15:00:02 2023
            NAMESPACE: exastro
            STATUS: deployed
            REVISION: 1
            TEST SUITE: None
            NOTES:
            Exastro install completion!

            1. Execute the following command and wait until the pod becomes "Running" or "Completed":

              # NOTE: You can also append "-w" to the command or wait until the state changes with "watch command"

              kubectl get pods --namespace exastro

            2. Get the ENCRYPT_KEY by running these commands:

              # Exastro IT Automation ENCRYPT_KEY
              kubectl get secret ita-secret-ita-global -n exastro -o jsonpath='{.data.ENCRYPT_KEY}' | base64 -d

              # Exastro Platform ENCRYPT_KEY
              kubectl get secret platform-secret-pf-global -n exastro -o jsonpath='{.data.ENCRYPT_KEY}' | base64 -d

              !!! Please save the output ENCRYPT_KEY carefully. !!!

            3. Run the following command to get the application URL and go to the URL or go to the displayed URL:
              # NOTE: It may take a few minutes for the LoadBalancer IP to be available.
              #       You can watch the status of by running 'kubectl get --namespace exastro svc -w platform-auth'

              export NODE_SVC_PORT=$(kubectl get services platform-auth --namespace exastro -o jsonpath="{.spec.ports[0].nodePort}")
              export NODE_MGT_PORT=$(kubectl get services platform-auth --namespace exastro -o jsonpath="{.spec.ports[1].nodePort}")
              export NODE_IP=$(kubectl get services platform-auth --namespace exastro -o jsonpath="{.status.loadBalancer.ingress[0].ip}")
              # *************************
              # * Administrator Console *
              # *************************
              echo http://$NODE_IP:$NODE_MGT_PORT/auth/

              # *************************
              # * Service Console       *
              # *************************
              echo http://$NODE_IP:$NODE_SVC_PORT

            # Note: You can display this note again by executing the following command.

         | Follow the output results for the following steps.

      2. | Check installation

      .. include:: ../include/check_installation_status.rst

      1. Backup encrypt key

         .. include:: ../include/backup_encrypt_key_k8s.rst

      2. Check connection

         | Copy and paste the commands output from step 1.:command:`helm install` to the console and run them.

         .. code-block:: bash
            :caption: Command

            # Running the commands from the helm install results
            export NODE_SVC_PORT=$(kubectl get services platform-auth --namespace exastro -o jsonpath="{.spec.ports[0].nodePort}")
            export NODE_MGT_PORT=$(kubectl get services platform-auth --namespace exastro -o jsonpath="{.spec.ports[1].nodePort}")
            export NODE_IP=$(kubectl get services platform-auth --namespace exastro -o jsonpath="{.status.loadBalancer.ingress[0].ip}")
            # *************************
            # * Administrator Console *
            # *************************
            echo http://$NODE_IP:$NODE_MGT_PORT/auth/

            # *********************
            # * Service Console       *
            # *************************
            echo http://$NODE_IP:$NODE_SVC_PORT

         | Follow the output results and access the URL to :menuselection:`Administrator Console`.
         | The following is an example. Please change the following with the data from the commands results.

         .. code-block:: bash
            :caption: Output results(Example)

            *************************
            * Administrator Console *
            *************************
            http://172.16.20.XXX:32031/auth/

            *************************
            * Service Console       *
            *************************
            http://172.16.20.XXX:31798

         .. list-table:: Connection check URL
            :widths: 20 40
            :header-rows: 0
            :align: left

            * - Managment console
              - http://172.16.20.xxx:32031/auth/

   .. group-tab:: NodePort

      1. Use Helm command to install on Kubernetes environment.

         .. code-block:: bash
            :caption: Command

            helm install exastro exastro/exastro \
              --namespace exastro --create-namespace \
              --values exastro.yaml

         .. code-block:: bash
            :caption: Output results

            NAME: exastro
            LAST DEPLOYED: Sun Jan 29 12:18:02 2023
            NAMESPACE: exastro
            STATUS: deployed
            REVISION: 1
            TEST SUITE: None
            NOTES:
            Exastro install completion!

            1. Execute the following command and wait until the pod becomes "Running" or "Completed":

              # NOTE: You can also append "-w" to the command or wait until the state changes with "watch command"

              kubectl get pods --namespace exastro

            2. Get the ENCRYPT_KEY by running these commands:

              # Exastro IT Automation ENCRYPT_KEY
              kubectl get secret ita-secret-ita-global -n exastro -o jsonpath='{.data.ENCRYPT_KEY}' | base64 -d

              # Exastro Platform ENCRYPT_KEY
              kubectl get secret platform-secret-pf-global -n exastro -o jsonpath='{.data.ENCRYPT_KEY}' | base64 -d

              !!! Please save the output ENCRYPT_KEY carefully. !!!

            3. Run the following command to get the application URL and go to the URL or go to the displayed URL:


              export NODE_SVC_PORT=$(kubectl get services platform-auth --namespace exastro -o jsonpath="{.spec.ports[0].nodePort}")
              export NODE_MGT_PORT=$(kubectl get services platform-auth --namespace exastro -o jsonpath="{.spec.ports[1].nodePort}")
              export NODE_IP=$(kubectl get nodes --namespace exastro -o jsonpath="{.items[0].status.addresses[0].address}")
              # *************************
              # * Administrator Console *
              # *************************
              echo http://$NODE_IP:$NODE_MGT_PORT/auth/

              # *************************
              # * Service Console       *
              # *************************
              echo http://$NODE_IP:$NODE_SVC_PORT

            # Note: You can display this note again by executing the following command.

         | Follow the output results for the following steps.

      2. | Check install status

      .. include:: ../include/check_installation_status.rst

      1. Backup encrypt key

         .. include:: ../include/backup_encrypt_key_k8s.rst

      2. Check connection

         | 1. Copy and paste the commands output from step 1.:command:`helm install` to the console and run them.

         .. code-block:: bash
            :caption: Command

            export NODE_SVC_PORT=$(kubectl get services platform-auth --namespace exastro -o jsonpath="{.spec.ports[0].nodePort}")
            export NODE_MGT_PORT=$(kubectl get services platform-auth --namespace exastro -o jsonpath="{.spec.ports[1].nodePort}")
            export NODE_IP=$(kubectl get nodes --namespace exastro -o jsonpath="{.items[0].status.addresses[0].address}")
            # *************************
            # * Administrator Console *
            # *************************
            echo http://$NODE_IP:$NODE_MGT_PORT/auth/

            # *************************
            # * Service Console       *
            # *************************
            echo http://$NODE_IP:$NODE_SVC_PORT

         | Follow the output results and access the URL to :menuselection:`Administrator Console`.
         | The following is an example. Please change the following with the data from the commands results.

         .. code-block:: bash
            :caption: Output results(Example)

            *************************
            * Administrator Console *
            *************************
            http://172.16.20.xxx:30081/auth/

            *************************
            * Service Console       *
            *************************
            http://172.16.20.xxx:30080


         .. list-table:: Connection check URL
            :widths: 20 40
            :header-rows: 0
            :align: left

            * - Managment console
              - http://172.16.20.xxx:30081/auth/

Log in to Managment console
--------------------------

| If the page belows is displayed, select :menuselection:`Administration Console` and log in.
 
.. figure:: /images/ja/manuals/platform/keycloak/administrator-console.png
  :alt: administrator-console
  :width: 600px
  :name: Management console

| The Login ID and password are the :kbd:`KEYCLOAK_USER` and :kbd:`KEYCLOAK_PASSWORD` registered in :ref:`create_system_manager`.

.. figure:: /images/ja/manuals/platform/login/exastro-login.png
  :alt: login
  :width: 300px
  :name: Login page

| Open the Keycloak managment page.

.. figure:: /images/ja/manuals/platform/keycloak/keycloak-home.png
  :alt: login
  :width: 600px
  :name: Keycloak management page

| Once logged in, create a :doc:`../manuals/platform_management/organization`.

Update
==============

| This section describes how to update the Exastro system.


Update preparation
--------------------

.. warning::
  | We recommend that the user follow :doc:`../manuals/maintenance/backup_and_restore` and back up the data before updating.

Update Helm repository
^^^^^^^^^^^^^^^^^^^^^

| Update the Exastro system's Helm repository.

| Check the version before updating.

.. code-block:: shell
   :linenos:
   :caption: Command

   # Check Repository information
   helm search repo exastro

.. code-block:: shell
   :linenos:
   :caption: Run results
   :emphasize-lines: 3

   helm search repo exastro
   NAME                            CHART VERSION   APP VERSION     DESCRIPTION
   exastro/exastro                 1.0.0           2.0.3           A Helm chart for Exastro. Exastro is an Open So...
   exastro/exastro-it-automation   1.2.0           2.0.3           A Helm chart for Exastro IT Automation. Exastro...
   exastro/exastro-platform        1.5.0           1.4.0           A Helm chart for Exastro Platform. Exastro Plat...

| Update the Helm repository.

.. code-block:: shell
   :linenos:
   :caption: Command

   # Update Repository information
   helm repo update

| Check that it has been updated to the latest version.

.. code-block:: shell
   :linenos:
   :caption: Command

   # Check Repository information
   helm search repo exastro

.. code-block:: shell
   :linenos:
   :caption: Run results
   :emphasize-lines: 3

   helm search repo exastro
   NAME                            CHART VERSION   APP VERSION     DESCRIPTION
   exastro/exastro                 1.0.1           2.1.0           A Helm chart for Exastro. Exastro is an Open So...
   exastro/exastro-it-automation   1.2.0           2.0.3           A Helm chart for Exastro IT Automation. Exastro...
   exastro/exastro-platform        1.5.0           1.4.0           A Helm chart for Exastro Platform. Exastro Plat...


Check default setting values and update data
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| Check the updated default values.
| Compare the :file:`exastro.yaml` file pre and post update.

.. code-block:: shell
   :caption: Command

   diff exastro.yaml <(helm show values exastro/exastro)


.. code-block:: diff
   :caption: Run results

   exastro-platform:
     platform-api:
       image:
         repository: "exastro/exastro-platform-api"
          tag: ""

     platform-auth:
   +    extraEnv:
   +      # Please set the URL to access
   +      EXTERNAL_URL: ""
   +      EXTERNAL_URL_MNG: ""
       ingress:
         enabled: true
         hosts:
           - host: exastro-suite.example.local
             paths:

Update setting values
^^^^^^^^^^^^

| After comparing the default setting values, add any desired items and setting values before updating.
| If no setting value update is needed, skip this step.
| E.g. In the example below, :kbd:`exastro-platform.platform-auth.extraEnv` is added, meaning that the corresponding setting items and values in :file:`exastro.yaml` must be added.


.. code-block:: diff
   :caption: Run results

   exastro-platform:
     platform-api:
       image:
         repository: "exastro/exastro-platform-api"
          tag: ""

     platform-auth:
   +    extraEnv:
   +      # Please set the URL to access
   +      EXTERNAL_URL: ""
   +      EXTERNAL_URL_MNG: ""
       ingress:
         enabled: true
         hosts:
           - host: exastro-suite.example.local
             paths:

Update
--------------

Stop service
^^^^^^^^^^^^

.. include:: ../include/stop_service_k8s.rst

Start Update
^^^^^^^^^^^^^^^^^^

| Start the update.

.. code-block:: bash
  :caption: Command

  helm upgrade exastro exastro/exastro \
    --namespace exastro \
    --values exastro.yaml

.. code-block:: bash
  :caption: Output results

  NAME: exastro
  LAST DEPLOYED: Sat Jan 28 15:00:02 2023
  NAMESPACE: exastro
  STATUS: deployed
  REVISION: 2
  TEST SUITE: None
  NOTES:
  Exastro install completion!

  1. Execute the following command and wait until the pod becomes "Running" or "Completed":

    # NOTE: You can also append "-w" to the command or wait until the state changes with "watch command"

    kubectl get pods --namespace exastro

  2. Get the ENCRYPT_KEY by running these commands:

    # Exastro IT Automation ENCRYPT_KEY
    kubectl get secret ita-secret-ita-global -n exastro -o jsonpath='{.data.ENCRYPT_KEY}' | base64 -d

    # Exastro Platform ENCRYPT_KEY
    kubectl get secret platform-secret-pf-global -n exastro -o jsonpath='{.data.ENCRYPT_KEY}' | base64 -d

    !!! Please save the output ENCRYPT_KEY carefully. !!!

  3. Run the following command to get the application URL and go to the URL or go to the displayed URL:
    *************************
    * Service Console       *
    *************************
    http://exastro-suite.example.local/

    *************************
    * Administrator Console *
    *************************
    http://exastro-suite-mng.example.local/auth/


    # Note: You can display this note again by executing the following command.


Restart service
^^^^^^^^^^^^

.. include:: ../include/start_service_k8s.rst

Check update status
^^^^^^^^^^^^^^^^^^^^^^

| Input the commands below into the command line and check that the update process has ended.

.. code-block:: bash
   :caption: Command

   # Acquire Pod list
   kubectl get po -n exastro

| If the process was successfull, the "ita-migration-xxx" and "platform-migration-xxx" status will display "Completed", and all other processes will display "Running".
| ※The process might take a couple of minutes before ending.

.. code-block:: bash
   :caption: Output results

    NAME                                                      READY   STATUS      RESTARTS   AGE
    ita-api-admin-64657656c6-r4s2l                            1/1     Running     0          30m
    ita-api-oase-receiver-6647cb4457-46d2                     1/1     Running     0          30m
    ita-api-organization-75ff9d599c-gthvl                     1/1     Running     0          30m
    ita-by-ansible-execute-fdd8dfc57-7676h                    1/1     Running     0          30m
    ita-by-ansible-legacy-role-vars-listup-6cd558d78b-xxl6x   1/1     Running     0          30m
    ita-by-ansible-legacy-vars-listup-5db44d54d8-zxqj7        1/1     Running     0          30m
    ita-by-ansible-pioneer-vars-listup-6bf744f5b6-k8ctx       1/1     Running     0          30m
    ita-by-ansible-towermaster-sync-59594b5d84-phbg7          1/1     Running     0          30m
    ita-by-cicd-for-iac-f6855c588-r6w4k                       1/1     Running     0          30m
    ita-by-collector-6fc8c7b4d4-hjwck                         1/1     Running     0          30m
    ita-by-conductor-regularly-5897dcb9f6-4npz7               1/1     Running     0          30m
    ita-by-conductor-synchronize-6fd6dcd5f4-qgdhx             1/1     Running     0          30m
    ita-by-excel-export-import-df76d77c4-ms4j2                1/1     Running     0          30m
    ita-by-hostgroup-split-86746f758-b796k                    1/1     Running     0          30m
    ita-by-menu-create-8588c9747d-66xwn                       1/1     Running     0          30m
    ita-by-menu-export-import-6b8498f476-zwml7                1/1     Running     0          30m
    ita-by-oase-conclusion-567c85567b-8tgvq                   1/1     Running     0          30m
    ita-by-terraform-cli-execute-8478554d8d-qztbv             1/1     Running     0          30m
    ita-by-terraform-cli-vars-listup-bf688659d-zgh8d          1/1     Running     0          30m
    ita-by-terraform-cloud-ep-execute-5dbbb599b-qh8rc         1/1     Running     0          30m
    ita-by-terraform-cloud-ep-vars-listup-5564fcb5b-nphm7     1/1     Running     0          30m
    ita-migration-1.0.4-0wdt                                  0/1     Completed   0          30m
    ita-web-server-854bcdbbf4-s7fdb                           1/1     Running     0          30m
    keycloak-56d8b4556c-tndnv                                 1/1     Running     0          30m
    platform-api-bddb446db-s9zjh                              1/1     Running     0          30m
    platform-auth-799f57fb6c-wlbtf                            1/1     Running     0          30m
    platform-migration-1.4.2-6sks                             0/1     Completed   0          30m
    platform-web-88db7c489-wkmn9                              1/1     Running     0          30m

Uninstall
================

| This section explains how to uninstall Exastro.

Uninstall preparation
----------------------

.. warning::
  | We recommend that the user follow :doc:`../manuals/maintenance/backup_and_restore` and back up the data before uninstalling.

Uninstall
----------------

Start Uninstall
^^^^^^^^^^^^^^^^^^^^

| Start the uninstall process.

.. code-block:: bash
  :caption: Command

  helm uninstall exastro --namespace exastro

.. code-block:: bash
  :caption: Output results

  release "exastro" uninstalled


Delete data from database
^^^^^^^^^^^^^^^^^^^^^^^^^^

| This section describes how to delete data if a persistent volume has been created on Kubernetes using hostPath.
| If using external databases (managed databases included), make sure to delete environmental data as well.

.. code-block:: bash
  :caption: Command

  kubectl delete pv pv-database

.. code-block:: bash
  :caption: Execution results

  persistentvolume "pv-database" deleted

| Log in to the Kubernetes Control node and delete the data.
| The command below is an example of deleting data hostPath is specified :file:`/var/data/exastro-suite/exastro-platform/database` when creating persistent volumes.

.. code-block:: bash
   :caption: Command

   # Log in to control node that has persistent data
   ssh user@contol.node.example

   # Delete persistent data
   sudo rm -rf /var/data/exastro-suite/exastro-platform/database


Delete file data
^^^^^^^^^^^^^^^^^^^^

| This section describes how to delete file data if a persistent volume has been created on Kubernetes using hostPath.
| If using external databases (managed databases included), make sure to delete environmental data as well.

.. code-block:: bash
  :caption: Command

  kubectl delete pv pv-ita-common

.. code-block:: bash
  :caption: Execution results

  persistentvolume "pv-ita-common" deleted

| Log in to the Kubernetes Control node and delete the data.
| The command below is an example of deleting data hostPath is specified :file:`/var/data/exastro-suite/exastro-it-automation/ita-common` when creating persistent volumes.

.. code-block:: bash
   :caption: Command

   # Log in to control node that has persistent data
   ssh user@contol.node.example

   # Delete persistent data
   sudo rm -rf /var/data/exastro-suite/exastro-it-automation/ita-common