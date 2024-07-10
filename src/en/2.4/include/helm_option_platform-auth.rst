
.. list-table:: Exastro Platform authentication function option parameters
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - exastro-platform.platform-auth.extraEnv.EXTERNAL_URL
     - | Publication URL for Exastro Platform endpoint
       | If a failure happends with the Exastro endpoint publication URL caused by a reverse proxy or PAT(Port Address Transport), the user might have to configure this in order to connect to the service.
     Yes
     - | Endpoint URL for publication
       | (http[s]://your-exastro.domain:port)
   * - exastro-platform.platform-auth.extraEnv.EXTERNAL_URL_MNG
     - | Publication URL for Exastro Platform Management console endpoint
       | If a failure happends with the Exastro endpoint publication URL caused by a reverse proxy or PAT(Port Address Transport), the user might have to configure this in order to connect to the service.
     Yes
     - | Endpoint URL for publication
       | (http[s]://your-exastro.domain:port)
   * - exastro-platform.platform-auth.ingress.enabled
     - Decide whether to use Ingress in Exastro Platform or not
     Yes
     - | :program:`true` (Default): Deploys Ingress Controller to access to Exastro Platform.
       | :program:`false` : Does not deploy Ingress Controller.
   * - exastro-platform.platform-auth.ingress.hosts[0].host
     - | Exastro Platform management console endpoint host name or FQDN
       | Will need to register record to DNS
     Yes (When using Ingress)
     - "exastro-suite.example.local"
   * - exastro-platform.platform-auth.ingress.hosts[0].paths[0].path
     - Exastro Platform management console endpoint path rule
     - No
     - "/"
   * - exastro-platform.platform-auth.ingress.hosts[0].paths[0].pathType
     - Exastro Platform management console endpoint path match condition
     - No
     - "Prefix"
   * - exastro-platform.platform-auth.ingress.hosts[0].paths[0].backend
     - Exastro Platform Management console service name
     - No
     - "http"
   * - exastro-platform.platform-auth.ingress.hosts[1].host
     - | Exastro Platform endpoint host name or FQDN
       | Will need to register record to DNS
     Yes (When using Ingress)
     - "exastro-suite-mng.example.local"
   * - exastro-platform.platform-auth.ingress.hosts[1].paths[0].path
     - Exastro Platform endpoint path rule
     - No
     - "/"
   * - exastro-platform.platform-auth.ingress.hosts[1].paths[0].pathType
     - Exastro Platform endpoint path match condition
     - No
     - "Prefix"
   * - exastro-platform.platform-auth.ingress.hosts[1].paths[0].backend
     - Exastro Platform endpoint's endpoint service name
     - No
     - "httpMng"
   * - exastro-platform.platform-auth.service.type
     - Exastro Platform service type
     Yes
     - | :program:`ClusterIP` (Default): Select when using Ingress Controller
       | :program:`LoadBalancer` : Select when using LoadBalancer
       | :program:`NodePort` : Select when using NodePort
   * - exastro-platform.platform-auth.service.http.nodePort
     - | Exastro Platform service public port number
     Yes (When using NodePort)
     - "30080"
   * - exastro-platform.platform-auth.service.httpMng.nodePort
     - | Exastro Platform system's management public port number
     Yes (When using NodePort)
     - "30081"
   * - exastro-platform.platform-auth.image.repository
     - Container image repository name
     - No
     - "docker.io/exastro/exastro-platform-auth"
   * - exastro-platform.platform-auth.image.tag
     - Container image tag
     - No
     - ""
