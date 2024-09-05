
.. list-table:: MariaDB container option parameters
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - exastro-platform.mariadb.enabled
     - Select whether to deploy MariaDB container or not
     Yes 
     - | :program:`true` (Default): Deploys MariaDB container
       | :program:`false` : Does not deploy MariaDB container
   * - exastro-platform.mariadb.image.repository
     - Container image repository name
     - No
     - "docker.io/mariadb"
   * - exastro-platform.mariadb.image.tag
     - Container image tag
     - No
     - "10.11"
   * - exastro-platform.mariadb.image.pullPolicy
     - Image pull policy
     - Yes
     - | :program:`IfNotPresent` (Default): Pull only if Container image does not exist
       | :program:`Always`: Always pull
       | :program:`None`: Never pull
   * - exastro-platform.mariadb.persistence.enabled
     - Exastro shared data base data persistence flag
     Yes 
     - | :program:`"true"` (Default): Persist data
       | :program:`"false"`: Does not persist data
   * - exastro-platform.mariadb.persistence.reinstall
     - Whether to initialize data area when re-installing
     - No
     - | :program:`"true"`: Initialize (delete) data
       | :program:`"false"`(Default): Does not initialize (delete) data
   * - exastro-platform.mariadb.persistence.accessMode
     - Specify access mode to Persistent volume.
     Yes (When persisting data)
     - "ReadWriteOnce"
   * - exastro-platform.mariadb.persistence.size
     - Persistent volume disk space
     Yes  (When persisting data)
     - "20Gi"
   * - exastro-platform.mariadb.persistence.storageClass
     - Specify class when using storage class for Persistent volume
     Yes  (When persisting data)
     - | :program:`"-"` (Default): Does not specify Storage class
       | :program:`Storage class name`: Specify storage class name provided by cloud provider or other providers.
   * - exastro-platform.mariadb.persistence.matchLabels.name
     - Specify Persistent volume name
     Yes (When persisting data)
     - "pv-database"
   * - exastro-platform.mariadb.resources.requests.memory
     - Memory requirement
     Yes 
     - "256Mi"
   * - exastro-platform.mariadb.resources.requests.cpu
     - CPU requirement
     Yes 
     - "1m"
   * - exastro-platform.mariadb.resources.limits.memory
     - Memory limit
     Yes 
     - "2Gi"
   * - exastro-platform.mariadb.resources.limits.cpu
     - CPU limit
     Yes 
     - "4"