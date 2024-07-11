
.. list-table:: shared settings (Exastro database) option settings
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - global.databaseDefinition.name
     - Exastro shared database definition name
     - No
     - "mariadb"
   * - global.databaseDefinition.enabled
     - Whether to use Exastro shared database definition
     - No
     - true
   * - global.databaseDefinition.secret.MARIADB_ROOT_PASSWORD
     - Password (not encoded) configured to the Exastro shared data base root account
     - Required
     - Free character string
   * - global.databaseDefinition.persistence.enabled
     - Exastro shared data base data persistence flag
     - Yes
     - | :program:`"true"` (Default): Persist data
       | :program:`"false"`: Does not persist data
   * - global.databaseDefinition.persistence.reinstall
     - Whether to initialize data area when re-installing
     - Yes (When persisting data)
     - | :program:`"true"` (Default): Initialize (delete) data
       | :program:`"false"`: Does not initialize (delete) data
   * - global.databaseDefinition.persistence.accessMode
     - Specify access mode to Persistent volume.
     - No
     - "ReadWriteOnce"
   * - global.databaseDefinition.persistence.size
     - Persistent volume disk space
     - Yes (When persisting data)
     - "20Gi"
   * - global.databaseDefinition.persistence.volumeType
     - Persistent volume type
     - Yes (currently not active)
     - | :program:`"hostPath"` (Default): Saves data to Kubernetes cluster node(Not recommended)
       | :program:`"AKS"`: Uses AKS storage class
   * - global.databaseDefinition.persistence.storageClass
     - Specify class when using storage class for Persistent volume
     - Yes (When persisting data)
     - | :program:`"-"` (Default): Does not specify Storage class
       | :program:`Storage class name`: Specify storage class name provided by cloud provider or other providers.
