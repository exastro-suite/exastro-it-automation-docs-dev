==================
Ansible-LegacyRole
==================

Introduction
========

| This document aims to explain how to use Ansible-LegacyRole.

Ansible-LegacyRole overview
======================

| Similar to the Legacy mode, this mode uses the standard Ansible functions to input settings to the different hosts.
| Register structure code as packages and configure job patterns and roles.
| Use Role packages provided by other departments to install the products and construct environments.

Ansible-LegacyRole Menu structure
===============================

| This section explains the Ansible-LegacyRole menu structure

Menu
-----------------

1. | **Basic console menus**

| The basic console menus used by Ansible-Legacy are as following.

.. include:: ../../include/ansible_option_basic-console-menu.rst

|

2. | **Ansible common menus**

.. include:: ../../include/ansible_option_ansible-common-console-menu.rst

   .. note::
      | ※1 Hidden menus are internal functions used to register and edit data.
      | There are some hidden menus configured when the Ansible-Legacy driver function is installed.
      | In order to display hidden menus, go to the :menuselection:`Management console-->Role/Menu link management` menu and restore the desired menus. For more information, see :doc:`../it_automation_base/management_console`.

|

3. | **Ansible-LegacyRole menus**

| The Ansible-LegacyRole menus are as following.

.. list-table::  Ansible-LegacyRole menu list
   :header-rows: 1
   :align: left

   * - No
     - Menu
     - Description
   * - 1
     - Movement list
     - Manages Movements
   * - 2
     - Role package management
     - Manages Role packages
   * - 3
     - Movement-Role link
     - Manages links between Role packages and Movements.
   * - 4
     - Variable nest management
     - Manages the maximum amount of array repetitions if the multistage variables are in a repeating array.
   * - 5
     - Substitute value auto registration settings
     - Manages movements and variables that link items and values for each operation registered in the parameter sheet menu.
   * - 6
     - Execute
     - Executes selected Movements and Operations.
   * - 7
     - Execution management
     - Managed execution history.
   * - 8
     - Check operation status
     - Displays the status of executions.
   * - 9
     - Target host
     - Manages target hosts.
   * - 10
     - Substitute value management
     - Manages variable substitute values.
   * - 11
     - Role name management （※1）
     - Allows users to see links between Role packages and Role names registered in the role package file uploaded to the Role package management menu.
   * - 12
     - Movement-variable link  (※1) 
     - Manages links between Movements and variables.
   * - 13
     - Multistage variable member management （※1）
     - Manages the structure of multistage variables defined in the ITA readmefile and the default variable definition file within the role package file uploaded to the Role package management menu.
   * - 14
     - Multistage variable array combination management （※1）
     - Manages Multistage variable array combinations defined in the ITA readmefile and the default variable definition file within the role package file uploaded to the Role package management menu.

   .. tip::
      | ※1 Hidden menus are internal functions used to register and edit data.
      | There are some hidden menus configured when the Ansible-Legacy driver function is installed.
      | In order to display hidden menus, go to the :menuselection:`Management console-->Role/Menu link management` menu and restore the desired menus. For more information, see :doc:`../it_automation_base/management_console`.


Ansible-LegacyRole procedure
==========================

| This section explains how to use Ansible-LegacyRole

Ansible-LegacyRole workflow
------------------------------

| A standard workflow using Ansible-LegacyRole can be seen below.

-  **Workflow details and references**

   #. | **Register connection information for the target**
      | From the :menuselection:`Ansible common --> Device list` menu, register connection information for the target.
      | For more information, see :ref:`ansible_common_device_list`.

   #. | **Register operation name**
      | From the :menuselection:`Basic console --> Operation list` menu, register an Operation list.
      | For more information, see :ref:`basic_console_operation`.

   #. | **Register Ansible Automation Controller host information (if needed) **
      | From the :menuselection:`Ansible common --> Ansible Automation Controller host list` menu, Register information for the Ansible Automation Controller host.
      | For more information, see :ref:`ansible_common_ansible_automation_controller_hosts`.

   #. | **Register Interface information**
      | From the :menuselection:`Ansible common --> Interface information` menu, select either Ansible Core or Ansible Automation Controller for the execution engine and register connection information for the execution engine server
      | For more information, see :ref:`ansible_common_interface_information`.

   #. | **Register Movement**
      | From the :menuselection:`Ansible-Legacy --> Movement list` menu, register a Movement.
      | For more information, see :ref:`ansible_legacy_movement_list`.

   #. | **Register Role package**
      | From the :menuselection:`Ansible-LegacyRole --> Role package management` menu, register a Role package.
      | For more information, see :ref:`ansible_legacyrole_role_package_list`.

   #. | **Register Global variables (if needed) **
      | From the :menuselection:`Ansible common --> Global value management` menu, register global variables to be used in the Playbook.
      | For more information, see :ref:`ansible_common_global_variable_list`.

   #. | **Register Template files (if needed) **
      | From the :menuselection:`Ansible common --> Template management` menu, register template files and template embedded variables to be used in the Playbooks.
      | For more information, see :ref:`ansible_common_template_list`.

   #. | **Register File material (if needed) **
      | From the :menuselection:`Ansible common --> File management` menu, register file materials and file embedded variables to be used in the Playbooks.
      | For more information, see :ref:`ansible_common_file_list`.

   #. | **Register Unmanaged variables (if needed) **
      | From the :menuselection:`Ansible common --> Unmanaged target variable list` menu, register extracted variables which will not be displayed in :menuselection:`Ansible-Legacy --> Substitute value auto registration`'s :menuselection:`Movement name:Variable name`.
      | For more information, see :ref:`ansible_common_unmanaged_var_list`.

   #. | **Register Role package to Movement**
      | From the :menuselection:`Ansible-LegacyRole --> Movement-Role link` menu, register a link between the registered Movement and the Role package.
      | For more information, see :ref:`ansible_legacyrole_movement_details`.

   #. | **Register Multistage variable maximum repetitions(if needed）**
      | From the :menuselection:`Ansible-LegacyRole --> Variable nest management` register maximum repetitions for the Member variable array defined in the Multistage variable arrays.
      | For more information, see :ref:`ansible_legacyrole_nested_variable_list`.

   #. | **Create parameter sheet**
      | From the :menuselection:`Create/Define parameter sheets` menu, create a Parameter sheet which will have data registered to it that can configure settings for the target.
      | For more information, see :doc:`../create_param/menu_creation`.

   #. | **Register data to Parameter sheet**
      | Register data to the parameter sheet created in the previous step.
      | For more information, see :doc:`../create_param/menu_creation`.

   #. | **Substitute value auto registration settings**
      | From the :menuselection:`Ansible-LegacyRole --> Substitute value auto registration settings` menu, link the Movement variables with the Parameter sheet's item's setting values.
      | For more information, see :ref:`ansible_legacyrole_substitution_value_auto_registration_setting`.

   #. | **Execute**
      | From the :menuselection:`Ansible-LegacyRole --> Execute` menu, select the desired Movement and Operation and execute them.
      | For more information, see :ref:`ansible_legacyrole_execution`.

   #. | **Confirm execution status**
      | From the :menuselection:`Ansible-LegacyRole --> Confirm execution status` menu,the status of all previously executed operations will be updated in realtime. Users can also monitor error logs and execution logs as well as stop them with an emergency stop.
      | For more information, see :ref:`ansible_legacyrole_check_operation_status`.

   #. | **Confirm execution history**
      | From the :menuselection:`Ansible-LegacyRole --> Execution management` menu, users can check the history of all previously executed operations..
      | For more information, see :ref:`ansible_legacyrole_execution_list`.


Ansible-LegacyRole menu operation
=======================================

| This section explains how to operate the Ansible-Legacyrole menus.


Basic console
--------------

| For more information regarding Basic console menu, see  :doc:`../it_automation_base/basic_console` 


Ansible common
-----------

| For more information regarding Ansible common menus, see :doc:`./ansible_common`


Ansible-LegacyRole
--------------

| This section explains how to operate the Ansible-LegacyRole menus.

.. _ansible_legacyrole_movement_list:

Movement list
~~~~~~~~~~~~

#. | Maintains (view.register/edit/discard) Movement information.

   .. figure:: /images/ja/ansible-legacyrole/movement_list/movement_list.png
      :width: 800px
      :alt: Submenu (Movement list) 

      Submenu (Movement list) 

#. | Press the :guilabel:`Register` button to register Movement information.

   .. figure:: /images/ja/ansible-legacyrole/movement_list/registration_movement_list.gif
      :width: 800px
      :alt: Registration page (Movement list) 

      Registration page (Movement list) 


#. | The items found in the registration page are as following.

   .. table:: Registration page item list (Movement list) 
      :align: left

      +-----------------------------------+-------------------------------------------------------------------------+-----------+--------------+-------------------+
      | Item                              | Description                                                             | Input \   | Input method | Restrictions      |
      |                                   |                                                                         | required  |              |                   |
      |                                   |                                                                         |           |              |                   |
      +===================================+=========================================================================+===========+==============+===================+
      | MovementID                        | Displays an automatically numbered string of 36 characters.             | ー        | Automatic    | ー                |
      +-----------------------------------+-------------------------------------------------------------------------+-----------+--------------+-------------------+
      | Movement name                     | Display a name for the Movement.                                        | ○        | Manual       | Maximum leng\     |
      |                                   |                                                                         |           |              | th 255 bytes      |
      +-----------------------------------+-------------------------------------------------------------------------+-----------+--------------+-------------------+
      | Delay timer                       | Enter the specified period (1~) in order for the status to display a w\ | ー        | Manual       | 0～2,147,483,647  |
      |                                   | arning when the Movement is delayed for the specified period. \         |           |              |                   |
      |                                   | (Unit: minutes)                                                         |           |              |                   |
      |                                   |                                                                         |           |              |                   |
      |                                   | No warning will be dispalyed if nothing is entered.                     |           |              |                   |
      +-----------------+-----------------+-------------------------------------------------------------------------+-----------+--------------+-------------------+
      | Ansible use \   | Host specifi\   | Select "Host name" in order to specify a host without using IP address. | ○        | List select\ | Same as desc\     |
      | information     | cation format   |                                                                         |           | ion          | ription.          |
      |                 |                 |                                                                         |           |              |                   |
      |                 +-----------------+-------------------------------------------------------------------------+-----------+--------------+-------------------+
      |                 | WinRM connection| Select "True" if the execution target is a Windows server.\             | ー        | List select\ | Same as desc\     |
      |                 |                 |                                                                         |           | ion          | ription.          |
      |                 +-----------------+-------------------------------------------------------------------------+-----------+--------------+-------------------+
      |                 | Header section\ | Edit the parent Playbook automatically generated by ITA from the begi\  | ー        | Manual       | Maximum leng\     |
      |                 |  ※1            | nning to the tasks or roles section.                                    |           |              | th 4000 bytes     |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 | The following will be applied if the column is not entered.             |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 | .. code-block:: yaml                                                    |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 |    - hosts: all                                                         |           |              |                   |
      |                 |                 |      remote_user: "{{ __loginuser__ }}"                                 |           |              |                   |
      |                 |                 |      gather_facts: no                                                   |           |              |                   |
      |                 |                 |      become: yes                                                        |           |              |                   |
      |                 |                 |      # If using winrm connection, become: yes is not applied.           |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 | The different parameter values can be described with Variables.         |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 | .. code-block:: yaml                                                    |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 |     become_user: '{{△vvv△}}'                                          |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 |     △：Half-width space                                                |           |              |                   |
      |                 |                 |     ':Must be enclosed in single or double quotations.                  |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 | For more information regarding writing parameter values with variable\  |           |              |                   |
      |                 |                 |  s, see":ref:`ansible_common_option_var_listup`.                        |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 | The Variable's  Specific value are registered from  :menuselection:`A\  |           |              |                   |
      |                 |                 | nsible-Legacy -->  Substitute value auto registration settings`.        |           |              |                   |
      |                 +-----------------+-------------------------------------------------------------------------+-----------+--------------+-------------------+
      |                 | Option p\       | Enter Movement fixed option parameters.                                 | ー        | Manual       | Maximum len\      |
      |                 | arameter        |                                                                         |           |              | gth 4000 bytes    |
      |                 |                 | For more inforamtion regarding option parameteres, see\                 |           |              |                   |
      |                 |                 | ":ref:`ansible_common_option_parameter_list`"\                          |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 | + | If the :menuselection:`Ansible common --> Interface information`'s\ |           |              |                   |
      |                 |                 |       :menuselection:`Execution engine` is \                            |           |              |                   |
      |                 |                 |     "Ansible Core"                                                      |           |              |                   |
      |                 |                 |   | Input the ansible-playbook command's option parameter.\             |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 | + | If the :menuselection:`Execution engine` is\                        |           |              |                   |
      |                 |                 |     "Ansible Automation Controller",                                    |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 |   | Input Job template's parameter.                                     |           |              |                   |
      |                 |                 |   | For more information regarding job tempaltes, see th\               |           |              |                   |
      |                 |                 |      e official Ansible Automation Controller manuals\                  |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 | Movement fixed option parameters are input from\                        |           |              |                   |
      |                 |                 |  :menuselection:`Ansible common --> Interface information`'s'\          |           |              |                   |
      |                 |                 | :menuselection:`Operation parameter`.                                   |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 +-----------------+-------------------------------------------------------------------------+-----------+--------------+-------------------+
      |                 | ansible.cfg     | Upload the ansible.cfg file that will be used when executed.            | ー        | File\        | Maximum size\     |
      |                 |                 |                                                                         |           | election     | 100 mb            |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 | If nothing is uplaoded, the default will be used.                       |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 |                 |                                                                         |           |              |                   |
      |                 +--------+--------+-------------------------------------------------------------------------+-----------+--------------+-------------------+
      |                 | Ansibl\| Execu\ | Displays the execution environments created by the Ansible A\           | ー        | List sel\    | Same as desc\     |
      |                 | e Auto\| tion e\| utomation Controller.                                                   |           | ection       | ription.          |
      |                 | matio\ | nviro\ |                                                                         |           |              |                   |
      |                 | n Cont\| nment\ | Select the execution environment that will be used.                     |           |              |                   |
      |                 | roller\| ※2    |                                                                         |           |              |                   |
      |                 | use in\|        | If nothing is selected, the default execution value configure\          |           |              |                   |
      |                 | format\|        | d to Ansible Automation Controller will be used.                        |           |              |                   |
      |                 | ion    |        |                                                                         |           |              |                   |
      +-----------------+--------+--------+-------------------------------------------------------------------------+-----------+--------------+-------------------+
      | Remarks                           | Free description field                                                  | ー        | Manual       | Maximum length    |
      |                                   |                                                                         |           |              | \4000 bytes       |
      +-----------------------------------+-------------------------------------------------------------------------+-----------+--------------+-------------------+

   .. tip:: | ※1 If the has "become: yes" configured.
       | The following settings must be configured to the target.
       | Login user must have sudo permission NOPASSWD configured to :file:`/etc/sudoers` with NOPASSWD.
       | 
       | 　　　**Demo_user ALL=(ALL) NOPASSWD:ALL**

   .. tip:: | ※2  Select from data fetched from :ref:`ansible_common_aac_sync`.

   .. warning:: | If :menuselection:`WinRM connection` is set to "True", the connecting hosts will be all Windows servers..


.. _ansible_legacyrole_role_package_list:

Role package management console
~~~~~~~~~~~~~~~~~~~~

#. | Maintains (view/register/edit/discard) Role package files .
   | Make sure to register a directory with a hierarchy that has "roles" compressed in a ZIP file. For more information regarding Role package directories, see :ref:`ansible_legacyrole_write_role_package_ansible_legacy_role` .

   .. figure:: /images/ja/ansible-legacyrole/role_packeage_management/role_package_list_v2-4.png
      :width: 800px
      :alt: Submenu（Role package management）

      Submenu（Role package management）

#. | Press the :guilabel:`Register` to register Role packages.

   .. figure:: /images/ja/ansible-legacyrole/role_packeage_management/registration_role_package_list_v2-4.gif
      :width: 800px
      :alt: Registration page （Role package management）

      Registration page （Role package management）


#. | The items found in the registration page are as following.

   .. table:: Registration page Item list（Role package management）
      :align: left

      +-----------------------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | Item                              | Description                                                                         | Input \   | Input \      | Restrictions           |
      |                                   |                                                                                     | required  | method       |                        |
      |                                   |                                                                                     |           |              |                        |
      +===================================+=====================================================================================+===========+==============+========================+
      | Item number                       | Displays an automatically numbered string of 36 characters.                         | －        | Automatic    | －                     |
      +-----------------------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | Role package name                 | Input a name for the Role package.                                                  | ○        | Manual       | Maximum length \       |
      |                                   |                                                                                     |           |              | 255 bytes              |
      +-----------------------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | Role package file                 | Upload a Role package file (zip format).                                            | ○        | File \       | Maximum size 100mb     |
      |                                   |                                                                                     |           | selection    |                        |
      |                                   | The Playbook file within the Role package must be created with Character co\        |           |              |                        |
      |                                   | de UTF-8 without BOM.                                                               |           |              |                        |
      +------------+----------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | Target     | Linux                | If the Playbook can be used by Linux, select "＊".                                  | －        | List \       | Same as description.   |
      |            |                      |                                                                                     |           | selection    |                        |
      |            |                      | Leaving this item blank will not have any effect on the execution.                  |           |              |                        |
      |            +----------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      |            | Windows              | If the Playbook can be used by Windows, select  "＊".                               | －        | List \       | Same as description.   |
      |            |                      |                                                                                     |           |selection     |                        |
      |            |                      | Leaving this item blank will not have any effect on the execution.                  |           |              |                        |
      |            +----------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      |            | Other                | If the Playbook is meant for OS other than Linux and Windows, select the Play\      | －        | Manual       | Maximum length \       |
      |            |                      | book application.                                                                   |           |              | 4000 bytes             |
      +------------+----------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | Python required                   | If the target device requires Ptyhon, select "＊".                                  | －        | List \       | Same as description.   |
      |                                   |                                                                                     |           | selection    |                        |
      |                                   | Leaving this item blank will not have any effect on the execution.                  |           |              |                        |
      +-----------------------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | Description                       | Input a description for the Playbook (Japanese)                                     | ー        | Manual       | Maximum length \       |
      |                                   |                                                                                     |           |              | 4000 bytes             |
      +-----------------------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | Description(en)                   | Input a description for the Playbook (English)                                      | ー        | Manual       | Maximum length \       |
      |                                   |                                                                                     |           |              | 4000 bytes             |
      +-----------------------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | Remarks                           | Free description field                                                              | ー        | Manual       | Maximum length \       |
      |                                   |                                                                                     |           |              | 4000 bytes             |
      +-----------------------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+


.. warning:: | **When variables defined within Playbooks are extracted**
   | The variables defined within Playbooks files are extracted by internal processes.The variables can have specific values registered to them in :ref:`ansible_legacyrole_substitution_value_auto_registration_setting` 
   | The variables are not extracted in realtime, meaning that it may take time before they can be used in :ref:`ansible_legacyrole_substitution_value_auto_registration_setting` .

.. warning:: | Unique variable names in Movements
   | In Ansible-LegacyRole, the variable names extracted from files must be unique for each Movement.
   | If there are multiple variable names used for roles within the same role package and the variable structure is different, an error will occur whe nregistered to :menuselection:`Ansible-LegacyRole --> Role package management`.
   | Specificaly, if the structure for normal variable and multistage variable (or the structure between different multistage variables) are different, an error will occur if the same variable name is used. 
   | This does not apply if the user is using different role packages.
   |
   | Examples for the Specific values are as following.

   | e.g.)

   .. table:: Specific value
      :align: left

      +--------------+------------------------+--------------+--------------------------------------------------------------------------+-----------+------------------------------------------------------------------+
      | No.          | Role package           | Role         | defaults/main.yml                                                        | Works     | Pattern                                                          |
      |              |                        |              |                                                                          |           |                                                                  |
      |              |                        |              |                                                                          |           |                                                                  |
      +==============+========================+==============+==========================================================================+===========+==================================================================+
      | 1            | package_A              | role1        | | VAR_SAMPLE:                                                            | 〇        | | ・Same as Variable name                                        |
      |              |                        |              |                                                                          |           | | ・Same as Multistage variable's Member variable definition     |
      |              |                        |              | |  - { VAR_001: "aaaa" , \VAR_002:\ "bbbb" }                             |           | | ・Member variable order is different.                          |
      |              |                        |              |                                                                          |           |                                                                  |
      |              |                        +--------------+--------------------------------------------------------------------------+           |                                                                  |
      |              |                        | role2        | | VAR_SAMPLE:                                                            |           |                                                                  |
      |              |                        |              |                                                                          |           |                                                                  |
      |              |                        |              | |  - { VAR_002: "bbbb" , \VAR_001:\ "aaaa" }                             |           |                                                                  |
      |              |                        |              |                                                                          |           |                                                                  |
      +--------------+------------------------+--------------+--------------------------------------------------------------------------+-----------+------------------------------------------------------------------+
      | 2            | package_A              | role1        | | VAR_SAMPLE:                                                            | ×        | | ・Same as Variable name                                        |
      |              |                        |              |                                                                          |           | | ・Multistage variable member variable definition is different  |
      |              |                        |              | |  - { VAR_001: "aaaa" , \VAR_002:\ "bbbb" }                             |           |                                                                  |
      |              |                        |              |                                                                          |           |                                                                  |
      |              |                        +--------------+--------------------------------------------------------------------------+           |                                                                  |
      |              |                        | role2        | | VAR_SAMPLE:                                                            |           |                                                                  |
      |              |                        |              |                                                                          |           |                                                                  |
      |              |                        |              | |  - { VAR_003: "aaaa" , \VAR_004:\ "bbbb" }                             |           |                                                                  |
      |              |                        |              |                                                                          |           |                                                                  |
      +--------------+------------------------+--------------+--------------------------------------------------------------------------+-----------+------------------------------------------------------------------+
      |3             | package_A              | role1        | | VAR_SAMPLE:                                                            | ×        | | ・Same as Variable name                                        |
      |              |                        |              |                                                                          |           | | ・Both Normal and Multstiage variables exists                  |
      |              |                        |              | |  - { VAR_001: "aaaa" , \VAR_002:\ "bbbb" }                             |           |                                                                  |
      |              |                        |              |                                                                          |           |                                                                  |
      |              |                        +--------------+--------------------------------------------------------------------------+           |                                                                  |
      |              |                        | role2        | | VAR_SAMPLE: aaaa                                                       |           |                                                                  |
      |              |                        |              |                                                                          |           |                                                                  |
      |              |                        |              |                                                                          |           |                                                                  |
      |              |                        |              |                                                                          |           |                                                                  |
      +--------------+------------------------+--------------+--------------------------------------------------------------------------+-----------+------------------------------------------------------------------+


.. _ansible_legacyrole_movement_details:

Movement-Role link
~~~~~~~~~~~~~~~~~~~

#. | Maintain (view/register/edit/discard) links between Role packages and Movements.

   .. figure:: /images/ja/ansible-legacyrole/movement_role/movement_role.png
      :width: 800px
      :alt: Submenu（Movement-Role link）

      Submenu（Movement-Role link）

#. | Press the :guilabel:`Register` to register the Role package that will be included in the Movement.

   .. figure:: /images/ja/ansible-legacyrole/movement_role/registration_movement_role.gif
      :width: 800px
      :alt: Registration page （Movement-Role link）

      Registration page （Movement-Role link）

#. | The items found in the registration page are as following.

   .. list-table:: Registration page Item list（Movement-Role link）
      :widths: 30 120 30 30 30
      :header-rows: 1
      :align: left

      * - Item
        - Description
        - Input required
        - Input method
        - Restrictions
      * - Item number
        - | Displays an automatically numbered string of 36 characters.
        - ー
        - Automatic
        - ー
      * - Movement
        - | Displays :menuselection:`Movement name` registered in the :menuselection:`Ansible-LegacyRole --> Movement list` menu.
          | Select a Movement
        - 〇
        - List selection
        - ー
      * - Role package:Role name
        - | Displays Role names included in the :menuselection:`Role package file （ZIP format）` registered in :menuselection:`Ansible-LegacyRole --> Role package management`.
          | Select the Role package role that will be included in the Movement.
          | It is not possible to register multiple role packages to a single Movement.
        - 〇
        - List selection
        - ー
      * - Include order
        - | Input the order in which the role will be executed （1～）.
          | The input include order executes the Roles in rising order.
        - 〇
        - Manual
        - 1～2,147,483,647
      * - Remarks
        - Free description field
        - ー
        - Manual
        - Maximum length 4000 bytes


.. _ansible_legacyrole_nested_variable_list:

Variable nest management
~~~~~~~~~~~~~~

#. | Maintain (view/edit) maximum repetitions of the Member variable array from the Multistage variable defined in the :menuselection:`Role package file（ZIP format）` registered in :menuselection:`Ansible-LegacyRole --> Role package management`.  
   | For more information, see :ref:`ansible_legacyrole_substitution_value_auto_registration_setting`.

   .. figure:: /images/ja/ansible-legacyrole/variable_nest_management/nested_variable_list.png
      :width: 800px
      :alt: Submenu（Variable nest management）

      Submenu（Variable nest management）

#. | Press the :guilabel:`Register` button to edit the maximum amount of repetitions.

   .. figure:: /images/ja/ansible-legacyrole/variable_nest_management/registration_nested_variable_list.gif
      :width: 800px
      :alt: Registration page （Variable nest management）

      Registration page （Variable nest management）

#. | The items found in the registration page are as following.

   .. list-table:: Registration page Item list（Variable nest management）
      :widths: 30 120 30 30 30
      :header-rows: 1
      :align: left

      * - Item
        - Description
        - Input required
        - Input method
        - Restrictions
      * - Item number
        - | Displays an automatically numbered string of 36 characters.
        - ー
        - Automatic
        - ー
      * - Maximum repetitions
        - | Input a value between 1～1,024 for the maximum repetitions.
          | The maximum value can be changed by configuring the MAXIMUM_ITERATION_ANSIBLE-LEGACYROLE in Management Console - :ref:`system_setting`
        - 〇
        - Manual
        - Input value from 1～1,024(Can be changed from :ref:`system_setting`)
      * - Remarks
        - Free description field
        - ー
        - Manual
        - Maximum length 4000 bytes


.. warning:: | **Initial registrations and Repetition count updates**
   | he internal process initially registers the repetition count of member variable defined in the nested variable which is defined in the role package. After the initial registration, the repetition count can be updated in the "Nested variable management" menu.
   | Note that both the initial registration and the update does not happen in real-time, meaning that it may take time before they can be used in :ref:`ansible_legacyrole_substitution_value_auto_registration_setting`.


.. _ansible_legacyrole_substitution_value_auto_registration_setting:

Substitute value auto registration settings
~~~~~~~~~~~~~~~~~~
#. | Links (view/register/edit/discard) parameter item setting values and Movement variables.
   |The registered information is displayed in :menuselection:`Ansible-LegacyRole --> Substitute value management` and :menuselection:`Ansible-LegacyRole --> Target host` when executed by internal processes.

   .. figure:: /images/ja/ansible-legacyrole/substitution_value_automatic_setting/substitution_value_auto_registration_setting_role.png
      :width: 800px
      :alt: Submenu (Substitute value auto registration settings) 

      Submenu (Substitute value auto registration settings) 

#. | Press the :guilabel:`Register` button to register a link between the Movement variables and Parameter sheet item setting values

   .. figure:: /images/ja/ansible-legacyrole/substitution_value_automatic_setting/registration_substitution_value_auto_registration_setting_role.gif
      :width: 800px
      :alt: Registration page (Substitute value auto registration settings) 

      Registration page (Substitute value auto registration settings) 


#. | The items found in the registration page are as following.


   .. table:: Registration page item list (Substitute value auto registration settings) 
      :align: left

      +-----------------------------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+
      | Item                              | Description                                                        | Input required                               | Input method | Restrictions                |
      |                                   |                                                                    |                                              |              |                             |
      |                                   |                                                                    |                                              |              |                             |
      +=================+=================+====================================================================+==============================================+==============+=============================+
      | Item number                       | Displays an automatically numbered string of 36 characters.        | ー                                           | Automatic    | ー                          |
      +-----------------+-----------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+
      | Parameter sheet\| Menu group:\    | Displays Parameter sheet items.                                    | ○                                           | List \       | Same as description.        |
      |    (From)       | Menu:Item:Item  |                                                                    |                                              | selection    |                             |
      |                 |                 | Select the target item.                                            |                                              |              |                             |
      |                 |                 |                                                                    |                                              |              |                             |
      |                 |                 | The items that can be selected are the ones within param           |                                              |              |                             |
      |                 |                 | eter sheets created with (with operation) in the ":menus\          |                                              |              |                             |
      |                 |                 | election:`Create parameter sheet -->Define/Create parame\          |                                              |              |                             |
      |                 |                 | ter sheets` menu.\                                                 |                                              |              |                             |
      |                 |                 |                                                                    |                                              |              |                             |
      |                 |                 |                                                                    |                                              |              |                             |
      |                 +-----------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+
      |                 | Substitute order| Input a :menuselection:`Substitute order` for the parameter sh\    | :ref:`※1 <ansible_legacyrole_parashi_\      | Manual       | 1～2,147,483,647            |
      |                 |                 | eet if the created parameter sheet is bundled.                     | substitution>`                               |              |                             |
      |                 |                 |                                                                    |                                              |              |                             |
      |                 |                 |                                                                    |                                              |              |                             |
      +-----------------+-----------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+
      | Registration method               | Select the contents registered to the specific value of the Va\    | ○                                           | List \       | Same as description.        |
      |                                   | riable selected in :menuselection:`IaC variable (To) `.            |                                              | selection    |                             |
      |                                   |                                                                    |                                              |              |                             |
      |                                   | + | Value type                                                     |                                              |              |                             |
      |                                   |   | The Item's setting value will be specific value for the Varia\ |                                              |              |                             |
      |                                   |     ble selected in :menuselection:`IaC variable (To) `.           |                                              |              |                             |
      |                                   |                                                                    |                                              |              |                             |
      |                                   | + | Key type                                                       |                                              |              |                             |
      |                                   |   | The item name will be specific value for the va\               |                                              |              |                             |
      |                                   |     riable selected in  :menuselection:`IaC variable (To) `.       |                                              |              |                             |
      |                                   |                                                                    |                                              |              |                             |
      +-----------------------------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+
      | Movement name                     | Displays :menuselection:`Movement name` registered in :menu\       | ○                                           | List \       | Same as description.        |
      |                                   | selection:`Ansible-Legacy --> Movement list`.                      |                                              | selection    |                             |
      |                                   |                                                                    |                                              |              |                             |
      |                                   | Select a Movement.                                                 |                                              |              |                             |
      +-----------------+-----------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+
      | IaC variable (To) | Movement name\| Displays the Variable used by the files registered in :menusel\    | ○                                           | List \       | Same as description.        |
      |                 | :Variable name  | ection:`Ansible-Legacyrole --> Movement-Playbook link`.            |                                              | selection    |                             |
      |                 |                 |                                                                    |                                              |              |                             |
      |                 |                 | Select the desired Specified value of the item selected i\         |                                              |              |                             |
      |                 |                 | n :menuselection:`Parameter sheet (From)`.                         |                                              |              |                             |
      |                 +-----------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+
      |                 | Substitute order| Input for Multiple specific value variables.                       | :ref:`※2 <ansible_legacyrole_substitution>` | Manual     | 1～2,147,483,647              |
      |                 |                 |                                                                    |                                              |              |                             |
      |                 |                 | Input a Susbtitute order forthe specific value (1～). T\           |                                              |              |                             |
      |                 |                 | he substitue order is in raising order. Input substitute order(1\  |                                              |              |                             |
      |                 |                 | ～) even when there are no multiple specific values.               |                                              |              |                             |
      +-----------------+-----------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+
      | NULL連携                          | If the specific value for the parameter sheet in :menuselecti\     | ー                                           | List \       | Same as description.        |
      |                                   | on:`Ansible-Legacy --> Substitute value management`is NULL, se\    |                                              | selection    |                             |
      |                                   |lect whether the registration to the substitute value manage\       |                                              |              |                             |
      |                                   | ment registration should be done with NULL value or not.           |                                              |              |                             |
      |                                   |                                                                    |                                              |              |                             |
      |                                   | + | True                                                           |                                              |              |                             |
      |                                   |   | Registers the value to \                                       |                                              |              |                             |
      |                                   |     :menuselection:`Mode --> Substitute value management` \        |                                              |              |                             |
      |                                   |     menu no matter the value                                       |                                              |              |                             |
      |                                   |                                                                    |                                              |              |                             |
      |                                   | + | False                                                          |                                              |              |                             |
      |                                   |   | Registers only the value if there is a value input to th\      |                                              |              |                             |
      |                                   |     e :menuselection:`Ansible-Legacy --> Substit\                  |                                              |              |                             |
      |                                   |     ute value management.                                          |                                              |              |                             |
      |                                   |                                                                    |                                              |              |                             |
      |                                   | If nothing is selected, the \                                      |                                              |              |                             |
      |                                   | :menuselection:`Ansible common --> Interface information`'s\       |                                              |              |                             |
      |                                   | :menuselection:`NULL link` value will be applied.                  |                                              |              |                             |
      |                                   |                                                                    |                                              |              |                             |
      +-----------------------------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+
      | Remarks                           | Free description field                                             | ー                                           | Manual       | Maximum length 4000 bytes   |
      +-----------------------------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+

.. _ansible_legacyrole_parashi_substitution:

.. tip:: | ※1:Only required if the Parammeter sheet has Bundles active.
   | In order to link Movement variables with Parameter sheets with bundles, the user must input a substitute order for the Parameter sheet (From) in :menuselection:`Ansible-LegacyRole --> Substitute value auto registration settings`.
   | See the following figure for more information regarding the relationship between bundled parameter sheets and Substitute value auto registration settings.

   .. figure:: /images/ja/diagram/parameter.png
      :width: 600px
      :alt: Register Substitute value auto registration settings when using Bundled parameter sheets.


.. _ansible_legacyrole_member:

.. tip:: | ※2:Only required when variable is multistage.
   | Member variables are only required if the variable is a Multistage variable. The variables displayed in the Member variables are the only variables that requries specific values.
   | Connect the stage variables with "."
   | For repetition arrays, connect the start position （0～）with [ ]. The amount of repeated arrays are configured in :menuselection:`Ansible-LegacyRole --> Variable nest management`.
   |
   | e.g.） Checking the selectable member variables after updating the Variable Nest Management's maximum repetitions and the selectable member variables in Substitute value auto registration settings.

   #. | Define variables to the Role package variable definition file （defaults/main.yml） as below and register Role package in :menuselection:`Ansible-LegacyRole --> Role package management`
      | **Variable definition file contents**

      .. code-block:: yaml

         VAR_aaaa:
           - name: alice
             object: obj1
             directory:
               - craete_dir: /dir
             password:
               - craete_pass:
                 sample:
                   - sample_pass: pass1
               - craete_pass:
                 sample:
                   - sample_pass: pass2
             user:
               root:
                 - craete_users:
                   prod:
                     - prod_user: user1
                   dev:
                     - dev_user: user2


   #. | If a role package is registered with variables defined like in Step 1. the following will be registered to :menuselection:`Ansible-LegacyRole --> Variable nest management` and the user will able to select the following member variables in :menuselection:`Ansible-LegacyRole --> Substitute value auto registration settings` by default. 

      .. list-table:: Variable nest management registration contents
         :widths: 40 30 30
         :header-rows: 1
         :align: left

         * - Variable name
           - Member variable name
           - Maximum repetitions
         * - VAR_aaaa
           - 0
           - 1
         * - VAR_aaaa
           - 0.directory
           - 1
         * - VAR_aaaa
           - 0.password
           - 1
         * - VAR_aaaa
           - 0.password.sample
           - 1
         * - VAR_aaaa
           - 0.user.root
           - 1
         * - VAR_aaaa
           - 0.user.root.dev
           - 1
         * - VAR_aaaa
           - 0.user.root.prod
           - 1

      .. list-table:: Selectable Member variables in Substitute value auto registration settings
         :widths: 40 50
         :header-rows: 1
         :align: left

         * - Variable name
           - Member variable name
         * - VAR_aaaa
           - [0].directory[0].create_dir
         * - VAR_aaaa
           - [0].name
         * - VAR_aaaa
           - [0].object
         * - VAR_aaaa
           - [0].password[0].create_pass
         * - VAR_aaaa
           - [0].password[0].sample[0].sample_pass
         * - VAR_aaaa
           - [0].user.root[0].create_users
         * - VAR_aaaa
           - [0].user.root[0].dev[0].dev_user
         * - VAR_aaaa
           - [0].user.root[0].prod[0].prod_user


   #. | In :menuselection:`Ansible-LegacyRole --> Variable nest management`, edit the Member variable "0.user.root.prod"'s Maximum repetitions from "1" to "3".

      .. list-table:: Variable nest management edited contents
         :widths: 40 30 30
         :header-rows: 1
         :align: left

         * - Variable name
           - Member variable name
           - Maximum repetitions
         * - VAR_aaaa
           - 0.user.root.prod
           - 3


   #. | If the member variables are edited like they were in Step 3., The selectable member variables in :menuselection:`Ansible-LegacyRole --> Substitute value auto registration settings` are also changed.
      | (Member variable [0].user.root[0].prod[1].prod_user and [0].user.root[0].prod[2].prod_user are added to the pulldown selection)

      .. list-table:: Selectable Member variables in Substitute value auto registration settings
         :widths: 40 50
         :header-rows: 1
         :align: left

         * - Variable name
           - Member variable name
         * - VAR_aaaa
           - [0].directory[0].create_dir
         * - VAR_aaaa
           - [0].name
         * - VAR_aaaa
           - [0].object
         * - VAR_aaaa
           - [0].password[0].create_pass
         * - VAR_aaaa
           - [0].password[0].sample[0].sample_pass
         * - VAR_aaaa
           - [0].user.root[0].create_users
         * - VAR_aaaa
           - [0].user.root[0].dev[0].dev_user
         * - VAR_aaaa
           - [0].user.root[0].prod[0].prod_user
         * - VAR_aaaa
           - [0].user.root[0].prod[1].prod_user
         * - VAR_aaaa
           - [0].user.root[0].prod[2].prod_user



.. _ansible_legacyrole_substitution:

.. tip:: | ※3:Only required when selected variable can have multiple specific values configured
   | Substitute orders does not need to succeed particular Multiple specific value variables.
   |
   | e.g.）Input Substitute order for multiple specific value variables and executing.

   #. | Follow the example below and define variables to the Role package variable definition file（defaults/main.yml） and register a Role package in :menuselection:`Ansible-LegacyRole --> Role package management`.
      | **Variable definition file description contents**

      .. code-block:: yaml

         VAR_substitutionA:
           - user-name
           - group-name
           - meta-name

         VAR_substitutionB:
           - login
           - authorized
           - space
           - cluster

   #. | In :menuselection:`Ansible-LegacyRole --> Substitute value auto registration settings`m link Role variables and th setting values for items registered to the Parameter sheets.

      .. table:: Parameter sheet registration contents
         :align: left

         +----------------+------------------------+----------+----------+----------+----------+
         | **Host name**  | **Operation name**     | **Parameter**                             |
         |                |                        +----------+----------+----------+----------+
         |                |                        | **Item1**| **Item2**| **Item3**| **Item4**|
         +================+========================+==========+==========+==========+==========+
         | test-host      | test-ope               | value1   | value2   | value3   | value4   |
         +----------------+------------------------+----------+----------+----------+----------+

      .. list-table:: Substitute value auto registration settings registration contents
         :widths: 40 20 30 20
         :header-rows: 1
         :align: left

         * - Menu name
           - Item
           - Variable name
           - Substitute order
         * - sample-menu
           - Item1
           - VAR_substitutionA
           - 30
         * - sample-menu
           - Item2
           - VAR_substitutionA
           - 10
         * - sample-menu
           - Item3
           - VAR_substitutionA
           - 20
         * - sample-menu
           - Item1
           - VAR_substitutionB
           - 2
         * - sample-menu
           - Item2
           - VAR_substitutionB
           - 4
         * - sample-menu
           - Item3
           - VAR_substitutionB
           - 1
         * - sample-menu
           - Item4
           - VAR_substitutionB
           - 3

   #. | When executed, the host variable file (host_vars/test-host) will have the variables registered in Substitute value auto registration settings output similarly to the example below.
      | **Output to Host variable file**

      .. code-block:: yaml

         VAR_substitutionA:
           - value2
           - value3
           - value1
         VAR_substitutionB:
           - value3
           - value1
           - value4
           - value2

.. _host:

.. tip:: | **Output to Host variable file**
   | Only variables registered in the Substitute value auto registration settings menu are output to the Host variable file when executed.
   | The same goes for multistage variables. Only member variables with specific values registered will be output.
   |
   | e.g.） Checking variables output the the Host variable file when executing Variables with specific values registered to them in the Substitute value auto registration settings.

   #. | Follow the example below and define variables to the Role package variable definition file（defaults/main.yml） and register a Role package in  :menuselection:`Ansible-LegacyRole --> Role package management`.
      | **Variable definition file description contents**

      .. code-block:: yaml

         VAR_output:
           - name: alice
             group: root
             user:
               root:
                 - craete_users:
                   prod:
                     - prod_user: user1
                   dev:
                     - dev_user: user2

   #. | In the :menuselection:`Ansible-LegacyRole --> Substitute value auto registration settings` menu, link Role variables and setting values for items registered to the Parameter sheets.

      .. table:: Parameter sheet registration contents
         :align: left

         +----------------+------------------------+---------------------+
         | Host name      | Operation name         | Parameter           |
         |                |                        +----------+----------+
         |                |                        | Item1    | Item2    |
         +================+========================+==========+==========+
         | test-host      | test-ope               | value1   | value2   |
         +----------------+------------------------+----------+----------+

      .. list-table:: Substitute value auto registration settings registration contents
         :widths: 30 15 30 50
         :header-rows: 1
         :align: left

         * - Menu name
           - Item
           - Variable name
           - Member variable name
         * - sample-menu
           - Item1
           - VAR_output
           - [0].name
         * - sample-menu
           - Item2
           - VAR_output
           - [0].user.root[0].dev[0].dev_user


   #. | When executed, the host variable file (host_vars/test-host) will have the variables registered in Substitute value auto registration settings output similarly to the example below.
      | **Output to Host variable file**

      .. code-block:: yaml

         VAR_output:
           - name: value1
             user:
               root:
               - dev:
                 - dev_user: value2

.. _ansible_legacyrole_file_and_templete:

.. tip:: | **Examples using Playbook variables linked to File embedded variables and Template embedded variables**
   | e.g.)  If the File embedded variable, CPF_test, and Template embedded variable, TPF_sample, is linked to the Playbook variable in the Substitute value auto registration settings menu.

   #. | Register the following in:menuselection:`Ansible common --> File management` / :menuselection:`Ansible common --> Template management`.

      .. list-table:: File management registration contents
         :widths: 50 40
         :header-rows: 1
         :align: left

         * File embedded variable name
           - File material
         * - CPF_test
           - test_file.txt

      .. list-table:: Template management registration contents
         :widths: 50 40
         :header-rows: 1
         :align: left

         * - Template embedded variable name
           - Template file
         * - TPF_sample
           - sample.tpl

   #. |  After creating "Ansible common:File management:File embedded variable name" and "Ansible common:Template management:Template embedded variable name" as Parameter sheet items in :menuselection:`Define/Create parameter sheet` , register File embedded variables and Template embedded variables as the Parameter sheets' item values. 

      .. figure:: /images/ja/ansible_common/menu_definition_and_create/menu_create.png
         :width: 800px
         :alt: Define/Create parameter sheet

         Define/Create parameter sheet

      .. table:: Sample parameter sheet registration contents
         :align: left

         +----------------+------------------------+-----------------+---------------------+
         | **Host name**  | **Operation name**     | **Parameter**                         |
         |                |                        +-----------------+---------------------+
         |                |                        | **File manag\   | **Template man\     |
         |                |                        | ement**         | agement**           |
         +================+========================+=================+=====================+
         | test-host      | test-ope               | CPF_test        | TPF_sample          |
         +----------------+------------------------+-----------------+---------------------+

   #. | In :menuselection:`Ansible-LegacyRole --> Substitute value auto registration settings`, link the Playbook variable and the Item setting value of the Parameter sheet registered in Step 2. and Execute Ansible in  :menuselection:`Ansible-Legacy --> Execute`. 

      .. list-table:: Substitute value auto registration settings registration contents
         :widths: 50 30 30
         :header-rows: 1
         :align: left

         * - Menu name
           - Item
           - Variable name
         * - Sample parameter sheet
           - File management
           - VAR_filetest
         * - Sample parameter sheet
           - Template management
           - VAR_temptest

   #. | Click the :menuselection:`Ansible-LegacyRole --> Confirm execution status`'s :guilabel:`Check substitute value` button to check that the  '{{ CPF_test }}' and '{{ TPF_sample }}' are dispalyed to the Specific value.

      .. figure:: /images/ja/ansible-legacyrole/assigned_value_management/general_operations_note.png
         :width: 800px
         :alt: Confirm execution status Substitute value management

         Confirm execution status Substitute value management


.. _ansible_legacyrole_execution:

Execute
~~~~~~~~

| Select a Movement from the Movement list.
| Select an Operation from the Operation list.
| There are 3 different types of execution types. Clicking the one of the execution buttons moves the user to :menuselection:`Ansible-LegacyRole --> Confirm execution status` where the execution process will start

.. figure:: /images/ja/ansible-legacyrole/execution/execution_screen.gif
   :width: 800px
   :alt: Execute menu

   Execute menu

| See the following for information regarding the different execution types.

#. | **Execute**
   | Press the :guilabel:`Execute` button to run operations to the execution target.

#. | **Dry run**
   | Clicking the :guilabel:`Dry run` button allows the user to perform a dry run where the operation is not executed to the execution target.
   | Dry runs will execute the Ansible-Playbook command's --check parameter.
   
#. | **Check Parameter**
   | Clicking the :guilabel:`Check Parameter` button allows users to check that the information registered in :menuselection:`Ansible-LegacyRole --> Substitute value auto registration settings` and the Operation and Movement link information is displayed to  :menuselection:`Ansible-Legacy --> Substitute value management` and :menuselection:`Ansible-Legacy --> Target host` without actually executing to the execution target.
   
.. tip:: |  **Specify reservation date**
   | Inputing a Reservation date allows users to reserve executions.
   | Reservation dates can only contain a date/time later than the current date/time.


.. _ansible_legacyrole_check_operation_status:

Confirm execution status
~~~~~~~~~~~~

| Allows users to monitor execution statuses.

.. figure:: /images/ja/ansible-legacyrole/check_work_status/check_operation_status.png
   :width: 800px
   :alt: Submenu (Confirm execution status) 

   Submenu (Confirm execution status) 

#. | **Execution status display**
   | The status matching the Execution status is displayed.
   | The execution log and error log also displays detailed information regarding the execution status.
   | If the execute type is "Execute", "Normal" will be displayed. If Dry run is selected, "Dry run". If Parameter check is selected, "Parameter check" will be displayed.
   | If the status ends in an unexpected error, a message will be displayed in the error log.
   | "Call Conductor" displays which Conductor was executed. This field will be blank if directly executed from Ansible-LegacyRole.

#. | **Confirm Target host**
   | Clicking the :guilabel:`Check Target host` button displays :menuselection:`Ansible-LegacyRole --> Target host` where hosts from Operations and Movements are displayed.

#. | **Confirm Substitute value**
   | Clicking the :guilabel:`Check Sbstitute value` button displays :menuselection:`Ansible-LegacyRole --> Substitute value management` where users can see Specific values and Variables from Operations and Movements.

#. | **Emergency stop/Delete reservation**
   | Users can press the :guilabel:`Emergency stop` button to stop the operation.
   | If the status was "Reserved execution", the :guilabel:`Delete reservation` button will be displayed. Check the :guilabel:`Delete reservation` button to delete the reservation

#. | **Display execution log**
   | When Ansible Automation Controller is executed, the Playbook is executed in units of the device to be built grouped by the item values of  :menuselection:`Ansible common --> Device list`'s  :menuselection:`User` ・ :menuselection:`Password` ・:menuselection:`ssh secret key file` ・ :menuselection:`Passphrase` ・ :menuselection:`Connection type` ・ :menuselection:`Instance group`, which splits the execution logs.
   | By specifying the number of job slices in the :menuselection:`Option parameter` in  :menuselection:`Ansible common --> Interface information` or :menuselection:`Ansible-LegacyRole --> Movement list`, the grouped targets can be further divided into the number of specified job slices before the Playbook is executed and the execution log is further divided.
   | If the execution log has been divided, the execution log will be divided into tabs, where the user can select which execution log they want to see.

   | The log file names displayed in the execution log's pulldown menu are as following.
   | exec.log: Log file containing all execution logs.
   | Not exec.log: Divided execution log. The file convention are as following. 
   | exec_<Group number>_<Serial number>

   .. list-table:: Divided execution log file naming convention
      :widths: 20 50
      :header-rows: 1
      :align: left

      * - Component
        - Contents
      * - Group number
        - The Execution target's serial number grouped by the :menuselection:`Ansible common --> Device list`'s :menuselection:`User` ・ :menuselection:`Password` ・ :menuselection:`ssh secret key file` ・ :menuselection:`Passphrase` ・ :menuselection:`Connection type` ・ :menuselection:`Instance group` items.
      * - Serial number
        - | Serial number from 1 that divides the group by setting the number of job slices.
          | If 0, no division of job slicing was done.

#. | **Search log**
   | Users can filter information to narrow down information in the execution log and the error log.
   | Input the string the user wants to search for and tick the "Corresponding lines only" checkbox to view only the lines corresponding to the string.
   | The refresh interval and maximum display lines can be configured by changing the "Status monitoring cycle item" and "Progress status display lines" items in :menuselection:`Ansible common --> Interface information`.

#. | **Input data**
   | Users can download executed Playbooks.
   | For more information, see :ref:`ansible_legacyrole_the_linkage_between_the_input_data_used_during_ansible_execution_and_ita_menu`.

#. | **Result data**
   | Users can download execution logs and error logs.
   | For more information, see :ref:`ansible_legacyrole_the_linkage_between_the_output_data_used_during_ansible_execution_and_ita_menu`.

.. _ansible_legacyrole_execution_list:

Execution management
~~~~~~~~

   | Allows userse to view execution histories.
   | Specify search conditions and press the :guilabel:`Filter` button to view a table of executions.
   | Pressing the :guilabel:`Details` button moves the user to :menuselection:`Ansible-LegacyRole --> Confirm execution status`  where they can view detailed information regarding the execution status.

.. figure:: /images/ja/ansible-legacy/work_management/execution_list.png
   :width: 800px
   :alt: Submenu (Execution management) 


   Submenu (Execution management) 

#. | The items found in the page are as following.

   .. table:: View page item list (Execution management) 
      :widths: 10 10 10 50
      :align: left

      +-------------------------------------------------------------------------------+------------------------------------------------------------------------------+
      | Item                                                                          | Description                                                                  |
      |                                                                               |                                                                              |
      +===============================================================================+==============================================================================+
      | Execution number.                                                             | Displays an automatically given unique ID (36 characters)                    |
      +-------------------------------------------------------------------------------+------------------------------------------------------------------------------+
      | Execution type                                                                | Displays the Execution type.                                                 |
      +-------------------------------------------------------------------------------+------------------------------------------------------------------------------+
      | Status                                                                        | Displays the status of the Execution.                                        |
      +-------------------------------------------------------------------------------+------------------------------------------------------------------------------+
      | Execution engine                                                              | Displays the Execution engine used.                                          |
      +-------------------------------------------------------------------------------+------------------------------------------------------------------------------+
      | Called Conductor                                                              | Displays the Conductor name if executed from Conductor.                      |
      +-------------------------------------------------------------------------------+------------------------------------------------------------------------------+
      | Execution user                                                                | Displays the user who executed the Ansible.                                  |
      +-------------------------------------------------------------------------------+------------------------------------------------------------------------------+
      | Registration date                                                             | Displays when the Execute button was clicked.                                |
      +---------------------+---------------------------------------------------------+------------------------------------------------------------------------------+
      | Movement            | ID                                                      | Displays the selected Movement ID.                                           |
      |                     +---------------------------------------------------------+------------------------------------------------------------------------------+
      |                     | name                                                    | Displays the selected Movement name                                          |
      |                     +---------------------------------------------------------+------------------------------------------------------------------------------+
      |                     | Delay timer                                             | Displays the delay timer value configured to the Movement.                   |
      |                     +-------------------------------+-------------------------+------------------------------------------------------------------------------+
      |                     | Ansible use information       | Host specification f\   | Displays the selected Movement's Host specification format.                  |
      |                     |                               | ormat                   |                                                                              |
      |                     |                               +-------------------------+------------------------------------------------------------------------------+
      |                     |                               | WinRM connection        | Displays the selected Movement's WinRM connection.                           |
      |                     |                               +-------------------------+------------------------------------------------------------------------------+
      |                     |                               | Header section          | Displays the selected Movement's header section.                             |
      |                     |                               +-------------------------+------------------------------------------------------------------------------+
      |                     |                               | ansible.cfg             | Allows users to download the selected Movement's ansible.cfg file.           |
      |                     +-------------------------------+-------------------------+------------------------------------------------------------------------------+
      |                     | Ansible Automation \          | Execution environment   | Displays the selected Movement's execution environment.                      |
      |                     | Controller use information    |                         |                                                                              |
      +---------------------+-------------------------------+-------------------------+------------------------------------------------------------------------------+
      | Operation           | No.                                                     | Displays the selected Operation's ID                                         |
      |                     +---------------------------------------------------------+------------------------------------------------------------------------------+
      |                     | Name                                                    | Displays the selected Operation's name                                       |
      +---------------------+---------------------------------------------------------+------------------------------------------------------------------------------+
      | Input data                                                                    | Allows users to download the input data in a Zip file                        |
      +-------------------------------------------------------------------------------+------------------------------------------------------------------------------+
      | Result data                                                                   | Allows users to download the result data in a Zip file.                      |
      +---------------------+---------------------------------------------------------+------------------------------------------------------------------------------+
      | Execution status    | Reservation date                                        | Displays the reservation date if the execution is reserved.                  |
      |                     +---------------------------------------------------------+------------------------------------------------------------------------------+
      |                     | Start date                                              | Displays when the execution will start.                                      |
      |                     +---------------------------------------------------------+------------------------------------------------------------------------------+
      |                     | End date                                                | Displays when the execution will end.                                        |
      +---------------------+---------------------------------------------------------+------------------------------------------------------------------------------+
      | Collect status      | Status                                                  | Displays the Connection function's status.                                   |
      |                     +---------------------------------------------------------+------------------------------------------------------------------------------+
      |                     | Collection log                                          | Allows users to downlaod the Collection function's log.                      |
      +---------------------+---------------------------------------------------------+------------------------------------------------------------------------------+
      | Conductor instance number                                                     | Displays the Conductor instance number if executed from Conductor.           |
      |                                                                               |                                                                              |
      +---------------------+---------------------------------------------------------+------------------------------------------------------------------------------+


.. _ansible_legacyrole_target_host:

Target host
~~~~~~~~~~~~~~

#. | Allows users to view Target hosts.

   .. figure:: /images/ja/ansible-legacyrole/work_taget_host/target_host.png
      :width: 800px
      :alt: Submenu (Target host) 

      Submenu (Target host) 


#. | The items found in the view page are as following.

   .. list-table:: View page item list (Target host) 
      :widths: 45 120
      :header-rows: 1
      :align: left

      * - Item
        - Description
      * - Item number
        - Displays an automatically given unique ID (36 characters)   
      * - Execution number
        - Displays the Execution number when executed.
      * - Operation
        - Displays the Operation when executed.
      * - Movement name
        - Displays the Movement when executed.
      * - Host name
        - Displays the Target host when Executed.
      * - Remarks
        - Free description field


.. _ansible_legacyrole_substitution_value_list:

Substitute value management
~~~~~~~~~~

#. | Displays the Variable's specific values.

   .. figure:: /images/ja/ansible-legacyrole/assigned_value_management/substitution_value_list.png
      :width: 800px
      :alt: Submenu (Substitute value management) 

      Submenu (Substitute value management) 


#. | The items found in the page are as following.

   .. table:: View page item list (Substitute value management) 
      :align: left

      +-------------------------------------------+-------------------------------------------------------------------------------------------------------------+
      | Item                                      | Description                                                                                                 |
      +===========================================+=============================================================================================================+
      | Item number                               | Displays an automatically given unique ID (36 characters).                                                  |
      +-------------------------------------------+-------------------------------------------------------------------------------------------------------------+
      | Execution number                          | Displays the Execution number when executed.                                                                |
      +-------------------------------------------+-------------------------------------------------------------------------------------------------------------+
      | Operation                                 | Displays the selected Operation.                                                                            |
      +-------------------------------------------+-------------------------------------------------------------------------------------------------------------+
      | Movement name                             | Displays the selected Movement.                                                                             |
      +-------------------------------------------+-------------------------------------------------------------------------------------------------------------+
      | Host name                                 | Displays the selected Target host.                                                                          |
      +-------------------------------------------+-------------------------------------------------------------------------------------------------------------+
      | Movement name:Variable name               | Displays the Variable name when executed                                                                    |
      +------------+-----------+------------------+-------------------------------------------------------------------------------------------------------------+
      | Specific\  | String    | Sensitive set\   | Displays either "True" or "False".                                                                          |
      |  value     |           | tings            |                                                                                                             |
      |            |           +------------------+-------------------------------------------------------------------------------------------------------------+
      |            |           | Value            | Displays the Variable's Specific value when executed.                                                       |
      |            |           |                  |                                                                                                             |
      |            |           |                  | + | If the :menuselection:`Sensitive settings` are set to "True"                                            |
      |            |           |                  |   | The Specific value input to the Parameter sheet will be encrypted and not be viewable on ITA.           |
      |            |           |                  |     The variable's Specific value has its encrypted contents configured by ansible-vault.                   |
      |            |           |                  |                                                                                                             |
      |            |           |                  | + | If the :menuselection:`Sensitive settings` are set to "False"                                           |
      |            |           |                  |   | The Specific value input to the Parameter sheets will be displayed.                                     |
      |            |           |                  |                                                                                                             |
      |            +-----------+------------------+-------------------------------------------------------------------------------------------------------------+
      |            | File                         | Displays the File name linked to the Variables.                                                             |
      +------------+------------------------------+-------------------------------------------------------------------------------------------------------------+
      | Substitute order                          | If the variable is a Multiple Specific Value Variable, the Substitute order will be displayed.              |
      +-------------------------------------------+-------------------------------------------------------------------------------------------------------------+
      | Remarks                                   | Free description field                                                                                      |
      +-------------------------------------------+-------------------------------------------------------------------------------------------------------------+


Describing Structure code
==================

.. _ansible_legacyrole_write_role_package_ansible_legacy_role:

Writing Role packages
----------------------

| For more information regarding Role package formats, see the official Ansible Manuals.
| This section explains the the role packages ZIP file uploaded to ":ref:`ansible_legacyrole_role_package_list`"  and which directory it should contain. 

.. code-block:: none

   （Upper directory）
   │
   ├─── site.yml                                             ・・・・・・・・・・・・・・・・・・・・・・・・ （1）
   │
   ├─── hosts                                                ・・・・・・・・・・・・・・・・・・・・・・・・ （2）
   │
   ├─── group_vars                                           ・・・・・・・・・・・・・・・・・・・・・・・・ （3）
   │
   ├─── host_vars                                            ・・・・・・・・・・・・・・・・・・・・・・・・ （4）
   │
   ├─── ITA readme                                           ・・・・・・・・・・・・・・・・・・・・・・・・ （5）
   │
   └─── roles                                                ・・・・・・・・・・・・・・・・・・・・・・・・ （6）
           │
           ├─ [role name①]                                    ・・・・・・・・・・・・・・・・・・・・・・・・ （7）
           │     │
           │     ├── readme.md                               ・・・・・・・・・・・・・・・・・・・・・・・・ （8）
           │     │
           │     ├── tasks                                   ・・・・・・・・・・・・・・・・・・・・・・・・ （9）
           │     │      ├── main.yml
           │     │      └── user_files
           │     │      └── user.yml
           │     │
           │     ├── handlers                                ・・・・・・・・・・・・・・・・・・・・・・・・ （10）
           │     │      ├── main.yml
           │     │      └── user_files
           │     │      └── user.yml
           │     │
           │     ├── templates                               ・・・・・・・・・・・・・・・・・・・・・・・・ （11）
           │     │      ├── hosts.j2
           │     │      └── user_files
           │     │      └── user.j2
           │     │
           │     ├── files                                   ・・・・・・・・・・・・・・・・・・・・・・・・ （12）
           │     │      └── sudoers
           │     │
           │     ├── vars                                    ・・・・・・・・・・・・・・・・・・・・・・・・ （13）
           │     │      └─ main.yml
           │     │
           │     ├── defaults                                ・・・・・・・・・・・・・・・・・・・・・・・・ （14）
           │     │      ├── main.yml
           │     │      └── user_files
           │     │              └── user.yml
           │     │
           │     ├── meta                                    ・・・・・・・・・・・・・・・・・・・・・・・・ （15）
           │     │      └── main.yml
           │     │
           │     If there are other directories and files, ITA will not recognize them.
           │
           └─ [role name②] roles have no specific limits.

.. list-table::
   :widths: 25 15 40
   :header-rows: 1
   :align: left

   * -
     - | Should include
       | 〇　：Required
       | △　：Optional
     - Handled by ITA
   * - \（1）\　site.yml　\（Master Playbook）\
     - △
     - Created by ITA. Will be overwritten if exists.
   * - \（2）\　hosts
     - △
     - Created by ITA. Will be overwritten if exists.
   * - \（3）\　group_vars
     - △
     - Not handled by ITA. Will be deleted if exists
   * - \（4）\　host_vars
     - △
     - Created by ITA. Will be overwritten if exists.
   * - \（5）\　ITA readme
     - △
     - | ITA readme is defined for every role. Error doesn't occur even if the file deosn't exist.
       | ITA readme character code should be UTF-8 without BOM.
       | For more information, see ":ref:`ansible_legacyrole_write_ita_readme_ansible_legacy_role_only`"
   * - \（6）\　roles
     - 〇
     - An Upload error will occur if the roles directory does not exist.
   * - \（7）\　roles/[role  name①]
     - 〇
     - | An Upload error will occur if the role name directory does not exist.
       | Handles directories (tasks directory included) as role.
       | Directory hierarchy can be deep.
   * - \（8）\　roles/[role  name①]/readme.md
     - △
     - Not recognized by ITA.
   * - \（9）\　roles/[role  name①]/tasks
     - 〇
     - | tasks directory is required.
       | playbook character code should be UTF-8 without BOM.
       | An Upload error will occur if main.yml does not exist.
       | Can contain other files than main.yml
       | Can deploy other files than main.yml in the sub-directory.
   * - \（10）\　roles/[role  name①]/handlers
     - △
     - | handlers directory is not recognized.
       | playbook character code should be UTF-8 without BOM.
       | main.yml is not recognized.
       | Can contain other files than main.yml
       | Can deploy files into the sub-directory.
   * - \（11）\　roles/[role  name①]/templates
     - △
     - | templates directory is not recognized.
       | The file character code should be UTF-8 without BOM. 
       | Can deploy files into the sub-directory.
   * - \（12）\　roles/[role  name①]/files
     - △
     - | files directory is not recognized.
       | File or sub-directory is not recognized.
       | File contents are not recognized.
   * - \（13）\　roles/[role  name①]/vars
     - △
     - | vars directory is not recognized.
       | playbook character code should be UTF-8 without BOM.
       | File or sub-directory is not recognized.
       | File contents are not recognized.
   * - \（14）\　roles/[role  name①]/defaults
     - △
     - | defaults directory is not recognized.
       | playbook character code should be UTF-8 without BOM.
       | main.yml is not recognized.
       | Can contain other files than main.yml
       | Can deploy other files than main.yml in the subdirectory.
   * - \（15）\　roles/[role  name①]/meta
     - △
     - | meta directory is not recognized.
       | playbook character code should be UTF-8 without BOM.
       | File or sub-directory is not recognized.
       | File contents are not recognized.


Master Playbook
~~~~~~~~~~~~~~~~

| The Master Playbook created by ITA consists of a header section and Roles section.

#. | Header section
   | Header sections have default values, but users can change them by using :menuselection:`Ansible-LegacyRole --> Movement list`'s :menuselection:`Header section`.

   | ▼Header section default value

   .. code-block:: yaml

        - hosts: all
          remote_user: "{{ __loginuser__ }}"
          gather_facts: no
          become: yes
        # For winrm connections, "become: yes" is ommited.

#. | roles section
   | Roles from uploaded role packages are executed according to the :menuselection:`Include order` in :menuselection:`Ansible-LegacyRole --> Movement-Role link`.

   .. figure:: /images/ja/diagram/role_session.png
      :align: center
      :width: 8.85417in
      :height: 6.67187in


Points to note when the role name in the role package is set to the directory hierarchy.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| he following directory hierarchy role package will be explained as an example.

.. code-block:: none

   └── roles
          ├── parent
          │     ├── sample_role1
          │     │ ├── defaults
          │     │ └── tasks
          │     └── sample_role2
          │            ├── defaults
          │            ├── sample_role3
          │            │     ├── defaults
          │            │     └── tasks
          │            ├── sample_role4
          │            │     ├── defaults
          │            │     └── tasks
          │            └── tasks
          ├── sample_role5
          │     └── defaults
          └── sample_role6
                 ├── defaults
                 └── tasks


#. | he directory recognized as a role is the directory containing the tasks directory.
   | In this example. There are three directory hierarchies (role names) to be handled by roles.

   - parent/sample_role1
   - parent/sample_role2
   - sample_role6

#. | Exclude directory hierarchies with multiple tasks directories
   | There are tasks directories in parent/sample_role2/sample_role3 and parent/sample_role2/sample_role4, but parent/sample_role2 has a tasks directories and recognizes them as roles, meaning they are not handaled as a role.


.. _ansible_legacyrole_write_ita_readme_ansible_legacy_role_only:

Writing ITAreadme
----------------

| The substitution value management function interpretes the variable type defined in defaults variable definition file and sets the variable value of each variable and its' member variable.

ITA readme file naming convention
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| 　ita_readme_[Role name].yml
| 　e.g.）

.. list-table::
   :widths: 20 40
   :header-rows: 1
   :align: left

   * - Role name
     - File name
   * - mysql
     - ita_readme_mysql.yml
   * - mysql/install
     - ita_readme_mysql%install.yml


.. warning:: | If the Role directory hierarchy is deep, the user will have to change "/" with "%" in the Role name.


ITA readme format
~~~~~~~~~~~~~~~~~~~~~~~~

| The format is YAML format.
| Make sure the character code is UTF-8 without BOM.
| The flow of the output of the concrete values of the variables defined in the ITA readme to the host variable file is henceforth referred to as " :ref:`Substitute value management function <ansible_common_legacy_role_var_value>`".
| If variable definitions overlap in the ITA readme and the defaults variable definition file, the variable structure of the ITA readme is applied.

.. tip:: | If variable definitions overlap in the ITA readme and the defaults variable definition file,the following rules are applied.

  .. list-table:: Variable adoption rule
     :widths: 30 30 50
     :header-rows: 1
     :align: left

     * - defaults variable definition file
       - ITA readme
       - Variable structure destination
     * - Defined
       - Not defined
       - Default variable definition file
     * - Not defined
       - Defined
       - ITA readme
     * - Defined
       - Defined
       - ITA readme


  | The ITA readme is cut of from the Role package when executed.
  | Variables and specific values written in the ITA readme file will not be given to Ansible.


 "ita_readme" use example
----------------------

| This section uses 7 cases to explain how the "ita_readmy" file can be used in Ansible-LegacyRole.
|
| This section assumes that Ansible-LegacyRole ("roles" directory) is fetched from an external source.
| The following figure illustrates of using the ita_readme file to uploading it and checking the results.

.. figure:: /images/ja/diagram/ansible-legacyrole_usage_base.png
   :width: 1000px
   :alt: Overall image

   Overall image

| The 7 use examples uses the previous figure as a base.

.. list-table:: Ansible Automation Controller system requirements
   :widths: 35 80
   :header-rows: 1
   :align: left

   * - No.
     - Case 
   * - 1
     - Using externally fetched Ansible-LegacyRole without editing it.
   * - 2
     - "ita_readme" role
   * - 3
     - Variable definitions and default values described in the "defaults/main.yml" file.
   * - 4
     - "host_vars" files and "ITA Parameter sheet"
   * - 5
     - Adding variables to “defaults/main.yml”
   * - 6
     - Applying Playbook Length evaluation
   * - 7
     - Applying Playbook Defined evaluation


- | **Case １：Using externally fetched Ansible-LegacyRole without editing it**
  | Users can use Ansible-Legacy Role (roles directory) acquired from anexternal source without modifying it.
  | Therefore, users can put the ita_readme file and/or substitute table in the “roles” directory and assign parameters to the variables used inside the directory.

.. figure:: /images/ja/diagram/ansible-legacyrole_usage_example1.png
   :width: 1000px
   :alt: Case １ figure

   Case １ figure


- | **Case ２："ita_readme" role**
  | The ita_readme file is used to send variables/variable types to ITA.
  | In other words, they are not used to define specific values (Parameters).
  | ITA will not be able to read any specific values written in them.
  | Please see the other cases below for information on how to assign specific values.

.. figure:: /images/ja/diagram/ansible-legacyrole_usage_example2.png
   :width: 1000px
   :alt: Case ２ figure

   Case ２ figure

- | **Case ３：Variable definitions and default values described in the "defaults/main.yml" file**
  | The "defaults/main.yml" file stored under "roles" is automatically passed to ansible.
  | The file will be automatically sent as long only if no variables or default values are defined in host_vars.(E.g: "VAR_A：aaa").

.. figure:: /images/ja/diagram/ansible-legacyrole_usage_example3.png
   :width: 1000px
   :alt: Case ３ figure

   Case ３ figure

- | **Case ４："host_vars" files and "ITA Parameter sheet"**
  | Host_vars files are automatically created everytime ITA parameter sheets executes something.

.. figure:: /images/ja/diagram/ansible-legacyrole_usage_example4.png
   :width: 1000px
   :alt: Case ４ figure

   Case ４ figure

- | **Case ５：Adding variables to “defaults/main.yml”**
  | In order to add any changes to Ansible-Legacy Role ("roles" directory), users can describe variable names/types in the "ita_readme" file.
  |
  | Users do not have to define any variables in the ita_readme file that are already defined in the "defaults/main.yml" file.
  | If there are different definitions for the same variables in the files, the ones in the "ita_readme" file will be prioritized.
  |
  | ※The figure below illustrates that it is possible to add variables by describing a variable(VAR_H) in the ita_readme file

.. figure:: /images/ja/diagram/ansible-legacyrole_usage_example5.png
   :width: 1000px
   :alt: Case ５ figure

   Case ５ figure

- | **Case ６：Applying Playbook Length evaluation**
  | Depending on whether a variable has a concrete value or not, it can be used as a conditional branch for length evaluation.
  | For example if "VAR_C：[]" is written in "defaults/main.yml", the length will equal 0 if the operation is executed with no specific value set to "VAR_C".
  | On the other hand, doing the same with a specific value set will have length be <0 (length<0). (E.g.: VAR_X：sss)

.. figure:: /images/ja/diagram/ansible-legacyrole_usage_example6.png
   :width: 1000px
   :alt: Case ６ figure

   Case ６ figure

- | **Case ７：Applying Playbook Defined evaluation**
  | Depending on whether a variable has a concrete value or not, it can be used as a conditional branch for defined valuation.
  | For example, first write a definition for the variables "VAR_G" and "VAR_H" in the "ita_readme" file. By doing so, they can be used by ITA parameter sheets.
  |
  | Running an operation without giving a specific value to "VAR_G" while it is not defined in "defaults/main.yml" or "host_vars" will turn "defined" to "false".
  | On the other hand, if the specific value "kkk" is added to "VAR_H", "defined" will turn into "true".

.. figure:: /images/ja/diagram/ansible-legacyrole_usage_example7.png
   :width: 1000px
   :alt: Case ７ figure

   Case ７ figure


Appendix
====

.. _ansible_legacyrole_the_linkage_between_the_input_data_used_during_ansible_execution_and_ita_menu:

Link between ITA menus and Input data when executing Ansible
--------------------------------------------------------
| Information from the different ITA menus are extracted in order to create input data required to execute Ansible. When this happens, :menuselection:`Password` items in the :menuselection:`Ansible common --> Device list` menu and items with their :menuselection:`Sensitive settings` set to "True" in the :menuselection:`Ansible-Legacy --> Substitute value management` menu.
| The Input data can be downloaded from the :menuselection:`Ansible-LegacyRole --> Confirm execution status` menu's :menuselection:`Input data`.
| Useres can also directly execute Ansible by unzipping the downloaded input data in a specified directory.
|
| The relationships between the different data and ITA menus are as following.


Ansible-LegacyRole input data
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table:: Ansible-LegacyRole Input data
   :widths: 20 20 30 20
   :header-rows: 1
   :align: left

   * - Menu group
     - Menu
     - Item
     - Directory unzip path
   * - Ansible-LegacyRole
     - Role package management
     - Role package
     - /roles
   * - Ansible Common
     - Template management
     - Template file
     - /template_files
   * - Ansible common
     - File management
     - File material
     - /copy_files
   * - Ansible-LegacyRole
     - Substitute value management
     - Specific value（File）
     - /upload_files
   * - Ansible common
     - Global variable management
     - Variable name/Specific value
     - /host_vars
   * - Ansible-LegacyRole
     - Substitute value management
     - Variable name/Specific value
     - /host_vars
   * - Ansible-LegacyRole
     - Template management
     - Template embedded variable
     - /host_vars
   * - Ansible-LegacyRole
     - File management
     - File embedded variable
     - /host_vars
   * - Ansible common
     - Device list
     - | Login user ID
       | Login password   ※Encrypted with ansible-vault
       | Host name
       | DNSHost name
       | IP address
     - /host_vars
   * - Ansible common
     - Device list
     - ssh authentication key file
     - /ssh_key_files
   * - Ansible common
     - Device list
     - Server certification
     - /winrm_ca_files
   * - Ansible common
     - Interface information
     - Option parameter
     - /AnsibleExecOption.txt
   * - Ansible-LegacyRole
     - Movement list
     - Option parameter
     - /AnsibleExecOption.txt
   * - Ansible common
     - Device list
     - | Login user ID
       | Login password   ※Encrypted with ansible-vault
       | Host name
       | DNSHost name
       | IP address
       | Inventory file additional option
       | WinRM connection information
       | Connection option
     - /hosts
   * - Ansible-LegacyRole
     - Movement-Role link
     - Role name・Include order
     - /site.yml


.. _ansible_legacyrole_the_linkage_between_the_output_data_used_during_ansible_execution_and_ita_menu:

Result data created when executing Ansible
-----------------------------------

| The results from executing "Input data" with Ansible are saved as "Result data" in a ZIP file.
| "Result data" can be downloaded from :menuselection:`Ansible-LegacyRole --> Confirm execution status` menu's :menuselection:`Result data` in a ZIP file.


Ansible-LegacyRole result data File list
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table:: Ansible-LegacyRole result data File list
   :widths: 20 50 20 20
   :header-rows: 1
   :align: left

   * - File name
     - Recorded contents
     - Ansible Core
     - Ansible Automation Controller
   * - result.txt
     - Records Ansible execution result's execution results
     - 〇
     -
   * - error.log
     - | Error output file with Executing.
       | Ansible-playbbok command standard error output file.
       | Contents displayed in the Execute confirmation error log.
     - 〇
     - 〇
   * - exec.log.org
     - xecution log output by Ansible-playbook
     - 〇
     - 〇
   * - exec.log
     - | Edited Aexec.log.org
       | Contents displayed to the Execution confirmation execution log
     - 〇
     - 〇
   * - exec_<Execution number>_<group number>
     - | Divided execution log file
       | For more information regarding file name conventions, see the execution log in :ref:`ansible_legacyrole_check_operation_status` .
     -
     - 〇
   * - forced.txt
     - Text file if stopped with Emergency stop
     - 〇
     -
   * - user_files
     - A directory where files are recorded when some file is output to ITA's original variable "\__\workflowdir\__\" in the playbook executed.
     - 〇
     - 〇

