=========================
Terraform Cloud/EP driver
=========================

Introduction
========
| This document aims to explains the Terraform Cloud/EP driver function and how to use it.
| For more information regarding the Terraform CLI driver common functions and Terraform & Terraform driver overviews, see :doc:`./terraform_common`.

Console menu structure
======================

| This section explains the Terraform Cloud/EP driver menu ustructure.

Menu list
-----------------

#. | **Basic console menus**
   | The basic console menus used by the Terraform Cloud/EP driver are as following.

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


#. | **Terraform Cloud/EP driver menus**
   | The Terraform Cloud/EP driver menu list are as following.

   .. table::  Terraform Cloud/EP driver menu list
      :widths: 1 2 2 5
      :align: left

      +-------+--------------+--------------+----------------------------------------+
      | **N\  | **Menu\      |  **Menu**    | **Description**                        |
      | o**   | Group**      |              |                                        |
      +=======+==============+==============+========================================+
      | 1     | Terraform \  | Interface \  | Manages information for executions.    |
      |       | Cloud/EP     | information  |                                        |
      +-------+              +--------------+----------------------------------------+
      | 2     |              | Organizatio\ | Manages Organization information used \|
      |       |              | n management | by Terraform.                          |
      +-------+              +--------------+----------------------------------------+
      | 3     |              | Workspace\   | Manages workspace information used by\ |
      |       |              | management   |  Terraform.                            |
      +-------+              +--------------+----------------------------------------+
      | 4     |              | Movement\    | Manages Movement lists.                |
      |       |              | list         |                                        |
      +-------+              +--------------+----------------------------------------+
      | 5     |              | Module file\ | Manages Module files.                  |
      |       |              |  collection  |                                        |
      +-------+              +--------------+----------------------------------------+
      | 6     |              | Policy manag\| Manages Policy files.                  |
      |       |              | ement.       |                                        |
      +-------+              +--------------+----------------------------------------+
      | 7     |              | Policy set\  | Manages Policy Sets.                   |
      |       |              |  management  | Policy Set allows users to use Polici\ |
      |       |              |              | es for the target workspace by linkin\ |
      |       |              |              | g with Policies and Workspaces.\       |
      +-------+              +--------------+----------------------------------------+
      | 8     |              | Policy \     | Manages links between PolicySet and P\ |
      |       |              | set-Policy\  | olicies.                               |
      |       |              |  link        |                                        |
      +-------+              +--------------+----------------------------------------+
      | 9     |              | Policy \     | Manages links between PolicySets Works\|
      |       |              | set-Work\    | paces.                                 |
      |       |              | space link   |                                        |
      +-------+              +--------------+----------------------------------------+
      | 10    |              | Movement-\   | Manages links between Movements and M\ |
      |       |              | Module link  | odule files.                           |
      |       |              |              |                                        |
      +-------+              +--------------+----------------------------------------+
      | 11    |              | Variable \   | Manages the maximum cycles for member \|
      |       |              | nest \       | variables if the variable type defined\|
      |       |              | management   |  in the tf file is "list" or "set" and\|
      |       |              |              |  the "list", "set," "tuple" or "object\|
      |       |              |              | " is defined.                          |
      +-------+              +--------------+----------------------------------------+
      | 12    |              | Substitute \ | Manage movements and variables that li\|
      |       |              | value auto \ | nk items and values for each operatio\ |
      |       |              | registration\| n registered in the parameter s\       |
      |       |              |  settings    | heet menu.                             |
      |       |              |              |                                        |
      |       |              |              |                                        |
      +-------+              +--------------+----------------------------------------+
      | 13    |              | Execute      | Executes selected Movements and Operat\|
      |       |              |              | ions.                                  |
      +-------+              +--------------+----------------------------------------+
      | 14    |              | Execution \  | Manages execution history.             |
      |       |              | management   |                                        |
      +-------+              +--------------+----------------------------------------+
      | 15    |              | Check operat\| Displays the status of executions.     |
      |       |              | ion status   |                                        |
      +-------+              +--------------+----------------------------------------+
      | 16    |              | Susbtitute v\| Manages variable substitute values.    |
      |       |              | alue manage\ |                                        |
      |       |              | ment         |                                        |
      +-------+              +--------------+----------------------------------------+
      | 17    |              | Link \       | Allows users to view and delete Polici\|
      |       |              | Terraform\   | es, Policy sets, Workspaces and Organ\ |
      |       |              | management   | izations registered to the linked Te\  |
      |       |              |              | rraform.                               |
      +-------+              +--------------+----------------------------------------+
      | 18    |              | Module-varia\| Manages links between Module variable\ |
      |       |              | ble link\    | s and Module f                         |
      |       |              | (※1)        |                                        |
      +-------+              +--------------+----------------------------------------+
      | 19    |              | Member varia\| Manages member variables.              |
      |       |              | ble managem\ |                                        |
      |       |              | ent(※1)     |                                        |
      +-------+              +--------------+----------------------------------------+
      | 20    |              | Movement-\   | Manages links between Movements and v\ |
      |       |              | variable \   | ariables.                              |
      |       |              | link(※1)    |                                        |
      +-------+              +--------------+----------------------------------------+
      | 21    |              | Movement-\   | Manages links between Movements and M\ |
      |       |              | member varia\| ember variables.                       |
      |       |              | ble link(※1)|                                        |
      +-------+--------------+--------------+----------------------------------------+

   .. note::
      | ※1 Hidden menus are internal functions used to register and edit data.
      | There are some hidden menus configured when the Terraform Cloud/EP driver function is installed.
      | In order to display hidden menus, go to the :menuselection:`Management console-->Role/Menu link management` menu and restore the desired menus. For more information, see :doc:`../it_automation_base/management_console`.


Terraform Cloud/EP driver procedure
========

| This section explains how to use the different Terraform Cloud/EP menus

Terraform Cloud/EP workflow
-----------------------

| A standard workflow using the different Terraform Cloud/EP menus can be seen below.
| See the following sections for more detailed information regarding each of the steps.

.. figure:: /images/ja/terraform_cloud_ep_driver/common/work_flow.png
   :align: left
   :width: 600px
   :alt: Workflow

-  **Workflow details and references**

   #. | **Register Input operation name**
      | From the basic console's Operation list menu, register an input operation name.
      | For more information, see :ref:`terraform_cloud_ep_operation_list`.

   #. | **Register Interface information**
      | Configure information for the execution.
      | For more information, see :ref:`terraform_cloud_ep_interface_information`.

   #. | **Register and link Organization**
      | Register inforamtion for the Terraform Organization and link with Terraform.
      | For information, see :ref:`terraform_cloud_ep_organization_list`

   #. | **Register and link Workspace**
      | Register information for the Terraform workspace.
      | For more information, see :ref:`terraform_cloud_ep_workspace_list`.

   #. | **Register Movement**
      | Register a movement.
      | For more information, see :ref:`terraform_cloud_ep_movement_list`.

   #. | **Register Module files**
      | Register a Module file that will be executed..
      | For more information, see :ref:`terraform_cloud_ep_module_list`.

   #. | **Register Policy (if required) **
      | Register a Policy file that will execute Policy check before executing the operation.
      | For more information, see :ref:`terraform_cloud_ep_policy_list`.

   #. | **Register Policy set (if required) **
      | Register a Policy set for linking with the Workspace that applies the Policy.
      | For more information, see :ref:`terraform_cloud_ep_policyset_list`.

   #. | **Link Policy set with Policy (if required) **
      | Register a link between the Policy set and the Policy.
      | For more information, see :ref:`terraform_cloud_ep_policyset_policy_link`.

   #. | **Link Policy set with Workspace (if required) **
      | Register a link between the Policy set and the Workspace.
      | For more information, see :ref:`terraform_cloud_ep_policyset_workspace_link`.

   #. | **Specify Module file to Movement**
      | Configure the registered module file to the registered Movement.
      | For more information, see :ref:`terraform_cloud_ep_movement_module_link`.

   #. | **Configure maximum cycles (if required)**
      | Configure maximum amount of cycles for the Member variable.
      | For more information, see :ref:`terraform_cloud_ep_nested_variable`.

   #. | **Create Parameter sheet (if required)**
      | From the Parameter sheet creation's "Define/Create parameter sheets" menu, create a parameter sheet where the user can register data that will be used to configure the target server. 
      | For more information, see :doc:`../create_param/menu_creation`.

   #. | **Register data to the Parameter sheet (if required)**
      | In the Input menu group, access the Parameter sheet created in the previous step.From there, register data that will be used to configure the target server.
      | For more information, see :doc:`../create_param/menu_creation`.

   #. | **Configure substitute value auto registration settings (if required)**
      | From the Substitute value auto registration settings menu, link the all the operation items and setting values registered to the Parameter sheet and the Movement variables.
      | For more information, see :ref:`terraform_cloud_ep_substitution_value_auto_registration_setting`.

   #. | **Execute operation**
      | From the Execution menu, select the previously created Movement and Input operation and execute them.
      | For more information, see :ref:`terraform_cloud_ep_execution`.

   #. | **Confirm operation status**
      | In the Execution status confirmation menu, the status of all previously executed operations will be updated in realtime. Users can also monitor error logs and execution logs as well as stop them with an emergency stop.
      | For more information, see :ref:`terraform_cloud_ep_check_operation_status`.

   #. | **Confirm operation history**
      | In the Execution management page, users can check the history of all previously executed operations.
      | For more information, see :ref:`terraform_cloud_ep_execution_list`.


Apply Policy
============

Linking Policy/PolicySet/Workspace
------------------------------------------
| **In order to use the Policy function, the Link Terraform must be either Terraform Enterprise or Terraform Cloud and the "Policy & Security" function must be active.
|
| In order to apply Policies, they must be linked after the Policy settings are registered.

| First, link the Policy registered in :ref:`terraform_cloud_ep_policy_list` and the Policy set registered in :ref:`terraform_cloud_ep_policyset_list` in the 
| :ref:`terraform_cloud_ep_policyset_policy_link` menu.

| Next, link the Terraform Workspace :ref:`terraform_cloud_ep_workspace_list` and the Policy set registered in :ref:`terraform_cloud_ep_policyset_list` in the
| :ref:`terraform_cloud_ep_policyset_workspace_link` menu.

| When the operation is executed, The Policy and the Policy set it is linked to will be applied to the Workspace linked to the selected Movement.

.. figure:: /images/ja/terraform_cloud_ep_driver/common/policy_setting.png
   :align: left
   :width: 800px
   :alt: Applying Policy


Function 
==================

| This section explains the different functions of the menus used by the Terraform Cloud/EP driver.

Basic console
--------------

| This section explains how to operate the Basic console menus.
| For this workflow, refer to :doc:`../it_automation_base/basic_console` while operating the Basic console menus.

.. _terraform_cloud_ep_operation_list:

Operation list
******************

| In the :menuselection:`Basic console-->Operation list` menu, users can manage the operations executed by the different orchestrators. 
| For more information regarding registering Operations, see :doc:`../it_automation_base/basic_console`.

.. figure:: /images/ja/basic_console/operation_list/register.png
   :width: 800px
   :alt: Submenu (Operation list) 

   Submenu (Operation list) 


Terraform Cloud/EP menu
-----------------------------

| This section explains how to operate the Terraform Cloud/EP driver menus.

.. _terraform_cloud_ep_interface_information:

Interface information
********************

#. | In the :menuselection:`Terraform Cloud/EP -->Interface information` menu, users can maintain (view/edit) execution information.
   | Users must have a UserToken issued from the Terraform and a Terraform Hostname.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/interface_information_menu.png
      :width: 800px
      :alt: Submenu (Interface information) 

      Submenu (Interface information) 

#. | Press the :guilabel:`Edit` button to register Interface information.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/interface_information_register.gif
      :width: 800px
      :alt: Registration page (Interface information) 

     Registration page (Interface information) 

#. | The items in the Interface information menu are as following.
   | If there is no Interface information registered, the operation execution will meet an unexpected error when multiple records are registered.

   .. list-table::Registration page Item list (Interface information) 
      :widths: 1 1 1 4 1 1 1
      :align: left

      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | **Item**                          | **Description**              | **Input r\| **Input met\ | **Restrictions**|
      |                                   |                              | equired** | hod**        |                 |
      |                                   |                              |           |              |                 |
      +=================+========+========+==============================+===========+==============+=================+
      |  Link Terra\    | Protocol        | Input either http or https f\| ○        | Manual       | ー              |
      |  form           |                 | or the protocol for the Terr\|           |              |                 |
      |                 |                 | aform. Standard protocol i\  |           |              |                 |
      |                 |                 | s https.\                    |           |              |                 |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | Hostname        | Input the Link Terraform's H\| ○        | Manual       | Maximum length \|
      |                 |                 | ostname.                     |           |              | 256 bytes       |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | Port            | Input the Link Terraform's P\| ー        | Manual       | Minimum value =1|
      |                 |                 | ort.\                        |           |              | Maximum value =\|
      |                 |                 |                              |           |              | 65535           |
      |                 |                 | Standard value is NULL.      |           |              |                 |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | User Token      | Input a User token issued fr\| ー        | Manual       | Maximum length\ |
      |                 |                 | om Terraform's UserSettings. |           |              | 1024 bytes      |
      |                 |                 |                              |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 | For more information regardi\|           |              |                 |
      |                 |                 | ng issuing User tokens, see \|           |              |                 |
      |                 |                 | ":ref:`configu\              |           |              |                 |
      |                 |                 | ration_terraform_cloud_ep_\  |           |              |                 |
      |                 |                 | initial_setting`".           |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 |                              |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      |  Proxy          | Address         | Input the address for the Pr\| ー        | Manual       | ー              |
      |                 |                 | oxy server. If ITA is under \|           |              |                 |
      |                 |                 | a proxy environment, the use\|           |              |                 |
      |                 |                 | r might need to configure ex\|           |              |                 |
      |                 |                 | tra settings in order to co\ |           |              |                 |
      |                 |                 | nnect to Terraform.          |           |              |                 |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | Port            | Input the port for the prox\ | ー        | Manual       | ー              |
      |                 |                 | y server.                    |           |              |                 |
      |                 |                 |                              |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | NULL連携                          | If the Parameter sheet's spe\| ○        | List selecti\| ー              |
      |                                   | cific value in the Substitut\|           | on           |                 |
      |                                   | e value auto registration se\|           |              |                 |
      |                                   | ttings are NULL, configure w\|           |              |                 |
      |                                   | hether the registration to t\|           |              |                 |
      |                                   | he Substitute value manageme\|           |              |                 |
      |                                   | nt registration should be do\|           |              |                 |
      |                                   | ne with the NULL value or not|           |              |                 |
      |                                   | If the Substitute value auto\|           |              |                 |
      |                                   |  registration settings menu'\|           |              |                 |
      |                                   | s "NULL link" is NULL, this \|           |              |                 |   
      |                                   | value will be used.          |           |              |                 |          
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Status monitoring cycle(Milisec\  | Input the interval time for \| ○        | Manual       | Minimum value \ |
      | onds)                             | when the :ref:`terraform_cl.\|           |              | 1000 miliseconds|
      |                                   | i_check_operation_status` lo\|           |              |                 |
      |                                   | g is refreshed.              |           |              |                 |
      |                                   | 1000 miliseconds is the reco\|           |              |                 |
      |                                   | mmended value.               |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Number of Progress status display\| Display the numbers of maxim\| ○        | Manual       | ー              |
      |  lines                            | um lines that will be displa\|           |              |                 |
      |                                   | yed in the progress log and \|           |              |                 |
      |                                   | error log in :ref:`terraform\|           |              |                 |
      |                                   | _cloud_ep_check_operation_st\|           |              |                 |
      |                                   | atus`.                       |           |              |                 |
      |                                   |                              |           |              |                 |
      |                                   | If the status is [Not execut\|           |              |                 |
      |                                   | ed]、[Preparing]、[Executing\|           |              |                 |
      |                                   | ]、[Executing(Delayed)], the\|           |              |                 |
      |                                   |  log will output the specifi\|           |              |                 |
      |                                   | ed amount of lines           |           |              |                 |
      |                                   |                              |           |              |                 |
      |                                   | If the status is [Complete]\ |           |              |                 |
      |                                   | 、[Complete(Error)]、[Unexpe\|           |              |                 |
      |                                   | cted error]、[Emergency sto\ |           |              |                 |
      |                                   | p], [Not executed(Reserved)\ |           |              |                 |
      |                                   | 、[Reservation deleted]], th\|           |              |                 |
      |                                   | e log will output all the \  |           |              |                 |
      |                                   | lines.                       |           |              |                 |
      |                                   |                              |           |              |                 |
      |                                   | We recommend tuning this num\|           |              |                 |
      |                                   | ber depending on the user en\|           |              |                 |
      |                                   | vironment. The standard reco\|           |              |                 |
      |                                   | mmended value is 1000 lines. |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Remarks                           | Free description field       | ー        | Manual       | Maximum length \|
      |                                   |                              |           |              | 4000 bytes      |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+

.. _terraform_cloud_ep_organization_list:

Organization management
****************

#. | In the :menuselection:`Terraform Cloud/EP-->Organization management` menu, users can maintain (view/register/update/delete discarded) Organizations used in Terraform.
   | Users can link (register/edit/delete) Organizations registered to ITA to Terraform.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/organization_list_menu.png
      :width: 800px
      :alt: Submenu (Organization management) 

      Submenu (Organization management) 

#. | Press the :guilabel:`＋ Register` button to register Organization informationn.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/organization_list_register.gif
      :width: 800px
      :alt: Registration page (Organization management) 

      Registration page (Organization management) 

#. | After an Organization is registered, users can click the "Check status" button  to check the Link status with the Terraform linked in :ref:`terraform_cloud_ep_interface_information`.
   | By clicking the "Register", "Edit" or the "Delete" button in the "Terraform link" column group, users register, edit and delete Organizations for the linked Terraform
   | If an operation is executed while no Organization is linked to Terraform, \ **the execution will end in an unexpected error**\ .

   | If hostname and User Token registered in "6.2.1 Interface Information" are incorrect, the link with Terraform will fail, and the following message will be displayed in the link status:
   | "Failed to connect to Terraform. Check the interface information”.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/organization_list_terraform_link.gif
      :width: 800px
      :alt: Terraform link (Organization management) 

      Terraform link (Organization management) 

#. | The items found in the Organization management menu are as following.

   .. table:: Registration page Item list (Organization management) 
      :widths: 1 1 1 4 1 1 1
      :align: left

      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | **Item**                          | **Description**              | **Input r\| **Input\     | **Restrictions**|
      |                                   |                              | equired** | method**     |                 |
      |                                   |                              |           |              |                 |
      +=================+========+========+==============================+===========+==============+=================+
      | Organization name                 | Input the Organization name\ | ○        | Manual       | Maximum length\ |
      |                                   |                              |           |              | 40 bytes        |
      |                                   | Organization names can conta\|           |              |                 |
      |                                   | in half-width alphanumeric c\|           |              |                 |
      |                                   | haracters and the following \|           |              |                 |
      |                                   | symbols _ - (Underbar and hy\|           |              |                 |
      |                                   | phen).                       |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Email address                     | Input the Organization's E-\ | ○        | Manual       | Maximum length\ |
      |                                   | mail address.                |           |              | 128 bytes       |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Terraform link  | Status check    | Checks if link status betwee\| ー        | Button       | ー              |
      |                 |                 | n the target Organization an\|           |              |                 |
      |                 |                 | d the linked Terraform.      |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 | After pressing the button, t\|           |              |                 |
      |                 |                 | he status will be displayed \|           |              |                 |
      |                 |                 | in a popup message.          |           |              |                 |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | Register        | Button that allows users reg\| ー        | Button       | ー              |
      |                 |                 | ister Organizations to the l\|           |              |                 |
      |                 |                 | inked Terraform.             |           |              |                 |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | Edit            | Button that allows users to \| ー        | Button       | ー              |
      |                 |                 | edit already registered Org\ |           |              |                 |
      |                 |                 | anizations.\                 |           |              |                 |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | Delete          | Button that allows users to \| ー        | Button       | ー              |
      |                 |                 | delete already registered O\ |           |              |                 |
      |                 |                 | rganizations.                |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 | ※Delete Organizations canno\|           |              |                 |
      |                 |                 | t be restored. Any belonging\|           |              |                 |
      |                 |                 |  workspaces will also be del\|           |              |                 |
      |                 |                 | eted.\                       |           |              |                 |
      |                 |                 |                              |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Remarks                           | Free description field       | ー        | Manual       | Maximum length\ |
      |                                   |                              |           |              | 4000 bytes      |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+


.. _terraform_cloud_ep_workspace_list:

Workspace management
*************

#. | In the :menuselection:`Terraform Cloud/EP-->Workspace management` menu, users can maintain (view/register/update/delete discarded) Workspaces used by Terraform.
   | It is also possible to link (register/edit/delete) Workspaces registered to ITA to Terraform as well as delete resources(terraform destroy).

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/workspace_list_menu.png
      :width: 800px
      :alt: Submenu (Workspace management) 

      Submenu (Workspace management) 

#. | Press the :guilabel:`＋ Register` button to register Workspace information.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/workspace_list_register.gif
      :width: 800px
      :alt: Submenu (Workspace management) 

      Submenu (Workspace management) 

#. |  After an Workspace is registered, users can click the "Check status" button  to check the Link status with the Terraform linked in :ref:`terraform_cloud_ep_interface_information`.
   | By clicking the "Register", "Edit" or the "Delete" button in the "Terraform link" column group, users register, edit and delete Workspaces for the linked Terraform
   | If an operation is executed while no Workspace is linked to Terraform, \ **the execution will end in an unexpected error**\ .

   | If hostname and User Token registered in "6.2.1 Interface Information" are incorrect, the link with Terraform will fail, and the following message will be displayed in the link status:
   | "Failed to connect to Terraform. Check the interface information”.』
   | The same message will be displayed if the selected Organizatio nis not linked to Terraform.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/workspace_list_terraform_link.gif
      :width: 800px
      :alt: Terraform link (Workspace Management) 

      Terraform link (Workspace Management) 

#. | Click the "Delete resource" button moves the user to ":ref:`terraform_cloud_ep_check_operation_status`" where the target workspace will have their resources deleted (terraform destroy).

#. | The items found in the Workspace management menu are as following.

   .. table:: Registration page Item list (Workspace management) 
      :widths: 1 1 1 4 1 1 1
      :align: left

      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | **Item**                          | **Description**              | **Input r\| **Input\     | **Restrictions**|
      |                                   |                              | equired** |  method**    |                 |
      |                                   |                              |           |              |                 |
      +=================+========+========+==============================+===========+==============+=================+
      | Organization name                 | Select an Organization name \| ○        | List select\ | Maximum length  |
      |                                   | registered in ":ref:`terrafo\|           | ion          | 40 bytes.       |
      |                                   | rm_cloud_ep_organization_li\ |           |              |                 |
      |                                   | st`".                        |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Workspace name  |                 | Input a name for the works\  | ○        | Manual       | Maximum length\ |
      |                 |                 | pace.                        |           |              |   90 bytes.     |
      |                 |                 |                              |           |              |                 |
      |                 |                 | The workspace name can cont\ |           |              |                 |
      |                 |                 | ain half-width alphanumeric\ |           |              |                 |
      |                 |                 |  characters and the followi\ |           |              |                 |
      |                 |                 | ng symbols _ - (Underbar a\  |           |              |                 |
      |                 |                 | nd hyphen).                  |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Terraform version                 | Input the Version of the Ter\| ○        | Manual       | Maximum length  |
      |                                   | raform. If left blank, the n\|           |              | 128 bytes       |
      |                                   | ewest version when the Terr\ |           |              |                 |
      |                                   | aform was linked (registered\|           |              |                 |
      |                                   |) will be used.               |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Terraform link  | Status check    | Checks if link status betwee\| ー        | Button       | ー              |
      |                 |                 | n the target Workspace an\   |           |              |                 |
      |                 |                 | d the linked Terraform.      |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 | After pressing the button, t\|           |              |                 |
      |                 |                 | he status will be displayed \|           |              |                 |
      |                 |                 | in a popup message.          |           |              |                 |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | Register        | Button that allows users reg\| ー        | Button       | ー              |
      |                 |                 | ister Workspace to the l\    |           |              |                 |
      |                 |                 | inked Terraform.             |           |              |                 |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | Edit            | Button that allows users to \| ー        | Button       | ー              |
      |                 |                 | edit already registered Org\ |           |              |                 |
      |                 |                 | anizations.\                 |           |              |                 |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | Delete          | Button that allows users to \| ー        | Button       | ー              |
      |                 |                 | delete already registered W\ |           |              |                 |
      |                 |                 | orkspace.                    |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 | ※If the workspace is delet\ |           |              |                 |
      |                 |                 | ed, the user will no longer \|           |              |                 |
      |                 |                 | be able to delete resources.\|           |              |                 |
      |                 |                 | Deleted Workspaces cannot b\ |           |              |                 |
      |                 |                 | e restored.                  |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Execute         | Delete resources| Deletes resources managed \  | ー        | Button       | ー              |
      |                 |                 | and structured per workspace.|           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 | Click the button will dis\   |           |              |                 |
      |                 |                 | play a dialog box asking for\|           |              |                 |
      |                 |                 |  comfirmation. Click "OK"\   |           |              |                 |
      |                 |                 |  will move the user to :ref:\|           |              |                 |
      |                 |                 | `terraform_cloud_ep_check_op\|           |              |                 |
      |                 |                 | eration_status` where the re\|           |              |                 |
      |                 |                 | sources are deleted.\        |           |              |                 |
      |                 |                 |                              |           |              |                 |
      |                 |                 |                              |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Remarks                           | Free description field       | ー        | Manual       | Maximum length \|
      |                                   |                              |           |              | 4000 bytes      |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+

.. _terraform_cloud_ep_movement_list:

Movement list
************

#. | In the :menuselection:`Terraform Cloud/EP-->Movement list` menu, users can maintain (view/register/edit/discard) Movement names.
   | As Movements needs to be linked to the Workspace and Organization as Terraform use information, The user will first have to register a target in :ref:`terraform_cloud_ep_workspace_list` and :ref:`terraform_cloud_ep_organization_list`.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/movement_list_menu.png
      :width: 800px
      :alt: Submenu (Movement list) 

      Submenu (Movement list) 

#. | Check the :guilabel:`＋ Register` button to register Movement information.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/movement_list_register.gif
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
      |                       | rm Cloud/\|           |           |           |
      |                       | EP"       |           |           |           |
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
      | Remarks   |           | Free desc\| ー        | Manual    | Maximum \ |
      |           |           | ription f\|           |           | length 40\|
      |           |           | ield      |           |           | 00 bytes  |
      +-----------------------+-----------+-----------+-----------+-----------+

.. _terraform_cloud_ep_module_list:

Module file collection
************

#. | In the :menuselection:`Terraform Cloud/EP-->Module file collection` menu, users can maintain (view/register/edit/discard) user created modules.
   | For more inforamtion regarding writing Modules, see :ref:`terraform_common_module_description`.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/module_list_menu.png
      :width: 800px
      :alt: Submenu (Module file collection) 

      Submenu (Module file collection) 

#. | Press the :guilabel:`＋ Register` button to register Movement information.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/module_list_register.gif
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
   | The variables can have specific values registered to them in ":ref:`terraform_cloud_ep_substitution_value_auto_registration_setting`".
   | The variables are not extracted in realtime, meaning that it may take time before they can be used in ":ref:`terraform_cloud_ep_substitution_value_auto_registration_setting`".。

.. _terraform_cloud_ep_policy_list:

Policy management
**********

#. | In the :menuselection:`Terraform Cloud/EP-->Policy management` menu, users can maintain (view/register/update/delete discarded) user created Policies.
   | For more information writing Modules, see :ref:`terraform_common_policy_description`.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/policy_list_menu.png
      :width: 800px
      :alt: Submenu (Policy management) 

      Submenu (Policy management) 

#. | Press the :guilabel:`＋ Register` button to register a Policy.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/policy_list_register.gif
      :width: 800px
      :alt: Registration page (Policy management) 

      Registration page (Policy management) 

#. | The items found in the Policy management menu are as following.

   .. list-table:: Registration page Item list (Policy management) 
      :widths: 2 4 1 1 2
      :header-rows: 1
      :align: left

      * - Item
        - Description
        - Input required
        - Input method
        - Restrictions
      * - Policy name
        - | Input a name for the Policy
          | Policies can contain half-width alphanumeric charactesr and the following symbols:  _ - (Underbar and hyphen).
        - ○
        - Manual
        - Maximum length 255 bytes
      * - Policy file
        - Upload a created Policy file.
        - ○
        - File selection
        - Maximum size 100 mb
      * - Remarks
        - Free description field
        - ー
        - Manual
        - Maximum length 4000 bytes

.. _terraform_cloud_ep_policyset_list:

Policy Set management
**************

#. | In the :menuselection:`Terraform Cloud/EP-->Policy set management` menu, users can maintain (view/register/update/delete discarded) Policy sets.
   | Policy Sets applies Policies to the Workspace when executed by linking with Policies and Workspaces in ":ref:`terraform_cloud_ep_policyset_policy_link`" and ":ref:`terraform_cloud_ep_policyset_workspace_link`".

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/policyset_list_menu.png
      :width: 800px
      :alt: Submenu (Policy set management) 

      Submenu (Policy set management) 

#. | Press the :guilabel:`＋ Register` button to register a Policy set.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/policyset_list_register.gif
      :width: 800px
      :alt: Registration page (Policy set management) 

      Registration page (Policy set management) 

#. | The items found in the Policy set management menu are as following.

   .. list-table:: Registration page Item list (Policy set management) 
      :widths: 2 4 1 1 2
      :header-rows: 1
      :align: left

      * - Item
        - Description
        - Input required
        - Input method
        - Restrictions
      * - Policy set name
        - | Input a name for the Policy set.
          | Policy sets can contain half-width alphanumeric charactesr and the following symbols:  _ - (Underbar and hyphen).
        - ○
        - Manual
        - Maximum 255 bytes
      * - Remarks
        - Free description field
        - ー
        - Manual
        - Maximum length 4000 bytes

.. _terraform_cloud_ep_policyset_policy_link:

Policy set-Policy link
*********************

#. | In the :menuselection:`Terraform Cloud/EP-->Policy set-Policy link` menu, users can maintain (view/register/update/delete discarded) links between Policy sets registered in ":ref:`terraform_cloud_ep_policyset_list`" and Policies registered in ":ref:`terraform_cloud_ep_policy_list`".

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/policyset_policy_link_menu.png
      :width: 800px
      :alt: Submenu (Policy set-Policy link) 

      Submenu (Policy set-Policy link) 

#. | Press the :guilabel:`＋ Register` button to register a Policy set-Policy link.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/policyset_policy_link_register.gif
      :width: 800px
      :alt: Registration page (Policy set-Policy link) 

      Registration page (Policy set-Policy link) 

#. | The items found in the Policy set-Policy link menu are as following.

   .. list-table:: Registration page Item list (Policy set-Policy link) 
      :widths: 2 4 1 1 2
      :header-rows: 1
      :align: left

      * - Item
        - Description
        - Input required
        - Input method
        - Restrictions
      * - Policy set name
        - | Select a Policy set name registered in :ref:`terraform_cloud_ep_policyset_list`.
        - ○
        - List selection
        - ー
      * - Policy name
        - | Select a Policy name registered in :ref:`terraform_cloud_ep_policy_list`.
        - ○
        - List selection
        - ー
      * - Remarks
        - Free description field
        - ー
        - Manual
        - Maximum length 4000 bytes

.. _terraform_cloud_ep_policyset_workspace_link:

PolicySet-Workspace list
***********************

#. | In the :menuselection:`Terraform Cloud/EP-->Policy set-Workspace list` menu, users can maintain (view/register/update/delete discarded) links between Policy sets registered in ":ref:`terraform_cloud_ep_policyset_list`" and Workspaces registered in ":ref:`terraform_cloud_ep_workspace_list`".

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/policyset_workspace_link_menu.png
      :width: 800px
      :alt: Submenu (Policy set-Workspace list) 

      Submenu (Policy set-Workspace list) 

#. | Press the :guilabel:`＋ Register` button to register a Policy set-Policy link.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/policyset_workspace_link_register.gif
      :width: 800px
      :alt: Registration page (Policy set-Workspace list) 

      Registration page (Policy set-Workspace list) 

#. | The items found in the Policy set-Workspace list menu are as following.

   .. list-table:: Registration page Item list (Policy set-Workspace list) 
      :widths: 2 4 1 1 2
      :header-rows: 1
      :align: left

      * - Item
        - Description
        - Input required
        - Input method
        - Restrictions
      * - Policy set name
        - | Select a Policy set name registered in :ref:`terraform_cloud_ep_policyset_list`.
        - ○
        - List selection
        - ー
      * - Workspace name
        - | Select a Workspace name (Linked to an Organization) registered in :ref:`terraform_cloud_ep_workspace_list`.
        - ○
        - List selection
        - ー
      * - Remarks
        - Free description field
        - ー
        - Manual
        - Maximum length 4000 bytes

.. _terraform_cloud_ep_movement_module_link:

Movement-Module link
*******************

#. | In the :menuselection:`Terraform Cloud/EP-->Movement-Module link` menu, users can maintain (view/register/edit/discard) links between Movements registered in :ref:`terraform_cloud_ep_movement_list` and Module files registered in :ref:`terraform_cloud_ep_movement_module_link`.
   | When executing Movements, the linked Module file will be applied
   | Users can link multiple Module files to Movements.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/movement_module_link_menu.png
      :width: 800px
      :alt: Submenu (Movement-Module link) 

      Submenu (Movement-Module link) 

#. | Press the :guilabel:`＋ Register` button in order to register a link for the Movements and Modules.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/movement_module_link_register.gif
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
        - | Select a Movement registered in ":ref:`terraform_cloud_ep_movement_list`".
        - ○
        - List selection
        - ー
      * - Module file
        - | Select a Module file registered in ":ref:`terraform_cloud_ep_module_list`".
        - ○
        - List selection
        - ー
      * - Remarks
        - Free description field
        - ー
        - Manual
        - Maximum length 4000 bytes

.. _terraform_cloud_ep_nested_variable:

Variable nest management
**************

#. | In the :menuselection:`Terraform Cloud/EP-->Variable nest management` menu, if the variable type defined in the tf file is "list" or "set" and the "list", "set," "tuple" or "object" is defined, the user can view and edit the Member variable's maximum number of cycles. 
   | The items in this menu cannot be registered, discarded or restored as BackYard manages the records based on the Module file collection.
   | For more information with examples of Variable nest management, see ":ref:`terraform_nested_example`".

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/nested_variable_list_menu.png
      :width: 800px
      :alt: Submenu (Variable nest management) 

      Submenu (Variable nest management) 

#. | Press the :guilabel:`＋ Edit` button to edit the maximum cycle number.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/nested_variable_list_register.gif
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
        - Displays the variable used by Module file registered in ":ref:`terraform_cloud_ep_module_list`".
        - ー
        - No input
        - ー
      * - Member variable name (CyCloud/EPng) 
        - If the Nest variable list target is a Member variable, the Member variable name will be displayed. The Member variables are displayed concatenating with variables with "." for each stage.
        - ー
        - No input
        - ー
      * - Maximum number of cycles
        - | The maximum amount of cycles for the array can range from 1～1024. Input a number within that range.
          | The limit of maximum number of cycles corresponds to the "MAXIMUM_ITERATION_TERRAFORM-Cloud/EP" setting value in the  "Management console - :ref:`system_setting`". The range is 1～1024.
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
    | ※Initial registrations and repetition updates are not happening in real-time, so it might take a couple of minutes before the variables can be used in ":ref:`terraform_cloud_ep_substitution_value_auto_registration_setting`".

.. _terraform_cloud_ep_substitution_value_auto_registration_setting:

Substitute value auto registration settings
******************

#. | In the :menuselection:`Terraform Cloud/EP-->Substitute value auto registration settings` menu, users can link parameter sheets (with operation) created with the Menu creation tool and Movement variables. 
   | The registered information is displayed in :ref:`terraform_cloud_ep_substitution_value_list`


   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/substitution_value_auto_registration_menu.png
      :width: 800px
      :alt: Submenu (Substitute value auto registration settings) 

      Submenu (Substitute value auto registration settings) 

#. | Press the :guilabel:`＋ Register` button to register Substitute value auto registration settings.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/substitution_value_auto_registration_register.gif
      :width: 800px
      :alt: Registration page (Substitute value auto registration settings) 

     Registration page (Substitute value auto registration settings) 

#. | The items found in the Registration page are as following.

   .. table:: Registration page Item list (Substitute value auto registration settings) 
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
      |                                   | ed in ":ref:`terraform_cloud\|           | on           |                 |
      |                                   | _ep_movement_list`"          |           |              |                 |
      |                                   |                              |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | IaC variable(To)| Movement name:v\|  Displays the variables of \ | ○        | List selecti\| ー              |
      |                 | ariable         | the files registered in" :re\|           | on           |                 |
      |                 |                 | f:`terraform_cloud_ep_moveme\|           |              |                 |
      |                 |                 | nt_module_link`".            |           |              |                 |
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
      |                 |                 | :`terraform_cloud_ep_substit\|           |              | match.          |
      |                 |                 | ution_value_list`" by the in\|           |              |                 |
      |                 |                 | ternal processes, the select\|           |              |                 |
      |                 |                 | ed value will be inherited.  |           |              |                 |
      |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
      |                 | Movement name:v\| Displays the member variabl\ | ※2       | List selecti\| ー              |
      |                 | ariable name:\  | e of the format of the varia\|           | on           |                 |
      |                 | member variable | ble used in the files regist\|           |              |                 |
      |                 |                 | ered in ":ref:`terraform_clo\|           |              |                 |
      |                 |                 | ud_ep_movement_module_link`".|           |              |                 |
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
      |                                   | :`terraform_cloud_ep_interfa\|           |              |                 |
      |                                   | ce_information`" will be u\  |           |              |                 |
      |                                   | sed.                         |           |              |                 |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
      | Remarks                           | Free description field       | ー        | Manual       | Maximum length \|
      |                                   |                              |           |              | 4000 bytes      |
      +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+

| ※1:Only required if the Parammeter sheet has Bundles active.
| ※2:Required if the selected "Movement name:Variable name" has a member variable and if the HCL settings are set to "False".
| ※3:Only required if the selected "Movement name:Variable name" and "Movement name:Variable name:Member variable" is a format that requires a substitute order.

.. note:: | **For Parameter sheets with bundles**
   | In order to link Movement variables with Parameter sheets with bundles, the user must input a substitute order for the Parameter sheet (From) in :menuselection:`Terraform Cloud/EP-->Substitute value auto registration settings`
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


.. _terraform_cloud_ep_execution:

Execute
********

| In the :menuselection:`Terraform Cloud/EP-->Execute` menu, users can execute operations.
| Select a Movement and Operation from the Movement list and Operation list and press the :guilabel:`Execute` button to move to the :ref:`terraform_cloud_ep_check_operation_status` where the execution will be processed.

.. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/execution_menu.gif
   :width: 800px
   :alt: Submenu (Execute) 

   Submenu (Execute) 

#. | **Specify reservation date**
   | By inputting a "Reservation date", the user can book executions and plan checks.
   | Only future dates can be specified.

#. | **Specify Movement**
   | Select a Movement registered in ":ref:`terraform_cloud_ep_movement_list`".

#. | **Specify Operation**
   | Select an Operation registered in ":ref:`terraform_cloud_ep_operation_list`".

#. | **Execute**
   | Press the Execute button to move to the "5.2.10 Execution status confirmation" menu where the execution processed will start.
   | Terraform Apply will automatically be executed after Terraform Plan ends.

#. | **Confirm Plan**
   | Click the "Check Plan" button operates similarly as the "Execute" button as it start the execution process. However, it will only execute, and not Terraform Apply.

#. | **Confirm parameters**
   | Click the "Check parameters" button allows users to check the input parameter values. Neither Terraform Plan nor Terraform Apply will be executed.

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

.. _terraform_cloud_ep_check_operation_status:

Check operation status
************

| In the :menuselection:`Terraform Cloud/EP-->Check operation status` menu, users can monitor execution statuses.

.. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/operation_status_menu.png
   :width: 800px
   :alt: Submenu (Check operation status) 

   Submenu (Check operation status) 


#. | **Execution status display**
   | The status matching the Execution status is displayed.
   | The execution log and error log also displays detailed information regarding the execution status.
   |  If the "Execution type" is set to "Check Plan", "Check Plan" will be displayed. If it is set to delete workspace resources (Executed from ":ref:`terraform_cloud_ep_workspace_list`".), it will display "Delete resource". For everything else, "Standard".

   | If the status ends in an unexpected error, and error log will be displayed in the message if there is something wrong with the registration in the ":ref:`terraform_cloud_ep_interface_information`" or other web contents.
   | For other errors, no message will be displayed in the error log. For those cases, the error information will be displayed in the application log. 

   |  "Call Conductor" displays which Conductor was executed. This field will be blank if directly executed from Terraform Cloud/EP driver.
   |  "Execution user" displays the user that was logged in when the "Execute" button was pressed.
   | The "RUN-ID" displayed in the "Terraform use information" is an ID used to manage executions from the Terraform side. It is used for the internal Terraform link process.
   | ※ If "Execution type" is set to "Delete resources", the following items will not be configured.
   

   - Called Conductor
   - Movement
   - Operation
   - Input data

#. | **Check substitute value**
   | Press the :guilabel:`Check Susbtitute` button to display  ":ref:`terraform_cloud_ep_substitution_value_list`" where the Substitute values narrowed down to the target Operation and Movements are displayed.

#. | **Emergency stop/Delete reservation**
   | Users can press the :guilabel:`Emergency stop` button to stop the operation.
   | If the status was "Reserved execution", the :guilabel:`Delete reservation` button will be displayed. Check the :guilabel:`Delete reservation` button to delete the reservation

#. | **Display execution log**
   | The log file names displayed in the execution log's pulldown menu are as following.
   | plan.log: Terraform Plan execution log
   | policyCheck.log: Terraform Policy Check execution log
   | apply.log: Terraform Apply execution log

#. | **Search log**
   | Users can filter information to narrow down information in the execution log and the error log.
   | Input the string the user wants to search for and tick the "Corresponding lines only" checkbox to view only the lines corresponding to the string.
   | The refresh interval and maximum display lines can be configured by changing the "Status monitoring cycle item" and "Progress status display lines" items in the ":ref:`terraform_cloud_ep_interface_information`" menu.


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
        - | Stores all input Module files within a zip file.
      * - ー
        - |  (Input Policy file name) 
        - | Stores all Module files within a zip file.
      * - variables
        - | variables.json
        - | File that contains the configured substitute value's "Variable name(key)", "Specific value (value)", "HCL settings" and "Sensitive settings" settings value in JSON format.
          | The specific values will be NULL if the Sensitive settings are set to ON (true).

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
        - | plan.log
        - | Log file that contains the contents output to the progress log(plan.log).
      * - ー
        - | policyCheck.log
        - | Log file that contains the contents output to the execution log(policyCheck.log).
      * - ー
        - | apply.log
        - | Log file that contains the contents output to the progress log(apply.log).
      * - ー
        - | error.log
        - | Log file that contains the contents output to the progress (apply.log).
      * - ー
        - | sv-XXXXXX.tfstate
        - | State file generated by Terraform. The file name is also generated by Terraform, meaning that the name is different for every execution.
          | The file is saved in an encoded state.

.. _terraform_cloud_ep_execution_list:

Execution management
********

#. | In the :menuselection:`Terraform Cloud/EP-->Execution management` menu, the user can view execution histories.
   | Specify search conditions and press the :guilabel:`Filter` button to view a table of executions.
   | Pressing the :guilabel:`Details` button moves the user to :ref:`terraform_cloud_ep_check_operation_status` where they can view detailed information regarding the execution status.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/execution_list_menu.png
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
      | Details                           | Press this button to move to the ":ref:`terraform_cloud_ep_check_operatio\|
      |                                   | n_status`" menu where users can see more detailed information.            |
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

.. _terraform_cloud_ep_substitution_value_list:

Susbtitute value management
**********

#. | In the :menuselection:`Terraform Cloud/EP-->Susbtitute value management` menu, userse can view the specific value that substitues the variables in the Module files used by the Movement linked to the Operaration.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/substitution_value_list_menu.png
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
      |                                   | `terraform_cloud_ep_substitution_value_auto_registration_setting`".       |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | HCL settings                      | Displays whether the HCL settings configured in ":ref:`terraform_cloud_ep\|
      |                                   | _substitution_value_auto_registration_setting`" are set to False or True\ |
      |                                   | . Variables with hierarchies containing member variables and substitute o\|
      |                                   | rder are set to "True".                                                   |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Movement name:Member name:Mem\    |  Displays the Member variable attached to the Movement selected in ":ref\ |
      | ber variable                      | :`terraform_cloud_ep_substitution_value_auto_registration_setting`".      |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Susbtitute order                  |  Displays the substitute order of the Member variable or Variable name at\|
      |                                   | tached to the Movement selected in ":ref:`terraform_cloud_ep_substitution\|
      |                                   | _value_auto_registration_setting`".                                       |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Specific value  | Sensitive setti\|  Displays either "True" or "False".                                       |
      |                 | ngs             |                                                                           |
      |                 |                 |  If "True", the data will not be stored in the input data fetched from \  |
      |                 |                 | ":ref:`terraform_cloud_ep_check_operation_status`".                       |
      +                 +--------+--------+---------------------------------------------------------------------------+
      |                 | Value           | Displays the Specific value of the variable used by the Operation/Move\   |
      |                 |                 | ment.                                                                     |
      |                 |                 |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Remarks                           | Free description field                                                    |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+

.. _terraform_cloud_ep_linked_terraform_management:

Link Terrraform management
********************

#. | In the :menuselection:`Terraform Cloud/EP-->Link Terraform management` menu, users can use the information registered to the :ref:`terraform_cloud_ep_interface_information` to connect to Terraform and view Organizations, Workspaces, Policies and Policy sets registered to said Terraform.
   | Users can also delete targets registered to ITA from Terraform.
   | Users can also delete managed and configured resources per Workspace.
   | It is also possible to delete Links between Policy sets, Workspaces and Policies.
   | ※The actions performed on this page will have no effect on the registration targets on the ITA side.

   .. figure:: /images/ja/terraform_cloud_ep_driver/operation_method_explanation/linked_terraform_management.gif
      :width: 800px
      :alt: Submenu (Link Terraform management) 

      Submenu (Link Terraform management) 

#. | The items list displayed in the fetched lists are as following.

   .. list-table:: Item list (Organization registration managenet) 
      :widths: 2 8
      :header-rows: 1
      :align: left

      * - Item
        - Description
      * - Organization Name
        - Name of the Organization registered to Terraform.
      * - Email address
        - E-mail address registered to the Organization.
      * - ITA registration status
        - If the target Organization Name is registered to ":ref:`terraform_cloud_ep_organization_list`", the status will display "Registered". If not, it will display "Not registered".
      * - Delete
        - | Clicking this button will display a dialog box asking if the user really wants to delete the data. Click "OK" to delete the Organization from the linked Terraform.
          | ※Deleted Organizations cannot be restored.

   .. list-table:: Item list (Workspace registration management) 
      :widths: 2 8
      :header-rows: 1
      :align: left

      * - Item
        - Description
      * - Organization Name
        - Name of Organization linked to the target Workspace.
      * - Workspace Name
        - Name of the Workspace registered to Terraform.
      * - ITA registration status
        - If the target Organization name is registered to ":ref:`terraform_cloud_ep_workspace_list`", the status will display "Registered". If not, it will display "Not registered".
      * - Delete resoruces
        - | Clicking this button will display a dialog box asking if the user really wants to delete the data. Clicking OK will move the user to ":ref:`terraform_cloud_ep_check_operation_status`" where the Workspace resources will be deleted.。
          | ※Deleted resources cannot be restored.
      * - Delete
        - |  Clicking this button will display a dialog box asking if the user really wants to delete the data. Clicking OK will delete the Workspace link from Terraform.
          | ※Deleting the Workspace will make the user unable to dete the resources. Deleted Workspaces cannot be restored.

   .. list-table:: Item list (Policy registration management) 
      :widths: 2 8
      :header-rows: 1
      :align: left

      * - Item
        - Description
      * - Organization Name
        - Name of the Organization linked to the target Policy.
      * - Policy Name
        - Name of Policy registered to the Terraform.
      * - ITA registration status
        - If the target Policy Name is registered to ":ref:`terraform_cloud_ep_policy_list`", the status will display "Registered". If not, it will display "Not registered".
      * - Download Policy Code
        - Clicking this button will download the target Policy's Policy code.
      * - Delete
        - | Clicking this button will display a dialog box asking if the user really wants to delete the data. Clicking OK will delete the Policy from Terraform.
          | ※Deleted Policies cannot be restored.

   .. table:: Item list (PolicySet registration management) 
      :widths: 1 1 1 7
      :align: left

      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | **Item**                          | **Description**                                                           |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +=================+========+========+===========================================================================+
      | Organization Name                 | Name of the Organization linked to the taret Policy set.                  |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Policy Set Name                   | Name of the target Policy set.                                            |
      |                                   |                                                                           |
      |                                   |                                                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Link Workspace  | Workspace Name  | Name of the Workspace linked to the target Policy set.                    |
      |                 |                 |                                                                           |
      |                 |                 |                                                                           |
      +                 +--------+--------+---------------------------------------------------------------------------+
      |                 | ITA registratio\| If the target Policy Name is registered to ":ref:`terraform_cloud_ep_poli\|
      |                 | n status        | cyset_workspace_link`", the status will display "Registered". If not, it \|
      |                 |                 | will display "Not registered".「:ref:`terraform_cloud_ep_policy.          |
      +                 +--------+--------+---------------------------------------------------------------------------+
      |                 | Delete link     | Clicking this button will display a dialog box asking if the user really \|
      |                 |                 | wants to delete the data. Clicking OK will delete the link between the T\ |
      |                 |                 | arget Policy set and Workspace.                                           |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Link Policy     | Policy Name     | Name of the Policy linked to the target Policy set.                       |
      |                 |                 |                                                                           |
      |                 |                 |                                                                           |
      +                 +--------+--------+---------------------------------------------------------------------------+
      |                 | ITA registratio\| If the target Policy Set name and Policy Name is registered to ":ref:`ter\|
      |                 | n status        | raform_cloud_ep_policyset_policy_link`", the status will display "Registe\|
      |                 |                 | red". If not, it will display "Not registered".                           |
      +                 +--------+--------+---------------------------------------------------------------------------+
      |                 | Dlete link      | Clicking this button will display a dialog box asking if the user really \|
      |                 |                 | wants to delete the data. Clicking OK will delete the link between the ta\|
      |                 |                 | rget Policy set and Policy.                                               |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | ITA registration status           | If the target Policy Set Name is registered to ":ref:`terraform_cloud_ep_\|
      |                                   | policyset_list`" the status will display "Registered". If not, it will d\ |
      |                                   | isplay "Not registered".                                                  |
      +-----------------+--------+--------+---------------------------------------------------------------------------+
      | Delete                            | Clicking this button will display a dialog box asking if the user really \|
      |                                   | wants to delete the data. Clicking OK will delete the target Policy set f\|
      |                                   | rom the Linked Terraform.                                                 |
      |                                   | ※Deleted Policy sets cannot be restored.                                 |
      +-----------------+--------+--------+---------------------------------------------------------------------------+



