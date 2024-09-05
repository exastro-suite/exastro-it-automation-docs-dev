==============
Resource plans
==============

Introduction
========

| This document aims to explain the Resource plans used in the Exastro Suite.
| Resource plans can only be configured by the System administrator (Organizations cannot be accessed by users).

Resource plan
==================

| Resource plans decide the amount of resources usable per organization.
| Users can control the resources available by setting multiple resource limits to plans and applying them to organizations.

.. list-table:: Resource plan setting example
    :widths: 20, 20, 20, 20, 20
    :header-rows: 1
    :align: left

    * - Organization
      - Resource plan
      - Workspace number
      - User number
      - Role number
    * - org1
      - Standard plan
      - Max 20
      - Max 30
      - Max 30
    * - org2
      - Premium plan
      - Max 50
      - Max 100
      - Max 100

Configuring resource plans
----------------------

| In order to apply resource plans to organizations, the user must first register resource plans.
| For more information on how to apply registered resource plans, see :ref:`organization_creation`.

System behaviour
----------------------------

| Example) Up until January, use Resource plan with max workspace number = 5. Then from February, use Resource plan with max workspace number = 3.

.. figure:: /images/ja/diagram/operation_and_system_movement_num.png
    :alt: System behaviour

1. | If a user asks to change the max amount to workspaces to 3, the system administrator will get a warning that the value will exceed the limit from February since the registered data says "Workspace number =4"
  
2. | Since the registered data says "Workspace number = 4", the user will be able to add workspaces without exceeding the resource plan limit ("Workspace number =5").
  
3. | Since the registered data says "Workspace number = 5", the user will not be able to add more workspaces since the Maximum Workspace number =5 (an error will occur).

4. | The amount of workspaces will exceed the Maximum workspace number (3), but it will not restrict the user from using the system

5. | Since the registered data says "Workspace number = 5",the user will not be able to add workspaces exceeding the resource plan's Maximum workspace number (3) (an error will occur).
  
6. | Users can delete workspaces so the registered data changes from "Workspace number = 5" to "Workspace number = 2".
  
7. | Since the Registered data says "Workspace number = 2", the user can create a new workspace since the resource plan's maximum workspace number is 3.



Configure Resource plan
==================

Pre-requisites
--------

| The workflow in this document uses the following commands. Make sure that they are installed.

- Operation client required applications

  - :kbd:`curl`
  - :kbd:`git`
  - :kbd:`jq`

.. note::

   These commands are not required the user is creating resource plans from the webUI.

Preparation
--------

| Execute the shell script from the files fetched from the GitHub repository  and create an Organization.
| The conf file is used by the settings and the fetch shell.

#. | Fetch the Organization creation shell script from the repository using :kbd:`git clone`.

   .. code-block:: bash

      # Acquire Exastro Platform files
      git clone https://github.com/exastro-suite/exastro-platform.git


#. | Move the fetched files to the tools folder and change the API execution destination URL within the Organization creation shell script to the System administrator's site address.

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

.. note::

   These commands are not required the user is creating resource plans from the webUI.

Resource plan configuration
------------------------

| The steps for register resource plans are as following.

#. | :ref:`plan_list`
#. | :ref:`plan_create`
#. | :ref:`plan_check`

※For more information regarding applying resource plans, see :ref:`Creating/Editing Organizations <organization_creation>`.


.. _plan_list:

Confirming current resource plan items
----------------------------

| There are 3 methods for confirming resource plan items.

.. tabs::

   .. group-tab:: Web UI

      | There is no web UI for confirming resource plan items.
      | When creating resource plans, the items that requires configuration are displayed.


   .. group-tab:: Script and setting file

      Follow the steps below

      - | Confirm Resource plan setting items

        | Confirm the resource types (ID) that can be specified when creating resource plans.

        - | Command
          
          .. code-block:: bash

             ./get-plan-item-list.sh


        - | Input information after executing command (input example) 

          .. code-block:: bash

             your username : System administrator's username
             your password : System administrator's password

        - | Results when process succeeds
        
          | `"result": "000-00000"` means that the process succeeded

          .. code-block:: bash

            < HTTP/1.1 200 OK
            < Date: Fri, 09 Dec 2022 06:58:26 GMT
            < Server: Apache/2.4.37 (Red Hat Enterprise Linux) mod_wsgi/4.7.1 Python/3.9
            < Content-Length: 451
            < Content-Type: application/json
            < 
            { [451 bytes data]
            * Connection #0 to host platform-auth left intact
            {
              "data": [
                {
                  "id": "ita.organization.ansible.execution_limit",
                  "informations": {
                    "default": 25,
                    "description": "Maximum number of movement executions for organization default",
                    "max": 1000
                  }
                },
                {
                  "id": "platform.roles",
                  "informations": {
                    "default": 1000,
                    "description": "Maximum number of roles for organization default",
                    "max": 1000
                  }
                },
                {
                  "id": "platform.users",
                  "informations": {
                    "default": 10000,
                    "description": "Maximum number of users for organization default",
                    "max": 10000
                  }
                },
                {
                  "id": "platform.workspaces",
                  "informations": {
                    "default": 100,
                    "description": "Maximum number of workspaces for organization default",
                    "max": 1000
                  }
                }
              ],
              "message": "SUCCESS",
              "result": "000-00000",
              "ts": "2022-12-09T06:58:26.764Z"
            }

   .. group-tab:: Rest API

      Follow the steps below.

      - | If directly calling RestAPI, the following contents can be called.

        .. code-block:: bash

           BASE64_BASIC=$(echo -n "Configure System admin user name:Configure system admin password" | base64)
           BASE_URL=Configure system admin site address.

           curl -k -X GET \
               -H "Content-Type: application/json" \
               -H "Authorization: basic ${BASE64_BASIC}" \
               -d  @- \
               "${BASE_URL}/api/platform/plan_items"

.. _plan_create:

Register resource plan
--------------------------

| There are 3 methods for registering resource plans.

.. tabs::

   .. group-tab:: Web UI

      | From the menu, select :menuselection:`Resource plan management`.

      .. figure:: /images/ja/manuals/platform/plan/plan_menu.png
         :width: 200px
         :align: left
         :class: with-border-thin

      | This will display the Resource plan list. Press the :guilabel:`Create` button and register a new resource plan.

      .. figure:: /images/ja/manuals/platform/plan/plan_list_0.png
         :width: 600px
         :align: left
         :class: with-border-thin

      - | Register resource plan

        - | Configure json file for the resource plan
              
          | Copy and use the `add-plan.sample.json` under the fetched tools folder.

        .. figure:: /images/ja/manuals/platform/plan/plan_create.png
           :width: 600px
           :align: left
           :class: with-border-thin

        .. list-table:: Item description
           :widths: 40 200
           :header-rows: 1
           :align: left
        
           * - Item name
             - Description
           * - Resource plan ID
             - | Specify an unique ID for the resource plan.
               | This ID is used to link the resource plan to Organizations.
           * - Resource plan name
             - | Specify a name for the resource plan.
           * - Decription
             - | Write a description for the resource plan.
           * - Resource plan limit value settings
             - | Specify limit for the organization resources.
               | The maximum and default values for the different items are as following.
               | ita.organization.ansible.execution_limit:【Max:1000】【Default:25】 
               | platform.roles:【Max:1000】【Default:1000】 
               | platform.users:【Max:10000】【Default:10000】 
               | platform.workspaces:【Max:1000】【Default:100】 

   .. group-tab:: Script and setting file

      Follow the steps below.

      - | Configure resource plan

        - | Configure json file for the resource plan
              
          | Copy and use the `add-plan.sample.json` under the fetched tools folder.


      - | Register resource plan
          
        | add-plan.json copy example

        .. code-block:: bash

            vi add-plan.json


        .. code-block:: bash

            {
                "id": "plan-standard",
                "name": "Standard plan",
                "informations": {
                    "description": ""
                },
                "limits": {
                    "ita.organization.ansible.execution_limit": 25,
                    "platform.workspaces": 500,
                    "platform.users": 1000,
                    "platform.roles": 500
                }
            } 

        .. tip::

           | ※"limits" are created based on the contents fetched in the Resource plan setting item confirmation

      - | Item description

        .. list-table:: Resource plan setting items
           :widths: 20, 20, 40
           :header-rows: 1
           :align: left

           * - Item
             - Contents
             - Format
           * - id 
             - Resource plan ID 
             - | Can contain half-width alphanumeric cahracters, numbers, hypen and underscore (Max 36 letters)
               | ※The ID must start with an uncapitalized alphanumeric letter
               | ※The ID cannot match reserved phrases (More information further down).
           * - name 
             - Resource plan name
             - Max 255 letters
           * - informations.description 
             - Description
             - Max 255 letters
           * - limits.xxxxxx.xxxxx
             - Configure the contents of the fetched resource plan items
             - Numeric value
       
      - | Command
         
        .. code-block:: bash

            ./add-plan.sh add-plan.json


      - | Input information after executing command (input example) 
         
        .. code-block:: bash

            your username : Input the System admin's username
            your password : Input the System admin's password

      - | Results when process succeeds
        
        | `"result": "000-00000"` means that the process succeeded
         
        .. code-block:: bash

            < HTTP/1.1 200 OK
            < Date: Fri, 09 Dec 2022 08:12:35 GMT
            < Server: Apache/2.4.37 (Red Hat Enterprise Linux) mod_wsgi/4.7.1 Python/3.9
            < Content-Length: 104
            < Content-Type: application/json
            < 
            { [104 bytes data]
            * Connection #0 to host platform-auth left intact
            {
            "data": null,
            "message": "SUCCESS",
            "result": "000-00000",
            "ts": "2022-12-09T08:12:36.219Z"
            }

      - | Results when process fails
        
        .. code-block:: bash

            < HTTP/1.1 400 BAD REQUEST
            < Date: Fri, 09 Dec 2022 08:16:09 GMT
            < Server: Apache/2.4.37 (Red Hat Enterprise Linux) mod_wsgi/4.7.1 Python/3.9
            < Content-Length: 265
            < Connection: close
            < Content-Type: application/json
            < 
            { [265 bytes data]
            * Closing connection 0
            {
              "data": null,
              "message": "Could not create because the specified plan already exists",
              "result": "400-27001",
              "ts": "2022-12-09T08:16:09.830Z"
            }

   .. group-tab:: Rest API

      Follow the steps below.

      - | If directly calling RestAPI, the following contents can be called.

        .. code-block:: bash

          BASE64_BASIC=$(echo -n "Configure System admin user name:Configure system admin password" | base64)
          BASE_URL=Configure system admin site address.

          curl -k -X POST \
              -H "Content-Type: application/json" \
              -H "Authorization: basic ${BASE64_BASIC}" \
              -d  @- \
              "${BASE_URL}/api/platform/plans" \
              << EOF
          {
            "id": "plan-standard",
            "name": "Standard plan",
            "informations": {
              "description": ""
            },
            "limits": {
              "ita.organization.ansible.execution_limit": 25,
              "platform.workspaces": 500,
              "platform.users": 1000,
              "platform.roles": 500
            }
          }     
          EOF

.. note:: ita.organization.ansible.execution_limit
 
   | "ita.organization.ansible.execution_limit" is the max amount of Movements that can be executed by IT Automation's Ansible driver at once (per organization).
   | The max amount of executions that can happen simultaneously per organization depends on the configured settings. Note that the Exastro system also have a limit of how many executions can happen at once, so the absolute max limit will be the max value set to the system settings.
   | As a result, executing more Movements than the configured limit will start a queue and execute movements when there is space.

.. .. todo:: システムの上限値の説明は、別途記載

.. .. note:: 各項目の設定値について
 
..    | システムの上限は、上述の通りですが、リソースを大きくすることによってパフォーマンスに影響します。
..    | 基本的には、既定値の値が、最小構成で実行できる最大値となります。
..    | ※最小構成は、 :doc:`../../installation/index` の前提条件を確認してください。

.. _plan_check:

Confirm resource plan
--------------------------

| There are 3 methods for checking the resource plans.

.. tabs::

   .. group-tab:: Web UI

      | From the menu, select :menuselection:`Resource plan management`.

      .. figure:: /images/ja/manuals/platform/plan/plan_menu.png
         :width: 200px
         :align: left
         :class: with-border-thin

      | This will display the Resource plan list where users can check registered resource plans.

      .. figure:: /images/ja/manuals/platform/plan/plan_list_1.png
         :width: 600px
         :align: left
         :class: with-border-thin
      
   .. group-tab:: Script and setting file

      Follow the steps below.

      - | Check configured resource plans 

        - | Command
           
          .. code-block:: bash

              ./get-plan-list.sh


        - | Input information after executing command (input example) 
           
          .. code-block:: bash

             your username : Input the System admin's username
             your password : Input the System admin's password


        - | Results when process succeeds
          
          | `"result": "000-00000"` means that the process succeeded
           
          .. code-block:: bash

              < HTTP/1.1 200 OK
              < Date: Thu, 12 Jan 2023 08:26:42 GMT
              < Server: Apache/2.4.37 (Red Hat Enterprise Linux) mod_wsgi/4.7.1 Python/3.9
              < Content-Length: 4274
              < Content-Type: application/json
              < 
              { [4274 bytes data]
              * Connection #0 to host platform-auth left intact
              {
                "data": [
                  {
                    "create_timestamp": "2022-12-07T06:04:31.000Z",
                    "create_user": "system",
                    "id": "_default",
                    "informations": {
                      "description": "default plan"
                    },
                    "last_update_timestamp": "2022-12-07T06:04:31.000Z",
                    "last_update_user": "system",
                    "limits": {
                      "ita.organization.ansible.execution_limit": 25,
                      "platform.workspaces": 100,
                      "platform.roles": 1000,
                      "platform.users": 10000
                    },
                    "name": "_default plan"
                  },
                  {
                    "create_timestamp": "2022-12-09T08:12:36.000Z",
                    "create_user": "bd09d674-298f-4b55-9777-0758bf6f294e",
                    "id": "plan-standard",
                    "informations": {
                      "description": ""
                    },
                    "last_update_timestamp": "2022-12-09T08:12:36.000Z",
                    "last_update_user": "bd09d674-298f-4b55-9777-0758bf6f294e",
                    "limits": {
                      "ita.organization.ansible.execution_limit": 25,
                      "platform.workspaces": 500,
                      "platform.users": 1000,
                      "platform.roles": 500
                    },
                    "name": "Standard plan"
                  }
                ],
                "message": "SUCCESS",
                "result": "000-00000",
                "ts": "2023-01-12T08:26:42.375Z"
              }

   .. group-tab:: Rest API

      Follow the steps below.

      - | If directly calling RestAPI, the following contents can be called.

        .. code-block:: bash

          BASE64_BASIC=$(echo -n "Configure System admin user name:Configure system admin password" | base64)
          BASE_URL=Configure system admin site address.

          curl -k -X GET \
              -H "Content-Type: application/json" \
              -H "Authorization: basic ${BASE64_BASIC}" \
              -d  @- \
              "${BASE_URL}/api/platform/plans"

.. tip::
 
   | Curent resource plans cannot be edited or deleted.

.. note::
 
   | For more information regarding applying created resource plans, see :doc:`Create/Edit organizations<./organization>`.


.. _plan_organization_status:

Confirm use status
----------------------------------------------------

| Users can check the resource usage statuses for each organization (number of workspaces, users and roles).
| There are 2 methods for checking resource usage statuses.

.. tip::

   | There is no Web UI for checking the usage statuses.
   | Use either "Script and setting file" or "Rest API".

.. tabs::

   .. group-tab:: Script and setting file

      Follow the steps below.

      - | Check usage status per organization

        - | Command
         
          .. code-block:: bash

            ./get-usage-list.sh

        - | Input information after executing command (input example) 
         
          .. code-block:: bash

            organization id : Input the ID of the organization that will be fetched (If left blank, all organizations will be specified) 
            
            your username : Input the System admin's username
            your password : Input the System admin's password

        - | Results when process succeeds
          
          | `"result": "000-00000"` means that the process succeeded
           
          .. code-block:: bash

            < HTTP/1.1 200 OK
            < Date: Mon, 30 Jan 2023 08:18:57 GMT
            < Server: Apache/2.4.37 (Red Hat Enterprise Linux) mod_wsgi/4.7.1 Python/3.9
            < Content-Length: 432
            < Content-Type: application/json
            < 
            { [432 bytes data]
            * Connection #0 to host platform-auth left intact
            {
              "data": [
                {
                  "organization_id": "org1",
                  "usages": [
                    {
                      "current_value": 0,
                      "id": "platform.workspaces"
                    },
                    {
                      "current_value": 1,
                      "id": "platform.users"
                    },
                    {
                      "current_value": 0,
                      "id": "platform.roles"
                    }
                  ]
                }
              ],
              "message": "SUCCESS",
              "result": "000-00000",
              "ts": "2023-01-30T08:18:57.887Z"
            }


   .. group-tab:: Rest API

      Follow the steps below.

      - | If directly calling RestAPI, the following contents can be called.

        .. code-block:: bash
          
          BASE64_BASIC=$(echo -n "Configure System admin user name:Configure system admin password" | base64)
          BASE_URL=Configure system admin site address.
          ORG_ID=Input the ID of the organization that will be fetched.

          curl -k -X GET \
              -H "Content-Type: application/json" \
              -H "Authorization: basic ${BASE64_BASIC}" \
              "${BASE_URL}/api/platform/usages?organization_id=${ORG_ID}"

        .. note::
       
           | In order to check the usage status for all organizations, do not specify "?organization_id=${ORG_ID}" and execute.