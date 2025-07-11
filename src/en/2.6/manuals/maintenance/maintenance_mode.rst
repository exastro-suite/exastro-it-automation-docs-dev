.. _ita_maintenance_mode:

==================
Maintenance mode
==================

Introduction
========

| This document aims to explain the ITA maintenance mode.
| The maintenance mode settings can only be accessed by the system admin.(The settings are configured from the Organization which users cannot access).

Maintenance mode
======================

| While in Maintenance mode, users can view the data and stop backyard processes that registers or updates data to the database. It also allows users to take backups of the databases and update the system in a more safe manner.
| The Maintenance mode applies to all organizations and workspaces on the system.

.. _ita_maintenance_mode_purpose_of_use:

Maintenance mode applications
----------------------------

| The maintenance mode has 2 modes. "Stop server side jobs " and "Load mode".
| Turning the "Stop server side jobs " mode to ON will stop backyard functions that executes operations and such from executing new processes.
| Note that already running (Operations one of the following statuses: "Preparing", "Executing", "Executing(Delayed)") will continue to run until they meet one of the following statuses: "Complete", "Complete(Error)".
| Turning the "Load mode" to ON will prevent the user from being able to use any functions that registers or edit data to databases (the user can still view the data from the different menus).
| For more information, see ":ref:`ita_maintenance_mode_setting_value`".
|
| Note that userse can use :ref:`ita_maintenance_mode_get_backyard_execute_check` API to acquire backyard functions with "Preparing", "Executing" or "Executing(Delayed)" statuses.
| Use these functions to 

- | Turn "Stop server side jobs " to ON
- | Check that the "Preparing", "Executing" or "Executing(Delayed)" statuses in "Backyard activation status bulk acquirement" changes to "Preparing", "Executing" or "Executing(Delayed)".
- | Turn "Load" mode to ON.

| Follow the process above to make sure that all the running backyard processes have been stopped before taking backups or updating the system.

.. figure:: /images/ja/maintenance_mode/purpose_of_use_v2-4.png
   :width: 600px
   :alt: Maintenance mode applications

   Maintenance mode applications

| Turning Maintenance mode ON displays a message that says taht Maintenance is turned on to everyone on the web UI.

.. figure:: /images/ja/maintenance_mode/mode_message.png
   :width: 600px
   :alt: Maintenance mode web page

   Maintenance mode web page

.. _ita_maintenance_mode_setting_value:

Maintenance mode types and setting values
----------------------------------------

| The types of maintenance modes and their setting values are as following.

.. list-table:: Maintenance mode types and setting values
    :widths: 2 2 6
    :header-rows: 1
    :align: left

    * - Type
      - Setting value
      - Description
    * - Stop service side job
      - OFF or ON
      - | When the mode is set to ON, all of the following backyard processes that has the status "Not executed" will not be executed (users can still register executions).
        | Operations the status "Preparing", "Executing", "Executing(Delayed)" will continue to run until they meet one of the following statuses: "Complete", "Complete(Error)".
        | - ita-by-ansible-execute(Ansible execution)
        | - ita-by-terraform-cloud-ep-execute(Terraform Cloud/EP execution)
        | - ita-by-terraform-cli-execute(Terraform CLI execution)
        | - ita-by-menu-create(Parameter sheet creation)
        | - ita-by-menu-export-import(Menu export/import)
        | - ita-by-excel-export-import(Excel bulk export/import)
    * - Load mode
      - OFF or ON
      - | Turning "Load mode" on will disable all functions that allows users to register and edit data. All backyard processes will be stoped.
        | **The user will still be able to see the data from the different menus**
        | The main functions that will not available are the following
        | - Registering and editing data to menus
        | - Conductor creation and execution
        | - Executions from the different drivers
        | - Creating/defining parameter sheets
        | - Menu export/import
        | - Excel bulk export/import
        | - Changing log levels
        | - Creating organizations
        | - Create, delete or edit workspaces


Confirming maintenance mode and changing settings
==========================================

| Follow the following steps to check the maintenance mode or change the settings.

..  include:: ../../include/setting_running_state_maintenancemode.rst


.. _ita_maintenance_mode_get_backyard_execute_check:

Backyard activation status bulk acquirement
============================

| This function allows users to acquire all processes that have the status "Preparing", "Executing" or "Executing (delayed)" from all the organizations and workspaces on the system

- | ita-by-conductor-synchronize(Conductor execution)
- | ita-by-ansible-execute(Ansible execution)
- | ita-by-terraform-cloud-ep-execute(Terraform Cloud/EP execution)
- | ita-by-terraform-cli-execute(Terraform CLI execution)
- | ita-by-menu-create(Parameter shet creation)
- | ita-by-menu-export-import(Menu export/import)
- | ita-by-excel-export-import(Excel bulk export/import)

| The user can also acquire the count of processes that have the status "Preparing", "Executing" or "Executing (delayed)" in system units, organization units and workspace units.
| \ **※ita-by-conductor-synchronize(Conductor execution)" operations with the status "Preparing", "Executing" or "Executing (delayed)" will not be included.**\
| (The processes from the different drivers that are executed within Conductor are included)

Pre-requisites
--------

| This process requires that the user can use the following commands.

- CLient required applications

  - :kbd:`curl`
  - :kbd:`git`
  - :kbd:`jq`

Preparation
--------

| Runn the shellscript within the files acquired from the GitHub repository and acquire all the backyard activation statuses.
| The conf file is used by the settings and acquirement shells

#. Acquire the Backyard activation status bulk acquirement shell script from the repository by using :kbd:`git clone`.

   .. code-block:: bash

      # Acquire Exastro Platform files
      git clone https://github.com/exastro-suite/exastro-platform.git


#. Move the acquired files' tools folder and change the API setting file's ( :file:`api-auth.conf`) API execution destination URL to the site address for System admin.

   .. code-block:: bash

      vi api-auth.conf

   | Changes

   - api-auth.conf

     .. code-block:: bash

        CONF_BASE_URL={Site address for System admin}
        CURL_OPT=-svk

   .. tip::
       | If the user is using a self-signed certificate, a certificate error will occur.
       | Changing the :kbd:`CURL_OPT=-sv` within the setting file to :kbd:`CURL_OPT=-svk` prevents the error from occuring, but it is recommended that the user installs a valid certificate.


Backyard activation status bulk acquirementの実行
----------------------------------

- Command

  .. code-block:: bash

      ./get-backyard-execute-check.sh


- Input after running command (Input example)

  .. code-block:: bash

      your username : Input the system admin user name
      your password : Input the system admin password


- Results when process succeeds

  | `"result": "000-00000"` means that the process succeeded

  .. code-block:: bash

      < HTTP/1.1 200 OK
      < Date: Tue, 10 Oct 2023 07:59:09 GMT
      < Content-Type: application/json
      < Content-Length: 2449
      < Connection: keep-alive
      <
      { [data not shown]
      * Connection #0 to host platform-auth left intact
      {
        "data": {
          "execute_count": 3,  # Count of all system statuses that says "Preparing", "Executing" or "Executing (delayed)" (ita-by-conductor-synchronize not included).
          "organizations ": [
            {
              "id": "Organization_01", # System organization
              "execute_count": 2,  # Count of all system statuses that says "Preparing", "Executing" or "Executing (delayed)" in Organization units (ita-by-conductor-synchronize not included).
              "workspaces ": [
                {
                  "id": "Workspace_01",  # Workspace on Organization
                  "execute_count": 2,  # Count of all system statuses that says "Preparing", "Executing" or "Executing (delayed)" in Workspace units (ita-by-conductor-synchronize not included).
                  "backyards ": {  # If the backyard function status says "Preparing", "Executing" or "Executing (delayed)", the target ID, last updated date/time, Status ID and Status name will be stored.
                    "ita-by-ansible-execute": [
                      {
                        "id": "965dfd15-b741-4dd8-9136-00e505b14c44",
                        "last_update_timestamp": "2023-10-10T16:58:18.748121Z",
                        "status_id": "3",
                        "status_name": "Executing"
                      },
                      {
                        "id": "f3d52038-cb76-470f-ab7e-1898df107a87",
                        "last_update_timestamp": "2023-10-10T16:58:39.247824Z",
                        "status_id": "3",
                        "status_name": "Executing"
                      }
                    ],
                    "ita-by-conductor-synchronize": [
                      {
                        "id": "6b9743ab-73fd-49e9-b20b-910f00546827",
                        "last_update_timestamp": "2023-10-10T16:55:04.053156Z",
                        "status_id": "3",
                        "status_name": "Executing"
                      },
                      {
                        "id": "9b8ab1d7-b2f7-4e78-8529-e79b63ce495b",
                        "last_update_timestamp": "2023-10-10T16:50:02.175727Z",
                        "status_id": "3",
                        "status_name": "Executing"
                      }
                    ],
                    "ita-by-excel-export-import": [],
                    "ita-by-menu-create": [],
                    "ita-by-menu-export-import": [],
                    "ita-by-terraform-cli-execute": [],
                    "ita-by-terraform-cloud-ep-execute": []
                  }
                }
              ]
            },
            {
              "id": "Organization_02",  # System organization
              "execute_count": 1,  # Count of all system statuses that says "Preparing", "Executing" or "Executing (delayed)" in Organization units (ita-by-conductor-synchronize not included).
              "workspaces ": [
                {
                  "id": "Workspace_01",  # Workspace on Organization
                  "execute_count": 0,  # Count of all system statuses that says "Preparing", "Executing" or "Executing (delayed)" in Workspace units (ita-by-conductor-synchronize not included).
                  "backyards ": {
                    "ita-by-ansible-execute": [],
                    "ita-by-conductor-synchronize": [],
                    "ita-by-excel-export-import": [],
                    "ita-by-menu-create": [],
                    "ita-by-menu-export-import": [],
                    "ita-by-terraform-cli-execute": [],
                    "ita-by-terraform-cloud-ep-execute": []
                  }
                },
                {
                  "id": "Workspace_02",  # Workspace on Organization
                  "execute_count": 1,  # Count of all system statuses that says "Preparing", "Executing" or "Executing (delayed)" in Workspace units (ita-by-conductor-synchronize not included).
                  "backyards ": {  # If the backyard function status says "Preparing", "Executing" or "Executing (delayed)", the target ID, last updated date/time, Status ID and Status name will be stored.
                    "ita-by-ansible-execute": [],
                    "ita-by-conductor-synchronize": [],
                    "ita-by-excel-export-import": [],
                    "ita-by-menu-create": [],
                    "ita-by-menu-export-import": [],
                    "ita-by-terraform-cli-execute": [],
                    "ita-by-terraform-cloud-ep-execute": [
                      {
                        "id": "da1ac029-5e2d-45d7-8516-3c54edbad45d",
                        "last_update_timestamp": "2023-10-10T17:13:58.744328Z",
                        "status_id": "3",
                        "status_name": "Executing"
                      }
                    ]
                  }
                }
              ]
            }
          ]
        },
        "message": "SUCCESs ",
        "result": "000-00000",
        "ts ": "2023-10-10T07:59:05.079Z"
      }

  | We recommend turning "Load mode" to ON after the execute_count says changes to 0. See below for an example.

  .. code-block:: bash

      < HTTP/1.1 200 OK
      < Date: Tue, 10 Oct 2023 07:59:09 GMT
      < Content-Type: application/json
      < Content-Length: 2449
      < Connection: keep-alive
      <
      { [data not shown]
      * Connection #0 to host platform-auth left intact
      {
        "data": {
          "execute_count": 0,  # Count of all system statuses that says "Preparing", "Executing" or "Executing (delayed)" (ita-by-conductor-synchronize not included).
          "organizations ": [
            {
              "id": "Organization_01",  # System organization
              "execute_count": 0,  # Count of all system statuses that says "Preparing", "Executing" or "Executing (delayed)" in Organization units (ita-by-conductor-synchronize not included).
              "workspaces ": [
                {
                  "id": "Workspace_01",  # Workspace on Organization
                  "execute_count": 0,  # Count of all system statuses that says "Preparing", "Executing" or "Executing (delayed)" in Workspace units (ita-by-conductor-synchronize not included).
                  "backyards ": {  # If the backyard function status says "Preparing", "Executing" or "Executing (delayed)", the target ID, last updated date/time, Status ID and Status name will be stored.
                    "ita-by-ansible-execute": [],
                    "ita-by-conductor-synchronize": [
                      {
                        "id": "6b9743ab-73fd-49e9-b20b-910f00546827",
                        "last_update_timestamp": "2023-10-10T16:55:04.053156Z",
                        "status_id": "3",
                        "status_name": "Executing"
                      },
                      {
                        "id": "9b8ab1d7-b2f7-4e78-8529-e79b63ce495b",
                        "last_update_timestamp": "2023-10-10T16:50:02.175727Z",
                        "status_id": "3",
                        "status_name": "Executing"
                      }
                    ],
                    "ita-by-excel-export-import": [],
                    "ita-by-menu-create": [],
                    "ita-by-menu-export-import": [],
                    "ita-by-terraform-cli-execute": [],
                    "ita-by-terraform-cloud-ep-execute": []
                  }
                }
              ]
            },
            {
              "id": "Organization_02",  # System organizations
              "execute_count": 0,  # Count of all system statuses that says "Preparing", "Executing" or "Executing (delayed)" in Organization units (ita-by-conductor-synchronize not included).
              "workspaces ": [
                {
                  "id": "Workspace_01",  # Workspace on Organization
                  "execute_count": 0,  # Count of all system statuses that says "Preparing", "Executing" or "Executing (delayed)" in Workspace units (ita-by-conductor-synchronize not included).
                  "backyards ": {
                    "ita-by-ansible-execute": [],
                    "ita-by-conductor-synchronize": [],
                    "ita-by-excel-export-import": [],
                    "ita-by-menu-create": [],
                    "ita-by-menu-export-import": [],
                    "ita-by-terraform-cli-execute": [],
                    "ita-by-terraform-cloud-ep-execute": []
                  }
                },
                {
                  "id": "Workspace_02",  # Workspace on Organization
                  "execute_count": 0,  # Count of all system statuses that says "Preparing", "Executing" or "Executing (delayed)" in Workspace units (ita-by-conductor-synchronize not included).
                  "backyards ": {  # If the backyard function status says "Preparing", "Executing" or "Executing (delayed)", the target ID, last updated date/time, Status ID and Status name will be stored.
                    "ita-by-ansible-execute": [],
                    "ita-by-conductor-synchronize": [],
                    "ita-by-excel-export-import": [],
                    "ita-by-menu-create": [],
                    "ita-by-menu-export-import": [],
                    "ita-by-terraform-cli-execute": [],
                    "ita-by-terraform-cloud-ep-execute": []
                  }
                }
              ]
            }
          ]
        },
        "message": "SUCCESs ",
        "result": "000-00000",
        "ts ": "2023-10-10T07:59:05.079Z"
      }


- If directly calling RestAPI, the following contents can be called.

  .. code-block:: bash

      BASE64_BASIC=$(echo -n "Configure System admin user name:Configure system admin password" | base64)
      BASE_URL=Configure system admin site address.

      curl -k -X GET \
          -H "Content-Type: application/json" \
          -H "Authorization: basic ${BASE64_BASIC}" \
          "${BASE_URL}/api/ita/backyard-execute-check/"

