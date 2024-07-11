
.. list-table:: Shared settings (Exastro IT Automation) Option parameter
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - global.itaGlobalDefinition.name
     - Exastro IT Automation definition name
     - No
     - ita-global
   * - global.itaGlobalDefinition.enabled
     - Decide whether to use Exastro IT Automation definition or not
     - No
     - true
   * - global.itaGlobalDefinition.image.registry
     - Default image registry used in Exastro IT Automation.
     - No
     - docker.io
   * - global.itaGlobalDefinition.image.organization
     - Default image registry organization name used in Exastro IT Automation
     - No
     - exastro
   * - global.itaGlobalDefinition.image.package
     - Default image registry package name used in Exastro IT Automation
     - No
     - exastro-it-automation
   * - global.itaGlobalDefinition.config.DEFAULT_LANGUAGE
     - Default language used in Exastro IT Automation
     - No
     - "ja"
   * - global.itaGlobalDefinition.config.LANGUAGE
     - Usable language in Exastro IT Automation 
     - No
     - en
   * - global.itaGlobalDefinition.config.CONTAINER_BASE
     - Deply destination container environment
     - No
     - kubernetes
   * - global.itaGlobalDefinition.config.TZ
     - Time zone used in Exastro IT Automation time
     - No
     - Asia/Tokyo
   * - global.itaGlobalDefinition.config.STORAGEPATH
     - Shared directory mount point
     - No
     - /storage/
   * - global.itaGlobalDefinition.secret.ENCRYPT_KEY
     - | AES key for encrypting and decrypting data saved within Exastro Platform.
       | Free 32 byte ASCII BASE64 encoded string value
     - Yes
     - | Random 32 byte ASCII BASE64 encoded string value
   * - global.itaGlobalDefinition.persistence.enabled
     - | Whether to persist Exastro IT Automation data or not
     - Yes
     - | :program:`"true"` (Default): Persist data
       | :program:`"false"`: Does not persist data
   * - global.itaGlobalDefinition.persistence.accessMode
     - | Persistent Volume Claim access mode in Exastro IT Automation
     - Yes (When persisting data)
     - | :program:`ReadWriteMany` (Default): Volume is multiple notes and mounted as read only.
       | :program:`ReadWriteOnce`: Volume is a single node and mounted as read/write.
   * - global.itaGlobalDefinition.persistence.size
     - | Required volume Persistent Volume claim volume size in Exastro IT Automation (Bytes)
     - Yes (When persisting data)
     - "10Gi"
   * - global.itaGlobalDefinition.persistence.volumeType
     - | Volume type for the Persistent Volume in Exastro IT Automation.
       | Not required if using Storage Class.
     - Yes (When persisting data)
     - "hostPath"
   * - global.itaGlobalDefinition.persistence.storageClass
     - | Storage Class used to persist data in Exastro IT Automation
       | Not required if using Persistent Volume.
     - Yes (When persisting data)
     - | :program:`"-"` (Default): Does not specify Storage class
       | :program:`Storage class name`: Specify storage class name provided by cloud provider or other providers.
