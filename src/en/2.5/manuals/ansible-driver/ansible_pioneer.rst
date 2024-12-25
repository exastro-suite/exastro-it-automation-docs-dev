===============
Ansible-Pioneer
===============

Introduction
========

| This document aims to explains how to use Ansible-Pioneer.

Ansible-Pioneer overview
===================

| Ansible-Pioneer adds original modules to Ansible, alowing users to input configuration in an interactive format.
| Servers, storage and network devices that log in through Telnet and SSH can be used.

Ansible-Pioneer Menu structure
============================

| This section explains the Ansible-Pioneer menu structure.

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

3. | **Ansible-Pioneer menus**

| The Ansible-Pioneer menus are as following.

.. list-table::  Ansible-Pioneer menu list
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
     - Interactive type
     - Manages Interactive types that compiles interactive files for the same goal.
   * - 3
     - OS type
     - Manages the OS type of the target device.
   * - 4
     - Interactive file colletion
     - Manage the OS type linked with the Interactive type and the ITA system original format work procedure file (hereinafter refered to as Interactive files.).
   * - 5
     - Movement-Interactive type link
     - Manages links between Movements and Interactive types for the Interactive file.
   * - 6
     - Substitute value auto registration settings
     - Manages movements and variables that link items and values for each operation registered in the parameter sheet menu.
   * - 7
     - Execute
     - Executes selected Movements and Operations.
   * - 8
     - Execution management
     - Managed execution history.
   * - 9
     - Check operation status
     - Displays the status of executions.
   * - 10
     - Target host
     - Manages target hosts.
   * - 11
     - Substitute value management
     - Manages variable substitute values.
   * - 12
     - Movement-variable link  (※1) 
     - Manages links between Movements and variables.

.. tip:: | ※1 Hidden menus are internal functions used to register and edit data.
    | There are some hidden menus configured when the Ansible-Legacy driver function is installed.
    | In order to display hidden menus, go to the :menuselection:`Management console-->Role/Menu link management` menu and restore the desired menus. For more information, see :doc:`../it_automation_base/management_console`.
    | Make sure to not register any data to these menus.


Ansible-Pioneer procedure
=======================

| This section explains how to use Ansible-Pioneery.

Ansible-Pioneer workflow
-------------------------

| A standard workflow using Ansible-Pioneer can be seen below.

-  **Workflow details and references**

   #. | **Register OS type**
      | From the :menuselection:`Ansible-Pioneer --> OS type` menu, register the OS type of the target device.
      | For more information, see :ref:`ansible_pioneer_os_types`.

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
      | From the :menuselection:`Ansible-Pioneer --> Movement list` menu, register a Movement.
      | For more information, see :ref:`ansible_pioneer_movement_list`.

   #. | **Register Interactive type**
      | From the :menuselection:`Ansible-Pioneer --> Interactive type` menu, register an Interactive type.
      | For more information, see :ref:`ansible_pioneer_dialog_type_list`.

   #. | **Register Interactive file**
      | From the :menuselection:`Ansible-Pioneer --> Interactive file colletion` menu, register an interactive file for the Interactive type OS type combination.
      | For more information, see :ref:`ansible_pioneer_dialog_files`.

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

   #. | **Register Interactive file to Movement**
      | From the :menuselection:`Ansible-Pioneer --> Movement-Interactive type link` menu, register a link between the Interactive file and Movement.
      | For more information, see :ref:`ansible_pioneer_movement_details`.

   #. | **Create parameter sheet**
      | From the :menuselection:`Create/Define parameter sheets` menu, create a Parameter sheet which will have data registered to it that can configure settings for the target.
      | For more information, see :doc:`../create_param/menu_creation`.

   #. | **Register data to Parameter sheet**
      | Register data to the parameter sheet created in the previous step.
      | For more information, see :doc:`../create_param/menu_creation`.

   #. | **Substitute value auto registration settings**
      | From the :menuselection:`Ansible-Pioneer --> Substitute value auto registration settings` menu, link the Movement variables with the Parameter sheet's item's setting values.
      | For more information, see :ref:`ansible_pioneer_substitution_value_auto_registration_setting`.

   #. | **Execute**
      | From the :menuselection:`Ansible-Pioneer --> Execute` menu, select the desired Movement and Operation and execute them.
      | For more information, see :ref:`ansible_pioneer_execution`.

   #. | **Confirm execution status**
      | From the :menuselection:`Ansible-Pioneer --> Confirm execution status` menu,the status of all previously executed operations will be updated in realtime. Users can also monitor error logs and execution logs as well as stop them with an emergency stop.
      | For more information, see :ref:`ansible_pioneer_check_operation_status`.

   #. | **Confirm execution history**
      | From the :menuselection:`Ansible-Pioneer --> Execution management` menu, users can check the history of all previously executed operations..
      | For more information, see :ref:`ansible_pioneer_execution_list`.


Ansible-Pioneer Menu operation
====================================

| This section explains how to operate the Ansible-Pioneer menus.


Basic console
--------------

| For more information regarding Basic console menu, see  :doc:`../it_automation_base/basic_console` 


Ansible common
-----------

| For more information regarding Ansible common menus, see :doc:`./ansible_common`


Ansible-Pioneer
---------------

| This section explains how to operate the Ansible-Pioneer menus.

.. _ansible_pioneer_os_types:

OS type
~~~~~~
#. | Maintains (view/register/edit/discard) target devices' OS types.

   .. figure:: /images/ja/ansible_pioneer/os_type_list/os_type_list.png
      :width: 800px
      :alt: Submenu （OS type）

      Submenu （OS type）

#. | Press the :guilabel:`Register` button to register an OS type.

   .. figure:: /images/ja/ansible_pioneer/os_type_list/registration_os_type_list.gif
      :width: 800px
      :alt: Registration page (Movement list) 

      Registration page (Movement list) 


#. | The items found in the registration page are as following.

   .. table:: Registration page item list（OS type）
      :align: left

      +----------------------------+------------------------------------------------------------------------+--------------------+-----------------------+-------------------------------------------------+
      | Item                       | Description                                                            | Input required     | Input method          | Restriction                                     |
      +============================+========================================================================+====================+=======================+=================================================+
      | Item number                | Displays an automatically numbered string of 36 characters.            | ー                 | Automatic             | ー                                              |
      +----------------------------+------------------------------------------------------------------------+--------------------+-----------------------+-------------------------------------------------+
      | OS type name               | Input a name for the OS ty                                             | 〇                 | Manual                | Maximum length 255 bytes                        |
      +-------------+--------------+------------------------------------------------------------------------+--------------------+-----------------------+-------------------------------------------------+
      |             | SV           | Set to "True" if the target device is a Server device.                 | ー                 | List selection        | ー                                              |
      |             +--------------+------------------------------------------------------------------------+--------------------+-----------------------+-------------------------------------------------+
      | Device type | NW           | Set to "True" if the target device is a Network device.                | ー                 | List selection        | ー                                              |
      |             +--------------+------------------------------------------------------------------------+--------------------+-----------------------+-------------------------------------------------+
      |             | ST           | Set to "True" if the target device is a Storage device.                | ー                 | List selection        | ー                                              |
      +-------------+--------------+------------------------------------------------------------------------+--------------------+-----------------------+-------------------------------------------------+
      | Remarks                    | Free description field                                                 | ー                 | Manual                | ー                                              |
      +----------------------------+------------------------------------------------------------------------+--------------------+-----------------------+-------------------------------------------------+


.. _ansible_pioneer_movement_list:

Movement list
~~~~~~~~~~~~

#. | Maintains (view.register/edit/discard) Movement information.

   .. figure:: /images/ja/ansible_pioneer/movement_list/movement_list.png
      :width: 800px
      :alt: Submenu (Movement list) 

      Submenu (Movement list) 

#. | Press the :guilabel:`Register` button to register Movement information.

   .. figure:: /images/ja/ansible_pioneer/movement_list/registration_movement_list.gif
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
      |                 | Number of paral\| Input a value in order to specify "--forks" in the ansible-playbo\      | ー        | Manual       | 1～4,294,967,296  |
      |                 | lel executions  | ok command's optional parameter.                                        |           |              |                   |
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

   .. tip:: | ※1  Select from data fetched from :ref:`ansible_common_aac_sync`.


.. _ansible_pioneer_dialog_type_list:

Interactive type
~~~~~~~~

#. | Maintains (view/register/edit/discard) Interactive types.
   | In Ansible-Pioneer, define differences per OS type in Interactive files, and dialogue files with the same purpose are grouped together as 'Interactive type' to absorb (extract) differences.

   .. figure:: /images/ja/ansible_pioneer/dialog_type_list/dialog_type_list_v2-4.png
      :width: 800px
      :alt: Submenu （Interactive type）

      Submenu （Interactive type）

#. | Press the :guilabel:`Register` button to register an Interactive type.

   .. figure:: /images/ja/ansible_pioneer/dialog_type_list/registration_dialog_type_list_v2-4.gif
      :width: 800px
      :alt: Registration page（Interactive type）

      Registration page（Interactive type）

#. | The items found in the registration page are as following.

   .. list-table:: Registration page item list（Interactive type）
      :widths: 15 50 5 10 20
      :header-rows: 1
      :align: left

      * - Item
        - Description
        - Input required
        - Input method
        - Restrictions
      * - Item number
        - Displays an automatically numbered string of 36 characters.
        - ー
        - Automatic
        - ー
      * - Interactive type name
        - Input a name for the Interactive type.
        - 〇
        - List selection
        - Maximum length 255 bytes
      * - Remarks
        - Free description field
        - ー
        - Manual
        - Maximum 4000 bytes


.. _ansible_pioneer_dialog_files:

Interactive file colletion
~~~~~~~~~~~~~~~~~~

#. | Maintains (view/register/edit/discard) user created interactive files
   | For more information regarding writing Interactive files, see :ref:`ansible_pioneer_write_dialog_file_ansible_pioneer`.
   | Register Interactive file for each Interactive type and OS type combination.
   | In order to have multiple OS work for 1 Interactive type, the user must register an Interactive file for each OS type.

   .. figure:: /images/ja/ansible_pioneer/dialog_list/dialog_list.png
      :width: 800px
      :alt: Submenu （Interactive file colletion）

      Submenu （Interactive file colletion）

#. | Press the :guilabel:`Register` button to register Interactive file materials.

   .. figure:: /images/ja/ansible_pioneer/dialog_list/registration_dialog_list.gif
      :width: 800px
      :alt: Registration page（Interactive file colletion）

      Registration page（Interactive file colletion）

#. | The items found in the registration page are as following.

   .. table:: Registration page item list（Interactive file colletion）
      :align: left

      +-----------------------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | Item                              | Description                                                                         | Input \   | Input \      | Restrictions           |
      |                                   |                                                                                     | required  | method       |                        |
      |                                   |                                                                                     |           |              |                        |
      +===================================+=====================================================================================+===========+==============+========================+
      | Item number                       | Displays an automatically numbered string of 36 characters.                         | －        | Automatic    | －                     |
      +-----------------------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | Interactive type name             | Displays :menuselection:`Interactive type`  registered in  \                        | ○        | List \       | Same as description.   |
      |                                   | :menuselection:`Ansible-Pioneer --> Interactive type`                               |           | selection    |                        |
      |                                   |                                                                                     |           |              |                        |
      |                                   | Select the Interactive type of the Interactive file.                                |           |              |                        |
      +-----------------------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | OS type                           | Displays :menuselection:`OS types` registered in  \                                 | ○        | List \       | Same as description.   |
      |                                   | :menuselection:`Ansible-Pioneer --> OS type`.                                       |           | selection    |                        |
      |                                   |                                                                                     |           |              |                        |
      |                                   | Select the OS type of the registered Interactive file.                              |           |              |                        |
      +-----------------------------------+-------------------------------------------------------------------------------------+-----------+--------------+------------------------+
      | Interactive file material         | Upload an interactive file for the :menuselection:`Interactive type` an\            | ○        | File \       | Maximum size 100MB     |
      |                                   | d :menuselection:`OS type` combination.                                             |           | selection    |                        |
      |                                   |                                                                                     |           |              |                        |
      |                                   | The file's Character code must be UTF-8 without BOM.                                |           |              |                        |
      |                                   |                                                                                     |           |              |                        |
      |                                   | Interactive files must follow YAML format rules.                                    |           |              |                        |
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

.. warning:: | **When variables defined within Interactive files are extracted**
   | The variables defined within Interactive files are extracted by internal processes.The variables can have specific values registered to them in :ref:`ansible_pioneer_substitution_value_auto_registration_setting` 
   | The variables are not extracted in realtime, meaning that it may take time before they can be used in :ref:`ansible_pioneer_substitution_value_auto_registration_setting` .

.. _ansible_pioneer_movement_details:

Movement-Interactive type link
~~~~~~~~~~~~~~~~~~~~~

#. | Maintains (view/register/edit/discard) links between Movements and Interactive types.

   .. figure:: /images/ja/ansible_pioneer/movement_dialog_link/movement_dialog_link.png
      :width: 800px
      :alt: Submenu （Movement-Interactive type link）

      Submenu （Movement-Interactive type link）

#. | Press the :guilabel:`Register` button to register Movement and Interactive type links.

   .. figure:: /images/ja/ansible_pioneer/movement_dialog_link/registration_movement_dialog_link.gif
      :width: 800px
      :alt: Registration page（Movement-Interactive type link）

      Registration page（Movement-Interactive type link）

#. | The items found in the registration page are as following.

   .. list-table:: Registration page item list（Movement-Interactive type linkの場合）
      :widths: 15 50 5 10 20
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
      * - Interactive file type
        - | Displays :menuselection:`Interactive types` registered in :menuselection:`Ansible-Pioneer --> Interactive type`.
          | Select the Interactive type for the Interactive file.
          | The Interactive file linked to the execution target's OS type and Interactive type can be executed.
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


.. _ansible_pioneer_substitution_value_auto_registration_setting:

Substitute value auto registration settings
~~~~~~~~~~~~~~~~~~
#. | Links (view/register/edit/discard) parameter item setting values and Movement variables.
   |The registered information is displayed in :menuselection:`Ansible-Pioneer --> Substitute value management` and :menuselection:`Ansible-Pioneer --> Target host` when executed by internal processes.

   .. figure:: /images/ja/ansible_pioneer/substitution_value_automatic_setting/substitution_value_auto_registration_setting.png
      :width: 800px
      :alt: Submenu (Substitute value auto registration settings) 

      Submenu (Substitute value auto registration settings) 

#. | Press the :guilabel:`Register` button to register a link between the Movement variables and Parameter sheet item setting values

   .. figure:: /images/ja/ansible_pioneer/substitution_value_automatic_setting/registration_substitution_value_automatic_setting.gif
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
      |                 | Substitute order| Input a :menuselection:`Substitute order` for the parameter sh\    | :ref:`※1 <ansible_Pioneer_parashi_\         | Manual       | 1～2,147,483,647            |
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
      |                                   | selection:`Ansible-Pioneer --> Movement list`.                     |                                              | selection    |                             |
      |                                   |                                                                    |                                              |              |                             |
      |                                   | Select a Movement.                                                 |                                              |              |                             |
      +-----------------+-----------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+
      | IaC variable \  | Movement name\  | Displays the Variable used by the files registered in :menusel\    | ○                                           | List \       | Same as description.        |
      | (To)            | :Variable name  | ection:`Ansible-Pioneer --> Movement-Playbook link`.               |                                              | selection    |                             |
      |                 |                 |                                                                    |                                              |              |                             |
      |                 |                 | Select the desired Specified value of the item selected i\         |                                              |              |                             |
      |                 |                 | n :menuselection:`Parameter sheet (From)`.                         |                                              |              |                             |
      |                 +-----------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+
      |                 | Substitute order| Input for Multiple specific value variables.                       | :ref:`※2 <ansible_Pioneer_substitution>`    | Manual       | 1～2,147,483,647            |
      |                 |                 |                                                                    |                                              |              |                             |
      |                 |                 | Input a Susbtitute order for the specific value (1～). T\          |                                              |              |                             |
      |                 |                 | he substitue order is in raising order. Input substitute order(1\  |                                              |              |                             |
      |                 |                 | ～) even when there are no multiple specific values.               |                                              |              |                             |
      +-----------------+-----------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+
      | NULL連携                          | If the specific value for the parameter sheet in :menuselecti\     | ー                                           | List \       | Same as description.        |
      |                                   | on:`Ansible-Pioneer --> Substitute value management`is NULL, se\   |                                              | selection    |                             |
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
      |                                   |     e :menuselection:`Ansible-Pioneer --> Substit\                 |                                              |              |                             |
      |                                   |     ute value management.                                          |                                              |              |                             |
      |                                   |                                                                    |                                              |              |                             |
      |                                   | If nothing is selected, the \                                      |                                              |              |                             |
      |                                   | :menuselection:`Ansible common --> Interface information`'s\       |                                              |              |                             |
      |                                   | :menuselection:`NULL link` value will be applied.                  |                                              |              |                             |
      |                                   |                                                                    |                                              |              |                             |
      +-----------------------------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+
      | Remarks                           | Free description field                                             | ー                                           | Manual       | Maximum length 4000 bytes       |
      +-----------------------------------+--------------------------------------------------------------------+----------------------------------------------+--------------+-----------------------------+

.. _ansible_pioneer_parashi_substitution:

.. tip:: | ※1:Only required if the Parammeter sheet has Bundles active.
   | In order to link Movement variables with Parameter sheets with bundles, the user must input a substitute order for the Parameter sheet (From) in :menuselection:`Ansible-Pioneer --> Substitute value auto registration settings`.
   | See the following figure for more information regarding the relationship between bundled parameter sheets and Substitute value auto registration settings.

   .. figure:: /images/ja/diagram/parameter.png
      :width: 600px
      :alt: Register Substitute value auto registration settings when using Bundled parameter sheets.


.. _ansible_pioneer_substitution:

.. tip:: | ※2 **Input Substitute order**

   | In Ansible-Legacy, if no Substitute order is input, the variables will be handled as normal variables.
   | If Substitute order has been input, they will be handled as multiple specific value variables. Even If the Multiple Specific Value Variable doesnt need multiple specific values,
   |  (Specific value can be 1 or more),  make sure to input a substitute order.
   | Substitute orders does not need to succeed particular Multiple specific value variables.
   |
   | e.g.) Input Substitute order for multiple specific value variables and executing.

   #. | In :menuselection:`Ansible-Pioneer --> Substitute value auto registration settings`s link Role variables and th setting values for items registered to the Parameter sheets.

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


.. _ansible_pioneer_file_and_templete:

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
         | test-host      | test-ope               | CPF_test        | TPF_sample  |
         +----------------+------------------------+-----------------+---------------------+

   #. | In :menuselection:`Ansible-Pioneer --> Substitute value auto registration settings`, link the Playbook variable and the Item setting value of the Parameter sheet registered in Step 2. and Execute Ansible in  :menuselection:`Ansible-Legacy --> Execute`. 

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

   #. | Click the :menuselection:`Ansible-Pioneer --> Confirm execution status`'s :guilabel:`Check substitute value` button to check that the  '{{ CPF_test }}' and '{{ TPF_sample }}' are dispalyed to the Specific value.

      .. figure:: /images/ja/ansible-legacyrole/assigned_value_management/general_operations_note.png
         :width: 800px
         :alt: Confirm execution status Substitute value management

         Confirm execution status Substitute value management


.. _ansible_pioneer_execution:

Execute
~~~~~~~~
| Select a Movement from the Movement list.
| Select an Operation from the Operation list.
| There are 3 different types of execution types. Clicking the one of the execution buttons moves the user to :menuselection:`Ansible-LegacyRole --> Confirm execution status` where the execution process will start

.. figure:: /images/ja/ansible_pioneer/execution/execution_screen.gif
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
   | Clicking the :guilabel:`Check Parameter` button allows users to check that the information registered in :menuselection:`Ansible-Pioneer --> Substitute value auto registration settings` and the Operation and Movement link information is displayed to  :menuselection:`Ansible-Legacy --> Substitute value management` and :menuselection:`Ansible-Legacy --> Target host` without actually executing to the execution target.
   
.. tip:: |  **Specify reservation date**
   | Inputing a Reservation date allows users to reserve executions.
   | Reservation dates can only contain a date/time later than the current date/time.


.. _ansible_pioneer_check_operation_status:

Confirm execution status
~~~~~~~~~~~~

| Allows users to monitor execution statuses.

.. figure:: /images/ja/ansible_pioneer/check_work_status/check_operation_status.png
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
   | By specifying the number of job slices in the :menuselection:`Option parameter` in  :menuselection:`Ansible common --> Interface information` or :menuselection:`Ansible-Pioneer --> Movement list`, the grouped targets can be further divided into the number of specified job slices before the Playbook is executed and the execution log is further divided.
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
   | For more information, see :ref:`ansible_pioneer_the_linkage_between_the_input_data_used_during_ansible_execution_and_ita_menu`.

#. | **Result data**
   | Users can download execution logs and error logs.
   | For more information, see :ref:`ansible_pioneer_the_linkage_between_the_output_data_used_during_ansible_execution_and_ita_menu`.

.. _ansible_pioneer_execution_list:

Execution management
~~~~~~~~

   | Allows userse to view execution histories.
   | Specify search conditions and press the :guilabel:`Filter` button to view a table of executions.
   | Pressing the :guilabel:`Details` button moves the user to :menuselection:`Ansible-Pioneer --> Confirm execution status`  where they can view detailed information regarding the execution status.

.. figure:: /images/ja/ansible_pioneer/work_management/execution_list.png
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


.. _ansible_pioneer_target_host:

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


.. _ansible_pioneer_substitution_value_list:

Substitute value management
~~~~~~~~~~

#. | Displays the Variable's specific values.


   .. figure:: /images/ja/ansible_pioneer/assigned_value_management/substitution_value_list.png
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


.. _ansible_pioneer_write_dialog_file_ansible_pioneer:

Writing Interactive files （Ansible-Pioneer）
=========================================

| Ansible-Pioneer sends ITA original modules to Ansible.

| This section explains the Terminology used in the following sections.

.. list-table:: Terminology
      :widths: 10 50
      :header-rows: 1
      :align: left

      * - Terminology
        - Description
      * - Command prompt
        - Strings waiting for command input when ssh connecting to the target server from a terminal, 
      * - Standard output
        - Command process result output from the Command prompt after input a command to the target server.

.. figure:: /images/ja/diagram/ansible_pioneer_command_prompt.png
   :alt: Command prompt standard output

   Command prompt standard output


Interactive file structure
------------------

| Interactive files are configured by 2 types of sections.

.. table:: Interactive file section list
   :align: Left

   +------------------+------------------------------------------------------+
   | Section name     | Application                                          |
   +==================+======================================================+
   | conf             | Specify the timeout value according to timeout p\    |
   |                  | arameter.                                            |
   |                  | timeout value: 1~3600(unit:second)                   |
   +------------------+------------------------------------------------------+
   | exe_list         | Construct the target host with 4 kinds of dial\      |
   |                  | og commands.                                         |
   +------------------+------------------------------------------------------+

| This section describes the conf session's timeout parameter.

- | e.g.）conf session's timeout parameter example

  .. code-block:: yaml

     # Comment
     conf:
     △△timeout: 10
     exec_list:

     △:half width space

| ITA original module connects to the target through SSH or telnet connection when the Interactive file is executed.
| Depending on the case, users might need to go through a password authentication at the start of the exec_list session proccess.

- | e.g.）Password authentication input example.

  .. code-block:: yaml

     exec_list:
       # Wait for ssh connection password input prompt and input the correct password.
       - expect: '*assword'
         exec: 'password'


| This section explains the different interactive modules.

Interactive Module
--------------

| There are 4 kinds of dialog commands as follows.

.. table:: Interactive Module list
  :align: Left

  +---------------------+--------------------------------------------------------+
  | Module              | Application                                            |
  +=====================+========================================================+
  | expect              | Input commands after  waiting for the comma\           |
  |                     | nd prompt from the target host.                        |
  +---------------------+--------------------------------------------------------+
  | state               | Input the command to target host. The contents of th\  |
  |                     | e standard output until the prompt is output to the st\|
  |                     | andard output are analyzed by external shell, an\      |
  |                     | d the result is determined.                            |
  +---------------------+--------------------------------------------------------+
  | command             | Loops and conditional branching can be performed bef\  |
  |                     | ore and after inputting commands to the target host.   |
  +---------------------+--------------------------------------------------------+
  | localaction         | Input command in the environment Ansible Core/Ansibl\  |
  |                     | e Automation Controller is executed.                   |
  +---------------------+--------------------------------------------------------+

expect module
~~~~~~~~~~~~~~~~

Overview 
****
| Input commands after  waiting for the command prompt from the target host.
| The overview figure for the expect module are as following.
   
.. figure:: /images/ja/diagram/ansible-pioneer-expect-exec.png
   :alt: expect overview


| ①Waits for the output of the expected string (prompt) form the contents that the target host outputs for the standard input.
| ②Inputs command specified by exec.
| ③Waits for command prompt specified by the expect from the standard output of the command input in②.
| ④Inputs command specified by exec.


Format
****
| The expect module format are as following.

.. table:: expect module format
   :widths: 20 40 10 60
   :align: Left

   +----------------------+------------------------------------+------------+------------------------------------------------------------------------------------+
   | Parameter　          | Format                             | Required   | Description　                                                                      |
   +======================+====================================+============+====================================================================================+
   | expect               | .. code-block:: yaml               | Required   | Input command prompt. Can be input as regular expression.                          |
   |                      |                                    |            |                                                                                    |
   |                      |    exec_list:                      |            | If the command prompt does not recieve within the time period specified in the c.\ |
   |                      |    △△-△expect:△Parameter value |            |                                                                                    |
   |                      |                                    |            | onf->timeout parameter, the interactive file end in an error                       |
   |                      |    △:half width space             |            |                                                                                    |
   |                      |                                    |            |                                                                                    |
   +----------------------+------------------------------------+------------+------------------------------------------------------------------------------------+
   | exec                 | .. code-block:: yaml               | Required   | Input the command that will be input after the command prompt defin\               |
   |                      |                                    |            | ed by expect recieves something.                                                   |
   |                      |    exec_list:                      |            |                                                                                    |
   |                      |    △△-△expect:△Parameter value |            |                                                                                    |
   |                      |    △△△△exec:△Parameter value  |            |                                                                                    |
   |                      |                                    |            |                                                                                    |
   |                      |    △:half width space             |            |                                                                                    |
   |                      |                                    |            |                                                                                    |
   +----------------------+------------------------------------+------------+------------------------------------------------------------------------------------+

Input example
******
| This section cotnains expect module input examples.

- | e.g.）expect module input example.

  .. code-block:: yaml

     # Wait for ssh connection password input prompt and input the correct password.
     - expect: '*assword'
       exec: 'password'


state module
~~~~~~~~~~~~~~~~

Overview 
****
| After submitting commands to the working host and waiting for the command prompt, the contents of the standard output are analysed by an external Shell to determine the results.
| The overview figure for the state module are as following.
   
.. figure:: /images/ja/diagram/ansible-pioneer-state.png
   :alt: state module overview


| ①Wait for the output of the expected string (prompt) form the contents that the target host outputs for the standard input.
| ②Input command specified by state.
| ③Wait for command prompt specified by the expect from the standard output of the command input in②.
| ④Save standard output contents to the file specified by stdout_file.
| ⑤grep the contents of the stdout_file with the word(s) specified with parameter.
| ⑥Inputs return so the command prompt can wait for new commands after the process.

Format
****
| statemodule format are as following.

.. table:: state module format
   :widths: 20 40 10 60
   :align: Left

   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | Parameter 　         | Format                                   | Required  | Description　                                                                       |
   +======================+==========================================+============+====================================================================================+
   | state                | .. code-block:: yaml                     | Required   | Input the input command.                                                           |
   |                      |                                          |            |                                                                                    |
   |                      |    exec_list:                            |            |                                                                                    |
   |                      |    △△-△state:△Parameter value        |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   |                      |    △:half width space                   |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | prompt               | .. code-block:: yaml                     | Required   |  Input Command prompt. Can be input as regular expression.                         |
   |                      |                                          |            |                                                                                    |
   |                      |    exec_list:                            |            | If the command prompt does not recieve within the time period specified in the c.\ |
   |                      |    △△-△state:△Parameter value        |            | onf->timeout parameter, the interactive file end in an error                       |
   |                      |    △△△△prompt:△Parameter value      |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   |                      |    △:half width space                   |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | shell                | .. code-block:: yaml                     | Optional       | Specify the shell file name to check the result with the created shell.            |
   |                      |                                          |            |                                                                                    |
   |                      |    exec_list:                            |            |                                                                                    |
   |                      |    △△-△state:△Parameter value        |            | If the exit code of the created shell is 0, the result is determ\                  |
   |                      |    △△△△shell:△Parameter value       |            | ined as normal, and the others are abnormal.                                       |
   |                      |                                          |            | This parameter is not required when checking the result with default shell.        |
   |                      |    △:half width space                   |            |                                                                                    |
   |                      |                                          |            | The default shell will grep the contents of standard output with the string spe\   |
   |                      |                                          |            | cified by parameter (-).                                                           |
   |                      |                                          |            | If there is at least one matching row, the result is determined normal, and if th\ |
   |                      |                                          |            | ere is no matching row, the result is determined to be abnormal.                   |
   |                      |                                          |            | In addition, if the parameter is not specified, the result will be determ\         |
   |                      |                                          |            | ined as abnormal.                                                                  |
   |                      |                                          |            | In the case of using the parameter to save the command result (standard output) t\ |
   |                      |                                          |            | o the file specified by stdout_file, please specifiy yes for ignore_errors.        |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | For parameters and arguments for when running user created shells, see the follow\ |
   |                      |                                          |            | ing description.                                                                   |
   |                      |                                          |            | user created shell $1 $2～                                                         |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | 　　　$1: stdout_file                                                              |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | 　　　　　If stdout_file is not written, it will be a file name generated by ITA   |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | 　　　$2～: parameter contents                                                     |
   |                      |                                          |            |                                                                                    |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | parameter            | .. code-block:: yaml                     | Optional       | Specify the string to search for the result (standard output) of the input command.|
   |                      |                                          |            | Enumerate the criteria strings if there are multiple of them.                      |
   |                      |    exec_list:                            |            |                                                                                    |
   |                      |    △△-△state:△Parameter value        |            | If the shell is specified, the strings will become the parameters duri\            |
   |                      |    △△△△parameter:                    |            | ng shell execution.                                                                |
   |                      |    △△△△△△-△'Parameter value'      |            |                                                                                    |
   |                      |    △△△△△△-△'Parameter value'      |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   |                      |    △:half width space                   |            |                                                                                    |
   |                      |    ' :Single quotation                   |            |                                                                                    |
   |                      |       Enclose variables with single \    |            |                                                                                    |
   |                      |       quotations                         |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | stdout_file          | .. code-block:: yaml                     | Optional       | The file that saves the result (standard output) of the input command.             |
   |                      |                                          |            |                                                                                    |
   |                      |    exec_list:                            |            | If stdout_file is not specified, the name will be generated by ITA                 |
   |                      |    △△-△state:△Parameter value        |            |                                                                                    |
   |                      |    △△△△stdout_file:△Parameter value |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   |                      |    △:half width space                   |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | success_exit         | .. code-block:: yaml                     | Optional       | Specify "yes" to exit the dialog normally if the search result is normal and spec\ | 
   |                      |                                          |            | ify no to proceed to the next. "no" is set on default.                             |
   |                      |    exec_list:                            |            |                                                                                    |
   |                      |    △△-△state:△Parameter value        |            | If "no" is specified, the process will continue if the process succeeds.           |
   |                      |    △△△△success_exit:△<yes/no>       |            |                                                                                    |
   |                      |                                          |            | Default is "no"                                                                    |
   |                      |    △:half width space                   |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | ignore_errors        | .. code-block:: yaml                     | Optional       | Specify "yes" to proceed to the next even if the search result is abnormal.        |
   |                      |                                          |            |                                                                                    |
   |                      |    exec_list:                            |            | If "no" is specified, the interactive file will end if abnormal.                   |
   |                      |    △△-△state:△Parameter value        |            |                                                                                    |
   |                      |    △△△△ignore_errors:△<yes/no>      |            | Default is "no"                                                                    |
   |                      |                                          |            |                                                                                    |
   |                      |    △:half width space                   |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+


Input examples
******
| This section contains state module Input examples

- | e.g.）state module Input examples

  .. code-block:: yaml

    # cat the hosts file and grep the displayed results with parameter value.
    # If there is line containing 127.0.0.1 or lalhost, the result is determined as normal and proceed to the next.
    # If there is no such line, the result is determined as abnormal and the interactive file is terminated abnormally.
    exec_list:
      - state: 'cat /etc/hosts'
        prompt: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
        parameter:
          - '127.0.0.1'
          - 'localhost'
      - expect: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
        exec: exit


- | e.g.）Using success_exit

  .. code-block:: yaml

     # cat the hosts file and grep the displayed results with parameter value.
     # If there is line containing 127.0.0.1 or lalhost, the result is determined as normal and proceed to the next.
     # 対象If there is no such line, the result is determined as abnormal and the interactive file is terminated abnormally.

     exec_list:
       - state: 'cat /etc/hosts'
         prompt: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         parameter:
           - '127.0.0.1'
           - 'localhost'
         success_exit: yes
       - expect: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         exec: exit


- | e.g.）Using ignore_errors

  .. code-block:: yaml

     # cat the hosts file and grep the displayed results with parameter value.
     # If there is line containing 127.0.0.1 or lalhost, the result is determined as normal and proceed to the next.
     # If there is no such line, the result is determined as abnormal and proceed to the next according to the ignore_errors:yes settings.

     exec_list:
      - state: 'cat /etc/hosts'
        prompt: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
        parameter:
          - '127.0.0.1'
          - 'localhost'
        ignore_errors: yes
      - expect: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
        exec: exit


- | e.g.）Using shell

  .. code-block:: yaml

     # cat the hosts file and evaluate the contents output by the user created shell.
     # Parameter value is given using user created shell parameter.
     # If a user created shell ends in an error, the interactive file will end.

     exec_list:
      - state: 'cat /etc/hosts'
        prompt: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
        shell: '/tmp/grep.sh'
        stdout_file: '/tmp/stdout.txt'
        parameter:
          - '127.0.0.1'
          - 'localhost'
      - expect: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
        exec: exit


- | e.g.) User shell（/tmp/grep.sh） example                                             

  .. code-block:: shell                                        
                                                            
     #!/bin/bash                                               
     STDOUT=/tmp/STDOUT.tmp                                    
     STDERR=/tmp/STDERR.tmp                                    
     cat $1 | grep $2 | grep $3 | wc -l >${STDOUT} 2>${STDERR} 
     RET=$?                                                    
     if [ $RET -ne 0 ]; then                                   
        EXIT_CODE=$RET                                        
     else                                                      
        if [ -s ${STDERR} ]; then                             
            EXIT_CODE=1                                       
        else                                                  
            CNT=`cat ${STDOUT}`                               
            if [ ${CNT} -eq 0 ]; then                         
                EXIT_CODE=1                                   
            else                                              
                EXIT_CODE=0                                   
            fi                                                
        fi                                                    
     fi                                                        
     /bin/rm -rf ${STDOUT} ${STDERR} >/dev/null 2&>1           


- | e.g.）Save target host file to "Result data" with state.

  .. code-block:: yaml

     # cat the hosts file and save the displayed result to the file specified by stdout_file then proceed to the next.
     # Will end in error if the default shell parameter is not configured. Set ignore_errors: yes in order to move to the next process.
     exec_list:
      - state: 'cat /etc/hosts'
        prompt: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
        stdout_file: '{{ __workflowdir__ }}/hosts'
        ignore_errors: yes
      - expect: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
        exec: exit


command module
~~~~~~~~~~~~~~~~~

Overview 
****
| Loops and conditional branching can be performed before and after inputting commands to the target host.
| The overview figure for the command module are as following.
   
.. figure:: /images/ja/diagram/ansible_pioneer_command.png
   :alt: command module overview


| ①Wait for the output of the expected string (prompt) form the contents that the target host outputs for the standard input.
| ②Input specific value for {{ commands }}
| ③Waits for command prompt specified by the expect from the standard output of the command input in②.
| ④Save the standard output contents to the register variable name specified with register.
| ⑤Input specific value for {{ commands }}
| ⑥Wait for command prompt specified by the expect from the standard output of the command input in⑤.
| ⑦Save the standard output contents to the register variable name specified with register.
| ⑧Inputs return so the command prompt can wait for new commands after the process.

Format   
****
| commandmodule format are as following.

.. table:: command module format
   :widths: 20 40 10 60
   :align: Left

   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | Parameter 　         | Format                                   | Required   | Description　                                                                      |
   +======================+==========================================+============+====================================================================================+
   | command              | .. code-block:: yaml                     | Required   | Input Command prompt.                                                              |
   |                      |                                          |            |                                                                                    |
   |                      |    exec_list:                            |            |                                                                                    |
   |                      |    △△-△command:△Parameter value      |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   |                      |    △:half width space                   |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | prompt               | .. code-block:: yaml                     | Required   | Input Command prompt. Can be input as regular expression.                          |
   |                      |                                          |            |                                                                                    |
   |                      |    exec_list:                            |            |                                                                                    |
   |                      |    △△-△command:△Parameter value      |            |                                                                                    |
   |                      |    △△△△prompt:△Parameter value      |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   |                      |    △:half width space                   |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | timeout              | .. code-block:: yaml                     | Optional       | Specify the timer to wait for the prompt after the command is sent.\               |
   |                      |                                          |            |                                                                                    |
   |                      |    exec_list:                            |            |                                                                                    |
   |                      |    △△-△command:△Parameter value      |            | If the parameter is omitted, then conf->timeout is used.                           |
   |                      |    △△△△timeout:△Parameter value     |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   |                      |    △:half width space                   |            |                                                                                    |
   |                      |                                          |            |                                                                                    |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | register             | .. code-block:: yaml                     | Optional       | Save the information of the standard output to any string specified aft\           |
   |                      |                                          |            | er sending the command                                                             |
   |                      |    exec_list:                            |            |                                                                                    |
   |                      |    △△-△command:△Parameter value      |            | When using with_items to loop, the information of the standard output after t\     |
   |                      |    △△△△register:△Parameter value    |            | he last command input is saved.                                                    |
   |                      |                                          |            |                                                                                    |
   |                      |    △:half width space                   |            | This variable can be only used with condition jud\                                 |
   |                      |                                          |            | gment （when・exec_when・failed_when）                                             |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | Saving the information of standard output for every variable name is not poss\     |
   |                      |                                          |            | ible. Previous information will be overwritten.                                    |
   |                      |                                          |            |                                                                                    |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | with_items           | .. code-block:: yaml                     | Optional       | If looping and inputting commands to with_items, configure multiple variable names.|
   |                      |                                          |            |                                                                                    |
   |                      |    exec_list:                            |            |                                                                                    |
   |                      |    △△-△command:△Parameter value      |            |                                                                                    |
   |                      |    △△△△with_items:△                 |            | If the using a Command module parameter with this variable value, input \          |
   |                      |    △△△△△△-△'{{△Variable name△}}'|            | {{ item.X }}（X can be 0-99）                                                      |
   |                      |                                          |            |                                                                                    |
   |                      |    △:half width space                   |            | If the number of variable's specific values set to with_items are not the same, i\ |
   |                      |    ' Single quotation                    |            | t will loop at the maximum number of specific values. If there are any variabl     |
   |                      |       Enclose variables with single \    |            | es that does not have any specific values, they will have their specific val\      |
   |                      |       quotations                         |            | ue set to "NULL". ** if using with_items with Prompt or Timeout, pay attenti\      |
   |                      |                                          |            | on to the numbers of specific values.。**                                          |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | prompt→command→prompt→command→prompt・・・                                     |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | As it will loop like this, you will need to set 1 additi\                          |
   |                      |                                          |            | onal specific value (Number of commands+1).\                                       |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | For more information, see :ref:`ansible_pioneer_coomand_example`                   |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | If there are any prompt or timeout variables that does not have specific va\       |
   |                      |                                          |            | lues set, an error will occur when the operation is executed.                      |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | when                 | .. code-block:: yaml                     | Optional       | The condition judgement before command executes.                                   |
   |                      |                                          |            |                                                                                    |
   |                      |    exec_list:                            |            | Execute command if the condition matches.。                                        |
   |                      |    △△-△command:△Parameter value      |            |                                                                                    |
   |                      |    △△△△when:△                       |            | Moves to the next “command” line if the condition doesn't match.                 |
   |                      |    △△△△△△-△'Condition'            |            |                                                                                    |
   |                      |                                          |            | Conditional expression                                                             |
   |                      |    △:half width space                   |            |                                                                                    |
   |                      |    ' :Single quotation                   |            | 　Judging variable definition                                                      |
   |                      |       Enclose variables with single \    |            |                                                                                    |
   |                      |       quotations                         |            | 　VAR_xx is define　　　Variable is defined　　true                                |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | 　VAR_xx is undefine　　Variable is not defined　　　　　　true                    |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | - | e.g.） Variable definition judgement Input examples                            |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            |   | - 'VAR_status is define'                                                       |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            |   | - 'VAR_status is undefine'                                                     |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | Judging variable's specific values                                                 |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | VAR_xx or register variable　relational operator　string                           |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | VAR_xx or register variable　relational operator　VAR_xx                           |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | VAR_xx or register variable　match（Regular expression string or VAR_xx）          |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | VAR_xx or register variable　no match（Regular expression string or VAR_xx）       |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | ※relational operators are "=="、"!="、">"、">="、"<"、"<="                        |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | ※relational operators">"、">="、"<"、"<=" are assumed to be used for num\         |
   |                      |                                          |            |  eric values.                                                                      |
   |                      |                                          |            | - | e.g.）Judging variable specific values Input examples                          |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            |   | - '{{ VAR_status }} match（active）'                                           |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            |   | - '{{ VAR_status }} == active'                                                 |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | - | e.g.）Regular expression  judgement Input examples                             |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            |   | - 'register variable match（\*active）'                                        |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | 　※ **It is not required to enclose string and regular expression string\         |
   |                      |                                          |            |   with single or double quotations.**                                              |
   |                      |                                          |            | Compound condition with and / or　                                                 |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | When processing with or condition, add OR between judge conditions                 |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | - | e.g.）OR compound conditional judgement Input examples                         |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            |   | - '{{ VAR_status }} == 1 OR {{ VAR_status }} == 2'                             |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | When processing with and condition, write the statement in multiple lines          |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | - | e.g.）or/and compound conditional judgement Input example                      |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            |   | - '{{ VAR_status }} == 1 OR {{ VAR_status }} == 2'                             |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            |   | - '{{ VAR_sub_status }} == 1'                                                  |
   |                      |                                          |            |                                                                                    |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | exec_when            | .. code-block:: yaml                     | Optional       | Judge condition for every loop (continue condition)                                |
   |                      |                                          |            |                                                                                    |
   |                      |    exec_list:                            |            | Perform condition judgement if with_items is written                               |
   |                      |    △△-△command:△Parameter value      |            |                                                                                    |
   |                      |    △△△△exec_when:△                  |            | If the condition matches, execute command of the corresponding loop.               |
   |                      |    △△△△△△-△'Condition'            |            |                                                                                    |
   |                      |                                          |            | If the condition doesn't match, it moves to the next loop                          |
   |                      |    △:half width space                   |            |                                                                                    |
   |                      |    ' :Single quotation                   |            | Conditional expression                                                             |
   |                      |       Enclose variables with single \    |            |                                                                                    |
   |                      |       quotations                         |            | 　Write same as when:                                                              |
   |                      |                                          |            |                                                                                    |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+
   | failed_when          | .. code-block:: yaml                     | Optional       | Condition judgment for the stdout content after command execution(for every loop)  |
   |                      |                                          |            |                                                                                    |
   |                      |    exec_list:                            |            | Perform condition judgement if with_items is written                               |
   |                      |    △△-△command:△Parameter value      |            |                                                                                    |
   |                      |    △△△△failed_when:△                |            | If the condition matches, the result is normal                                     |
   |                      |    △△△△△△-△'Condition'            |            |                                                                                    |
   |                      |                                          |            | If the condition doesn't match, the result is abnormal and the interactive fi\     |
   |                      |    △:half width space                   |            | le ends.                                                                           |
   |                      |    ' :Single quotation                   |            | Conditional expression                                                             |
   |                      |       Enclose variables with single \    |            |                                                                                    |
   |                      |       quotations                         |            | 　Write same as when:                                                              |
   |                      |                                          |            |                                                                                    |
   |                      |                                          |            | After the command input to the command has been input, the contents of the standa\ |
   |                      |                                          |            | rd output can be written to "stdout".　                                            |
   |                      |                                          |            | stdout relational operator string                                                  |
   +----------------------+------------------------------------------+------------+------------------------------------------------------------------------------------+

.. _ansible_pioneer_coomand_example:

Input examples   
******
| This section contains examples for the command module Input examples.

- | e.g.) command module Input examples

  | Inputting the following commands with the command module

  .. code-block:: shell

     systemctl start httpd
     systemctl start mysql

  | The variable's specific values used with "with_items" and the interactive file description are as following.

  - | Interactive file contents

  .. code-block:: yaml

     - command: "systemctl  {{ item.0 }}  {{ item.1 }}"
       prompt: '{{ item.2 }}'
       timeout: '{{ item.3 }}'
       with_items:
         - '{{ VAR_status_list }}'    # item.0
         - '{{ VAR_service_list }}'   # item.1
         - '{{ VAR_prompt_list }}'    # item.2
         - '{{ VAR_timeout_list }}'   # item.3

  - | Variable specific values using with_items

  .. code-block:: yaml

     VAR_status_list:
       - start
       - start
     VAR_service_list:
       - httpd
       - mysql
     # there are 2 specific values used by command.
     # The required amount of specific values for the variables using prompt and timeout is 3.
     VAR_prompt_list:
       - Command prompt
       - Command prompt
       - Command prompt
     VAR_timeout_list:
       - 10
       - 10
       - 10


- | e.g.） Example using when

  .. code-block:: yaml

     conf:
       timeout: 30

     exec_list:
       - expect: 'password:'
         exec:   '{{ __loginpassword__ }}'

       # If the ITA variable, VAR_hosts_make, is written in host variable file（The parameter sheet items and variables are linked in Susbtitute value auto registration), cat the host file.
       # If the variable are not written, the command is skipped.
       - command: cat /etc/hosts
         prompt: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         when:
           - VAR_hosts_make is define
       - expect: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         exec: exit


- | e.g.） Example using exec_when and register

  .. code-block:: yaml

     conf:
       timeout: 30

     exec_list:
       - expect: 'password:'
         exec:   '{{ __loginpassword__ }}'

       # If the ITA variable, VAR_hosts_make, is written in host variable file, cat the host file.
       # If the variable are not written, the command is skipped.
       # Use cat to save the contents of the standard output hosts file to result_stdout.
       - command: cat /etc/hosts
         prompt: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         register: result_stdout
         when:
           - VAR_hosts_make is define

       # If the ITA variable, VAR_hosts_make, is written in host variable file, cat the host file.
       # Input commad. If the variable are not written, the command is skipped.
       # Execute the command for the numbers of the specific values of the multiple specific value variables set in the with_items.
       # From the result of condition judgment for each loop, if "ip address host name" does not
       # correspond to the hosts file, Input command.  "IP address Host name" is added to the end of the hosts file.。
       - command: 'echo {{ item.0 }}  {{ item.1 }} >> /etc/hosts'
         prompt: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         when:
           - VAR_hosts_make is define
         with_items:
           - '{{ VAR_hosts_ip }}'     # item.0
           - '{{ VAR_hosts_name }}'   # item.1
         exec_when:
           - result_stdout no match({{ item.0 }} *{{ item.1 }})

       - expect: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         exec: exit


- | e.g.）Example using failed_when

  .. code-block:: yaml

     conf:
       timeout: 30

     exec_list:
       - expect: 'password:'
         exec:   '{{ __loginpassword__ }}'

       # Execute the command for the numbers of the specific values of the multiple specific value variables set in the with_items.
       # Configure auto startup for the service.
       - command: 'systemctl enable {{ item.0 }}'
         prompt: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         with_items:
           - '{{ VAR_service_name_list }}'  # item.0

       # Execute the command for the numbers of the specific values of the multiple specific value variables set in the with_items.
       # Start the service.
       - command: 'systemctl start {{ item.0 }}'
         prompt: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         with_items:
           - '{{ VAR_service_name_list }}'  # item.0

       # Execute the command for the numbers of the specific values of the multiple specific value variables set in the with_items.
       # outputs service status (stdout)
       # If the content of result output to standard output contains the regular expression of item.1, the result is right.
       # For example, in the case that the specific value of VAR_service_status_list is set to running and the service is running, "running" in "Active: active(running)" matches so the result is right. (Move on to the next loop)
       # In the case that condition doesn't match, the result is determined as abnormal and the dialog file terminates abnormally.
       - command: 'systemctl status {{ item.0 }}'
         prompt: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         with_items:
           - '{{ VAR_service_name_list }}'  # item.0
           - '{{ VAR_service_status_list }}'  # item.1
         failed_when:
           - stdout match({{ item.1 }})

       - expect: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         exec: exit


- | e.g.） Example using when with or/and condition

  .. code-block:: yaml

     conf:
       timeout: 30

     exec_list:
       - expect: 'password:'
         exec:   '{{ __loginpassword__ }}'

       # Example of compound condition using and / or.
       # When processing with or condition, write the if statement horizontally.
       # When processing with and condition, describing the statement in multiple lines.
       # "when" is used as the example here but the same applies to exec_when and failed_when.
       - command: systemctl stop my_service
         prompt: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         when:
           - '{{ VAR_status }} == 10 OR {{ VAR_status }} == 11' 
           - '{{ VAR_sub_status }} == 20 OR {{ VAR_sub_status }} == 21'

       - expect: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         exec: exit


localaction module
~~~~~~~~~~~~~~~~~~~~~

Overview
****

| Command executed to the Ansible Core/Ansible AutomationController execution environment.

Format
****

| localactionmodule format are as following.

.. table:: localaction module format
   :widths: 20 40 10 60
   :align: Left

   +----------------------+------------------------------------------+------------+----------------------------------------------------------------------------------+
   | Parameter 　         | Format                                   | Required   | Description　                                                                    |
   +======================+==========================================+============+==================================================================================+
   | localaction          | .. code-block:: yaml                     | Required   | | Input the execution command.                                                   |
   |                      |                                          |            | | Timer monitoring with the timeout parameter in the conf section is not \       |
   |                      |    exec_list:                            |            | | applicable.                                                                    |
   |                      |    △△-△localaction:△Parameter value  |            | | The next process does not proceed until the command is completed.              |
   |                      |                                          |            |                                                                                  |
   |                      |    △:half width space                   |            |                                                                                  |
   |                      |                                          |            |                                                                                  |
   +----------------------+------------------------------------------+------------+----------------------------------------------------------------------------------+
   | ignore_errors        | .. code-block:: yaml                     | Optional       | Specify “yes” to continue if the execution result of the command is abnormal.  |
   |                      |                                          |            |                                                                                  |
   |                      |    exec_list:                            |            | If “no” is specified, the dialog will end if the result of execution is ab\    |
   |                      |    △△-△localaction:△Parameter value  |            | normal.                                                                          |
   |                      |    △△△△ignore_errors:△<yes/no>      |            | Default is "no"                                                                  |
   |                      |                                          |            |                                                                                  |
   |                      |    △:half width space                   |            |                                                                                  |
   |                      |                                          |            |                                                                                  |
   +----------------------+------------------------------------------+------------+----------------------------------------------------------------------------------+

Input examples
******
| The following contains localaction module input examples.

- | e.g.）localactionのInput examples

  .. code-block:: yaml

     exec_list:
       - expect: 'password:'
         exec:   '{{ __loginpassword__ }}'
       # Create a directory to output the hosts file for every host in the shared directory ({{ __symphony_workflowdir__ }}) of each Movement.
       - localaction: mkdir -p 0755 {{ __workflowdir__ }}/{{ __inventory_hostname__ }}
         ignore_errors: yes
       # Output hosts file contents to the directory created with localaction.
       - state: cat /etc/hosts
         prompt: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         stdout_file: '{{ __workflowdir__ }}/{{ __inventory_hostname__ }}/hosts'
         ignore_errors: yes
       - expect: '{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         exec: exit

Regular expression
--------

| The strings written by the following commands and parameters are evaluated by regular expressions.
| - expectt module's expect parameter
| - statet module's prompt parameter
| - commandt module's prompt parameter
| - commandt module's when/exec_when/failed_when parameter's match ()
| If the string written in the regular expression contains one of the following characters, the user must put in escape characters "\\".

.. list-table:: Characters that requires escape
   :widths: 10 10
   :header-rows: 1
   :align: left

   * - Target character
     - After Escape
   * - \\
     - | \\\\ 
   * - \*
     - \\* 
   * - \.
     - \\. 
   * - \+
     - \\+ 
   * - ?
     - \\? 
   * - \|
     - \\| 
   * - { }
     - \\{ \\}
   * - ( )
     - \\( \\)
   * - [ ]
     - \\[ \\]
   * - ^
     - \\^
   * - $
     - \\$

- | e.g.) Good example

  .. code-block:: yaml

     expect: 'XAMPP Developer Files ¥[Y/n¥] exec_list:'

- | e.g.) Bad example

  .. code-block:: yaml

     expect: 'XAMPP Developer Files [Y/n] exec_list:'
 

Warning
--------

Using state module and command module
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. | 
   | If the prompt parameter is a backward match in the regular table "\. \*If the prompt parameter contains the backward match "\.
   | If the backward match "\. \*Ј*", the result of the executed command (standard output) will be empty.
   | D not use backward match regular expressions.
   
   - | e.g.）Regular expression backmatches

   .. code-block:: yaml
   
       - state: echo 'saple data'
         prompt: '\.\*{{ __loginuser__ }}@{{ __inventory_hostname__ }}'
         stdout_file: '{{ __workflowdir__ }}/{{ __inventory_hostname__ }}/hosts'

#. | Processing interactive commands
   | Not processed with command and state modules, Create interactive files with expect module.
   
   - | e.g.）Interactive command "ssh-keygen" process example

   .. code-block:: yaml

      # Process ssh-keygen in a dialogue file
      conf:
        timeout: 10

      exec_list:
        # ssh connection Password authentication
        - expect: 'assword:'
          exec: '{{ __loginpassword__ }}'

        # Execute ssh-keygen command
        - expect: '{{ __loginuser__ }}@{{ __loginhostname__ }}'
          exec: ssh-keygen

        # The following is the process for prompts other than the command prompt.
        # Set file path of the secret key
        # Since expect is evaluated in regular notation, the escape character (\) must be inserted for characters that needs escape
        - expect: 'id_rsa\):'
          exec: '{{ VAR_id_rsa_path }}'

        # Configure Passprhase
        - expect: ' passphrase\):'
          exec: '{{ VAR_passphrase }}'

        # Configure Passprhase
        - expect: ' passphrase again:'
          exec: '{{ VAR_passphrase }}'

        # Check generated secret key file
        - expect: '{{ __loginuser__ }}@{{ __loginhostname__ }}'
          exec: 'ls -al {{ VAR_id_rsa_path }}'

        # Close ssh connection
        - expect: '{{ __loginuser__ }}@{{ __loginhostname__ }}'
          exec: exit


Using multiple specific value variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| The parameters that allows for multiple specific value variables in interactive files is the command module with the with_items parameter only. Using any other command and parameter will cause an error when executed.


Ending interactive files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| Make sure to input a command that ends the session at the end of the dialogue file.
| Ending the last line of the module closes the session.
| If the final line is a file copy or any other process that takes time, the session will close before the command is finished and may end up ending abnormaly.

- | e.g.）Putting "exit" command for ending the session at the end of the interactive file.

  .. code-block:: yaml

     conf:
       timeout: 10

     exec_list:
       # ssh connection Password authentication
       - expect: 'assword:'
         exec: '{{ __loginpassword__ }}'

       # Copy file
       - expect: '{{ __loginuser__ }}@{{ __loginhostname__ }}'
         exec: 'cp -rfp {{ VAR_src_path }} {{ VAR_dest_path }}'

       # Write a line that waits for the previous command to end in the command prompt and inputs an exit command at the end of the Interactive file.
       - expect: '{{ __loginuser__ }}@{{ __loginhostname__ }}'
         exec: exit

.. _ansible_pioneer_things_to_keep_in_mind_when_writing_dialogue_files_in_yaml_format:

Writing interactive files in YAML format
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| Interactive files are treated as yaml format files. Interactive modules that doesnt follow YAML formats will cause an registration error. The following will cause errors:

- | When the Module parameters are not enclosed in quotation marks when inputting variables into them.
- | When each parameter is described by a constant only and the entire parameter is not enclosed in quotation marks, e.g. when the constant ends in "\ **:**\".

| The module parameters must have their parameters enclosed in quotations.

.. figure:: /images/ja/diagram/ansible_pioneer_yaml_syntax.png       
   :width: 800px
   :alt: Writing Interactive files in yaml format

   Writing Interactive files in yaml format


LANG for Target device login user
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| The Login user's "LANG" supports the 3 types of UTF-8/euc/shift_jis.
| The Login user's "LANG" settings must be configured from :menuselection:`Ansible common --> Device list`'s :menuselection:`LANG` item.
| If "euc" or "shift_jis" is used, the interactive file may not be processed correctly due to the characteristics of the decoding process to UTF-8 of the pexpect module used in the communication control with the device.
| Some full-width characters( such as "①②" cannot be used with the UTF-8 decoder. Characters that are not decodable will be displayed as "??".
| When some full-width characters ( such as " -, etc") are used in prompt waiting, The waiting will end successfuly if the LANG is "UTF-8". If it is "euc/shift_jis" the wait will time out.



Termination codes for commands input to the target device
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The termination code for the code executed to the target host sends "LF". If the termination code is "CRLF", add "\r" to the end of the command.

.. code-block:: yaml

   conf:
     timeout: 10
   exec_list:
     - expect: 'password:'
       exec: 'XXXXXXXX\r'
     - command: '{{ VAR_command }}\r'
       prompt: '{{ __loginuser__ }}@{{ __loginhostname__ }}'
     - state: '{{ VAR_state }}\r'
       prompt: '{{ __loginuser__ }}@{{ __loginhostname__ }}'
       parameter:
        - '{{ VAR_parameter1 }}'
        - '{{ VAR_parameter2 }}'

Operating System Command sequence
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| Depending on the working target, an Operating System Command sequence may be appended immediately before the command prompt sent by the working target. ITA eliminates the escape sequence immediately preceding the string specified in the prompt parameter.


Appendix
====

.. _ansible_pioneer_the_linkage_between_the_input_data_used_during_ansible_execution_and_ita_menu:

Link between ITA menus and Input data when executing Ansible
--------------------------------------------------------

| Information from the different ITA menus are extracted in order to create input data required to execute Ansible. When this happens, :menuselection:`Password` items in the :menuselection:`Ansible common --> Device list` menu and items with their :menuselection:`Sensitive settings` set to "True" in the :menuselection:`Ansible-Pioneer --> Substitute value management` menu.
| The Input data can be downloaded from the :menuselection:`Ansible-Pioneer --> Confirm execution status` menu's :menuselection:`Input data`.
| Useres can also directly execute Ansible by unzipping the downloaded input data in a specified directory.
|
| The relationships between the different data and ITA menus are as following.
~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table:: Ansible-Pioneer Input data
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
   * - Ansible-Pioneer
     - Substitute value management
     - Specific value (File) 
     - /upload_files
   * - Ansible common
     - Global value management
     - Variable name/Specific value
     - /host_vars
   * - Ansible-Pioneer
     - Substitute value management
     - Variable name/Specific value
     - /host_vars
   * - Ansible-Pioneer
     - template management
     - Template embedded variable
     - /host_vars
   * - Ansible-Pioneer
     - File management
     - File embedded variable
     - /host_vars
   * - Ansible common
     - Device list
     - | Login user ID
       | Login password   ※Encrypted with ansible-vault
       | Protocol
       | Host name
       | DNSHost name
       | IP address
     - /host_vars
   * - Ansible common
     - Device list
     - ssh authentication key file
     - /ssh_key_files
   * - Ansible common
     - Interface information
     - Option parameter
     - /AnsibleExecOption.txt
   * - Ansible-Pioneer
     - Movement list
     - Parallel executions
     - /AnsibleExecOption.txt
   * - Ansible common
     - Device list
       | Host name
       | DNSHost name
       | IP address
     - /hosts
   * - Ansible common
     - Device list
     - Connection option
     - /host_vars
   * - Ansible-Pioneer
     - Movement-Interactive type link
     - | Interactive file
       | Include order
     - /playbook.yml

.. _ansible_pioneer_the_linkage_between_the_output_data_used_during_ansible_execution_and_ita_menu:

Result data created when executing Ansible
-----------------------------------

| The results from executing "Input data" with Ansible are saved as "Result data" in a ZIP file.
| "Result data" can be downloaded from :menuselection:`Ansible-Pioneer --> Confirm execution status` menu's :menuselection:`Result data` in a ZIP file.



File list saved to Ansible-Pioneer result data
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table:: File list saved to Ansible-Pioneer result data
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


