====================
Terraform CLI driver
====================

Introduction
========

| This document aims to explains the Terraform CLI driver function and how to use it.
| For more information regarding the Terraform Cloud/EP driver common functions and Terraform & Terraform driver overviews, see :doc:`./terraform_common`.

Console menu structure
======================

| This section explains the Terraform CLI driver menu ustructure.

Menu list
-----------------

#. | **Basic console menus**
   | The basic console menus used by the Terraform CLI driver are as following.

   .. list-table:: Basic console Menu list
      :widths: 1 2 2 5
      :header-rows: 1
      :align: left

      * - No
        - Menu group
        - Menu
        - Description
      * - 1
        - Basic console
        - Operation list
        - Users can maintain (view/register/edit/discard) the Operation list.


#. | **Terraform CLI driver menus**
   | The Terraform CLI driver menu list are as following.

   .. table::  Terraform CLI driver Menu list
      :widths: 1 2 2 5
      :align: left

      +-------+--------------+--------------+----------------------------------------+
      | **N\  | **Menu\      |  **Menu**    | **Description**                        |
      | o**   | Group**      |              |                                        |
      +=======+==============+==============+========================================+
      | 1     | Terraform \  | Interface \  | Manages information for executions.    |
      |       | CLI          | information  |                                        |
      +-------+              +--------------+----------------------------------------+
      | 2     |              | Workspace\   | Manages workspace information used by\ |
      |       |              | management   |  Terraform.                            |
      +-------+              +--------------+----------------------------------------+
      | 3     |              | Movement\    | Manages Movement lists.                |
      |       |              | list         |                                        |
      +-------+              +--------------+----------------------------------------+
      | 4     |              | Module file\ | Manages Module files.                  |
      |       |              |  collection  |                                        |
      +-------+              +--------------+----------------------------------------+
      | 5     |              | Movement-\   | Manages links between Movements and M\ |
      |       |              | Module link  | odule files.                           |
      |       |              |              |                                        |
      +-------+              +--------------+----------------------------------------+
      | 6     |              | Variable \   | Manages the maximum cycles for member \|
      |       |              | nest \       | variables if the variable type defined\|
      |       |              | management   |  in the tf file is "list" or "set" and\|
      |       |              |              |  the "list", "set," "tuple" or "object\|
      |       |              |              | " is defined.                          |
      +-------+              +--------------+----------------------------------------+
      | 7     |              | Substitute \ | Manage movements and variables that li\|
      |       |              | value auto \ | nk items and values for each operatio\ |
      |       |              | registration\| n registered in the parameter s\       |
      |       |              |  settings    | heet menu.                             |
      |       |              |              |                                        |
      |       |              |              |                                        |
      +-------+              +--------------+----------------------------------------+
      | 8     |              | Execute      | Executes selected Movements and Operat\|
      |       |              |              | ions.                                  |
      +-------+              +--------------+----------------------------------------+
      | 9     |              | Execution \  | Manages execution history.             |
      |       |              | management   |                                        |
      +-------+              +--------------+----------------------------------------+
      | 10    |              | Check operat\| Displays the status of executions.     |
      |       |              | ion status   |                                        |
      +-------+              +--------------+----------------------------------------+
      | 11    |              | Susbtitute v\| Manages variable substitute values.    |
      |       |              | alue manage\ |                                        |
      |       |              | ment         |                                        |
      +-------+              +--------------+----------------------------------------+
      | 12    |              | Module-varia\| Manages links between Module variable\ |
      |       |              | ble link\    | s and Module f                         |
      |       |              | (※1)        |                                        |
      +-------+              +--------------+----------------------------------------+
      | 13    |              | Member varia\| Manages member variables.              |
      |       |              | ble managem\ |                                        |
      |       |              | ent(※1)     |                                        |
      +-------+              +--------------+----------------------------------------+
      | 14    |              | Movement-\   | Manages links between Movements and v\ |
      |       |              | variable \   | ariables.                              |
      |       |              | link(※1)    |                                        |
      +-------+              +--------------+----------------------------------------+
      | 15    |              | Movement-\   | Manages links between Movements and M\ |
      |       |              | member varia\| ember variables.                       |
      |       |              | ble link(※1)|                                        |
      +-------+--------------+--------------+----------------------------------------+

   .. note::
      | ※1 Hidden menus are internal functions used to register and edit data.
      | There are some hidden menus configured when the Terraform CLI driver function is installed.
      | In order to display hidden menus, go to the :menuselection:`Management console-->Role/Menu link management` menu and restore the desired menus. For more information, see :doc:`../it_automation_base/management_console`.


Terraform CLI driver procedure
========

| This section explains how to use the different Terraform CLI menus

Terraform CLI workflow
-----------------------

| A standard workflow using the different Terraform CLI menus can be seen below.
| See the following sections for more detailed information regarding each of the steps.

.. figure:: /images/ja/terraform_cli_driver/common/work_flow.png
   :align: left
   :width: 600px
   :alt: Workflow

-  **Workflow details and references**

   #. | **Register Input operation name**
      | From the basic console's Operation list menu, register an input operation name.
      | For more information, see :ref:`terraform_cli_operation_list`.

   #. | **Register Interface information**
      | Configure information for the execution.
      | For more information, see :ref:`terraform_cli_interface_information`.

   #. | **Register and link Workspace**
      | Register information for the Terraform workspace.
      | For more information, see :ref:`terraform_cli_workspace_list`.

   #. | **Register Movement**
      | Register a movement.
      | For more information, see :ref:`terraform_cli_movement_list`.

   #. | **Register Module files**
      | Register a Module file that will be executed..
      | For more information, see :ref:`terraform_cli_module_list`.

   #. | **Specify Module file to Movement**
      | Configure the registered module file to the registered Movement.
      | For more information, see :ref:`terraform_cli_movement_module_link`.

   #. | **Configure maximum cycles (if required)**
      | Configure maximum amount of cycles for the Member variable.
      | For more information, see :ref:`terraform_cli_nested_variable`.

   #. | **Create Parameter sheet**
      | From the Parameter sheet creation's "Define/Create parameter sheets" menu, create a parameter sheet where the user can register data that will be used to configure the target server. 
      | For more information, see :doc:`../create_param/menu_creation`.

   #. | **Register data to the Parameter sheet**
      | In the Input menu group, access the Parameter sheet created in the previous step.From there, register data that will be used to configure the target server.
      | For more information, see :doc:`../create_param/menu_creation`.

   #. | **Configure substitute value auto registration settings**
      | From the Substitute value auto registration settings menu, link the all the operation items and setting values registered to the Parameter sheet and the Movement variables.
      | For more information, see :ref:`terraform_cli_substitution_value_auto_registration_setting`.

   #. | **Execute operation**
      | From the Execution menu, select the previously created Movement and Input operation and execute them.
      | For more information, see :ref:`terraform_cli_execution`.

   #. | **Confirm operation status**
      | In the Execution status confirmation menu, the status of all previously executed operations will be updated in realtime. Users can also monitor error logs and execution logs as well as stop them with an emergency stop.
      | For more information, see :ref:`terraform_cli_check_operation_status`.

   #. | **Confirm operation history**
      | In the Execution management page, users can chee the history of all previously executed operations.
      | For more information, see :ref:`terraform_cli_execution_list`.


Function 
==================

| This section explains the different functions of the menus used by the Terraform CLI driver.

Basic console
--------------

| This section explains how to operate the Basic console menus.
| For this workflow, refer to :doc:`../it_automation_base/basic_console` while operating the Basic console menus.

.. _terraform_cli_operation_list:

Operation list
******************

| In the :menuselection:`Basic console-->Operation list` menu, users can manage the operations executed by the different orchestrators. 
| For more information regarding registering Operations, see :doc:`../it_automation_base/basic_console`.

.. figure:: /images/ja/basic_console/operation_list/register.png
   :width: 800px
   :alt: Submenu (Operation list) 

   Submenu (Operation list) 


Terraform CLI driver menu
------------------------------

| This section explains how to operate the Terraform CLI driver menus.

.. _terraform_cli_interface_information:

Interface information
********************

#. | In the :menuselection:`Terraform CLI-->Interface information` menu, users can maintain (view/edit) execution information.

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/interface_information_menu.png
      :width: 800px
      :alt: Submenu (Interface information) 

      Submenu (Interface information) 

#. | Press the :guilabel:`Edit` button to register Interface information.

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/interface_information_register.gif
      :width: 800px
      :alt: Registration page (Interface information) 

     Registration page (Interface information) 

#. | The items in the Interface information menu are as following.
   | If there is no Interface information registered, the operation execution will meet an unexpected error when multiple records are registered.

   .. list-table::Registration page Item list (Interface information) 
         :widths: 1 6 1 1 1
         :header-rows: 1
         :align: left

         * - Item
           - Description
           - Input required
           - Input method
           - Restrictions
         * - NULL link
           - | If the Parameter sheet's specific value in the Substitute value auto registration settings are NULL, configure whether the registration to the Substitute value management registration should be done with the NULL value or not.
             | If the Substitute value auto registration settings menu's "NULL link" is NULL, this value will be used.
             | If "Active", the Parameter sheet value will be registered to the substitute value management menu no matter what type the value is.
             | If "Not active", the Parameter sheet value will only be registered to the substitute value management if it contains a value.
           - 〇
           - List selection
           - ー
         * - Status monitoring cycle(Miliseconds)
           - | Input the interval time for when the :ref:`terraform_cli_check_operation_status` log is refreshed.
             | 3000 miliseconds is the recommended value.
           - 〇
           - Manual
           - Minimum value 1000 miliseconds
         * - Number of Progress status display lines
           - | Display the numbers of maximum lines that will be displayed in the progress log and error log in :ref:`terraform_cli_check_operation_status`.
             | If the status is [Not executed]、[Preparing]、[Executing]、[Executing(Delayed)], the log will output the specified amount of lines.
             | If the status is [Complete]、[Complete(Error)]、[Unexpected error]、[Emergency stop], [Not executed(Reserved)、[Reservation deleted]], the log will output all the lines.
             | We recommend tuning this number depending on the user environment. The standard recommended value is 1000 lines.
           - 〇
           - Manual
           - ー
         * - Remarks
           - Free description field
           - ー
           - Manual
           - Maximum length 4000 bytes

.. _terraform_cli_workspace_list:

Workspace management
**************

#. | In the :menuselection:`Terraform CLI-->Workspace management` menu, users can maintain (view/register/update/delete discarded) Workspaces used by Terraform.
   | Workspaces are used as directories for executing Terraform commands.
   | Even if the same workspace is target for executions, the state file generated by Terraform are managed per workspace, meaning that the indempotence will be preserved.

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/workspace_list_menu.png
      :width: 800px
      :alt: Submenu (Workspace management) 

      Submenu (Workspace management) 

#. | Press the :guilabel:`＋ Register` button to register Workspace information.

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/workspace_list_register.gif
      :width: 800px
      :alt: Registration page (Workspace management) 

     Registration page (Workspace management) 

#. | Clicking the "Delete resource" button moves the user to ":ref:`terraform_cli_check_operation_status`" where the target workspace will have their resources deleted (terraform destroy).

#. | The items found in the Workspace management menu are as following.

   .. table::Registration page Item list (Workspace management) 
      :widths: 1 1 1 4 1 1 1
      :align: left

      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | **Item**                          | **Description**              | **Input r\| **Input\     | **Restrictions**|
      |                                   |                              | equired** |  method**    |                 |
      |                                   |                              |           |              |                 |
      +=================+========+========+==============================+===========+==============+=================+
      | Workspace name  |                 | Input a name for the works\  | ○        | Manual       | Maximum length\ |
      |                 |                 | pace.                        |           |              |   90 bytes.     |
      |                 |                 |                              |           |              |                 |
      |                 |                 | The workspace name can cont\ |           |              |                 |
      |                 |                 | ain half-width alphanumeric\ |           |              |                 |
      |                 |                 |  characters and the followi\ |           |              |                 |
      |                 |                 | ng symbols _ - (Underbar a\  |           |              |                 |
      |                 |                 | nd hyphen).                  |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Execute         | Delete resources| Deletes resources managed \  | ー        | Button       | ー              |
      |                 |                 | and structured per workspace.|           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 | Clicking the button will dis\|           |              |                 |
      |                 |                 | play a dialog box asking for\|           |              |                 |
      |                 |                 |  comfirmation. Clicking "OK"\|           |              |                 |
      |                 |                 |  will move the user to :ref:\|           |              |                 |
      |                 |                 | `terraform_cli_check_operati\|           |              |                 |
      |                 |                 | on_status` where the resourc\|           |              |                 |
      |                 |                 | es are deleted.\             |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 |                              |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Remarks                           | Free description field       | ー        | Manual       | Maximum length \|
      |                                   |                              |           |              | 4000 bytes      |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+

.. _terraform_cli_movement_list:

Movement list
************

#. | In the :menuselection:`Terraform CLI-->Movement list` menu, users can maintain (view/register/edit/discard) Movement names.
   | As Movements needs to be linked to the Workspace as Terraform use information, The user will first have to register a target in :ref:`terraform_cli_workspace_list`.

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/movement_list_menu.png
      :width: 800px
      :alt: Submenu (Movement list) 

      Submenu (Movement list) 

#. | Click the :guilabel:`＋ Register` button to register Movement information.

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/movement_list_register.gif
      :width: 800px
      :alt: Registration page (Movement list) 

     Registration page (Movement list) 

#. | The items found in the Movement list are as following.

   .. table::Registration page Item list (Movement list) 
      :widths: 2 1 4 1 1 1
      :align: left

      +-----------------------+-----------+-----------+-----------+-----------+
      | Item                  | Descripti\| Input re\ | Input met\| Restrict\ |
      |                       | on        | quired    | hod       | ions      |
      +=======================+===========+===========+===========+===========+
      | Movement name         | Input a \ | ○        | Manual    | Maximum l\|
      |                       | name for \|           |           | ength 256\|
      |                       | the Move\ |           |           |  bytes    |
      |                       | ment.     |           |           |           |
      +-----------+-----------+-----------+-----------+-----------+-----------+
      | Orchestrator\         | The syste\| ー        | Automatic | ー        |
      |                       | m will au\|           |           |           |
      |                       | tomatical\|           |           |           |
      |                       | ly input \|           |           |           |
      |                       | "Terrafo\ |           |           |           |
      |                       | rm CLI"   |           |           |           |
      +-----------+-----------+-----------+-----------+-----------+-----------+
      | Delay timer           | Enter the\| ー        | Manual    | ー        |
      |                       | specified\|           |           |           |
      |                       |  period(1\|           |           |           |
      |                       | ~) in ord\|           |           |           |
      |                       | er for th\|           |           |           |
      |                       | e status \|           |           |           |
      |                       | to displa\|           |           |           |
      |                       | y "warnin\|           |           |           |
      |                       | g" when t\|           |           |           |
      |                       | he moveme\|           |           |           |
      |                       | nt is del\|           |           |           |
      |                       | ayed for \|           |           |           |
      |                       | the speci\|           |           |           |
      |                       | fied peri\|           |           |           |
      |                       | od. (Unit\|           |           |           |
      |                       | : minutes)|           |           |           |
      |                       |           |           |           |           |
      |                       | No warnin\|           |           |           |
      |                       | g will b\ |           |           |           |
      |                       | e display\|           |           |           |
      |                       | ed if not\|           |           |           |
      |                       | hing is e\|           |           |           |
      |                       | ntered.   |           |           |           |
      +-----------+-----------+-----------+-----------+-----------+-----------+
      | Terra\    | Workspace | Select th\| ○        | List sele\|           |
      | formm\    |           | e workspa\|           | ction     |           |
      | use infor\|           | ce regist\|           |           |           |
      | mation    |           | ered in :\|           |           |           |
      |           |           | ref:`terr\|           |           |           |
      |           |           | aform_cli\|           |           |           |
      |           |           | _workspac\|           |           |           |
      |           |           | e_list`". |           |           |           |
      +-----------+-----------+-----------+-----------+-----------+-----------+
      | Remarks   |           | Free desc\| ー        | Manual    | Maximum \ |
      |           |           | ription f\|           |           | length 40\|
      |           |           | ield      |           |           | 00 bytes  |
      +-----------------------+-----------+-----------+-----------+-----------+


.. _terraform_cli_module_list:

Module file collection
************

#. | In the :menuselection:`Terraform CLI-->Module file collection` menu, users can maintain (view/register/edit/discard) user created modules.
   | For more inforamtion regarding writing Modules, see :ref:`terraform_common_module_description`.

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/module_list_menu.png
      :width: 800px
      :alt: Submenu (Module file collection) 

      Submenu (Module file collection) 

#. | Press the :guilabel:`＋ Register` button to register Movement information.

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/module_loist_register.gif
      :width: 800px
      :alt: Registration page (Module file collection) 

     Registration page (Module file collection) 

#. | The items found in the Module file collection menu are as following.

   .. list-table::Registration page Item list (Module file collection) 
      :widths: 2 4 1 1 2
      :header-rows: 1
      :align: left

      * - Item
        - Description
        - Input required
        - Input method
        - Restrictions
      * - Module file name
        - Input a name for the Module file.
        - ○
        - Manual
        - Maximum length 255 bytes
      * - Module file
        - Upload a created Module file.
        - ○
        - File selection
        - Maximum size 100 mb
      * - Remarks
        - Free description field
        - ー
        - Manual
        - Maximum length 4000 bytes

.. warning:: | **When variables defined within the  Module files (.tf format files) are extracted.**
   | The variables defined within the Module files (.tf format files) are extracted by internal processes.
   | The variables can have specific values registered to them in ":ref:`terraform_cli_substitution_value_auto_registration_setting`".
   | The variables are not extracted in realtime, meaning that it may take time before they can be used in ":ref:`terraform_cli_substitution_value_auto_registration_setting`".


.. _terraform_cli_movement_module_link:

Movement-Module link
*******************

#. | In the :menuselection:`Terraform CLI-->Movement-Module link` menu, users can maintain (view/register/edit/discard) links between Movements registered in :ref:`terraform_cli_movement_list` and Module files registered in :ref:`terraform_cli_movement_module_link`.
   | When executing Movements, the linked Module file will be applied
   | Users can link multiple Module files to Movements.

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/movement_module_link_menu.png
      :width: 800px
      :alt: Submenu (Movement-Module link) 

      Submenu (Movement-Module link) 

#. | Press the :guilabel:`＋ Register` button in order to register a link for the Movements and Modules.

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/movement_module_link_register.gif
      :width: 800px
      :alt: Registration page (Movement-Module link) 

     Registration page (Movement-Module link) 

#. | The items found in the Movement-Module link menu are as following.

   .. list-table::Registration page Item list (Movement-Module link) 
      :widths: 2 4 1 1 2
      :header-rows: 1
      :align: left

      * - Item
        - Description
        - Input required
        - Input method
        - Restrictions
      * - Movement name
        - | Select a Movement registered in ":ref:`terraform_cli_movement_list`".
        - ○
        - List selection
        - ー
      * - Module file
        - | Select a Module file registered in ":ref:`terraform_cli_module_list`".
        - ○
        - List selection
        - ー
      * - Remarks
        - Free description field
        - ー
        - Manual
        - Maximum length 4000 bytes

.. _terraform_cli_nested_variable:

Variable nest management
**************

#. | In the :menuselection:`Terraform CLI-->Variable nest management` menu, if the variable type defined in the tf file is "list" or "set" and the "list", "set," "tuple" or "object" is defined, the user can view and edit the Member variable's maximum number of cycles. 
   | The items in this menu cannot be registered, discarded or restored as BackYard manages the records based on the Module file collection.
   | For more information with examples of Variable nest management, see ":ref:`terraform_nested_example`".

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/nested_variable_list_menu.png
      :width: 800px
      :alt: Submenu (Variable nest management) 

      Submenu (Variable nest management) 

#. | Press the :guilabel:`＋ Edit` button to edit the maximum cycle number.

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/nested_variable_list_register.gif
      :width: 800px
      :alt: Registration page (Variable nest management) 

     Registration page (Variable nest management) 

#. | The items found in the Variable nest management menu are as following.

   .. list-table::Registration page Item list (Variable nest management) 
      :widths: 2 4 1 1 2
      :header-rows: 1
      :align: left

      * - Item
        - Description
        - Input required
        - Input method
        - Restrictions
      * - Variable name
        - Displays the variable used by Module file registered in ":ref:`terraform_cli_module_list`".
        - ー
        - No input
        - ー
      * - Member variable name (Cycling) 
        - If the Nest variable list target is a Member variable, the Member variable name will be displayed. The Member variables are displayed concatenating with variables with "." for each stage.
        - ー
        - No input
        - ー
      * - Maximum number of cycles
        - | The maximum amount of cycles for the array can range from 1～1024. Input a number within that range.
          | The limit of maximum number of cycles corresponds to the "MAXIMUM_ITERATION_TERRAFORM-CLI" setting value in the  "Management console - :ref:`system_setting`". The range is 1～1024.
          | The initial value is set to the number obtained from the default value in the tf file.
          | If there is not "default" in the tf file, the value "1" will be set.
          | If it is not last updated by "Terraform variable update procedure", it is not possible to change the value from updating the Module file.
        - 〇
        - Manual
        - Input value 1～1,024 (Changed by the ":ref:`system_setting`" setting value)
      * - Remarks
        - Free description field
        - ー
        - Manual
        - Maximum length 4000 bytes

.. warning::
    | ※Initial registrations and repetition updates are not happening in real-time, so it might take a couple of minutes before the variables can be used in ":ref:`terraform_cli_substitution_value_auto_registration_setting`".

.. _terraform_cli_substitution_value_auto_registration_setting:

Substitute value auto registration settings
******************

#. | In the :menuselection:`Terraform CLI-->Substitute value auto registration settings` menu, users can link parameter sheets (with operation) created with the Menu creation tool and Movement variables. 
   | The registered information is displayed in :ref:`terraform_cli_substitution_value_list` when executed by internal processes.


   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/substitution_value_auto_registration_menu.png
      :width: 800px
      :alt: Submenu (Substitute value auto registration settings) 

      Submenu (Substitute value auto registration settings) 

#. | Press the :guilabel:`＋ Register` button to register Substitute value auto registration settings.

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/substitution_value_auto_registration_register.gif
      :width: 800px
      :alt: Registration page (Substitute value auto registration settings) 

     Registration page (Substitute value auto registration settings) 

#. | The items found in the Registration page are as following.

   .. table::Registration page Item list (Substitute value auto registration settings) 
      :widths: 1 1 1 4 1 1 1
      :align: left

      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | **Item**                          | **Description**              | **Input r\| **Input me\  | **Restrictions**|
      |                                   |                              | equired** | thod**       |                 |
      |                                   |                              |           |              |                 |
      +=================+========+========+==============================+===========+==============+=================+
      | Parameter sheet\| Menu group\     | Displays the items of the   \| ○        | List select\ | ー              |
      |  (From)         | :Menu:Item      | Parameter sheet (with operat\|           | ion          |                 |
      |                 |                 | ion) created with the Menu c\|           |              |                 |
      |                 |                 | reate function.              |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 |  Select the target item.     |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 | The items that can be select\|           |              |                 |
      |                 |                 | ed are the ones within param\|           |              |                 |
      |                 |                 | eter sheets created with (wi\|           |              |                 |
      |                 |                 | th operation) in the ":menus\|           |              |                 |
      |                 |                 | election:`Create parameter s\|           |              |                 |
      |                 |                 | heet -->Define/Create parame\|           |              |                 |
      |                 |                 | ter sheets` menu.\           |           |              |                 |        
      |                 |                 |                              |           |              |                 |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | Substitute order| Input a substitute order for\| ※1       | Manual       | Integer between\|
      |                 |                 |  the parameter sheet if the\ |           |              |  1～2147483647  |
      |                 |                 |  created parameter sheet i\  |           |              |                 |
      |                 |                 | s bundled.                   |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Registration method               | Value type: Select in order\ | ○        | List selecti | ー              |
      |                                   |  to set the value of the ite\|           | on           |                 |
      |                                   | m to be the specified value  |           |              |                 |
      |                                   |  of the linked variable.     |           |              |                 |
      |                                   |                              |           |              |                 |
      |                                   | Key type: Select in order to |           |              |                 |
      |                                   |  set the name of the item to\|           |              |                 |
      |                                   |  be the specified value of \ |           |              |                 |
      |                                   | the linked variable.         |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Movement name                     |  Displays Movements register\| ○        | List selecti\| ー              |
      |                                   | ed in ":ref:`terraform_cli_m\|           | on           |                 |
      |                                   | ovement_list`"               |           |              |                 |
      |                                   |                              |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | IaC variable(To)| Movement name:v\|  Displays the variables of \ | ○        | List selecti\| ー              |
      |                 | ariable         | the files registered in" :re\|           | on           |                 |
      |                 |                 | f:`terraform_cli_movement_mo\|           |              |                 |
      |                 |                 | dule_link`".                 |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 | Select the variable that wil\|           |              |                 |
      |                 |                 | l be linked to the specific \|           |              |                 |
      |                 |                 | value.                       |           |              |                 |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | HCL settings    | Select "False" or "True".    | ○        | List selecti\| If the Variabl\ |
      |                 |                 |                              |           | on           | e type is set t\|
      |                 |                 | Setting the HCL settings to \|           |              | o map, they can\|
      |                 |                 | "True" allows users to confi\|           |              |  only be regist\|
      |                 |                 | gure the parameter sheets' i\|           |              | ered if set to\ |
      |                 |                 | nput value (specific value) \|           |              |  True.          |
      |                 |                 | 1:1 without having to think \|           |              |                 |
      |                 |                 | about the variable type.     |           |              | If the operatio\|
      |                 |                 |                              |           |              | n, Movement and\|
      |                 |                 | If set to "True", "Member va\|           |              |  Variable name \|
      |                 |                 | riable" and "Substitute valu\|           |              | matches a diffe\|
      |                 |                 | e" cannot be input.          |           |              | rent record, th\|
      |                 |                 |                              |           |              | e HCL setting v\|
      |                 |                 | When reflected to the ":ref\ |           |              | alue must also \|
      |                 |                 | :`terraform_cli_substitution\|           |              | match.          |
      |                 |                 | _value_list`" by the interna\|           |              |                 |
      |                 |                 | l processes, the selected va\|           |              |                 |
      |                 |                 | lue will be inherited.       |           |              |                 |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | Movement name:v\| Displays the member variabl\ | ※2       | List selecti\| ー              |
      |                 | ariable name:\  | e of the format of the varia\|           | on           |                 |
      |                 | member variable | ble used in the files regist\|           |              |                 |
      |                 |                 | ered in ":ref:`terraform_cli\|           |              |                 |
      |                 |                 | _movement_module_link`".     |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 | Select the member variable t\|           |              |                 |
      |                 |                 | hat will be linked to the sp\|           |              |                 |
      |                 |                 | ecific value.                |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | Substitute order| Required if the variable nam\| ※3       | Manual       | Input NULL or a\|
      |                 |                 | e or member variable can hav\|           |              | n integer betwe\|
      |                 |                 | e multiple specific values s\|           |              | en 1～2147483647|
      |                 |                 | pecified.                    |           |              |                 |
      |                 |                 | Input a Susbtitute order for\|           |              |                 |
      |                 |                 |  the specific value (1～). T\|           |              |                 |
      |                 |                 | he substitue order is in rai\|           |              |                 |
      |                 |                 | sing order.                  |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | NULL link                         | If the Parameter sheet's spe\| ー        | List selecti\| ー              |
      |                                   | cific value in the Substitut\|           | on           |                 |
      |                                   | e value auto registration se\|           |              |                 |
      |                                   | ttings are NULL, configure w\|           |              |                 |
      |                                   | hether the registration to t\|           |              |                 |
      |                                   | he Substitute value manageme\|           |              |                 |
      |                                   | nt registration should be do\|           |              |                 |
      |                                   | ne with the NULL value or no\|           |              |                 |
      |                                   | t.                           |           |              |                 |
      |                                   |                              |           |              |                 |
      |                                   | ・ If "Active", the Paramete\|           |              |                 |
      |                                   | r sheet value will be regist\|           |              |                 |
      |                                   | ered to the substitute value\|           |              |                 |
      |                                   |  management menu no matter w\|           |              |                 |
      |                                   | hat type the value is.       |           |              |                 |
      |                                   |                              |           |              |                 |
      |                                   | ・ If "Not active", the Para\|           |              |                 |
      |                                   | meter sheet value will only \|           |              |                 |
      |                                   | be registered to the substit\|           |              |                 |
      |                                   | ute value management if it\  |           |              |                 |
      |                                   |  contains a value.           |           |              |                 |
      |                                   |                              |           |              |                 |
      |                                   | ・If "NULL", the "NULL LINK\ |           |              |                 |
      |                                   | " value configured in ":ref\ |           |              |                 |
      |                                   | :`terraform_cli_interface_i\ |           |              |                 |
      |                                   |  nformation`" will be used.  |           |              |                 |
      |                                   |                              |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Remarks                           | Free description field       | ー        | Manual       | Maximum length \|
      |                                   |                              |           |              | 4000 bytes      |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+

| ※1:Only required if the Parammeter sheet has Bundles active.
| ※2:Required if the selected "Movement name:Variable name" has a member variable and if the HCL settings are set to "False".
| ※3:Only required if the selected "Movement name:Variable name" and "Movement name:Variable name:Member variable" is a format that requires a substitute order.

.. note:: | **For Parameter sheets with bundles**
   | In order to link Movement variables with Parameter sheets with bundles, the user must input a substitute order for the Parameter sheet (From) in :menuselection:`Terraform CLI-->Substitute value auto registration settings`
   | See the following figure for more information regarding the relationship between bundled parameter sheets and Substitute value auto registration settings.

   .. figure:: /images/ja/diagram/parameter_no_host.png
      :width: 600px
      :alt: Register Substitute value auto registration settings when using Bundled parameter sheets.

      Register Substitute value auto registration settings when using Bundled parameter sheets.

.. note:: | **Configuring IaC variable(To) member variables**
   | Must be configured if the variable type is object or tuple.
   | When configuring member variables, all the member variables of the same variable must also be configured.
   | If there are member variables without configured substitute values, they will not be used, even with default values.
   | For more information, see "※1 …Member variable targets" in ":ref:`terraform_common_variable_type`".

.. note:: | **IaC variable(To) substitute order**
   | Must be configured if the variable type is either list or set.
   | For more information, see "※2 …Susbtitute order targets" in ":ref:`terraform_common_variable_type`".

.. note:: | **HCL settings**
   | By setting the HCL settings to True, the user can configure the parameter sheets' input value (specific value) 1:1 without having to think about the variable type.
   | If the Variable type is set to map, they can only be registered if set to True.


.. _terraform_cli_execution:

Execute
********

| In the :menuselection:`Terraform CLI-->Execute` menu, users can execute operations.
| Select a Movement and Operation from the Movement list and Operation list and press the :guilabel:`Execute` button to move to the :ref:`terraform_cli_check_operation_status` where the execution will be processed.

.. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/execution_menu.gif
   :width: 800px
   :alt: Submenu (Execute) 

   Submenu (Execute) 

#. | **Specify reservation date**
   | By inputting a "Reservation date", the user can book executions and plan checks.
   | Only future dates can be specified.

#. | **Specify Movement**
   | Select a Movement registered in ":ref:`terraform_cli_movement_list`".

#. | **Specify Operation**
   | Select an Operation registered in ":ref:`terraform_cli_operation_list`".

#. | **Execute**
   | Press the Execute button to move to the "5.2.10 Execution status confirmation" menu where the execution processed will start.
   | Terraform Apply will automatically be executed after Terraform Plan ends.

#. | **Confirm Plan**
   | Clicking the "Check Plan" button operates similarly as the "Execute" button as it start the execution process. However, it will only execute, and not Terraform Apply.

#. | **Confirm parameters**
   | Clicking the "Check parameters" button allows useres to check the input parameter values. Neither Terraform Plan nor Terraform Apply will be executed.

.. tip:: | **Output block**
   | If a module with an output block is Executed with Conductor, the contents of the output block will be saved to the deta relay storage path(shared movement directory) as a json file. 
   | This file allows users to use a value output by Terraform from a different Movement (in the same conductor).

   | **File path**
   | [Conductor Operation directory path]/[Conductor Instance ID]/terraform_output_[Execution No.].json
   | Conductor Operation directory path・・・Ansible ITA original variable data link's Conductor Operation directory path
   | Conductor Instance ID・・・ ":ref:`conductor_conductor_job_list`" のconductor Instance ID
   | Execution No.・・・ ":ref:`terraform_cloud_ep_execution_list`" Execution No.

   | Description example

   +----------------------------------+
   | variable "VAR_sample" {          |
   |                                  |
   | 　type = string                  |
   |                                  |
   | 　default = "sample_string"      |
   |                                  |
   | }                                |
   |                                  |
   | output "output_sample" {         |
   |                                  |
   | 　value = "${var.VAR_sample}"    |
   |                                  |
   | }                                |
   +----------------------------------+

   | Output example

   +----------------------------------+
   | {                                |
   |                                  |
   | 　"output_sample": {             |
   |                                  |
   | 　　"sensitive": false,          |
   |                                  |
   | 　　"type": "string",            |
   |                                  |
   | 　　"value": "sample_string"     |
   |                                  |
   | 　}                              |
   |                                  |
   | }                                |
   +----------------------------------+


.. _terraform_cli_check_operation_status:

Check operation status
************

| In the :menuselection:`Terraform CLI-->Check operation status` menu, users can monitor execution statuses.

.. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/operation_status_menu.png
   :width: 800px
   :alt: Submenu (Check operation status) 

   Submenu (Check operation status) 

#. | **Execution status display**
   | The status matching the Execution status is displayed.
   | The execution log and error log also displays detailed information regarding the execution status.
   |  If the "Execution type" is set to "Check Plan", "Check Plan" will be displayed. If it is set to delete workspace resources (Executed from ":ref:`terraform_cli_workspace_list`".), it will display "Delete resource". For everything else, "Standard".

   | If the status ends in an unexpected error, and error log will be displayed in the message if there is something wrong with the registration in the ":ref:`terraform_cli_interface_information`" or other web contents.
   | For other errors, no message will be displayed in the error log. For those cases, the error information will be displayed in the application log. 

   |  "Call Conductor" displays which Conductor was executed. This field will be blank if directly executed from Terraform CLI driver.
   |  "Execution user" displays the user that was logged in when the "Execute" button was pressed.
   | ※ If "Execution type" is set to "Delete resources", the following items will not be configured.

   - Called Conductor
   - Movement
   - Operation
   - Input data

#. | **Check substitute value**
   | Press the :guilabel:`Check Susbtitute` button to display  ":ref:`terraform_cli_substitution_value_list`" where the Substitute values narrowed down to the target Operation and Movements are displayed.

#. | **Emergency stop/Delete reservation**
   | Users can press the :guilabel:`Emergency stop` button to stop the operation.
   | If the status was "Reserved execution", the :guilabel:`Delete reservation` button will be displayed. Click the :guilabel:`Delete reservation` button to delete the reservation.

#. | **Display execution log**
   | The log file names displayed in the execution log's pulldown menu are as following.
   | init.log: Terraform Init execution log
   | plan.log: Terraform Plan execution log
   | apply.log: Terraform Apply execution log

#. | **Search log**
   | Users can filter information to narrow down information in the execution log and the error log.
   | Input the string the user wants to search for and tick the "Corresponding lines only" checkbox to view only the lines corresponding to the string.
   | The refresh interval and maximum display lines can be configured by changing the "Status monitoring cycle item" and "Progress status display lines" items in the ":ref:`terraform_cli_interface_information`" menu.

#. | **Input data**
   | Users can download executed module files and a zip file containing a list of policy materials and the configured substitute values in Json format. 
   | The files are as following:

   .. list-table:: Input data storing file
      :widths: 2 2 6
      :header-rows: 1
      :align: left

      * - Folder name
        - File name
        - Description
      * - ー
        - |  (Input Module file name) 
        - | Stores all input nodule files within a zip file.
      * - ー
        - | terraform.tfvars
        - | File that contains the configured substitute value's "Variable name(key)" and "Specific value (value)".
          | Will not contain said data if the Secure settings are set to True.

#. | **Result data**
   | User can download execution logs, error logs, and state files generated by Terraform. 
   | The files are as following:

   .. list-table:: Result data storing file
      :widths: 2 2 6
      :header-rows: 1
      :align: left

      * - Folder name
        - File name
        - Description
      * - ー
        - | init.log
        - | Log file that contains the contents output to the execution log(init.log).
      * - ー
        - | plan.log
        - | Log file that contains the contents output to the progress log(plan.log).
      * - ー
        - | apply.log
        - | Log file that contains the contents output to the progress log(apply.log).
      * - ー
        - | error.log
        - | Log file that contains the contents output to the progress (apply.log).
      * - ー
        - | result.txt
        - | File that documents the progress log used by the internal functions.
      * - ー
        - | .terraform.lock.hcl
        - | File generated by Terraform. Contains provider and module information.
      * - ー
        - | terraform.tfstate
        - | State file generated by Terraform.
          | Saved in a decrypted state.
      * - ー
        - | terraform.tfstate.backup
        - | Backup of the state file generated by Terraform.
          | Saved in a decrypted state.

.. _terraform_cli_execution_list:

Execution management
********

#. | In the :menuselection:`Terraform CLI-->Execution management` menu, the user can view execution histories.
   | Specify search conditions and press the :guilabel:`Filter` button to view a table of executions.
   | Pressing the :guilabel:`Details` button move sthe user to :ref:`terraform_cli_check_operation_status` where they can view detailed information regarding the execution status.

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/execution_list_menu.png
      :width: 800px
      :alt: Submenu (Execution management) 

      Submenu (Execution management) 

#. | The items found in the Execution management menu are as following.

   .. table:: Item list (Execution management) 
      :widths: 1 1 1 4
      :align: left

      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | **Item**                          | **Description**                                                           |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +=================+========+========+===========================================================================+
      | Execution No.                     | Displays an automatically given unique ID (36 characters)                 |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Details                           | Press this button to move to the ":ref:`terraform_cli_check_operation_st\ |
      |                                   | atus`" menu where users can see more detailed information.                |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Execution type                    | Displays what type of execution was executed.                             |
      |                                   |                                                                           |
      |                                   | The following types exists: "Normal"  "Plan check"  "Parameter sheet c\   |
      |                                   | heck"                                                                     |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Status                            | Displays the status of the execution.                                     |
      |                                   | The following exists:                                                     |
      |                                   |  "Not executed"  "Not executed(Reserved)"  "Preparing"  "Executing"  "Exe\|
      |                                   | cuting(Delayed)"  "Complete"  "Complete(Error)"  "Unexpected error"  "Em\ |
      |                                   | ergency stop"  "Reservation deleted".                                     |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Execution user                    | Displays the name that executed the operation.                            |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Registration time                 | Displays the time when the operation was registered.                      |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Movement        | ID              | Displays the ID of the Movement.                                          |
      |                 |                 |                                                                           |
      +                 +--------+--------+---------------------------------------------------------------------------+
      |                 | Name            | Displays the name of the Movement.                                        |
      |                 |                 |                                                                           |
      |                 |                 |                                                                           |
      +                 +--------+--------+---------------------------------------------------------------------------+
      |                 | Delay timer     | Displays the delay timer value configured to the Movement.                |
      |                 |                 |                                                                           |
      |                 |                 |                                                                           |
      +                 +--------+--------+---------------------------------------------------------------------------+
      |                 | Terraf\| Work\  | Displays the Terraform Workspace ID configured to the Movement.           |
      |                 | orm us\| space\ |                                                                           |
      |                 | e info\| ID     |                                                                           |
      +                 | rmation+--------+---------------------------------------------------------------------------+
      |                 |        | Worksp\| Displays the name of the Terraform Workspace configured to the Movement.  |
      |                 |        | ace Na\|                                                                           |
      |                 |        | me     |                                                                           |
      |                 |        |        |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Operation       | No.             | Dispalys the Operation No.                                                |
      |                 |                 |                                                                           |
      +                 +--------+--------+---------------------------------------------------------------------------+
      |                 | Name            | Displays the name of the Operation.                                       |
      |                 |                 |                                                                           |
      |                 |                 |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Input data                        | Allows users to download the input data in a Zip file.                    |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Result data                       | Allows users to download the result data in a Zip file.                   |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Execution status| Reservation date| Displays the reservation date if the execution is reserved.               |
      |                 |                 |                                                                           |
      +                 +--------+--------+---------------------------------------------------------------------------+
      |                 | Start date      | Displays when the execution will start.                                   |
      |                 |                 |                                                                           |
      |                 |                 |                                                                           |
      +                 +--------+--------+---------------------------------------------------------------------------+
      |                 | End date        | Displays when the execution will end.                                     |
      |                 |                 |                                                                           |
      |                 |                 |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Remarks                           | Free description field                                                    |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+

.. _terraform_cli_substitution_value_list:

Susbtitute value management
**********

#. | In the :menuselection:`Terraform CLI-->Susbtitute value management` menu, userse can view the specific value that substitues the variables in the Module files used by the Movement linked to the Operaration.

   .. figure:: /images/ja/terraform_cli_driver/operation_method_explanation/substitution_value_list_menu.png
      :width: 800px
      :alt: Submenu (Susbtitute value management) 

      Submenu (Susbtitute value management) 


#. | The items found in the Susbtitute value management menu are as following.

   .. table:: Item list (Susbtitute value management) 
      :widths: 1 1 1 4
      :align: left

      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | **Item**                          | **Description**                                                           |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +=================+========+========+===========================================================================+
      | Execution No.                     | Displays an automatically given unique ID (36 characters).                |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Operation                         | Displays the selected Operation.                                          |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Movement name                     | Displays the selected Movement.                                           |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Movement name:Variable name       |  Displays the variable name attached to the Movement selected in ":ref:\  |
      |                                   | `terraform_cli_substitution_value_auto_registration_setting`".            |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | HCL settings                      | Displays whether the HCL settings configured in ":ref:`terraform_cli_subs\|
      |                                   | titution_value_auto_registration_setting`" are set to False or True. Vari\|
      |                                   | ables with hierarchies containing member variables and substitute order \ |
      |                                   | are set to "True".                                                        |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Movement name:Member name:Mem\    |  Displays the Member variable attached to the Movement selected in ":ref\ |
      | ber variable                      | :`terraform_cli_substitution_value_auto_registration_setting`".           |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Susbtitute order                  |  Displays the substitute order of the Member variable or Variable name at\|
      |                                   | tached to the Movement selected in ":ref:`terraform_cli_substitution_valu\|
      |                                   | e_auto_registration_setting`".                                            |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Specific value  | Sensitive setti\|  Displays either "True" or "False".                                       |
      |                 | ngs             |                                                                           |
      |                 |                 |  If "True", the data will not be stored in the input data fetched from \  |
      |                 |                 | ":ref:`terraform_cli_check_operation_status`".                            |
      +                 +--------+--------+---------------------------------------------------------------------------+
      |                 | Value           | Displays the Specific value of the variable used by the Operation/Move\   |
      |                 |                 | ment.                                                                     |
      |                 |                 |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Remarks                           | Free description field                                                    |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+



