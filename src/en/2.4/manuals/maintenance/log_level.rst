.. _log_level:

==========
Log level
==========

Introduction
========

| This document aims to explain the Log levels used in ITA.
| Only the system admin can change the log level settings (The log levels are configured from the Organization which users cannot access)

Log levels
==============

| This function is for managing the log levels for the different ITA services.
| the user can change the log level or the specified service.
| The service log levels are shared between all organizations and workspaces.

.. _ita_log_level_list:

Log level setting values and outputs
--------------------------------

.. list-table:: Log level setting values and outputs
    :header-rows: 1
    :align: left

    * - Service log level setting value
      - Target output to log
    * - INFO
      - | INFO
        | ERROR
    * - DEBUG
      - | INFO
        | ERROR
        | DEBUG

.. note:: "INFO" is set by default after installation

.. _ita_service_list:

Log level changable service list
--------------------------------

| The services that can have their log levels changed are as following.

.. list-table:: Service list
   :header-rows: 1
   :align: left

   * - Service name
     - Function overview
   * - ita-api-admin
     - ITA admin function API
   * - ita-api-organization
     - ITA user API
   * - ita-by-ansible-execute
     - Ansible execution
   * - ita-by-ansible-legacy-role-vars-listup
     - Ansible-LegacyRole variable collection
   * - ita-by-ansible-legacy-vars-listup
     - Ansible-Legacy variable collection
   * - ita-by-ansible-pioneer-vars-listup
     - Ansible-Pionne variable collection
   * - ita-by-ansible-towermaster-sync
     - Ansible Automation controller synchronization
   * - ita-by-cicd-for-iac
     - CI/CD execution
   * - ita-by-collector
     - Collection
   * - ita-by-conductor-regularly
     - Conductor scheduled execution
   * - ita-by-conductor-synchronize
     - Conductor execution
   * - ita-by-excel-export-import
     - Excel bulk export/import execution
   * - ita-by-execinstance-dataautoclean
     - Operation deletion
   * - ita-by-file-autoclean
     - Auto-clean function
   * - ita-by-hostgroup-split
     - Host group division process
   * - ita-by-menu-create
     - Parameter sheet creation
   * - ita-by-menu-export-import
     - Menu export/import execution
   * - ita-by-terraform-cli-execute
     - Terraform-CLI execution
   * - ita-by-terraform-cli-vars-listup
     - Terraform-CLI variable collection
   * - ita-by-terraform-cloud-ep-execute
     - Terraform-Cloud/EP execution
   * - ita-by-terraform-cloud-ep-vars-listup
     - Terraform-Cloud/EP variable collection
   * - ita-api-oase-receiver
     - OASE user API
   * - ita-by-oase-conclusion
     - OASE evaluation function


Configuring log levels
============================

..  include:: ../../include/setting_running_state_loglevel.rst
