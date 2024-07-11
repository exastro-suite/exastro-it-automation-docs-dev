
.. list-table:: ita-by-terraform-cloud-ep-execute Values list
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - exastro-it-automation.ita-by-terraform-cloud-ep-execute.replicaCount
     - Pod replica number
     - No
     - 1
   * - exastro-it-automation.ita-by-terraform-cloud-ep-execute.extraEnv.EXECUTE_INTERVAL
     - Waiting time from the proccess ends to the next execution
     - No
     - 10
   * - exastro-it-automation.ita-by-terraform-cloud-ep-execute.extraEnv.PLATFORM_API_HOST
     - Exastro shared platform internal API endpoint host name
     - No
     - "platform-api"
   * - exastro-it-automation.ita-by-terraform-cloud-ep-execute.extraEnv.PLATFORM_API_PORT
     - Exastro shared platform internal API endpoint port number(TCP)
     - No
     - "8000"
   * - exastro-it-automation.ita-by-terraform-cloud-ep-execute.image.repository
     - Container image repository name
     - No
     - docker.io/exastro/exastro-it-automation-by-terraform-cloud-ep-execute
   * - exastro-it-automation.ita-by-terraform-cloud-ep-execute.image.tag
     - Container image tag
     - No
     - ""
   * - exastro-it-automation.ita-by-terraform-cloud-ep-execute.image.pullPolicy
     - Image pull policy
     - Yes
     - | :program:`IfNotPresent` (Default): Pull only if Container image does not exist
       | :program:`Always`: Always pull
       | :program:`None`: Never pull
