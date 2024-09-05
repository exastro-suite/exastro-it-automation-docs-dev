
.. list-table:: ita-database-setup-job Values list
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - exastro-it-automation.ita-database-setup-job.image.repository
     - Container image repository name
     - No
     - ※This parameter is not currently used
   * - exastro-it-automation.ita-database-setup-job.image.tag
     - Container image tag
     - No
     - ※This parameter is not currently used
   * - exastro-it-automation.ita-database-setup-job.image.pullPolicy
     - Image pull policy
     - Yes
     - | :program:`IfNotPresent` (Default): Pull only if Container image does not exist
       | :program:`Always`: Always pull
       | :program:`None`: Never pull
       | ※This parameter is not currently used
