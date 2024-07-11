
.. list-table:: Shared settings (Exastro shared platform database) option parameters
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - global.pfDatabaseDefinition.name
     - Database definition name for Authentication function
     - No
     - "pf-database"
   * - global.pfDatabaseDefinition.enabled
     - Select whether to define database for Authentication function
     - No
     - true
   * - global.pfDatabaseDefinition.config.DB_VENDOR
     - Database used by the Authentication function database
     - Yes (When using external Databases)
     - | :program:`"mariadb"` (Default): Use MariaDB
       | :program:`"mysql"`: Use MySQL 
   * - global.pfDatabaseDefinition.config.DB_HOST
     - | DB used by Database for Authentication function
       | Specifies the Container deployed within the same Kubernetes class by default.
       | Must be configured if using DB external to the cluster
     - Yes (When using external Databases)
     - "mariadb"
   * - global.pfDatabaseDefinition.config.DB_PORT
     - Port number used by Database for Authentication function(TCP)
     - Yes (When using external Databases)
     - "3306"
   * - global.pfDatabaseDefinition.config.DB_DATABASE
     - Database name used by Database for Authentication function
     - Yes (When using external Databases)
     - "platform"
   * - global.pfDatabaseDefinition.secret.DB_ADMIN_USER
     - DB username that has Admin permission to the Database for Authentication function
     - Required
     - DB username with Admin permission
   * - global.pfDatabaseDefinition.secret.DB_ADMIN_PASSWORD
     - Password for the DB user that has Admin permission to the Database for Authentication function(No encode)
     - Required
     - Password for DB user with Admin permission
   * - global.pfDatabaseDefinition.secret.DB_USER
     - | DB username created to Database for Authentication function
       | Creates the specified DB user
     - Required
     - Free string
   * - global.pfDatabaseDefinition.secret.DB_PASSWORD
     - Password for DB user created to Database for Authentication function(No encode)
     - Required
     - Free string
