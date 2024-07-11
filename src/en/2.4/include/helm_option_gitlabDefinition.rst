
.. list-table:: Shared settings (GitLab) option parameters
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Parameter
     - Description
     - Editable
     - Default value/ Selectable setting value
   * - global.gitlabDefinition.name
     - GitLab definition name
     - No
     - gitlab
   * - global.gitlabDefinition.enabled
     - GitLab definition
     - No
     - true
   * - global.gitlabDefinition.config.GITLAB_PROTOCOL
     - GitLab endpoint protocol
     - Yes
     - http
   * - global.gitlabDefinition.config.GITLAB_HOST
     - GitLab endpoint host name or FQDN
     - Yes
     - gitlab
   * - global.gitlabDefinition.config.GITLAB_PORT
     - GitLab endpoint port number
     - Yes
     - 80
   * - global.gitlabDefinition.secret.GITLAB_ROOT_PASSWORD
     - GitLab's Root permission password
     - Required
     - Free string（Cannot use reserved phrases over 8 letters）
   * - global.gitlabDefinition.secret.GITLAB_ROOT_TOKEN
     - GitLab root permission account access token
     - Required
     - Access token(Plain text)
