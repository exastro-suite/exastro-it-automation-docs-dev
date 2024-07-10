
.. list-table:: Keycloak container option parameters
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - exastro-platform.keycloak.enabled
     - Select whether to deploy Keycloak container or not
     - Yes
     - | :program:`true` (Default): Deploys Keycloak container
       | :program:`false` : Does not deploy Keycloak container
   * - exastro-platform.keycloak.image.repository
     - Container image repository name
     - No
     - "docker.io/exastro/keycloak"
   * - exastro-platform.keycloak.image.tag
     - Container image tag
     - No
     - ""
   * - exastro-platform.keycloak.image.pullPolicy
     - Image pull policy
     - Yes
     - | :program:`IfNotPresent` (Default): Pull only if Container image does not exist
       | :program:`Always`: Always pull
       | :program:`None`: Never pull
   * - exastro-platform.keycloak.resources.requests.memory
     - Memory required
     - Yes
     - "256Mi"
   * - exastro-platform.keycloak.resources.requests.cpu
     - CPU required
     - Yes
     - "1m"
   * - exastro-platform.keycloak.resources.limits.memory
     - Memory limit
     - Yes
     - "2Gi"
   * - exastro-platform.keycloak.resources.limits.cpu
     - CPU limit
     - Yes
     - "4"
