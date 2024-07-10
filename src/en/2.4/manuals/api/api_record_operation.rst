.. _api_authentication:

API access（Authentication）
=============================

| For more information regarding the target's API endpoint and parameters, see ":ref:`api_operator`" and ":ref:`api_system_manager`"
| For executing API using Bearer authentication, see the "API access (authentication)" for the different users and change the authentication method.

.. warning::
   | Language for API execution
   
   - The last login language information will be referenced.

.. tip::
   | For running API using Basic authentication with user information from a new user

   - If the correct settings have not be configured after the first login, an authentication error will occur.
     See :ref:`first_login` and follow the steps.
     
   .. code-block:: bash

      {
          "data": null,
          "message": "Failed to authenticate",
          "result": "401-00002",
          "ts": "2023-10-13T08:19:22.913Z"
      }
    

.. _api_execution_example:

API for Registering, Editing and other API examples
================================

| The following contains examples for executing API for registering, editing and other related operations.

-  :ref:`api_execution_example_filter`
-  :ref:`api_execution_example_maintenance`
-  :ref:`parameter_information`

| The following API executions uses Basic authentication.
| For more information regarding executing API with Bearer authentication, see ":ref:`operator_certification_bearer`".

.. tip:: 
   | Checking Menu names used for API endpoints
 
   - Check the corresponding menus from the ":menuselection:`Management console --> Menu management`" menu and use the ":menuselection:`Menu name(rest)`" value.
 

.. tip:: | Additional information regarding JSON and FOEM data when using Parameters
    | Format for specifying parameters
    | Make sure to  depending on the content type, parameter specification method, curl execution environment, etc.
    
    - Save the JSON data in a JSON file and specify the JSON file to the parameters.
    - If the JSON data cannot use single quotation marks, use double quotations and change it so the double quotations used internally are escaped.
    - Change the end (\\, ^) to fit the user environment.

    | For more information regarding specifying parameters with Content types, see ":ref:`maintenance_parameters_by_content_type`".

    .. code-block:: bash
       :caption: When using JSON data

       curl -X POST \
       "http://servername/api/organization_1/workspaces/workspace_1/ita/menu/playbook_files/maintenance/all/" \
       -H "Authorization: Basic dXNlcl9pZDpwYXNzd29yZA==" \
       -H "Content-Type: application/json" \
       --data-raw [ { \"file\": { \"playbook_file\": \"LSBuYW1lOiBydW4gImVjaG8iCiAgY29tbWFuZDogZWNobyB7eyBWQVJfU1RSXzEgfX0=\" }, \"parameter\": { \"discard\": \"0\", \"item_no\": null, \"playbook_name\": \"echo\", \"playbook_file\": \"echo.yml\", \"remarks\": null, \"last_update_date_time\": null, \"last_updated_user\": null }, \"type\": \"Register\" } ]


    .. code-block:: bash
       :caption: When using JSON file
       
       curl -X POST \
       "http://servername/api/organization_1/workspaces/workspace_1/ita/menu/playbook_files/maintenance/all/" \
       -H "Authorization: Basic dXNlcl9pZDpwYXNzd29yZA==" \
       -H "Content-Type: application/json" \
       -d @playbook_files_sample.json


    .. code-block:: json
       :caption: playbook_files_sampleの内容
       
       [
           {
               "file": {
                   "playbook_file": "LSBuYW1lOiBydW4gImVjaG8iCiAgY29tbWFuZDogZWNobyB7eyBWQVJfU1RSXzEgfX0="
               },
               "parameter": {
                   "discard": "0",
                   "item_no": null,
                   "playbook_name": "echo",
                   "playbook_file": "echo.yml",
                   "remarks": null,
                   "last_update_date_time": null,
                   "last_updated_user": null
               },
               "type": "Register"
           }
       ]

    .. code-block:: bash
       :caption: If the user is not using single quotations

       curl -X POST \
       "http://servername/api/organization_1/workspaces/workspace_1/ita/menu/playbook_files/maintenance/all/" \
       -H "Authorization: Basic dXNlcl9pZDpwYXNzd29yZA==" \
       -F "json_parameters=[{\"parameter\":{\"discard\":\"0\",\"item_no\":null,\"playbook_name\":\"echo\",\"playbook_file\":\"echo.yml\",\"remarks\":null,\"last_update_date_time\":null,\"last_updated_user\":null},\"type\":\"Register\"}] " \
       -F "0.playbook_file=@echo.yml"


.. _api_execution_example_filter:

Acquire list（Menu Filter：Acquire records）
---------------------------------------

| The following samples uses Basic authentication to call an API for acquiring records from ":menuselection:`Device list`".

.. code-block:: bash
   :caption: Calling API for acquiring Device list records

    BASEURL="https://servername"
    ORGANAIZATION_ID="Organization ID"
    WORKSPACE_ID="Workspace ID"
    MENU="device_list"
    USERNAME="User name"
    PASSWORD="Password"
    BASE64_BASIC=$(echo -n "Please set a user name:Please set a password" | base64)

    # Acquire all records from Device list
    curl -X GET -u "${USERNAME}:${PASSWORD}" "${BASEURL}/api/${ORGANAIZATION_ID}/workspaces/${WORKSPACE_ID}/ita/menu/${MENU}/filter/"

    # Acquire all records from Device list
    curl -X GET \
      "${BASEURL}/api/${ORGANAIZATION_ID}/workspaces/${WORKSPACE_ID}/ita/menu/${MENU}/filter/" \
      -H "Authorization: Basic ${BASE64_BASIC}" \

    # Acquire records that meets the requirements from Device list（Requirement：Exclude deleted data）
    curl -X POST \
      "${BASEURL}/api/${ORGANAIZATION_ID}/workspaces/${WORKSPACE_ID}/ita/menu/${MENU}/filter/" \
      -H "Authorization: Basic ${BASE64_BASIC}" \
      -H "Content-Type: application/json" \
      --data-raw "{\"discard\":{\"LIST\":[\"0\"]}}"

.. tip:: 
  | For acquiring lists with requirements
  | The following search methods are available when using requirements.

  .. list-table:: Available search options when using requirements
     :header-rows: 1
     :align: left
     
     * - **Option**
       - **Description**
       - **Setting example**
       - **Restrictions**
     * - NORMAL
       - | Executes a broad search.
         | Searches for records containing specific words and phrases.
       - {"Target key":{"NORMAL":"Search Requirements"}}
       - 
     * - LIST
       - | Ececutes a complete search.
         | Searches for records containing specific words and phrases.
       - {"Target key":{"LIST":["Search Requirements"]}}
       - 
     * - RANGE
       - | Executes a search within a specified area.
         | Searches for mathcing records within a specified area.
         | When only START is specified, the system will search for records after the specified time.
         | When only END is specified, the system will search for records before the specified time.
       - {"Target key":{"RANGE":{"START":"Search Requirements","END":"Search Requirements"}}}
       -  
  .. code-block:: json
     :caption: Requirements parameter structure when acquiring lists

      {
          "Target key": {
              "NORMAL": "Specify search requirement"
          },
          "Target key": {
              "LIST": [
                  "Specify search requirement",
                  "Specify search requirement"
              ]
          },
          "Target key": {
              "RANGE": {
                  "START": "Specify search requirement",
                  "END": "Specify search requirement"
              }
          }
      }

  | Parameters for searching Device list with specified requirements:
  
  - Exclude deleted information
  - Include "host" in host name
  - The last updated time/date is set between "2023/01/01 00:00:00" ～ "2023/12/31 00:00:00"
 
  .. code-block:: json
     :caption: Example for searching Device list with requirements

      {
          "host_name": {
              "NORMAL": "host"
          },
          "discard": {
              "LIST": [
                  "0"
              ]
          },
          "last_update_date_time": {
              "RANGE": {
                  "START": "2023/01/01 00:00:00",
                  "END": "2023/12/31 00:00:00"
              }
          }
      }

.. tip:: 
   | Deleting records(Deleting logic)

   - | Records with their logic deleted are called deleted records.
   - | Their status is displayed through their discard value.
     | - "0"：Active records
     | - "1"：Deleted records

   - Records with the deleted status cannot be validated.
 

.. tip::
   | File output

   - The file data is output as a base64 encoded character string. Use a base64 decoded depending on the situation.

.. tip::
   | Encoded items

   - Some items (such as passwords) are saved in an encoded format.
   - The value for the items output by the List acquisition API will be set to "null" and the registered value will not be output.

   | ※For more infotmation regarding items that are saved in an encoded format, see the manual for the appropriate menus.


.. _api_execution_example_maintenance:

Registering and editing（Menu MaintenanceAll Record bulk operation）
----------------------------------------------------

| The following Content-Types can be selected as API Parameter specification method for registering and editing.

- application/json format

  - Sends parameters as JSON data.
  - File data is written and sent as base64 string within parameters.

- multipart/form-data format

  - Sends parameters and files as form data.
  - The keys of the form data in the file are used by connecting the index of the JSON data of the parameter and the target key with ". to connect the keys.


| | The following samples uses Basic authentication to call an API for acquiring records from ":menuselection:`Ansible common --> Device list`" and ":menuselection:`Ansible-Legacy --> Playbook file collection`".

- :ref:`api_execution_example_maintenance_device_list`
- :ref:`api_execution_example_maintenance_playbook_files`

.. tip::
   | Validation when registering and editing
   
   - Registration and editing with API must also go through the same validation as operations done from the web UI.
   - For more information regarding item validation, see the manuals for the respective menus.


.. _maintenance_parameters_by_content_type:

Content-Type parameter structure differences
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| The following describes the parameter structure for each of the Content-Types
| For more information regarding acquiring and checking the target key used with the parameters, see ":ref:`parameter_information`"

- Content-Type: application/json

.. code-block:: json
   :caption: Parameter structure(application/json)

    [
        {
            "file": {
                "Target key": "String that base64 encoded the file data",                 
            },
            "parameter": {
                "Target key": "Value",
            },
            "type":"Register"
        }
    ]

- Content-Type: multipart/form-data

.. code-block:: bash
   :caption: Parameter structure(multipart/form-data)

    json_parameters=' 
        [
            {
                "parameter": {
                    "Target key": "Value",
                },
                "type":"Register"
            }
        ]'
    X.<Target key>=@echo.yml

    # For X, specify a numeric value that corresponds to the json_parameters index.

| The following are examples of parameters when registering and updating.

- ":menuselection:`Ansible-Legacy --> Playbook file collection`" registration sample

.. code-block:: json
   :caption: Content-Type: --data-raw parameter for application/json 
   
    [
        {
            "file": {
                "playbook_file": "LSBuYW1lOiBydW4gImVjaG8iCiAgY29tbWFuZDogZWNobyB7eyBWQVJfU1RSXzEgfX0="
            },
            "parameter": {
                "discard": "0",
                "item_no": null,
                "playbook_name": "echo",
                "playbook_file": "echo.yml",
                "remarks": null,
                "last_update_date_time": null,
                "last_updated_user": null
            },
            "type": "Register"
        }
    ]


.. code-block:: bash
   :caption:  Content-Type: curls's -F parameter for multipart/form-dat

   json_parameters='[
       {
           "parameter": {
               "discard": "0",
               "item_no": null,
               "playbook_name": "echo",
               "playbook_file": "echo.yml",
               "remarks": null,
               "last_update_date_time": null,
               "last_updated_user": null
           },
           "type": "Register"
       }
   ]'
   # File data
   0.playbook_file=@echo.yml

    ※ For better readability, the example contains both  newlines and indents.

- ":menuselection:`Ansible-Legacy --> Playbook file collection`" update sample

.. code-block:: json
    :caption: Content-Type: --data-raw parameter for application/json 
    
    [
        {
            "file": {
                "playbook_file": "LSBuYW1lOiBydW4gImVjaG8iDQogIGNvbW1hbmQ6IGVjaG8ge3sgVkFSX1NUUl8xIH19DQoNCi0gbmFtZTogcGF1c2UNCiAgcGF1c2U6DQogICAgc2Vjb25kczogMTAw"
            },
            "parameter": {
                "discard": "0",
                "item_no": "00000000-0000-0000-0000-000000000000",
                "playbook_name": "echo_pause100",
                "playbook_file": "echo_pause100.yml",
                "remarks": null,
                "last_update_date_time": "2023/10/11 09:24:09.928044",
                "last_updated_user": "User name"
            },
            "type": "Update"
        }
    ]

.. code-block:: bash
    :caption: Content-Type: curls's -F parameter for multipart/form-data

    json_parameters='[
        {
            "parameter": {
                "discard": "0",
                "item_no": "00000000-0000-0000-0000-000000000000",
                "playbook_name": "echo_pause100",
                "playbook_file": "echo_pause100.yml",
                "remarks": null,
                "last_update_date_time": "2023/10/11 09:24:09.928044",
                "last_updated_user": "User name"
            },
            "type": "Register"
        }
    ]'
    # File data
    0.playbook_file=@echo_pause100.yml

    ※ For better readability, the example contains both  newlines and indents.


.. tip::
   | "last_update_date_time" value when updating records
   
   - For last_update_date_time, use the value of the latest applicable record obtained by FILTER.
   - If it doesnt match the latest value, the record will not update.

.. tip:: 
   | File operation using application/json

   - | Registering and updating files 
     | Specify the value which will be registered or updated to the specified key under the parameter or file.
     | For file names, specify the key for the target below the parameter and specify the key for the target below the file. Make sure to specify a base64 encoded string for the file.

   - | Changing the file name
     | For only changing the file name, change the value of the target key under the parameter and specify a base64-encoded string for the file in the target key under the file.
     | Make sure to specify it to the target key below the file, even if there is no change in the data.
     | If only the target key below the parameter is changed and the target key below the file does not exist, it will excluded from the update.

   - | Deleting the file
     | Specify the key for the target below the parameter as "" or as null. "null" will be recognized as a file name.

.. tip:: 
   | File operation using multipart/form-data

   - | Registering and updating files 
     | Specify the value which will be registered or updated to the specified key under the parameter.
     | For file names, specify the key for the target below the parameter.
     | For file data, specify the index of the JSON data + the target key connected by “." and specify the path to the file in the -F key specification.

   - | Changing the file name
     | If you want to change only the file name, change the value of the target key under parameters, and connect the target key of the index+ of JSON data in json_parameters with “. and specify the path of the file as the key of -F.
     | Make sure to specify the index of the JSON data + the target key connected by “." to specify the path to the file and the -F key specification, even if there are no changes to the data.
     | If only the target key below the parameter is changed and the target key below the file does not exist, it will excluded from the update.

   - | Deleting the file
     | Specify the key for the target below the parameter as "" or as null. "null" will be recognized as a file name.


.. tip:: 
   | Updating only the values of other items without changing the data and file name of the file

   - Make sure to change only the value of the item to be changed under “parameter” and update without including the key of the item under “file” or without specifying the file with -F.
     
.. tip::
   | Pulldown values

   - For more information regarding pulldown item targets and usable values, see ":ref:`parameter_information_pulldown_info`".

.. _api_execution_example_maintenance_device_list:

Ansible common - Device list
^^^^^^^^^^^^^^^^^^^^^^
.. code-block:: bash
   :caption: Execution steps(Sample)：Device list

   BASEURL="https://servername"
   ORGANAIZATION_ID="Organization ID"
   WORKSPACE_ID="Workspace ID"
   MENU="device_list"
   USERNAME="User name"
   PASSWORD="Password"
   BASE64_BASIC=$(echo -n "Please set a user name:Please set a password" | base64)

   # Content-Type: application/json
   curl -X POST \
     "${BASEURL}/api/${ORGANAIZATION_ID}/workspaces/${WORKSPACE_ID}/ita/menu/${MENU}/maintenance/all/" \
     -H "Authorization: Basic ${BASE64_BASIC}" \
     -H "Content-Type: application/json" \
     --data-raw "[{ \"file\": {\"ssh_private_key_file\": \"\", \"server_certificate\": \"\"}, \"parameter\": { \"authentication_method\": \"Password authentication\", \"connection_options\": null, \"connection_type\": \"machine\", \"discard\": \"0\", \"host_dns_name\": null, \"host_name\": \"exastro-test\", \"hw_device_type\": null, \"instance_group_name\": null, \"inventory_file_additional_option\": null, \"ip_address\": \"127.0.0.1\", \"lang\": \"utf-8\", \"login_password\": \"password\", \"login_user\": \"root\", \"os_type\": null, \"passphrase\": null, \"port_no\": null, \"protocol\": \"ssh\", \"remarks\": null, \"server_certificate\": null, \"ssh_private_key_file\": null }} ]"

   ※ Specify a base64 encoded file for the ssh_private_key_file and server_certificate below the file.

   # Content-Type: Multipart/form-data
   curl -X POST \
     "${BASEURL}/api/${ORGANAIZATION_ID}/workspaces/${WORKSPACE_ID}/ita/menu/${MENU}/maintenance/all/" \
     -H "Authorization: Basic ${BASE64_BASIC}" \
     -F 'json_parameters="[ { "parameter": { "discard": "0", "managed_system_item_number": null, "hw_device_type": null, "host_name": "exastro-test", "host_dns_name": null, "ip_address": "127.0.0.1", "login_user": "root", "login_password": "asdfghjkl", "ssh_private_key_file": "ssh_key_file.pem", "authentication_method": "パスワード認証","port_no": null, "server_certificate": "certificate_file.crt", "protocol": "ssh", "os_type": null, "lang": "utf-8", "connection_options": null, "inventory_file_additional_option": null, "instance_group_name": null,"connection_type": "machine", "remarks": null,"last_update_date_time": null, "last_updated_user": null}, "type": "Register" }]"' \
     -F '0.ssh_private_key_file=@/ssh_key_file.pem' \
     -F '0.server_certificate=@/certificate_file.crt' \
   

.. _api_execution_example_maintenance_playbook_files:

Ansible-Legacy - Playbook file collection
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  
.. code-block:: bash
   :caption: Execution steps(Sample)：Playbook file collection
    
   BASEURL="https://servername"
   ORGANAIZATION_ID="Organization ID"
   WORKSPACE_ID="Workspace ID"
   MENU="playbook_files"
   USERNAME="User name"
   PASSWORD="Password"
   BASE64_BASIC=$(echo -n "Please set a user name:Please set a password" | base64)

   # Content-Type: application/json
   curl -X POST \
     "${BASEURL}/api/${ORGANAIZATION_ID}/workspaces/${WORKSPACE_ID}/ita/menu/${MENU}/maintenance/all/" \
     -H "Authorization: Basic ${BASE64_BASIC}" \
     -H "Content-Type: application/json" \
     --data-raw "[{\"file\":{\"playbook_file\":\"LSBuYW1lOiBydW4gImVjaG8iCiAgY29tbWFuZDogZWNobyB7eyBWQVJfU1RSXzEgfX0=\"},\"parameter\":{\"discard\":\"0\",\"item_no\":null,\"playbook_name\":\"echo\",\"playbook_file\":\"echo.yml\",\"remarks\":null,\"last_update_date_time\":null,\"last_updated_user\":null},\"type\":\"Register\"}]"
   
   # Content-Type: Multipart/form-data
   curl -X POST 
    "${BASEURL}/api/${ORGANAIZATION_ID}/workspaces/${WORKSPACE_ID}/ita/menu/${MENU}/maintenance/all/" \
    -H "Authorization: Basic ${BASE64_BASIC}" \
    -F "json_parameters=[{\"parameter\":{\"discard\":\"0\",\"item_no\":null,\"playbook_name\":\"echo\",\"playbook_file\":\"echo.yml\",\"remarks\":null,\"last_update_date_time\":null,\"last_updated_user\":null},\"type\":\"Register\"}] " \
    -F "0.playbook_file=@echo.yml"

   
.. _parameter_information:

API parameter related information（Acquire Menu Information）
-------------------------------------------------------

| Creating parameters for record bulk operation
| For more information regarding record bulk operation parameter and item structure, see the following.

-  :ref:`parameter_information_menu_info`  
-  :ref:`parameter_information_column_info`
-  :ref:`parameter_information_pulldown_info`

.. _parameter_information_menu_info:

Menu information
^^^^^^^^^^^^

| This API allows users to acquire setting values related to menu structure information, collumn group and collumns used in :ref:`api_execution_example_maintenance`.


- | /api/{organization_id}/workspaces/{workspace_id}/ita/menu/{menu}/info/

  .. code-block:: bash
     :caption: API for acquiring Menu structure information

     BASEURL="https://servername"
     ORGANAIZATION_ID="Organization ID"
     WORKSPACE_ID="Workspace Id"
     MENU="Target menu"
     USERNAME="User name"
     PASSWORD="Password"
     BASE64_BASIC=$(echo -n "Please set a user name:Please set a password" | base64)

     curl -X GET \
       "${BASEURL}/api/${ORGANAIZATION_ID}/workspaces/${WORKSPACE_ID}/ita/menu/${MENU}/info/" \
       -H "Authorization: Basic ${BASE64_BASIC}" \

  .. code-block:: bash
     :caption: Menu structure information
     
     {
         "data": {
             "column_group_info": {},
             "column_info": {
                 "cX": {
                     "column_name": "",     # Item name displayed on the page
                     "column_name_rest":"", # Item name specified with API parameter
                     "auto_input": "",      # Auto-input flag
                     "input_item": "",      # Input target flag
                     "view_item": ""        # Output target flag
                     "required_item": "",   # Required input flag
                     "unique_item": "",     # Unique item flag
                     "...省略...": "",      # 
                 },
             },
             "custom_menu": {
                 "...省略...": "",
             },
             "menu_info": {
                 "...省略...": "",
             }
         },
         "message": "SUCCESS",
         "result": "000-00000",
         "ts": "2023-10-11T05:41:27.678Z"
     }

.. tip:: | Menu item structure and setting values related to record bulk operation parameters
    | API for acquiring menu information's item structure (column_info) key and setting value

    .. list-table:: Menu item information key and setting value
       :header-rows: 1
       :align: left
       
       * - **Key**
         - **Description**
         - **Setting value**
       * - column_name
         - Item name displayed on the page
         - String
       * - column_name_rest
         - Item name specified with API parameter
         - String
       * - auto_input
         - | Auto-input flag
           | Item automatically input by system
         - | "0":Not target 
           | "1":Target
       * - input_item
         - | Input target flag
           | Input target item when registering and editing with API
         - | "0": Not target 
           | "1": Target
           | "2": Hidden
       * - view_item
         - | Output target flag
           | Output target item for running filter API
         - | "0": Not target 
           | "1": Target
       * - required_item
         - | Required input flag
           | Required target item for registering and editing with API
         - | "0": Not target 
           | "1": Target
       * - unique_item
         - | Unique item flag
           | Unique target item for registering and editing with API
         - | "0": Not target 
           | "1": Target

    | ※For more information regarding item validation, see the manuals for the respective menus.
      
.. _parameter_information_column_info:

Parameter item information
^^^^^^^^^^^^^^^^^^^^
| This API allows users to acquire parameter information used by :ref:`api_execution_example_maintenance`.
| For more information regarding settings, see :ref:`parameter_information_menu_info`.

- | /api/{organization_id}/workspaces/{workspace_id}/ita/menu/{menu}/info/column/

  .. code-block:: bash
     :caption: API for acquiring parameter items

     BASEURL="https://servername"
     ORGANAIZATION_ID="Organization ID"
     WORKSPACE_ID="Workspace ID"
     MENU="Target menu"
     USERNAME="User name"
     PASSWORD="Password"
     BASE64_BASIC=$(echo -n "Please set a user name:Please set a password" | base64)

     curl -X GET \
       "${BASEURL}/api/${ORGANAIZATION_ID}/workspaces/${WORKSPACE_ID}/ita/menu/${MENU}/column/" \
       -H "Authorization: Basic ${BASE64_BASIC}" \


  - | Example: ":menuselection:`Playbook file collection`" response
 
  .. code-block:: bash
     :caption: Menu collumn information：Playbook file collection

     {
         "data": {
             "discard": "Delete flag",
             "item_no": "Item number",
             "last_update_date_time": "Last updated date and time",
             "last_updated_user": "Last updated user",
             "playbook_file": "Playbook file",
             "playbook_name": "Playbook file name",
             "remarks": "remarks"
         },
         "message": "SUCCESS",
         "result": "000-00000",
         "ts": "2023-10-11T06:48:10.697Z"
     }


.. _parameter_information_pulldown_info:

Usable lists in pulldown items
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| This API allows users to acquire a list of usable pulldown items in :ref:`api_execution_example_maintenance`.

- | /api/{organization_id}/workspaces/{workspace_id}/ita/menu/{menu}/info/pulldown/

  .. code-block:: bash
     :caption: API for acquiring pulldown item information

     BASEURL="https://servername"
     ORGANAIZATION_ID="Organization ID"
     WORKSPACE_ID="Workspace ID"
     MENU="Target menu"
     USERNAME="User name"
     PASSWORD="Password"
     BASE64_BASIC=$(echo -n "Please set a user name:Please set a password" | base64)

     curl -X GET \
       "${BASEURL}/api/${ORGANAIZATION_ID}/workspaces/${WORKSPACE_ID}/ita/menu/${MENU}/info/pulldown/" \
       -H "Authorization: Basic ${BASE64_BASIC}" \

  - | Example: ":menuselection:`Device list`" response
 
  .. code-block:: json
     :caption: Pulldown item list：Device list

     {
         "data": {
             "authentication_method": {
                 "1": "Key authentication(No passphrase)",
                 "2": "Password authentication",
                 "4": "Key authentication(With passphrase)",
                 "5": "Password authentication(winrm)"
             },
             "connection_type": {
                 "1": "machine",
                 "4": "network"
             },
             "hw_device_type": {
                 "1": "SV",
                 "2": "ST",
                 "3": "NW"
             },
             "instance_group_name": {
             },
             "lang": {
                 "1": "utf-8",
                 "2": "shift_jis",
                 "3": "euc"
             },
             "os_type": {
             },
             "protocol": {
                 "1": "telnet",
                 "2": "ssh"
             }
         },
         "message": "SUCCESS",
         "result": "000-00000",
         "ts": "2023-10-13T09:07:04.036Z"
     }

.. _api_apply:

Applying parameters（API）
=============================

| This API performs Conductor execution from operation generation to parameter application.
| Note that this API will not confirm if the Conductor has ended or not. To check the Conductor status, do so from :menuselection:`Conductor  -->  Conductor operation list`.

.. _api_apply_request_format_description:

request format
-----------------------

| This section descripes this API's request format.

.. list-table:: request format description
   :header-rows: 1
   :align: left

   * - Item
     - Description
   * - API category
     - Apply
   * - API name
     - Apply parameter
   * - URL
     - /api/{organizaiton_id}/workspaces/{workspace_id}/ita/apply/ 
   * - method
     - POST 
   * - headers
     - | content-type: application/json
       | Authorization: Basic authentication or Bearer authentication
       | For executing API with Bearer authentication, see ":ref:`operator_certification_bearer`".
   * - Request body
     - | See Request body.

.. _api_apply_request_body_description:

Request body
-----------------------

| This section describes the Request body.

.. table:: Request body description
   :widths: 10 10 20 30 15 15 100
   :align: left

   +----------------------------------------+------------------------+------+------------------+-------------------------------------------------------------------------------------------------------------------------------+
   | Key                                    | Item                   | Req\ | Type             | Description                                                                                                                   |
   |                                        |                        | uired|                  |                                                                                                                               |
   +========================================+========================+======+==================+===============================================================================================================================+
   | conductor_class_name                   | Conductor name         | ○   | String           | | Specify executing Conductor name.                                                                                           |
   |                                        |                        |      |                  | | The Conductor name specifies the :menuselection:`Conductor name` registered in :menuselection:`Conductor  -->  Co\.         |
   |                                        |                        |      |                  |   nductor list`.                                                                                                              |
   |                                        |                        |      |                  | | Specifying a Conductor name not registered in :menuselection:`Conductor  -->  Conductor一覧` will result in an error.       |
   +----------------------------------------+------------------------+------+------------------+-------------------------------------------------------------------------------------------------------------------------------+
   | operation_name                         | Operation name         |      | String           | | Specify executing operation name.                                                                                           |
   |                                        |                        |      |                  |                                                                                                                               |
   |                                        |                        |      |                  | + | Existing operations                                                                                                       |
   |                                        |                        |      |                  |   | Specify a  :menuselection:`Operation name` registered in :menuselection:`Basic console  -->  Operation list`.             |
   |                                        |                        |      |                  |                                                                                                                               |
   |                                        |                        |      |                  | + | New operations                                                                                                            |
   |                                        |                        |      |                  |   | Specify a :menuselection:`Operation name` not registered in :menuselection:`Basic console  -->  Operation list`.          |
   |                                        |                        |      |                  |                                                                                                                               |
   |                                        |                        |      |                  |   | The specified operation_name will be registered to :menuselection:` Basic console  -->  Operation list`.                  |
   |                                        |                        |      |                  |                                                                                                                               |
   |                                        |                        |      |                  | + | Automatically numbered operations                                                                                         |
   |                                        |                        |      |                  |   | If no operation_name is specified, the :menuselection:`Operation name` will be automatically numbered and registered to\  |
   |                                        |                        |      |                  |     :menuselection:`Basic console  -->  Operaiton list`.                                                                      |
   |                                        |                        |      |                  |   |  　Numbering rule：「yyyymmddhhmissffffffN"                                                                               |
   |                                        |                        |      |                  |   |  　y:Year m:Month d:Day h:Hours mi:Minute s:Second f:Miliseconds N:Number between 0-9                                     |
   |                                        |                        |      |                  |                                                                                                                               |
   +----------------------------------------+------------------------+------+------------------+-------------------------------------------------------------------------------------------------------------------------------+
   | schedule_date                          | Reservation time/date  |      | String           | | Specify the scheduled time/date in the following format: yyyy/mm/dd hh:mi:ss.                                               |
   |                                        |                        |      |                  | | If not specified, the conductor will be executed immediately.                                                               |
   +----------------------------------------+------------------------+------+------------------+-------------------------------------------------------------------------------------------------------------------------------+
   | parameter_info                         | Parameter information  |      | Array            | | Specify parameter information for registering/updating/deleting/restoring.                                                  |
   |                                        |                        |      |                  | | For cases where multiple menus are targeted, the user will have to adjust the order in the array.                           |
   |                                        |                        |      |                  | | Do not use if the user is only executing Conductors.                                                                        |
   +----------------+-----------------------+------------------------+------+------------------+-------------------------------------------------------------------------------------------------------------------------------+
   | ※1            | (menu_name_rest)      | Menu name(REST)        |      | Array            | | Specify :menuselection:`Menu name(Rest)` from :menuselection:`Management console  -->  Menu management`                     |
   |                |                       |                        |      |                  | | For cases where multiple records are targeted, the user will have to adjust the order in the array.                         |
   |                +--------+--------------+------------------------+------+------------------+-------------------------------------------------------------------------------------------------------------------------------+
   |                |        | type         | Record operation type  |      | String           | | Specify one of the following.                                                                                               |
   |                |        |              |                        |      |                  | | For registering： Register                                                                                                  |
   |                |        |              |                        |      |                  | | For updating： Update                                                                                                       |
   |                |        |              |                        |      |                  | | For deleting： Discard                                                                                                      |
   |                |        |              |                        |      |                  | | For restoring： Restore                                                                                                     |
   |                |        +--------------+------------------------+------+------------------+-------------------------------------------------------------------------------------------------------------------------------+
   |                |        | file         | Upload file            |      | Dictionary       | | If using Upload file columns, specify the column key and value.                                                             |
   |                |        |              |                        |      |                  | | Specify a base64-encoded string of file data.                                                                               |
   |                |        +--------------+------------------------+------+------------------+-------------------------------------------------------------------------------------------------------------------------------+
   |                |        | parameter    | Parameter              |      | Dictionary       | | Specify column key and value for the target menu.                                                                           |
   |                |        |              |                        |      |                  | | if a "New operation" or "automatically numbered operation" is specified for operation_name,\                                |
   |                |        |              |                        |      |                  |   The collumn key and value does not need to be specified.                                                                    |
   |                |        |              |                        |      |                  | | Note that If the conductor_class_name has a Conductor containing Conductor call function (hereinafter called Sub cond\      |
   |                |        |              |                        |      |                  |   uctor) is specifiedand the user needs to explicitly specify a specific sub conductor's individual oper                      |
   |                                        |                        |      |                  |   ation, specify a corresponding operation name.                                                                              |
   +----------------+--------+--------------+------------------------+------+------------------+-------------------------------------------------------------------------------------------------------------------------------+

.. tip:: | ※1  The Request body from (menu_name_rest) to parameter has the same specification as the API that performs the following record operations.
   | ・"Menu MaintenanceAll" 


.. _api_apply_request_body_example:

Request body specific example
-----------------------

| This section contains specific examples of using Request body.

Executing Conductors using already registered parameters from existing operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. code-block:: json

     {
       "conductor_class_name"  : "sample_conductor",
       "operation_name"        : "sample_operation"
     }


Reserved execution of Conductors using already registered parameters from existing operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. code-block:: json

     {
       "conductor_class_name"  : "sample_conductor",
       "operation_name"        : "sample_operation",
       "schedule_date"         : "2024/12/31 23:59"	
     }


Executing Conductors using parameters applied with existing operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. figure:: /images/ja/api/Apply_API_request_body_exp3.png
     :align: left

  .. code-block:: json

     {
         "conductor_class_name": "sample_conductor",
         "operation_name" : "sample_operation",
         "schedule_date" : "",
         "parameter_info" : [ 
             {
                 "sample_menu_001" : [ 
                     {
                         "type" : "Register",
                         "parameter" : {
                             "host_name"             : "sample_host1",
                             "operation_name_select" : "2024/01/01 00:00_sample_operation",                                                                                                   
                             "column_1"              : "value",
                             "column_2"              : "value.txt"
                         },
                         "file" : {
                             "column_2"              : "c2FtcGxlIGZpbGU="
                         }
                      } 
                  ]
              }
         ]
     }

  .. tip::
      | Specifying "operation_name_select"
      | For existing operations, the value set for the operation "operation_name_select" is specified by the "scheduled implementation date" (YYYY/MM/DD hh:mm)_"operation name" of the relevant operation.
   

Executing Conductors using parameters applied with new operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. figure:: /images/ja/api/Apply_API_request_body_exp4.png
     :align: left

  .. code-block:: json

     {
         "conductor_class_name": "sample_conductor",
         "operation_name" : "new_operation",
         "schedule_date" : "",
         "parameter_info" : [ 
             {
                 "sample_menu_001" : [ 
                     {
                         "type" : "Register",
                         "parameter" : {
                             "host_name"             : "sample_host1",
                             "column_1"              : "value",
                             "column_2"              : "value.txt"
                         },
                         "file" : {
                             "column_2"              : "c2FtcGxlIGZpbGU="
                         }
                     } 
                 ]
             }
         ]
     }

  .. tip::
      | Specifying "operation_name_select".
      | Operation "operation_name_select" specification is not required for new operations.


Reserved execution of Conductors using parameters applied with automatically numbered operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. figure:: /images/ja/api/Apply_API_request_body_exp5.png
     :align: left

  .. code-block:: json

     {
         "conductor_class_name": "sample_conductor",
         "schedule_date" : "",
         "parameter_info" : [ 
             {
                 "sample_menu_001" : [ 
                     {
                         "type" : "Register",
                         "parameter" : {
                             "host_name"             : "sample_host1",
                             "column_1"              : "value",
                             "column_2"              : "value.txt"
                         },
                         "file" : {
                             "column_2"              : "c2FtcGxlIGZpbGU="
                         }
                     } 
                 ]
             }
         ]
     }

  .. tip::
      | Specifying "operation_name_select".
      | Operation "operation_name_select" specification is not required for automatically numbered operations.


Executing Conductors with multiple record parameter applied for multiple menus
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. figure:: /images/ja/api/Apply_API_request_body_exp6.png
     :align: left

  .. code-block:: json

     {
         "conductor_class_name": "sample_conductor",
         "operation_name" : "",
         "schedule_date" : "",
         "parameter_info" : [
             {
                 "sample_menu_001" : [
                     {
                         "type" : "Register",
                         "parameter" : {
                             "host_name"             : "sample_host1",
                             "column_1"              : "value11",
                             "column_2"              : "value.txt"
                         },
                         "file" : {
                             "column_2"              : "c2FtcGxlIGZpbGU="
                         }
                     },{
                         "type" : "Register",
                         "parameter" : {
                             "host_name"             : "sample_host2",
                             "column_1"              : "value11",
                             "column_2"              : "value.txt"
                         },
                         "file" : {
                             "column_2"              : "c2FtcGxlIGZpbGU="
                         }
                     }
                 ]
             },{
                 "sample_menu_002" : [
                     {
                         "type" : "Register",
                         "parameter" : {
                             "host_name"             : "sample_host1",
                             "column_1"              : "value",
                             "column_2"              : "value.txt"
                         },
                         "file" : {
                             "column_2"              : "c2FtcGxlIGZpbGU="
                         }
                     },{
                         "type" : "Register",
                         "parameter" : {
                             "host_name"             : "sample_host2",
                             "column_1"              : "value",
                             "column_2"              : "value.txt"
                         },
                         "file" : {
                             "column_2"              : "c2FtcGxlIGZpbGU="
                         }
                     }
                 ]
             }
         ]
     }

Executing Conductors with explicitly specified individual operations of sub-conductors and applying parameters
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. figure:: /images/ja/api/Apply_API_request_body_exp7.png
     :align: left

  .. code-block:: json

     {
         "conductor_class_name": "sample_main_conductor",
         "operation_name" : "",
         "schedule_date" : "",
         "parameter_info" : [
             {
                 "sample_menu_001" : [
                     {
                         "type" : "Register",
                         "parameter" : {
                             "host_name"             : "sample_host1",
                             "column_1"              : "value11",
                             "column_2"              : "value.txt"
                         },
                         "file" : {
                             "column_2"              : "c2FtcGxlIGZpbGU="
                         }
                     },{
                         "type" : "Register",
                         "parameter" : {
                             "host_name"             : "sample_host2",
                             "column_1"              : "value11",
                             "column_2"              : "value.txt"
                         },
                         "file" : {
                             "column_2"              : "c2FtcGxlIGZpbGU="
                         }
                     }
                 ]
             },{
                 "sample_menu_002" : [
                     {
                         "type" : "Register",
                         "parameter" : {
                             "host_name"             : "sample_host1",
                             "operation_name_select" : "2024/01/01 00:00_sample_operation",                                                                                                   
                             "column_1"              : "value",
                             "column_2"              : "value.txt"
                         },
                         "file" : {
                             "column_2"              : "c2FtcGxlIGZpbGU="
                         }
                     },{
                         "type" : "Register",
                         "parameter" : {
                             "host_name"             : "sample_host2",
                             "operation_name_select" : "2024/01/01 00:00_sample_operation",                                                                                                   
                             "column_1"              : "value",
                             "column_2"              : "value.txt"
                         },
                         "file" : {
                             "column_2"              : "c2FtcGxlIGZpbGU="
                         }
                     }
                 ]
             }
         ]
     }

.. _api_apply_response_format_description:

response body
-----------------------

| This section explains the response body for this API.

  .. code-block:: json
     :caption: Success

     {
         "data" : {
         "conductor_instance_id" : "ID numbered when Conductor was executed"
         }	,
         "message" : "SUCCESS",
         "result"  : "000-00000",
         "ts"      : "Process time/date"
         }
     }

  .. code-block:: json
     :caption: Error

     {
         "message" : "Error message"
         "result"  : "Error code"
         "ts"      : "Process time/date"
     }

  .. code-block:: none
     :caption: Error message example

     Examples when there is something wrong with the string specified to the Menu name(REST):sample_menu_001's first record's (0 origin)'s key:collumn 1.
     { 
         "message": {                                                               
             "1": {                                                                                    The Menu name(REST)'s record number is displayed with 0 origin.
                "column_1": [ "Character length error (threshold : Value<=8byte, Value : 30byte), menu : sample_menu_001"]  Key：Item REST name that met an error、Value：Error contents、menu : Menu name（REST） which met an error
                  }
         },
         "result": "499-00201",
         "ts": "Execution date/time"
     }

.. _api_apply_important_notice:

Note
-----------------------

| This API can apply parameters to updatable ITA menus
| However, there are points of notice that might happen from Transaction processing. See below for more information.

Applying parameters to host groups
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   | If a parameter is applied to ":menuselection:`Host group management`", the conductor will be executed without processing host analysis belonging to the specified host group.
   | To apply parameters to the ":menuselection:`Host group management`" menu, make sure to register the API for operating the records on beforehand.
   |   ・"Menu MaintenanceAll" 
   |   ・"Menu Maintenance" 

Applying parameters to variable extractable menus
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   | Parameters aplied to variable extractable menus are executed with conductor in a state where the variables used within the specified parameters are not harvested. 
   | Make sure to register the following API to apply parameters to variable extractable menus.
   |   ・"Menu MaintenanceAll" 
   |   ・"Menu Maintenance" 
   | For more information regarding variable extractable menus, see ":doc:`../terraform_driver/terraform_common` -> :ref:`terraform_common_variable_handling`\
    or ":doc:`../ansible-driver/ansible_common` -> :ref:`ansible_common_var_listup`".

Roleback for errors
^^^^^^^^^^^^^^^^^^^^^^^
   | This API updates the database with the transaction process.
   | The information updated within the transaction process is rolled back if the database update fails.
   
