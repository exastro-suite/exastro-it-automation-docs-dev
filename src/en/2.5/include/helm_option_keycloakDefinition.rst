
.. list-table:: Shared settings (Keycloak) option parameters
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - global.keycloakDefinition.name
     - Keycloak definition name
     - No
     - keycloak
   * - global.keycloakDefinition.enabled
     - Select whether to use Keycloak definition or not
     - No
     - true
   * - global.keycloakDefinition.config.API_KEYCLOAK_PROTOCOL
     - Keycloak API endpoint protocol
     - No
     - "http”
   * - global.keycloakDefinition.config.API_KEYCLOAK_HOST
     - Keycloak API endpoint host name or FQDN
     - No
     - "keycloak"
   * - global.keycloakDefinition.config.API_KEYCLOAK_PORT
     - Keycloak API endpoint port number
     - No
     - "8080"
   * - global.keycloakDefinition.config.KEYCLOAK_PROTOCOL
     - Keycloak endpoint protocol
     - No
     - "http"
   * - global.keycloakDefinition.config.KEYCLOAK_HOST
     - Keycloak endpoint host name or FQDN
     - No
     - "keycloak"
   * - global.keycloakDefinition.config.KEYCLOAK_PORT
     - Keycloak API endpoint port number
     - No
     - "8080"
   * - global.keycloakDefinition.config.KEYCLOAK_MASTER_REALM
     - Keycloak master realm name
     - No
     - "master"
   * - global.keycloakDefinition.config.KEYCLOAK_DB_DATABASE
     - Database name used by Keycloak
     - No
     - "keycloak"
   * - global.keycloakDefinition.secret.SYSTEM_ADMIN
     - | Specify user that has Admin permission for the Keycloak master realm.
       | Creates the specified DB user
       | ※Change KEYCLOAK_USER→SYSTEM_ADMIN
     - Required
     - Free string
   * - global.keycloakDefinition.secret.SYSTEM_ADMIN_PASSWORD
     - | Password for the user that has Admin permission for the Keycloak master realm(No encode)
       | ※Change KEYCLOAK_PASSWORD→SYSTEM_ADMIN_PASSWORD
     - Required
     - Free string
   * - global.keycloakDefinition.secret.KEYCLOAK_DB_USER
     - | Database user used by Keycloak
       | Creates the specified DB user
     - Required
     - Free string
   * - global.keycloakDefinition.secret.KEYCLOAK_DB_PASSWORD
     - Password for the Database user used by Keycloak(No encode)
     - Required
     - Free string
