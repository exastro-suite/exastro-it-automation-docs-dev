
.. list-table:: ita-by-ansible-execute Values list
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - exastro-it-automation.ita-by-ansible-execute.replicaCount
     - Pod replica number
     - No
     - 1
   * - exastro-it-automation.ita-by-ansible-execute.image.repository
     - Container image repository name
     - No
     - docker.io/exastro/exastro-it-automation-by-ansible-execute
   * - exastro-it-automation.ita-by-ansible-execute.image.tag
     - Container image tag
     - No
     - ""
   * - exastro-it-automation.ita-by-ansible-execute.image.pullPolicy
     - Image pull policy
     - Yes
     - | :program:`IfNotPresent` (Default): Pull only if Container image does not exist
       | :program:`Always`: Always pull
       | :program:`None`: Never pull
   * - exastro-it-automation.ita-by-ansible-execute.extraEnv.EXECUTE_INTERVAL
     - Waiting time from the proccess ends to the next execution
     - No
     - 10
   * - exastro-it-automation.ita-by-ansible-execute.extraEnv.ANSIBLE_AGENT_IMAGE
     - Ansible Agent container repository name
     - No
     - exastro/exastro-it-automation-by-ansible-agent
   * - exastro-it-automation.ita-by-ansible-execute.extraEnv.ANSIBLE_AGENT_IMAGE_TAG
     - Ansible Agent container image tag
     - No
     - 2.0.0
   * - exastro-it-automation.ita-by-ansible-execute.extraEnv.PLATFORM_API_HOST
     - Exastro shared platform internal API endpoint host name
     - No
     - "platform-api"
   * - exastro-it-automation.ita-by-ansible-execute.extraEnv.PLATFORM_API_PORT
     - Exastro shared platform internal API endpoint port number(TCP)
     - No
     - "8000"
   * - exastro-it-automation.ita-by-ansible-execute.serviceAccount.create
     - Whether to create Ansible Agent service account or not
     - Yes
     - | :program:`false` (Default): Does not create service account
       | :program:`true`: Creates service account
   * - exastro-it-automation.ita-by-ansible-execute.serviceAccount.name
     - Created service account name
     - No
     - exastro-it-automation.ita-by-ansible-execute-sa