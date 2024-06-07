.. raw:: html

   <script>
   $(window).on('load', function () {
      setTimeout(function(){
        for (var i = 0; i < $("table.filter-table").length; i++) {
          $("[id^='ft-data-" + i + "-2-r']").removeAttr("checked");
          $("[id^='select-all-" + i + "-2']").removeAttr("checked");
          $("[id^='ft-data-" + i + "-2-r'][value^='可']").prop('checked', true);
          $("[id^='ft-data-" + i + "-2-r'][value*='必須']").prop('checked', true);
          tFilterGo(i);
        }
      },200);
   });
   </script>

.. _oase_agent_install:

==========
OASE Agent
==========

Introduction
====

| This document aims to explain how to install Exastro OASE Agent, the software required in order to use OASE with Exastro IT Automation.

Features
====

| The OASE Agent is required in order to use OASE.
| The Exastro OASE Agent is easily run with Docker Compose.
| To see more information on how to configure and use the Exastro OASE Agent, see :ref:`エージェント概要<agent_about>`.

Prerequisites
========

- Exastro IT Automation

  | The Exastro OASE Agent and Exastro IT Automation needs to be on the same version in order for the Exastro OASE Agent to work.

- Deploy environment

  | The following describes the minimum requirements for the container environment.

  .. list-table:: Hardware requirements(minimum requirements)
   :widths: 1, 1
   :header-rows: 1
  
   * - Resource type
     - Required resource
   * - CPU
     - 2 Cores (3.0 GHz, x86_64)
   * - Memory
     - 4GB
   * - Storage (Container image size)
     - 10GB

- Confirmed compatible operating systems

  The following describes confirmed compatible operation systems as well as their versions.

  .. list-table:: Operating systems
   :widths: 20, 20
   :header-rows: 1

   * - Type
     - Version
   * - Red Hat Enterprise Linux
     - Version	8
   * - AlmaLinux
     - Version	8
   * - Ubuntu
     - Version	22.04

- Confirmed compatible container platform

  When installing the OASE agent manually, make sure to prepare a container platform with the following specifications.
  The following describes confirmed compatible container platforms.

  .. list-table:: Container platform
   :widths: 20, 10
   :header-rows: 1

   * - Software
     - Version
   * - Podman Engine ※When using Podman
     - Version	4.4
   * - Docker Compose ※When using Podman
     - Version	2.20
   * - Docker Engine ※When using Docker
     - Version	24


- Application

  | The user must be able to run :command:`sudo` commands.

.. warning::
   | The Exastro OASE Agent process must be run by a user that has normal user permissions (the OASE Agent cannot be installed by root users).
   | That being said, the user who is installing the agent must have sudoer permission.


Install
============

Preparation
----

| First, the user must acquire the different construction files, such as docker-compose.yml and other required files.

.. code-block:: shell

   git clone https://github.com/exastro-suite/exastro-docker-compose.git

| The following commands are run in the exastro-docker-compose/ita-ag-oase directory.

.. code-block:: shell

   cd exastro-docker-compose/ita-ag-oase

| Create an environment variable setting file (.env) from the sample file.

.. code-block:: shell
   :caption: （When using Docker） Copy from sample

   cp .env.docker.sample .env

.. code-block:: shell
   :caption: （when using Podman） Copy from sample

   cp .env.podman.sample .env

| Use the end of the parameter list and register required information to the .env file. 

.. code-block:: shell

   vi .env

Start
----

| Start the container using the docker or docker-compose command.

.. code-block:: shell
   :caption: docker command (Docker environment)

   docker compose up -d  --wait  

.. code-block:: shell
   :caption: docker-compose command (Podman environment)

   docker-compose up -d  --wait  

Parameter list
==============

| For information regarding how the Exastro OASE Agent and parts of their parameters works, see :ref:`oase_agent_flow`.

.. list-table:: 
 :widths: 5, 7, 1, 5
 :header-rows: 1

 * - Parameter
   - Description
   - Change
   - Default values / selectable setting values
 * - NETWORK_ID
   - Docker network ID used by the OASE agent
   - Possible
   - 20230101
 * - LOGGING_MAX_SIZE
   - Max file size per container log file
   - Possible
   - 10m
 * - LOGGING_MAX_FILE
   - Max file generation per container
   - Possible
   - 10
 * - TZ
   - TimeZone used by the OASE agent system
   - Possible
   - Asia/Tokyo
 * - DEFAULT_LANGUAGE
   - Default language used by the OASE agent system
   - Possible
   - ja
 * - LANGUAGE
   - Language used by the OASE agent system
   - Possible
   - en
 * - ITA_VERSION
   - OASE agent version
   - Possible
   - 2.3.0
 * - UID
   - OASE agent user
   - Optional
   - 1000 (default): If using Docker
  
     0: If using Podman
 * - HOST_DOCKER_GID
   - Docker group ID on host
   - Optional
   - 999: If using Docker

     0: If using Podman
 * - AGENT_NAME
   - Name of the running OASE agent
   - Possible
   - ita-oase-agent-01
 * - EXASTRO_URL
   - Exastro IT Automation Service URL
   - Possible
   - http://localhost:30080
 * - EXASTRO_ORGANIZATION_ID
   - Exastro IT Automation OrganizationID
   - Required
   - None
 * - EXASTRO_WORKSPACE_ID
   - Exastro IT Automation WorkspaceID
   - Required
   - None
 * - EXASTRO_USERNAME
   - Exastro IT Automation Username

     ※The user role must have permission to maintain the OASE - Event - Event history meny.
   - Possible
   - admin
 * - EXASTRO_PASSWORD
   - Password created in Exastro IT Automation 
   - Possible
   - Ch@ngeMe
 * - EVENT_COLLECTION_SETTINGS_NAMES
   - Event collection setting name created by the Exastro IT Automation's OASE management agent
   - Required
   - None※ Can scpecify multiple by seperating with comma
 * - ITERATION
   - Number of iterations the OASE agent processes before initializing settings
   - Possible
   - 10（Lowest value: 10）
 * - EXECUTE_INTERVAL
   - OASE agent data gathering process run interval
   - Possible
   - 5（Lowest value: 3）
 * - LOG_LEVEL
   - OASE agent log level
   - Possible
   - INFO