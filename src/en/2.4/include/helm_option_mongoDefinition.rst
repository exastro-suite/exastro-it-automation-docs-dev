
.. list-table:: OASE settings (Exastro OASE database) option parameters
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - global.mongoDefinition.config.MONGO_PROTOCOL
     - | DB protocol used by database for OASE
     - Yes
     - "http"
   * - global.mongoDefinition.config.MONGO_HOST
     - | DB used by Database for OASE
       | Specifies the Container deployed within the same Kubernetes class by default.
       | Must be configured if using DB external to the cluster
     - Yes (When using external databases)
     - "mongo"
   * - global.mongoDefinition.config.MONGO_PORT
     - Port number used in Database for OASE(TCP)
     - Yes (When using external databases)
     - "27017"
   * - global.mongoDefinition.secret.MONGO_ADMIN_USER
     -  DB username that has Admin permission to the Database for OASE
     - Required
     - DB username with Admin permission
   * - global.mongoDefinition.secret.DB_ADMIN_PASSWORD
     - Password for the DB user that has Admin permission to the Database for OASE(No encode)
     - Required
     - Password for DB user with Admin permission
