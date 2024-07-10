
.. list-table:: GitLab container option parameters
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - exastro-platform.gitlab.enabled
     - Whether to deploy GitLab container or not
     - Yes
     - | :program:`true` : Deploys GitLab container.
       | :program:`false` (Default): Does not deploy GitLab container.
   * - exastro-platform.gitlab.extraEnv.GITLAB_OMNIBUS_CONFIG
     - GitLab container environment variable configuration
     - Yes
     - | postgresql['shared_buffers'] = "2048MB"
       | postgresql['work_mem'] = "128MB"
       | postgresql['maintenance_work_mem'] = "128MB"
       | postgresql['effective_cache_size'] = "128MB"
       | postgresql['checkpoint_segments'] = 16
       | postgresql['checkpoint_timeout'] = "10min"
       | external_url 'http://gitlab:40080'
       | nginx['listen_port'] = 40080
       | gitlab_rails['initial_root_password'] = "${GITLAB_ROOT_PASSWORD:-}"
       | gitlab_rails['registry_enabled'] = false;
       | gitlab_rails['db_prepared_statements'] = false;
       | gitlab_rails['monitoring_whitelist'] = ['0.0.0.0/0']
       | # gitlab_rails['env'] = {'MALLOC_CONF' => 'dirty_decay_ms:1000,muzzy_decay_ms:1000'}
       | # puma['worker_processes'] = 0
       | prometheus_monitoring['enable'] = false
       | # sidekiq['max_concurrency'] = 10
       | # gitaly['env'] = {'MALLOC_CONF' => 'dirty_decay_ms:1000,muzzy_decay_ms:1000', 'GITALY_COMMAND_SPAWN_MAX_PARALLEL' => '2'}
   * - exastro-platform.gitlab.extraEnv.GITLAB_POST_RECONFIGURE_SCRIPT
     - GitLab container token authentication and creation command
     - No
     - | while ! curl -sfI -o /dev/null http://localhost:40080/-/readiness;
       | do
       | echo "GitLab service is not ready."
       | sleep 1
       | done
       | echo "GitLab service started normally"
       | curl -Ssf -H "PRIVATE-TOKEN: ${GITLAB_ROOT_TOKEN:-}" "http://localhost:40080/api/v4/version" || (
       |   gitlab-rails runner "token = User.find_by_username('root').personal_access_tokens.create(scopes: [:api, :write_repository, :sudo], name: 'exastro system token'); token.set_token('${GITLAB_ROOT_TOKEN:-}'); token.save!"
       | )
       | echo "GitLab post reconfigure script ended."
   * - exastro-platform.gitlab.image.repository
     - Container image repository name
     - No
     - "docker.io/gitlab/gitlab-ce"
   * - exastro-platform.gitlab.image.tag
     - Container image tag
     - No
     - "15.11.13-ce.0"
   * - exastro-platform.gitlab.image.pullPolicy
     - Image pull policy
     - Yes
     - | :program:`IfNotPresent` (Default): Pull only if Container image does not exist
       | :program:`Always`: Always pull
       | :program:`None`: Never pull
   * - exastro-platform.gitlab.persistence.enabled
     - Exastro shared data base data persistence flag
     - Yes
     - | :program:`"true"` (Default): Persist data
       | :program:`"false"`: Does not persist data
   * - exastro-platform.gitlab.persistence.volumeName
     - Persistent volume name
     - No
     - pv-gitlab
   * - exastro-platform.gitlab.persistence.reinstall
     - Whether to initialize data area when re-installing
     - No
     - | :program:`"true"` : Initialize (delete) data
       | :program:`"false"`(Default): Does not initialize (delete) data
   * - exastro-platform.gitlab.persistence.accessMode
     - Specify access mode to Persistent volume.
     - Yes (When persisting data)
     - "ReadWriteOnce"
   * - global.databaseDefinition.persistence.size
     - Persistent volume disk space
     - Yes (When persisting data)
     - "20Gi"
   * - exastro-platform.gitlab.persistence.storageClass
     - Specify class when using storage class for Persistent volume
     - Yes (When persisting data)
     - | :program:`"-"` (Default): Does not specify Storage class
       | :program:`Storage class name`: Specify storage class name provided by cloud provider or other providers.
   * - exastro-platform.gitlab.persistence.matchLabels.name
     - Persistent volume name
     - No
     - pv-gitlab
   * - exastro-platform.gitlab.resources.requests.memory
     - Memory required
     - Yes
     - "4Gi"
   * - exastro-platform.gitlab.resources.requests.cpu
     - CPU required
     - Yes
     - "4"
   * - exastro-platform.gitlab.resources.limits.memory
     - Memory limit
     - Yes
     - "8Gi"
   * - exastro-platform.gitlab.resources.limits.cpu
     - CPU limit
     - Yes
     - "8"
   * - exastro-platform.gitlab.service.type
     - GitLab service type
     - Yes
     - | :program:`ClusterIP` (Default): Select when using Ingress Controller
       | :program:`LoadBalancer` : Select when using LoadBalancer
       | :program:`NodePort` : Select when using NodePort
   * - exastro-platform.gitlab.service.name
     - | GitLab service name
     - No
     - "gitlab"
   * - exastro-platform.gitlab.service.port
     - | Public port number for GitLab service
     - Yes (When using NodePort)
     - "40080"
   * - exastro-platform.gitlab.service.nodePort
     - | Public port number for GitLab service management
     - Yes (When using NodePort)
     - "30082"