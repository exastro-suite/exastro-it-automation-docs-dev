============
Service list
============

| This document contains the different services in Exastro IT Automation.

Service list
============

| The "Monitoring target" column contains services that should be monitored.
| Services that are target for monitoring are marked with "〇", services that are not target are marked with "×".

.. list-table:: 
   :widths: 15 1 25 25
   :header-rows: 1
   :align: left

   * - | 
     - | Monitoring target
     - | Description
     - | Remarks
   * - | ita-ag-oase
     - | 〇
     - | Agent for OASE and external services that will have events collected from.
     - |
   * - | ita-api-admin
     - | 〇
     - | API that receives system admin related usage.
     - |
   * - | ita-api-oase-receiver
     - | 〇
     - | API that receives OASE related usage.
     - |
   * - | ita-api-organization
     - | 〇
     - | API for all ITA
     - |
   * - | ita-by-ansible-agent
     - | ×
     - | Agent for operation targets when executing with Ansible-Core.
     - | The agent is monitored by ita-by-ansible-execute, meaning that this is service is not target for monitoring.
   * - | ita-by-ansible-execute
     - | 〇
     - | Background execution service that manages Ansible executions.
     - |
   * - | ita-by-ansible-legacy-role-vars-listup
     - | 〇
     - | Background execution service that harvests variables for Ansible-LegacyRole
     - |
   * - | ita-by-ansible-legacy-vars-listup
     - | 〇
     - | Background execution service that harvests variables for Ansible-Legacy
     - |
   * - | ita-by-ansible-pioneer-vars-listup
     - | 〇
     - | Background execution service that harvests variables for Ansible-LegacyPioneer
     - |
   * - | ita-by-ansible-towermaster-sync
     - | 〇
     - | Background execution service that synchronizes the Ansible Tower registration information with ITA
     - |
   * - | ita-by-cicd-for-iac
     - | 〇
     - | Background execution service that links Remote repositories and ITA files based on the CI/CD for IaC settings
     - |
   * - | ita-by-collector
     - | 〇
     - | Background execution service that automatically registers the Ansible execution results to parameter sheets based on the Collect item value management settings
     - |
   * - | ita-by-conductor-regularly
     - | 〇
     - | Background execution service that runs the Conductor scheduled executions
     - |
   * - | ita-by-conductor-synchronize
     - | 〇
     - | Background execution service that manages Conductors
     - |
   * - | ita-by-excel-export-import
     - | 〇
     - | Background execution service that runs the Bulk Excel export/import function
     - |
   * - | ita-by-execinstance-dataautoclean
     - | 〇
     - | Background execution service that deletes data linked to Operations past their validity period based on the Operation deletion management settings
     - |
   * - | ita-by-file-autoclean
     - | 〇
     - | Background execution service that deletes files past their validity period based on the file deletion management settings
     - |
   * - | ita-by-hostgroup-split
     - | 〇
     - | Background execution service that divides and registers data registered to the parameter sheet to hosts based on the Host group settings
     - |
   * - | ita-by-menu-create
     - | 〇
     - | Background execution service that creates menus (parameter sheets)
     - |
   * - | ita-by-menu-export-import
     - | 〇
     - | Background execution service that runs the Menu export/import function
     - |
   * - | ita-by-oase-conclusion
     - | 〇
     - | Background execution service that runs the OASE rule decision function
     - |
   * - | ita-by-terraform-cli-execute
     - | 〇
     - | Background execution service that manages the Terraform-CLI operations
     - |
   * - | ita-by-terraform-cli-vars-listup
     - | 〇
     - | Background execution service that harvests variables for Terraform-CLI
     - |
   * - | ita-by-terraform-cloud-ep-execute
     - | 〇
     - | Background execution service that manages Terraform-Cloud/EP operations
     - |
   * - | ita-by-terraform-cloud-ep-vars-listup
     - | 〇
     - | Background execution service that harvests variables for Terraform-Cloud/EP
     - |
   * - | ita-migration 
     - | ×
     - | Service for ITA migrations
     - | This service is only target for monitoring when isntalling/updating
   * - | ita-web-server
     - | 〇
     - | ITA'S front end web service
     - |
   * - | platform-api
     - | 〇
     - | Shared platform API controller service
     - |
   * - | platform-auth
     - | 〇
     - | Shared platform authentication/permission service
     - |
   * - | platform-job
     - | 〇
     - | Shared platform job service
     - |
   * - | platform-migration
     - | ×
     - | Shared platform migration service
     - | This service is only target for monitoring when isntalling/updating
   * - | platform-web
     - | 〇
     - | Shared platform front end Web service
     - | 
   * - | keycloak
     - | 〇
     - | ID management・Access management service
     - | Exastro system user management
   * - | mariadb
     - | 〇
     - | Database
     - | Exastro system's main database
   * - | mongodb
     - | 〇
     - | Database for documents
     - | Mainly used by the OASE function
   * - | gitlab
     - | 〇
     - | DevSecOps platform service
     - | Mainly used by Exastro IT Automation's Git repository function