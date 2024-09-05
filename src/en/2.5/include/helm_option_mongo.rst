
.. list-table:: MongoDB container option parameters
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - exastro-platform.mongo.enabled
     - Select whether to deploy MongoDB container or not
     - Yes
     - | :program:`true` (Default): Deploys MongoDB container
       | :program:`false` : Does not deploy MongoDB container
   * - exastro-platform.mongo.image.repository
     - Container image repository name
     - No
     - "mongo"
   * - exastro-platform.mongo.image.pullPolicy
     - Image pull policy
     - Yes
     - | :program:`IfNotPresent` (Default): Pull only if Container image does not exist
       | :program:`Always`: Always pull
       | :program:`None`: Never pull
   * - exastro-platform.mongo.image.tag
     - Container image tag
     - No
     - "6.0"
   * - exastro-platform.mongo.persistence.enabled
     - Exastro shared data base data persistence flag
     - Yes
     - | :program:`"true"` (Default): Persist data
       | :program:`"false"`: Does not persist data
   * - exastro-platform.mongo.persistence.reinstall
     - Whether to initialize data area when re-installing
     - No
     - | :program:`"true"`: Initialize (delete) data
       | :program:`"false"`(Default): Does not initialize (delete) data
   * - exastro-platform.mongo.persistence.accessMode
     - Specify access mode to Persistent volume.
     - No
     - "ReadWriteOnce"
   * - exastro-platform.mongo.persistence.size
     - Persistent volume disk space
     - Yes (When persisting data)
     - "20Gi"
   * - exastro-platform.mongo.persistence.storageClass
     - Specify class when using storage class for Persistent volume
     - Yes (When persisting data)
     - | :program:`"-"` (Default): Does not specify Storage class
       | :program:`Storage class name`: Specify storage class name provided by cloud provider or other providers.
   * - exastro-platform.mongo.persistence.matchLabels.name
     - Specify the name of the persistent volume
     - No
     - "Comment out"
   * - exastro-platform.mongo.resources.requests.memory
     - Memory required
     - Yes
     - "256Mi"
   * - exastro-platform.mongo.resources.requests.cpu
     - CPU required
     - Yes
     - "1m"
   * - exastro-platform.mongo.resources.limits.memory
     - Memory limit
     - Yes
     - "2Gi"
   * - exastro-platform.mongo.resources.limits.cpu
     - CPU limit
     - Yes
     - "4"