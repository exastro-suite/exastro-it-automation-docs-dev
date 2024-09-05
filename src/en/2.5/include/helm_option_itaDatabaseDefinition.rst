
.. list-table:: Shared settings (Exastro IT Automation database) Option parameter
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - global.itaDatabaseDefinition.name
     - Exastro IT Automation database definition name
     - No
     - "ita-database"
   * - global.itaDatabaseDefinition.enabled
     - Use Exastro IT Automation database definition or not
     - No
     - true
   * - global.itaDatabaseDefinition.config.DB_VENDOR
     - Database for the Exastro IT Automation database
     - Yes (When using external database)
     - | :program:`"mariadb"` (Default): Use MariaDB
       | :program:`"mysql"`: Use MySQL
   * - global.itaDatabaseDefinition.config.DB_HOST
     - | DB used by the Exastro IT Automation database
       | By default, the container deployed within the same Kubernetes cluster is specified.
       | If the user is using an DB external from the cluster, they must configure settings to do so.
     - Yes (When using external database)
     - "mariadb"
   * - global.itaDatabaseDefinition.config.DB_PORT
     - Exastro IT Automation database port number(TCP)
     - Yes (When using external database)
     - "3306"
   * - global.itaDatabaseDefinition.config.DB_DATABASE
     - Exastro IT Automation database name
     - Yes (When using external database)
     - "platform"
   * - global.itaDatabaseDefinition.secret.DB_ADMIN_USER
     - Username of the DB user with Admin permission for the Exastro IT Automation database
     - Required
     - Admin permission DB user username
   * - global.itaDatabaseDefinition.secret.DB_ADMIN_PASSWORD
     - Password of the DB user with Admin permission for the Exastro IT Automation database(no encode)
     - Required
     - Admin permission DB user password
   * - global.itaDatabaseDefinition.secret.DB_USER
     - | Name of the user created in the Exastro IT Automation database.
       | Creates the specified DB user
     - Required
     - Free string
   * - global.itaDatabaseDefinition.secret.DB_PASSWORD
     - Password of the user created in the Exastro IT Automation database(no encode)
     - Required
     - Free string
