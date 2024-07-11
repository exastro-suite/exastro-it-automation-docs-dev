
.. list-table:: ita-api-organization Values list
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - exastro-it-automation.ita-api-organization.replicaCount
     - Pod replica number
     - No
     - 1
   * - exastro-it-automation.ita-api-organization.image.repository
     - Container image repository name
     - No
     - docker.io/exastro/exastro-it-automation-api-organization
   * - exastro-it-automation.ita-api-organization.image.tag
     - Container image tag
     - No
     - ""
   * - exastro-it-automation.ita-api-organization.image.pullPolicy
     - Image pull policy
     - Yes
     - | :program:`IfNotPresent` (Default): Pull only if Container image does not exist
       | :program:`Always`: Always pull
       | :program:`None`: Never pull
