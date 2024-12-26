==============
Ansible-Legacy
==============

Introduction
========

| This document aims to explain how to use Ansible-Legacy.

Ansible-Legacy overview
==================

| Ansible Legacy  uses the standard Ansible function to input settings to the different hosts.
| Register structure code as YAML files configure them with job patterns.
| It can be used to configure environments to servers, storages and network devices.

Ansible-Legacy Menu structure
=====================================

| This section epxlains the Ansible-Legacy menu structure.

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

3. | **Ansible-Legacy menus**

| The Ansible-Legacy menus are as following.

.. list-table::  Ansible-Legacy menu list
   :widths: 20 30 80
   :header-rows: 1
   :align: left

   * - No
     - Menu
     - Description
   * - 1
     - Movement list
     - Manages Movements
   * - 2
     - Playbook file collection
     - Manages Playbook files.
   * - 3
     - Movement-Playbook link
     - Manages links between Movement and Playbooks.
   * - 4
     - Substitute value auto registration settings
     - Manages movements and variables that link items and values for each operation registered in the parameter sheet menu.
   * - 5
     - Execute
     - Executes selected Movements and Operations.
   * - 6
     - Execution management
     - Managed execution history.
   * - 7
     - Check operation status
     - Displays the status of executions.
   * - 8
     - Target host
     - Manages target hosts.
   * - 9
     - Substitute value management
     - Manages variable substitute values.
   * - 10
     - Movement-variable link  (※1) 
     - Manages links between Movements and variables.


   .. note::
      | ※1 Hidden menus are internal functions used to register and edit data.
      | There are some hidden menus configured when the Ansible-Legacy driver function is installed.
      | In order to display hidden menus, go to the :menuselection:`Management console-->Role/Menu link management` menu and restore the desired menus. For more information, see :doc:`../it_automation_base/management_console`.


Ansible-Legacy procedure
======================

| This section explains how to use Ansible-Legacy.

Ansible-Legacy workflow
------------------------

| A standard workflow using Ansible Legacy can be seen below.

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

   #. | **Register Playbook**
      | From the :menuselection:`Ansible-Legacy --> Playbook file collection` menu, register a Playbook.
      | For more information, see :ref:`ansible_legacy_playbook_file_list`.

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

   #. | **Register Playbooks to Movement**
      | From the :menuselection:`Ansible-Legacy --> Movement-Playbook link` menu, register link between Playbook and Movement.
      | For more information, see :ref:`ansible_legacy_movement_details`.

   #. | **Create parameter sheet**
      | From the :menuselection:`Create/Define parameter sheets` menu, create a Parameter sheet which will have data registered to it that can configure settings for the target.
      | For more information, see :doc:`../create_param/menu_creation`.

   #. | **Register data to Parameter sheet**
      | Register data to the parameter sheet created in the previous step.
      | For more information, see :doc:`../create_param/menu_creation`.

   #. | **Substitute value auto registration settings**
      | From the :menuselection:`Ansible-Legacy --> Substitute value auto registration settings` menu, link the Movement variables with the Parameter sheet's item's setting values.
      | For more information, see :ref:`ansible_legacy_substitution_value_auto_registration_setting`.

   #. | **Execute**
      | From the :menuselection:`Ansible-Legacy --> Execute` menu, select the desired Movement and Operation and execute them.
      | For more information, see :ref:`ansible_legacy_execution`.

   #. | **Confirm execution status**
      | From the :menuselection:`Ansible-Legacy --> Confirm execution status` menu,the status of all previously executed operations will be updated in realtime. Users can also monitor error logs and execution logs as well as stop them with an emergency stop.
      | For more information, see :ref:`ansible_legacy_check_operation_status`.

   #. | **Confirm execution history**
      | From the :menuselection:`Ansible-Legacy --> Execution management` menu, users can check the history of all previously executed operations..
      | For more information, see :ref:`ansible_legacy_execution_list`.


Ansible-Legacy menu operation
==========================================

| This section explains how to operate the Ansible-Legacy menus.


Basic console
--------------

| For more information regarding Basic console menu, see  :doc:`../it_automation_base/basic_console` 


Ansible common
-----------

| For more information regarding Ansible common menus, see :doc:`./ansible_common`


Ansible-Legacy
--------------

| This section explains how to operate the Ansible-Legacy menus.

.. _ansible_legacy_movement_list:

Movement list
~~~~~~~~~~~~

#. | Maintains (view.register/edit/discard) Movement information.

   .. figure:: /images/ja/ansible-legacy/movement_list/movement_list.png
      :width: 800px
      :alt: Submenu (Movement list) 

      Submenu (Movement list) 

#. | Press the :guilabel:`Register` button to register Movement information.

   .. figure:: /images/ja/ansible-legacy/movement_list/registration_movement_list.gif
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


.. _ansible_legacy_playbook_file_list:

Playbook file collection
~~~~~~~~~~~~~~

#. | Maintains (view/register/edit/discard) user created Playbooks.
   | For more information regarding describing Playbooks, see :ref:`ansible_legacy_write_playbook_ansible_legacy`.
   | The Playbook file collection menu will contains some sample Playbooks by default.
   | The Sample playbook names have names that starts with [Exastro standard]
   | Sample playbooks can be used by linking them to Movements.

   .. figure:: /images/ja/ansible-legacy/playbook_list/playbook_list_v2-4.png
      :width: 800px
      :alt: Submenu (Playbook file collection) 

      Submenu (Playbook file collection) 

#. | Press the :guilabel:`Register` button to register Playbooks.

   .. figure:: /images/ja/ansible-legacy/playbook_list/registration_playbook_list_v2-4.gif
      :width: 800px
      :alt: Registration page (Playbook file collection) 

      Registration page (Playbook file collection) 

#. | The items found in the registration page are as following.

   .. table:: Registration page item list (Playbook file collection) 
      :align: left

      +-----------------------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | Item                              | Description                                                                         | Input \   | Input \      | Restrictions           |
      |                                   |                                                                                     | required  | method       |                        |
      |                                   |                                                                                     |           |              |                        |
      +===================================+=====================================================================================+===========+==============+========================+
      | Item number                       | Displays an automatically numbered string of 36 characters.                         | －        | Automatic    | －                     |
      +-----------------------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | Playbook file name                | Input the name of the Playbook file.                                                | ○        | Manual       | Maximum length \       |
      |                                   |                                                                                     |           |              | 255 bytes              |
      +-----------------------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | Playbook file                     | Upload a Playbook file. The Playbook file must be created with Character co\.       | ○        | File \       | Maximum size 100mb     |
      |                                   | de UTF-8 without BOM                                                                |           | selection    |                        |
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
   | The variables defined within Playbooks files are extracted by internal processes.The variables can have specific values registered to them in :ref:`ansible_legacy_substitution_value_auto_registration_setting` 
   | The variables are not extracted in realtime, meaning that it may take time before they can be used in :ref:`ansible_legacy_substitution_value_auto_registration_setting` .

.. _ansible_legacy_movement_details:

Movement-Playbook link
~~~~~~~~~~~~~~~~~~~~~

#. | Maintains (view/register/edit/discard) links between Movements and Playbooks. 

   .. figure:: /images/ja/ansible-legacy/movement_playbook_link/movement_playbook_link.png
      :width: 800px
      :alt: Submenu (Movement-Playbook link) 

      Submenu (Movement-Playbook link) 

#. | Press the :guilabel:`Register` button to register Movement and Playbook links.

   .. figure:: /images/ja/ansible-legacy/movement_playbook_link/registration_movement_playbook_link.gif
      :width: 800px
      :alt: Registration page (Movement-Playbook link) 

      Registration page (Movement-Playbook link) 


#. | The items found in the registration page are as following.

   .. list-table:: Registration page item list (Movement-Playbook link) 
      :widths: 10 50 10 10 10
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
        - | Displays :menuselection:`Movement names` registered in :menuselection:`Ansible-Legacy --> Movement list`.
          | Select Movement.
        - 〇
        - List selection
        - Same as description.
      * - Playbook file
        - | Displays :menuselection:`Playbook file names` registered in :menuselection:`Ansible-Legacy --> Playbook file collection`.
          | Select the Playbook file that will be included in the Movement.
        - 〇
        - List selection
        - Same as description.
      * - Include order
        - | Input an include order (1～) for the Playbook.
          | The included Playbook files will be executed in order based on their include order (rising).
        - 〇
        - Manual
        - 1～2,147,483,647
      * - Remarks
        - Free description field
        - ー
        - Manual
        - Maximum length 4000 bytes


.. _ansible_legacy_substitution_value_auto_registration_setting:

Substitute value auto registration settings
~~~~~~~~~~~~~~~~~~
#. | Links (view/register/edit/discard) parameter item setting values and Movement variables.
   |The registered information is displayed in :menuselection:`Ansible-Legacy --> Substitute value management` and :menuselection:`Ansible-Legacy --> Target host` when executed by internal processes.

   .. figure:: /images/ja/ansible-legacy/substitution_value_automatic_setting/substitution_value_auto_registration_setting.png
      :width: 800px
      :alt: Submenu (Substitute value auto registration settings) 

      Submenu (Substitute value auto registration settings) 

#. | Press the :guilabel:`Register` button to register a link between the Movement variables and Parameter sheet item setting values

   .. figure:: /images/ja/ansible-legacy/substitution_value_automatic_setting/registration_substitution_value_automatic_setting.gif
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
      |                 | Substitute order| Input a :menuselection:`Substitute order` for the parameter sh\    | :ref:`※1 <ansible_legacy_parashi_\          | Manual       | 1～2,147,483,647            |
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
      | IaC variable \  | Movement name\  | Displays the Variable used by the files registered in :menusel\    | ○                                           | List \       | Same as description.        |
      | (To)            | :Variable name  | ection:`Ansible-Legacy --> Movement-Playbook link`.                |                                              | selection    |                             |
      |                 |                 |                                                                    |                                              |              |                             |
      |                 |                 | Select the desired Specified value of the item selected i\         |                                              |              |                             |
      |                 |                 | n :menuselection:`Parameter sheet (From)`.                         |                                              |              |                             |
      |                 +-----------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+
      |                 | Substitute order| Input for Multiple specific value variables.                       | :ref:`※2 <ansible_legacy_substitution>`     | Manual     | 1～2,147,483,647              |
      |                 |                 |                                                                    |                                              |              |                             |
      |                 |                 | Input a Susbtitute order for the specific value (1～). T\          |                                              |              |                             |
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

.. _ansible_legacy_parashi_substitution:

.. tip:: | ※1:Only required if the Parammeter sheet has Bundles active.
   | In order to link Movement variables with Parameter sheets with bundles, the user must input a substitute order for the Parameter sheet (From) in :menuselection:`Ansible-Legacy --> Substitute value auto registration settings`.
   | See the following figure for more information regarding the relationship between bundled parameter sheets and Substitute value auto registration settings.

   .. figure:: /images/ja/diagram/parameter.png
      :width: 600px
      :alt: Register Substitute value auto registration settings when using Bundled parameter sheets.


.. _ansible_legacy_substitution:

.. tip:: | ※2 **Input Substitute order**

   | In Ansible-Legacy, if no Substitute order is input, the variables will be handled as normal variables.
   | If Substitute order has been input, they will be handled as multiple specific value variables. Even If the Multiple Specific Value Variable doesnt need multiple specific values,
   |  (Specific value can be 1 or more),  make sure to input a substitute order.
   | Substitute orders does not need to succeed particular Multiple specific value variables.
   |
   | e.g.) Input Substitute order for multiple specific value variables and executing.

   #. | In :menuselection:`Ansible-Legacy --> Substitute value auto registration settings`, link Playbook variables and setting values for items registered to the Parameter sheets.

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

.. tip:: | **Output to Host variable file**
   | Only variables registered in the Substitute value auto registration settings menu are output to the Host variable file when executed.
   | Even if the Playbook variables are not registered to Substitute value auto registration settings, the user will be able to Execute them. However, executing Ansible with non-defined variables might cause an error.

.. _ansible_legacy_file_and_templete:

.. tip:: | **Examples using Playbook variables linked to File embedded variables and Template embedded variables**
   | e.g.)  If the File embedded variable, CPF_test, and Template embedded variable, TPF_sample, is linked to the Playbook variable in the Substitute value auto registration settings menu. 

   #. | Register the following in:menuselection:`Ansible common --> File management` / :menuselection:`Ansible common --> Template management`.

      .. list-table:: File management registration contents
         :widths: 50 40
         :header-rows: 1
         :align: left

         * - File embedded Variable name
           - File material
         * - CPF_test
           - test_file.txt

      .. list-table:: Template management registration contents
         :widths: 50 40
         :header-rows: 1
         :align: left

         * - Template embedded Variable name
           - Template file
         * - TPF_sample
           - sample.tpl

   #. | After creating "Ansible common:File management:File embedded variable name" and "Ansible common:Template management:Template embedded variable name" as Parameter sheet items in :menuselection:`Define/Create parameter sheet` , register File embedded variables and Template embedded variables as the Parameter sheets' item values. 

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

   #. | In :menuselection:`Ansible-Legacy --> Substitute value auto registration settings`, link the Playbook variable and the Item setting value of the Parameter sheet registered in Step 2. and Execute Ansible in  :menuselection:`Ansible-Legacy --> Execute`. 

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

   #. | Click the :menuselection:`Ansible-Legacy --> Confirm execution status`'s :guilabel:`Check substitute value` button to check that the  '{{ CPF_test }}' and '{{ TPF_sample }}' are dispalyed to the Specific value.

      .. figure:: /images/ja/ansible-legacyrole/assigned_value_management/general_operations_note.png
         :width: 800px
         :alt: Confirm execution status Substitute value management

         Confirm execution status Substitute value management


.. _ansible_legacy_execution:

Execute
~~~~~~~~

| Select a Movement from the Movement list.
| Select an Operation from the Operation list.
| There are 3 different types of execution types. Clicking the one of the execution buttons moves the user to :menuselection:`Ansible-Legacy --> Confirm execution status` where the execution process will start

.. figure:: /images/ja/ansible-legacy/execution/execution_screen.gif
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
   | Clicking the :guilabel:`Check Parameter` button allows users to check that the information registered in :menuselection:`Ansible-Legacy --> Substitute value auto registration settings` and the Operation and Movement link information is displayed to  :menuselection:`Ansible-Legacy --> Substitute value management` and :menuselection:`Ansible-Legacy --> Target host` without actually executing to the execution target.
   
.. tip:: |  **Specify reservation date**
   | Inputing a Reservation date allows users to reserve executions.
   | Reservation dates can only contain a date/time later than the current date/time.


.. _ansible_legacy_check_operation_status:

Confirm execution status
~~~~~~~~~~~~

| Allows users to monitor execution statuses.

.. figure:: /images/ja/ansible-legacy/check_work_status/check_operation_status.png
   :width: 800px
   :alt: Submenu (Confirm execution status) 

   Submenu (Confirm execution status) 

#. | **Execution status display**
   | The status matching the Execution status is displayed.
   | The execution log and error log also displays detailed information regarding the execution status.
   | If the execute type is "Execute", "Normal" will be displayed. If Dry run is selected, "Dry run". If Parameter check is selected, "Parameter check" will be displayed.
   | If the status ends in an unexpected error, a message will be displayed in the error log.
   | "Call Conductor" displays which Conductor was executed. This field will be blank if directly executed from Ansible-Legacy driver.

#. | **Confirm Target host**
   | Clicking the :guilabel:`Check Target host` button displays :menuselection:`Ansible-Legacy --> Target host` where hosts from Operations and Movements are displayed.

#. | **Confirm Substitute value**
   | Clicking the :guilabel:`Check Sbstitute value` button displays :menuselection:`Ansible-Legacy --> Substitute value management` where users can see Specific values and Variables from Operations and Movements.

#. | **Emergency stop/Delete reservation**
   | Users can press the :guilabel:`Emergency stop` button to stop the operation.
   | If the status was "Reserved execution", the :guilabel:`Delete reservation` button will be displayed. Check the :guilabel:`Delete reservation` button to delete the reservation

#. | **Display execution log**
   | When Ansible Automation Controller is executed, the Playbook is executed in units of the device to be built grouped by the item values of  :menuselection:`Ansible common --> Device list`'s  :menuselection:`User` ・ :menuselection:`Password` ・:menuselection:`ssh secret key file` ・ :menuselection:`Passphrase` ・ :menuselection:`Connection type` ・ :menuselection:`Instance group`, which splits the execution logs.
   | By specifying the number of job slices in the :menuselection:`Option parameter` in  :menuselection:`Ansible common --> Interface information` or :menuselection:`Ansible-Legacy --> Movement list`, the grouped targets can be further divided into the number of specified job slices before the Playbook is executed and the execution log is further divided.
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
   | For more information, see :ref:`ansible_legacy_the_linkage_between_the_input_data_used_during_ansible_execution_and_ita_menu`.

#. | **Result data**
   | Users can download execution logs and error logs.
   | For more information, see :ref:`ansible_legacy_the_linkage_between_the_output_data_used_during_ansible_execution_and_ita_menu`.

.. _ansible_legacy_execution_list:

Execution management
~~~~~~~~

| Allows userse to view execution histories.
   | Specify search conditions and press the :guilabel:`Filter` button to view a table of executions.
   | Pressing the :guilabel:`Details` button moves the user to :menuselection:`Ansible-Legacy --> Confirm execution status`  where they can view detailed information regarding the execution status.

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


.. _ansible_legacy_target_host:

Target host
~~~~~~~~~~~~~~

#. | Allows users to view Target hosts.

   .. figure:: /images/ja/ansible-legacy/work_taget_host/target_host.png
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


.. _ansible_legacy_substitution_value_list:

Substitute value management
~~~~~~~~~~

#. | Displays the Variable's specific values.


   .. figure:: /images/ja/ansible-legacy/assigned_value_management/substitution_value_list.png
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


.. _ansible_legacy_write_playbook_ansible_legacy:


Describing Playbook (Ansible-Legacy)
================================

| Playbooks uploaded to :ref:`ansible_legacy_playbook_file_list`  are executed in include format by the Master playbook generated by ITA.
| The Master Playbook are configured by the Header section and tasks section.

Header section
------------------

| Playbooks does not require a header section when being uploaded.
| Header sections have default values, but users can change them by using :menuselection:`Ansible-Legacy --> Movement list`'s :menuselection:`Header section`.
|
| ▼Header section default value

.. code-block:: yaml

     - hosts: all
       remote_user: "{{ __loginuser__ }}"
       gather_facts: no
       become: yes
     # For winrm connections, "become: yes" is ommited.

tasks section
---------------

| Uploaded Playbooks are executed in include format by the Master playbook generated by ITA.
| For more information regarding Playbooks, see Ansible's official manuals.
|
| e.g.) Playbook example

.. code-block:: yaml

   - name: Comment
     template:
       src:   "{{ item.src }}"
       dest:  "{{ item.dest }}"
       owner: "{{ item.owner is none |ternary('root', item.owner) }}"
       group: "{{ item.group is none |ternary('bacula', item.group) }}"
       mode:  "{{ item.mode is none |ternary('0654', item.mode) }}"


| Uploaded Playbooks are included according to  :menuselection:`Ansible-Legacy --> Movement-Playbook link`'s :menuselection:`Include order`.

.. figure:: /images/ja/diagram/legacy_session.png
   :align: center
   :width: 8.85417in
   :height: 6.67187in


Appendix
====

.. _ansible_legacy_the_linkage_between_the_input_data_used_during_ansible_execution_and_ita_menu:

Link between ITA menus and Input data when executing Ansible
--------------------------------------------------------

| Information from the different ITA menus are extracted in order to create input data required to execute Ansible. When this happens, :menuselection:`Password` items in the :menuselection:`Ansible common --> Device list` menu and items with their :menuselection:`Sensitive settings` set to "True" in the :menuselection:`Ansible-Legacy --> Substitute value management` menu.
| The Input data can be downloaded from the :menuselection:`Ansible-Legacy --> Confirm execution status` menu's :menuselection:`Input data`.
| Useres can also directly execute Ansible by unzipping the downloaded input data in a specified directory.
|
| The relationships between the different data and ITA menus are as following.

Ansible-Legacy input data
~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table:: Ansible-Legacy input data
   :widths: 20 20 30 20
   :header-rows: 1
   :align: left

   * - Menu group
     - Menu
     - Item
     - Directory unzip path
   * - Ansible-Legacy
     - Playbook file collection
     - Playbook
     - /child_playbooks
   * - Ansible common
     - Template management
     - Template file
     - /template_files
   * - Ansible common
     - File management
     - File material
     - /copy_files
   * - Ansible-Legacy
     - Substitute value management
     - Specific value (File) 
     - /upload_files
   * - Ansible common
     - Global value management
     - Variable name/Specific value
     - /host_vars
   * - Ansible-Legacy
     - Substitute value management
     - Variable name/Specific value
     - /host_vars
   * - Ansible-Legacy
     - template management
     - Template embedded variable
     - /host_vars
   * - Ansible-Legacy
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
   * - Ansible-Legacy
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
   * - Ansible-Legacy
     - Movement-Playbook link
     - Playbook name・include order
     - /playbook.yml

.. _ansible_legacy_the_linkage_between_the_output_data_used_during_ansible_execution_and_ita_menu:

Result data created when executing Ansible
-----------------------------------

| The results from executing "Input data" with Ansible are saved as "Result data" in a ZIP file.
| "Result data" can be downloaded from :menuselection:`Ansible-Legacy --> Confirm execution status` menu's :menuselection:`Result data` in a ZIP file.


File list saved to Legacy result data
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table:: File list saved to Legacy result data
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

