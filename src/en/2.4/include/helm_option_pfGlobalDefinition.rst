
.. list-table:: Shared settings (Exastro shared platform) option parameters
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - global.pfGlobalDefinition.name
     - Exastro shared platform definition name
     - No
     - pf-global
   * - global.pfGlobalDefinition.enabled
     - Exastro shared platform definition activation flag
     - No
     - true
   * - global.pfGlobalDefinition.image.registry
     - Default image registry used in Exastro shared platform
     - No
     - "docker.io"
   * - global.pfGlobalDefinition.image.organization
     - Image registry organization name used in Exastro shared platform
     - No
     - exastro
   * - global.pfGlobalDefinition.image.package
     - Image registry package name used in Exastro shared platform
     - No
     - exastro-platform
   * - global.pfGlobalDefinition.config.DEFAULT_LANGUAGE
     - Default language used in Exastro shared platform
     - No
     - "ja"
   * - global.pfGlobalDefinition.config.LANGUAGE
     - Usable language in Exastro shared platform
     - No
     - "en"
   * - global.pfGlobalDefinition.config.TZ
     - Timezone used in Exastro shared platform
     - No
     - "Asia/Tokyo"
   * - global.pfGlobalDefinition.config.PYTHONIOENCODING
     - Python file character code used in Exastro shared platform
     - No
     - utf-8
   * - global.pfGlobalDefinition.config.PLATFORM_API_PROTOCOL
     - Exastro shared platform internal API endpoint protocol
     - No
     - "http"
   * - global.pfGlobalDefinition.config.PLATFORM_API_HOST
     - Exastro shared platform internal API endpoint host name
     - No
     - "platform-api"
   * - global.pfGlobalDefinition.config.PLATFORM_API_PORT
     - Exastro shared platform internal API endpoint port number(TCP)
     - No
     - "8000"
   * - global.pfGlobalDefinition.config.PLATFORM_WEB_PROTOCOL
     - Exastro shared platform internal web endpoint protocol
     - No
     - "http"
   * - global.pfGlobalDefinition.config.PLATFORM_WEB_HOST
     - Exastro shared platform internal web endpoint protocol host name
     - No
     - "platform-web"
   * - global.pfGlobalDefinition.config.PLATFORM_WEB_PORT
     - Exastro shared platform internal web endpoint protocol port number(TCP)
     - No
     - "8000"
   * - global.pfGlobalDefinition.secret.ENCRYPT_KEY
     - | AES key for encrypting and decrypting data saved within Exastro Platform.
       | Free 32 byte ASCII BASE64 encoded string value
     - Yes
     - | Random 32 byte ASCII BASE64 encoded string value
   * - global.pfGlobalDefinition.persistence.enabled
     - | Whether to persist Exastro IT Automation data or not
       | ※Deleted in v2.3.
     - Delete
     - | :program:`"true"` (Default): Persist data
       | :program:`"false"`: Does not persist data
   * - global.pfGlobalDefinition.persistence.accessMode
     - | Persistent Volume Claim access mode in Exastro IT Automation
       | ※Deleted in v2.3.
     - Delete
     - | :program:`ReadWriteMany` (Default): Volume is multiple notes and mounted as read only.
       | :program:`ReadWriteOnce`: Volume is a single node and mounted as read/write.
   * - global.pfGlobalDefinition.persistence.size
     - | Required volume Persistent Volume claim volume size in Exastro IT Automation (Bytes)
       | ※Deleted in v2.3.
     - Delete
     - "10Gi"
   * - global.pfGlobalDefinition.persistence.volumeType
     - | Volume type for the Persistent Volume in Exastro IT Automation.
       | Not required if using Storage Class.
       | ※Deleted in v2.3.
     - Delete
     - "hostPath"
   * - global.pfGlobalDefinition.persistence.storageClass
     - | Storage Class used to persist data in Exastro IT Automation
       | Not required if using Persistent Volume.
       | ※Deleted in v2.3.
     - Delete
     - No
