
1. Confirm running Pods.

   | Before starting, check how many Pods are running and record the states

   .. code-block:: bash
     :caption: Command

     RS_AE=`kubectl get deploy ita-by-ansible-execute -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_ALRV=`kubectl get deploy ita-by-ansible-legacy-role-vars-listup -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_ATS=`kubectl get deploy ita-by-ansible-towermaster-sync -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_CS=`kubectl get deploy ita-by-conductor-synchronize -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_MC=`kubectl get deploy ita-by-menu-create -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_PA=`kubectl get deploy platform-auth -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`

   | Execute the following when updating from ITA2.1.0 to ITA2.1.1.

   .. code-block:: bash

     RS_ALV=`kubectl get deploy ita-by-ansible-legacy-vars-listup -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_APV=`kubectl get deploy ita-by-ansible-pioneer-vars-listup -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_CFI=`kubectl get deploy ita-by-cicd-for-iac -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_CR=`kubectl get deploy ita-by-conductor-regularly -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_COL=`kubectl get deploy ita-by-collector -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_EEI=`kubectl get deploy ita-by-excel-export-import -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_HS=`kubectl get deploy ita-by-hostgroup-split -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_MEI=`kubectl get deploy ita-by-menu-export-import -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_TCE=`kubectl get deploy ita-by-terraform-cli-execute -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_TCV=`kubectl get deploy ita-by-terraform-cli-vars-listup -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_TCEE=`kubectl get deploy ita-by-terraform-cloud-ep-execute -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
     RS_TCEV=`kubectl get deploy ita-by-terraform-cloud-ep-vars-listup -o jsonpath='{@.spec.replicas}{"\n"}' -n exastro`
 

2. Stop Reverse proxy

   | Change the amount of running Reverse proxy (platform-auth) Pods to 0 and limit access from the end user.

   .. code-block:: bash
     :caption: Command

     kubectl scale deployment platform-auth -n exastro --replicas=0

3. Stop Backyard process

   | Change the amount of running BackYard process (ita-by-\*\*\*) Pods to 0 and stop Database updates.

   .. code-block:: bash
     :caption: Command

     kubectl scale deployment ita-by-ansible-execute -n exastro --replicas=0
     kubectl scale deployment ita-by-ansible-legacy-role-vars-listup -n exastro --replicas=0
     kubectl scale deployment ita-by-ansible-towermaster-sync -n exastro --replicas=0
     kubectl scale deployment ita-by-conductor-synchronize -n exastro --replicas=0
     kubectl scale deployment ita-by-menu-create -n exastro --replicas=0

   | Execute the following when updating from ITA2.1.0 to ITA2.1.1.

   .. code-block:: bash

     kubectl scale deployment ita-by-ansible-legacy-vars-listup -n exastro --replicas=0
     kubectl scale deployment ita-by-ansible-pioneer-vars-listup -n exastro --replicas=0
     kubectl scale deployment ita-by-cicd-for-iac -n exastro --replicas=0
     kubectl scale deployment ita-by-collector -n exastro --replicas=0
     kubectl scale deployment ita-by-conductor-regularly -n exastro --replicas=0
     kubectl scale deployment ita-by-excel-export-import -n exastro --replicas=0
     kubectl scale deployment ita-by-hostgroup-split -n exastro --replicas=0
     kubectl scale deployment ita-by-menu-export-import -n exastro --replicas=0
     kubectl scale deployment ita-by-terraform-cli-execute -n exastro --replicas=0
     kubectl scale deployment ita-by-terraform-cli-vars-listup -n exastro --replicas=0
     kubectl scale deployment ita-by-terraform-cloud-ep-execute -n exastro --replicas=0
     kubectl scale deployment ita-by-terraform-cloud-ep-vars-listup -n exastro --replicas=0

4. Check number of running Pods 

   | Check that the target running Pods are 0.

   .. code-block:: bash
     :caption: Command

     kubectl get deployment -n exastro

   .. code-block:: bash
     :caption: Execution results

     NAME                                     READY   UP-TO-DATE   AVAILABLE   AGE
     mariadb                                  1/1     1            1           3h41m
     ita-web-server                           1/1     1            1           3h41m
     platform-web                             1/1     1            1           3h41m
     ita-api-admin                            1/1     1            1           3h41m
     ita-api-organization                     1/1     1            1           3h41m
     platform-api                             1/1     1            1           3h41m
     keycloak                                 1/1     1            1           3h41m
     ita-by-menu-create                       0/0     0            0           3h41m
     ita-by-ansible-execute                   0/0     0            0           3h41m
     ita-by-ansible-legacy-role-vars-listup   0/0     0            0           3h41m
     ita-by-ansible-towermaster-sync          0/0     0            0           3h41m
     ita-by-conductor-synchronize             0/0     0            0           3h41m
     platform-auth                            0/0     0            0           3h41m

   | Check the following when updating from ITA2.1.0 to ITA2.1.1.

   .. code-block:: bash

     NAME                                     READY   UP-TO-DATE   AVAILABLE   AGE
     ita-by-ansible-legacy-vars-listup        0/0     0            0           3h41m
     ita-by-ansible-pioneer-vars-listup       0/0     0            0           3h41m
     ita-by-cicd-for-iac                      0/0     0            0           3h41m
     ita-by-collector                         0/0     0            0           3h41m
     ita-by-conductor-regularly               0/0     0            0           3h41m
     ita-by-excel-export-import               0/0     0            0           3h41m
     ita-by-hostgroup-split                   0/0     0            0           3h41m
     ita-by-menu-export-import                0/0     0            0           3h41m
     ita-by-terraform-cli-execute             0/0     0            0           3h41m
     ita-by-terraform-cli-vars-listup         0/0     0            0           3h41m
     ita-by-terraform-cloud-ep-execute        0/0     0            0           3h41m
     ita-by-terraform-cloud-ep-vars-listup    0/0     0            0           3h41m
