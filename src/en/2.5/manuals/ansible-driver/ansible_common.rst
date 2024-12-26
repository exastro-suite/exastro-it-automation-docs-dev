===========
Ansible common
===========

Introduction
========

| This document aims to explain how to use the Ansible driver's common functions.

Ansible driver overview
==================

| This document explains the functions of Ansible Core, Ansible Automation Controller and the Ansible driver.

Ansible Core
--------------------

| The Ansible Core is an PF construction automation tool that makes application/system deployment operations for multiple construction targets easier.
| Ansible Core uses Playbook, YAML type text files, which contains routine tasks that can be run by Ansible Core.
| The "Tasks" are linked to processing programs called Modules and can control different devices.
| For more information regarding Ansible Core, see the official Ansible manuals.

Ansible Automation Controller
-------------------------------------

| The Ansible Automation Controller is a management platform that comes with functions such as controling Ansible access, scheduling jobs and visualizing tasks.
| It can be used to create job templates that contains Projects, Inventories and Authentication information that can be run with Ansible.
| By combining multiple "Job templates", the user can create a "Workflow template", which can be used to express more variegated task flows.
| For more information regarding Ansible Automation Controller, see the official Ansible Automation Controller manuals.
| For information regarding ITA compatible Ansible Automation Controller versions, see :doc:`../../configuration/ansible/ansible_automation_platform`.
| Note that all notations regarding the newest version might not work.


Ansible driver
----------------------

| The Ansible driver uses the ITA functions to automatically run Playbook processes to Servers, Storage or Network devices registered to ITA through either Ansible Core or Ansible Automation Controller. 

.. image:: /images/ja/diagram/overview.png
   :width: 6.68819in
   :height: 3.35972in
   :alt: Exastro overview

| The Ansible driver comes with the following 3 modes. 
| They each comes with their own strengths, so make sure to use the one that suits the situation best.

#. | **Legacy mode**
   | Uses Ansible's standard functions to input settings to the host.
   | The Legacy mode registers construction code as single YAML files and creates operation patterns using them.
   | Often used for configuring environments for Server, Storage and Network devices.

#. | **Legacy Role mode**
   | Similar to the Legacy mode, this mode also uses Ansible's standard functions to input settings to the host.
   | The Legacy Role mode registers consdtruction code as packages and creates operation patterns by combining them with Roles.
   | Often used by using Role packages provided by product and other departments to install products and construct environments.

#. | **Pioneer mode**
   | Adds original modules to Ansible and allows users to input settings in an interactive format.
   | Support Server, Storage and Network devices that can be logged in with Telnet or SSH. We recommend that the user has adequate IT skills, since this mode works directly with the target host.


.. _ansible_common_variable_handling:

Handling variables with Ansible driver 
==============================

| In the Ansible driver, the specific values within the variables in the Playbook can be set from ITA.

Variable types
----------

| The variables within Playbooks that can be handled as ITA variables are the following 7 types.


Normal
^^^^^^^^

| Variable that can define 1 specific value for variable names.
|
| e.g.) Example within Playbook

.. code-block:: yaml

   # Ansible-LegacyRole variable definition example
   user: user1
   
   # Playbook example
   - name: Create user
     user: 
       name: "{{ user }}"

|

Multiple specific value variables
^^^^^^^^^^^^^^

| Variable that can specify multiple specific values for variable names.
|
| e.g.) Example within Playbook

.. code-block:: yaml

   # Ansible-LegacyRole variable definition example
   users:
     - user1
     - user2

   # Playbook example
   - name: Create user
     user:
       name: "{{ item }}"
     with_items: "{{ users }}"

|

Multistage variables
^^^^^^^^

| Variables in hierarchy.
| Multiple variables can only be used in Ansible-LegacyRole.
|
| e.g.) Example within Playbook

.. code-block:: yaml

   # Ansible-LegacyRole variable definition example
   users:
     - name: user3
       groups: root
     - name: user4
       groups: root

   # Playbook example
   - name: Create user
     user:
       name: "{{ item.name }}"
     with_items: "{{ users }}"

|

Global variables
^^^^^^^^^^^^^^

| Variables registered from :menuselection:`Ansible common --> Global variable list`.

| e.g.) Example within Playbook

.. code-block:: yaml

   - command: echo {{ GBL_user }}

|

Template embedded variables
^^^^^^^^^^^^^^^^^^^^

| Variables registered from :menuselection:`Ansible common --> Template list`.

| e.g.) Example within Playbook

.. code-block:: yaml

   - template: src={{ TPF_SAMPLE }} dest=/tmp/SAMPLE.txt

|

File embedded variables
^^^^^^^^^^^^^^^^

| Variables registered from :menuselection:`Ansible common --> File list`.

| e.g.) Example within Playbook

.. code-block:: yaml

   - copy: src={{ CPF_SAMPLE }} dest=/tmp/SAMPLE.txt


.. _ansible_common_ita_original_variable:

ITA original variables
^^^^^^^^^^^

| Variables defined by ITA.

Device list
********

|  The following items in :menuselection:`Basic console --> Device list` can be handled as variables.

.. list-table::
   :widths: 50 80
   :header-rows: 1
   :align: left

   * - Item name
     - Variable name
   * - Host name
     - __inventory_hostname__
   * - DNS host name
     - __dnshostname__
   * - IP address
     - __ipaddress__
   * - Protocol
     - __loginprotocol__
   * - Login user ID
     - __loginuser__
   * - Login password
     - __loginpassword__

.. tip:: 
  | The "__" before and after the variable names are created by 2 underscores.

| The :menuselection:`Ansible common --> Device list ` items can be used as variables if set .
  If the items are not set, the operations run in :menuselection:`Mode --> Execute` will display an error.


Operation
**************

| The :menuselection:`Basic console --> Operation list` operations that are selected during execution can be selected as variables.

.. list-table::
   :widths: 50 80
   :header-rows: 1
   :align: left

   * - Item name 
     - Variable name
   * - Operation
     - __operation__

| Setting value: "YYYY/MM/DD HH:MM" _ "Operation ID" : "Operation name"
| YYYY/MM/DD HH:MM: :menuselection:`Basic console --> Operation list`'s :menuselection:`Scheduled execution date/time` 
| Operation ID: :menuselection:`Basic console --> Operation list`'s :menuselection:`Operation ID`
| Operation name: :menuselection:`Basic console --> Operation list`'s :menuselection:`Operation name`
|

Conductor instance ID
***********************

| The :menuselection:`Conductor --> Conductor confirmation`'s :menuselection:`Conductor instance ID` can be handled as variables when run.
| For more information regarding the Conductor function, see ":doc:`../it_automation_base/conductor`

.. list-table::
   :widths: 50 80
   :header-rows: 1
   :align: left

   * - Item name
     - Variable name
   * - Conductor instance ID
     - __conductor_id__

| __conductor_id__ can be handled as a variable when executing Conductor.
|  If :menuselection:`Mode --> Execute` is used, the operation will end in an error.
|

Link data
**********

| When executing operations, the operation directory path can be used as the following variables.

.. list-table::
   :widths: 50 80
   :header-rows: 1
   :align: left

   * - Item name
     - Variable name
   * - Operation directory path
     - __workflowdir__

| By creating a file in the Operation directory within the Playbook, the user can download the file from :menuselection:`Result data` in :menuselection:`Ansible mode --> Operation management`
|

| When running Conductors, the Movement's shared directory path can be used as the following variables.

.. list-table::
   :widths: 50 80
   :header-rows: 1
   :align: left

   * - Item name
     - Variable name
   * - Conductor operation directory path
     - __conductor_workflowdir__

| By creating a file in the Conductor operation directory path within the Playbook, the file can be shared between the Conductor's Movements.
| If the operation is executed from :menuselection:`Ansible mode --> Execution`, the same path as __workflowdir__ will be set.
|


| The file path for the status file referenced with :menuselection:`Conductor --> Conductor edit / execution`'s  :menuselection:`Status file branch node` can be used as the following variables.
| For more information regarding :menuselection:`Status file branch node`, see ":doc:`../it_automation_base/conductor`".

.. list-table::
   :widths: 50 80
   :header-rows: 1
   :align: left

   * - Item name
     - Variable name
   * - Status file path
     - __movement_status_filepath__

|

| The file paths used by the collect function can be used as the following variables.
| For more informatio nregarding the collect function, see ":doc:`./collect`".

.. list-table::
   :widths: 50 80
   :header-rows: 1
   :align: left

   * - Item name
     - Variable name
   * - Path for operation directory  (in) 's "_parameters"
     - __parameters_dir_for_epc__
   * - Path for operation directory  (in) 's "_parameters_file"
     - __parameters_file_dir_for_epc__
   * - Path for operation directory  (out) 's "_parameters"
     - __parameter_dir__
   * - Path for operation directory  (out) 's "_parameters_file"
     - __parameters_file_dir__

| "_parameters"：Source file (parameter) for storage destination
| "_parameters_file"：For storage destination for collected files
| ※File arrangement when parameter target is file upload collumn
|

Extracting variables and registering specific variables
--------------------------


.. _ansible_common_var_listup:

Variable extraction files
^^^^^^^^^^^^^^^^
| If the variable extraction target is a registered file, the variables can be extracted from the registered information.

.. table:: Variable extraction target menu/items
   :widths: 20 40 20 20 20 60
   :align: left

   +-----------------------+--------------------------------------+----------------+----------------+--------------------+---------------------------------------------------------------------------------+
   | Menu                  | Item                                 |                       Mode                           | Variable extraction format                                                      |
   |                       |                                      +----------------+----------------+--------------------+                                                                                 |
   |                       |                                      | Ansible-Legacy | Ansible-Pioneer| Ansible-LegacyRole |                                                                                 |
   +=======================+======================================+================+================+====================+=================================================================================+
   | Playbook files        | Playbook files                       | 〇             | ×             | ×                 | For more information, see: ":ref:`ansible_common_legacy_var_listup`".           |
   +-----------------------+--------------------------------------+----------------+----------------+--------------------+---------------------------------------------------------------------------------+
   | Interactive file col\ | Interactive file                     | ×             | 〇             | ×                 | For more information, see:  ":ref:`ansible_common_pioneer_var_listup`".         |
   | lection               |                                      |                |                |                    |                                                                                 |
   +-----------------------+--------------------------------------+----------------+----------------+--------------------+---------------------------------------------------------------------------------+
   | Role package mana\    | Role package file (ZIP format)       | ×             | ×             | 〇                 | For more information, see:  ":ref:`ansible_common_legacyrole_var_listup`".      |
   | gement                |                                      |                |                |                    |                                                                                 |
   +-----------------------+--------------------------------------+----------------+----------------+--------------------+---------------------------------------------------------------------------------+
   | Template management   | Variable definition                  | 〇             | 〇             | 〇                 | For more information, see:  ":ref:`ansible_common_template_list`".              |
   +-----------------------+--------------------------------------+----------------+----------------+--------------------+---------------------------------------------------------------------------------+
   | Device list           | Inventory file option                | 〇             | ×             | 〇                 | For more information, see:  ":ref:`ansible_common_option_var_listup`".          |
   +-----------------------+--------------------------------------+----------------+----------------+--------------------+---------------------------------------------------------------------------------+
   | Movement list         | Header section                       | 〇             | ×             | 〇                 | For more information, see:  ":ref:`ansible_common_option_var_listup`".          |
   +-----------------------+--------------------------------------+----------------+----------------+--------------------+---------------------------------------------------------------------------------+
   | Parameter sheet       | Item selected from Pulldown select\  | 〇             | 〇             | 〇                 | For more information, see:  ":ref:`ansible_common_template_list`".              |
   |                       | ion in Template management           |                |                |                    |                                                                                 |
   +-----------------------+--------------------------------------+----------------+----------------+--------------------+---------------------------------------------------------------------------------+
  
.. tip:: |  〇：Extraction target  ×：Not extraction target

.. _ansible_common_legacy_var_listup:

Playbook file extractable variable types and their format
**************************************************

| The following table displays what variable types can be extracted from the :menuselection:`Ansible-Legacy --> Playbook file collection`'s  :menuselection:`Playbook files` and their format.

.. table::  Playbook file extractable variable types and their format
   :widths: 4 8 16
   :align: left

   +-------------------------------+--------------------------------------+------------------------------------------------------------------------------------------+
   | Variable                      | Format                               | Specific value setting                                                                   |
   +===============================+======================================+==========================================================================================+
   | Normal variable               | .. code-block:: yaml                 | Specific values can be registered from :menuselection:`Ansible-Legacy --> Substitute va\ |
   |                               |                                      | lue automatic registration settings.                                                     |
   |                               |                                      | If :menuselection:`Ansible-Legacy --> Substitute value automatic registration setting\   |
   | Multiple specific value var\  |    {{△vvv△}}                       | s`'s :menuselection:`Substitute order` is input, they can be used as multiple sp\        |
   | iable                         |                                      | ecific value variables.                                                                  |
   |                               |    {{△vvv△|△Filter△}}            |                                                                                          |
   |                               |                                      |                                                                                          |
   +-------------------------------+--------------------------------------+------------------------------------------------------------------------------------------+
   | Global variable               | .. code-block:: yaml                 | Specific values can be registered from :menuselection:`Ansible common --> Global vari\   |
   |                               |                                      |  able managment`.                                                                        |
   |                               |    {{△GBL_xxx△}}                   |                                                                                          |
   |                               |                                      |                                                                                          |
   |                               |    {{△GBL_xxx△|△Filter△}}        |                                                                                          |
   +-------------------------------+--------------------------------------+------------------------------------------------------------------------------------------+
   | Template embedded variable    | .. code-block:: yaml                 | Specific values can be registered from :menuselection:`Ansible common --> Template ma\   |
   |                               |                                      | nagement`.                                                                               |
   |                               |    {{△TPF_xxx△}}                   |                                                                                          |
   |                               |                                      |                                                                                          |
   |                               |    {{△TPF_xxx△|△Filter△}}        |                                                                                          |
   +-------------------------------+--------------------------------------+------------------------------------------------------------------------------------------+
   | File embedded variable        | .. code-block:: yaml                 | Specific values can be registered from :menuselection:`Ansible common --> File manage\   |
   |                               |                                      | ment`.                                                                                   |
   |                               |    {{△CPF_xxx△}}                   |                                                                                          |
   |                               |                                      |                                                                                          |
   |                               |    {{△CPF_xxx△|△Filter△}}        |                                                                                          |
   |                               |                                      |                                                                                          |
   +-------------------------------+--------------------------------------+------------------------------------------------------------------------------------------+
   | ITA original variable         |                                      | For more information, see  ":ref:`ansible_common_ita_original_variable`".                |
   +-------------------------------+--------------------------------------+------------------------------------------------------------------------------------------+

.. tip:: | Notes regarding variable names
    | △：Half-width space  
    | vvv: Half-width characters and underscore within 255 bytes ( _ ) 
    | xxx: Half-width characters and underscore within 251 bytes ( _ ) 


.. _ansible_common_pioneer_var_listup:
    
Interactive file extractable variable types and their format
******************************************************

| The following table displays what variable types can be extracted from the :menuselection:`Ansible-Legacy --> Interactive file collection`'s :menuselection:`Interactive files`.

.. table::  Interactive file extractable variable types and their format
   :widths: 4 8 16
   :align: left

   +-------------------------------+--------------------------------------+------------------------------------------------------------------------------------------+
   | Variable                      | Format                               | Specific value setting                                                                   |
   +===============================+======================================+==========================================================================================+
   | Normal variable               | .. code-block:: yaml                 | Specific values can be registered from :menuselection:`Ansible-Legacy --> Substitute va\ |
   |                               |                                      | lue automatic registration settings`.                                                    |
   |                               |                                      | If :menuselection:`Ansible-Legacy --> Substitute value automatic registration s\         |
   | Multiple specific value va\   |    {{△vvv△}}                       | ettings`'s :menuselection:`Substitute order`is input, they can be used as multiple spe\  |
   | riable                        |                                      | cific value variables.                                                                   |
   +-------------------------------+--------------------------------------+------------------------------------------------------------------------------------------+
   | Global variable               | .. code-block:: yaml                 | Specific values can be registered from :menuselection:`Ansible common --> Global var\    |
   |                               |                                      | iable managment`.                                                                        |
   |                               |    {{△GBL_xxx△}}                   |                                                                                          |
   |                               |                                      |                                                                                          |
   +-------------------------------+--------------------------------------+------------------------------------------------------------------------------------------+
   | Template embedded variable    | .. code-block:: yaml                 | Specific values can be registered from :menuselection:`Ansible common --> Templ\         |
   |                               |                                      | ate management`.                                                                         |
   |                               |    {{△TPF_xxx△}}                   |                                                                                          |
   |                               |                                      |                                                                                          |
   +-------------------------------+--------------------------------------+------------------------------------------------------------------------------------------+
   |  File embedded variable       | .. code-block:: yaml                 | Specific values can be registered from :menuselection:`Ansible common --> File m\        |
   |                               |                                      | anagement`.                                                                              |
   |                               |    {{△CPF_xxx△}}                   |                                                                                          |
   |                               |                                      |                                                                                          |
   +-------------------------------+--------------------------------------+------------------------------------------------------------------------------------------+
   | ITA original variable         |                                      | For more information, see  ":ref:`ansible_common_ita_original_variable`".                |
   +-------------------------------+--------------------------------------+------------------------------------------------------------------------------------------+

.. tip:: | Notes regarding variable names
    | △：Half-width space  
    | vvv: Half-width characters and underscore within 255 bytes ( _ ) 
    | xxx: Half-width characters and underscore within 251 bytes ( _ ) 

.. _ansible_common_legacyrole_var_listup:

Local package file  (ZIP format)  extractable variable types and their format.
*************************************************************************

| The following table displays what variable types can be extracted from the :menuselection:`Ansible-Legacy --> Role package management`'s :menuselection:`Role package file (ZIP format) `.

.. table::  Local package file  (ZIP format)  extractable variable types and their format.
   :widths: 4 8 2 4 4 4 24
   :align: left

   +-----------------+------------------------------------------+--------------+--------------+--------------+-------+------------------------------------------------------------+
   | Variable name   | Format                                   | ITA readme   | Directory within Role package       | Specific value setting                                     |
   |                 |                                          |              |                                     |                                                            |
   |                 |                                          |              |                                     |                                                            |
   |                 |                                          |              |                                     |                                                            |
   |                 |                                          +              +--------------+--------------+-------+                                                            |
   |                 |                                          |              | defaults     | tasks        | Oth\  |                                                            |
   |                 |                                          |              |              |              | er    |                                                            |
   |                 |                                          |              |              | templates    |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   |                 |                                          |              |              | handlers     |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   |                 |                                          |              |              | meta         |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   +=================+==========================================+==============+==============+==============+=======+============================================================+
   | Normal variable | e.g.)                                    | 〇           | 〇           | ×           | ×    | Specific values can be registered from\                    |
   |                 |                                          |              |              |              |       | :menuselection:`Ansible-Legacy --> Substitute value au\    |
   |                 | .. code-block:: yaml                     |              |              |              |       | tomatic registration settings.                             |
   |                 |                                          |              |              |              |       |                                                            |
   |                 |    vvv: value                            |              |              |              |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   |                 | Specific values can be shortened.        |              |              |              |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   +-----------------+------------------------------------------+              +              +              |       +                                                            +
   | Multiple specific value variable  | e.g.)                  |              |              |              |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   |                 | .. code-block:: yaml                     |              |              |              |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   |                 |    vvv:                                  |              |              |              |       |                                                            |
   |                 |      - value                             |              |              |              |       |                                                            |
   |                 |    vvv: []                               |              |              |              |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   |                 | Specific values can be shortened.        |              |              |              |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   +-----------------+------------------------------------------+              +              +              |       +                                                            +
   | Multistage\    | e.g.)                                     |              |              |              |       |                                                            |
   | variable        |                                          |              |              |              |       |                                                            |
   |                 | .. code-block:: yaml                     |              |              |              |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   |                 |    vvv:                                  |              |              |              |       |                                                            |
   |                 |      - item1: value1  ←Member variable  |              |              |              |       |                                                            |
   |                 |        item2: value2  ←Member variable  |              |              |              |       |                                                            |
   |                 |    vvv:                                  |              |              |              |       |                                                            |
   |                 |      - array:                            |              |              |              |       |                                                            |
   |                 |          - item1: value1←Member variable|              |              |              |       |                                                            |
   |                 |            item2: value2←Member variable|              |              |              |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   |                 | Can shorten specific values.             |              |              |              |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   +-----------------+------------------------------------------+--------------+--------------+--------------+-------+------------------------------------------------------------+
   | Global variable | .. code-block:: yaml                     | ×           | ×           | ○           | ×    | Specific values can be registered from :menuselection\     |
   |                 |                                          |              |              |              |       | `Ansible common --> Global variable managment`.            |
   |                 |    {{△GBL_xxx△}}                       |              |              |              |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   |                 |    {{△GBL_xxx△|△Filter△}}            |              |              |              |       |                                                            |
   +-----------------+------------------------------------------+              +              +              |       +------------------------------------------------------------+
   | Template\       | .. code-block:: yaml                     |              |              |              |       | Specific values can be registered from :menuselection\     |
   | embedded\       |                                          |              |              |              |       | `Ansible common --> Template management`.                  |
   | variables       |    {{△TPF_xxx△}}                       |              |              |              |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   |                 |    {{△TPF_xxx△|△Filter△}}            |              |              |              |       |                                                            |
   +-----------------+------------------------------------------+              +              +              |       +------------------------------------------------------------+
   | File\           | .. code-block:: yaml                     |              |              |              |       | Specific values can be registered from :menuselection \    |
   | embedded\       |                                          |              |              |              |       | :menuselection:`Ansible common --> File management`.       |
   | variables       |    {{△CPF_xxx△}}                       |              |              |              |       |                                                            |
   |                 |                                          |              |              |              |       |                                                            |
   |                 |    {{△CPF_xxx△|△Filter△}}            |              |              |              |       |                                                            |
   +-----------------+------------------------------------------+              +              +              |       +------------------------------------------------------------+
   | ITA original\   |                                          |              |              |              |       | For more information, see  \                               |
   | variable        |                                          |              |              |              |       | ":ref:`ansible_common_ita_original_variable`".             |
   +-----------------+------------------------------------------+--------------+--------------+--------------+-------+------------------------------------------------------------+

.. tip:: |  〇：Variable definition extraction target   ×：Not variable definition extraction target

.. tip:: | Notes regarding variable names
    | △：Half-width space  
    | vvv: Half-width characters and underscore within 255 bytes ( _ ) 
    | xxx: Half-width characters and underscore within 251 bytes ( _ ) 
    | Member variables can use all ascii characters (0x20～0x7e) except for the 7 characters written below.
    | " . [ ] ' \\ :
    | Note that some characters can not be used at the start of the variable's names unless they are in quoatation marks.
    | For more information, see the official Ansible manuals' YAML and Syntax section.

.. _ansible_common_option_var_listup:

Inventory file options and header section parameter value extractable variable types and their format.
********************************************************************************************************

| The following table displays what variables can be extraccted with the Parameter values found in :menuselection:`Ansible-Legacy --> Device list`'s :menuselection:`Inventory file option` and :menuselection:`Ansible mode --> Movement list`'s :menuselection:`Header section`

.. table:: Parameter value extractable variable types and their format
   :widths: 25 15 30 80
   :align: left

   +------------------------+----------+-------------------------------+-------------------------------------------------------------------------------------------------------------------------------+
   | Type                   | Usable   | Format                        | Specific value setting                                                                                                        |
   +========================+==========+===============================+===============================================================================================================================+
   | Normal variable        | 〇       | .. code-block:: yaml          | ・For Ansible-Legacy                                                                                                          |
   |                        |          |                               |                                                                                                                               |
   | Multiple specific\     |          |    {{△vvv△}}                | Can handle normal and multiple value variables.                                                                               |
   | value variable         |          |                               |                                                                                                                               |
   |                        |          |                               |                                                                                                                               |
   | Multistage variable    |          |    {{△vvv△|△Filter△}}     | If :menuselection:`Ansible-Legacy --> Substitute value automatic registration settings`'s :menuselection:`Substitute order`\  |
   |                        |          |                               | is input, they can be used as multiple specific value variables.                                                              |
   |                        |          |                               |                                                                                                                               |
   |                        |          |                               | ・For Ansible-LegacyRole                                                                                                      |
   |                        |          |                               |                                                                                                                               |
   |                        |          |                               | Can handle normal, multiple value and multistage variables.                                                                   |
   |                        |          |                               |                                                                                                                               |
   |                        |          |                               | If a role package registered in\                                                                                              |
   |                        |          |                               |:menuselection:`Ansible-LegacyRole --> Role package management`'s :menuselection:`Role package file (ZIP format) `or\          |
   |                        |          |                               | a variable in  with the same name in :menuselection:`Ansible common --> Template management`'s\                               |
   |                        |          |                               | :menuselection:`Variable definition` is defined, they will be handled as the defined type of variable.。                      |
   |                        |          |                               |                                                                                                                               |
   |                        |          |                               | If no variable is defined, they will be handled as normal variables.                                                          |
   |                        |          |                               |                                                                                                                               |
   |                        |          |                               | Specific values can be registered from :menuselection:`Ansible-Legacy --> Substitute value automatic registration settings`.  |
   |                        |          |                               |                                                                                                                               |
   +------------------------+----------+-------------------------------+-------------------------------------------------------------------------------------------------------------------------------+
   | Global variable        | ×       |                               |                                                                                                                               |
   +------------------------+----------+-------------------------------+-------------------------------------------------------------------------------------------------------------------------------+
   | File embedded variable | ×       |                               |                                                                                                                               |
   +------------------------+----------+-------------------------------+-------------------------------------------------------------------------------------------------------------------------------+
   | Template embedded\     | ×       |                               |                                                                                                                               |
   | variable               |          |                               |                                                                                                                               |
   +------------------------+----------+-------------------------------+-------------------------------------------------------------------------------------------------------------------------------+
   | ITA original\          | 〇       |                               | For more information, see  ":ref:`ansible_common_ita_original_variable`".。                                                   |
   | variable               |          |                               |                                                                                                                               |
   +------------------------+----------+-------------------------------+-------------------------------------------------------------------------------------------------------------------------------+

.. tip:: | Notes regarding variable names
    | △：Half-width space  
    | vvv: Half-width characters and underscore within 255 bytes ( _ ) 


Specific values for variables
^^^^^^^^^^^^

Ansible-Legacy
**************

| The specific values of the extracted variables are set by setting specific values to the items on the parameter sheet and tying them to each variable in :menuselection:`Ansible-Legacy --> Substitute value automatic registration settings`.
| They are output to the host variable file when the operation is executed.
| The following diagram illustrates the specific value's relationships through :menuselection:`Ansible-Legacy --> Substitute value management` in the host's variable file's variables from when the operation is executed to when they are output.
| For more information regarding Parameter sheets, see "":doc:`../create_param/menu_creation`".

.. figure:: /images/ja/diagram/hensuu_nukidashi_legacy.png
   :alt: Variable's specific values in Ansible-Legacy host variable files
   :width: 800px

   Variable's specific values in Ansible-Legacy host variable files

| ① Variables are extracted from one of the variable extractable files in ":ref:`ansible_common_var_listup`" which makes them selectable in :menuselection:`Ansible-Legacy --> Substitute value automatic registration settings`.
| ② Register specific values for the variable linked to the parameter sheet item.
| ③ Register a link between the parameter sheet item and the variable in :menuselection:`Ansible-Legacy --> Substitute value automatic registration settings`.
| ④ Executing the operation displays the parameter sheet item and variable information linked in :menuselection:`Ansible-Legacy --> Substitute value automatic registration settings` to :menuselection:`Ansible-Legacy --> Substitute value management` and outputs it to the host variable file.


Ansible-Pioneer
***************

| The specific values of the extracted variables are set by setting specific values to the items on the parameter sheet and tying them to each variable in :menuselection:`Ansible-Pioneer --> Substitute value automatic registration settings`.
| They are output to the host variable file when the operation is executed.
| The following diagram illustrates the specific value's relationships through :menuselection:`Ansible-Pioneer --> Substitute value management` in the host's variable file's variables from when the operation is executed to when they are output.

.. figure:: /images/ja/diagram/hensuu_nukidashi_pioneer.png
   :alt: Variable's specific values in Ansible-Pioneer host variable files
   :width: 800px

   Variable's specific values in Ansible-Pioneer host variable files

| ① Variables are extracted from one of the variable extractable files in ":ref:`ansible_common_var_listup`" which makes them selectable in :menuselection:`Ansible-Pioneer --> Substitute value automatic registration settings`.
| ② Register specific values for the variable linked to the parameter sheet item.
| ③ Register a link between the parameter sheet item and the variable in :menuselection:`Ansible-Pioneer --> Substitute value automatic registration settings`.
| ④ Executing the operation displays the parameter sheet item and variable information linked in :menuselection:`Ansible-Pioneer --> Substitute value automatic registration settings` to :menuselection:`Ansible-Pioneer --> Substitute value management` and outputs it to the host variable file.

.. _ansible_common_legacy_role_var_value:
  
Ansible-LegacyRole
******************

| The specific values of the extracted variables are set by setting specific values to the items on the parameter sheet and tying them to each variable in :menuselection:`Ansible-LegacyRole --> Substitute value automatic registration settings`.
| They are output to the host variable file when the operation is executed.
| The following diagram illustrates the specific value's relationships through :menuselection:`Ansible-LegacyRole --> Substitute value management` in the host's variable file's variables from when the operation is executed to when they are output.

.. figure:: /images/ja/diagram/hensuu_nukidashi_legacyrole.png
   :alt: Variable's specific values in Ansible-LegacyRole host variable files
   :width: 800px

   Variable's specific values in Ansible-LegacyRole host variable files

| ① Variables are extracted from one of the variable extractable files in ":ref:`ansible_common_var_listup`" which makes them selectable in :menuselection:`Ansible-LegacyRole --> Substitute value automatic registration settings`.
| ② Register specific values for the variable linked to the parameter sheet item.
| ③ Register a link between the parameter sheet item and the variable in :menuselection:`Ansible-LegacyRole --> Substitute value automatic registration settings`.
| ④ Executing the operation displays the parameter sheet item and variable information linked in :menuselection:`Ansible-LegacyRole --> Substitute value automatic registration settings` to :menuselection:`Ansible-LegacyRole --> Substitute value management` and outputs it to the host variable file.

| The specific values for the variables registered in :menuselection:`Ansible-LegacyRole --> Substitute value automatic registration settings` are output to the Host variable definition file, (host_vars) .
| The order in which specific values are handled are as follows.

#. | Host variable definition file value
#. | values defined in defaults variable definition file


Ansible common menu
=======================

| This section explains the Ansible common menus and their configurations.

Menu/Page list
-----------------

.. include:: ../../include/ansible_option_ansible-common-console-menu.rst
 
.. tip:: | ※1 Menus that are hidden by default are used for internal processing.
   | The hidden menus are set to be hidden by default when ITA is installed.
   | In order to display them, access :menuselection:`Management console --> Role/Menu link management` and restore the desired menus. For more information, see ":doc:`../it_automation_base/management_console`"
   | We highly recommend against registering data to menus that handle internal processing.

 
Menu operation
====================

| This section explains how to operate the Ansible common menus.


.. _ansible_common_device_list:

Device list
--------

#. |  This menu allows users to maintain  (view/register/update/delete)  device information.
   |  Installing ITA registers the local device as "localhost" to the device list.
   |  The user can select "localhost" as the execution target and the operation be executed within the ansible host.
   |  Note that the Ansible-Pioneer mode can not use "localhost".

   .. figure:: /images/ja/ansible_common/devaicelist/device_list.png
      :width: 800px
      :alt: Submenu page (Device list) 

      Submenu page (Device list) 

#. |  Press the :guilabel:`Register` button to register the operation target device's information.

   .. figure:: /images/ja/ansible_common/devaicelist/registration_device_list.gif
      :width: 800px
      :alt: Registration page (Device list) 

      Registration page (Device list) 


#. | The items found in the registration page are as following.

   .. table:: Registration page item list (Device list) 
      :widths: 8 8 8 8 18 12 12 12
      :align: left

      +-----------------------------------+--------------------------------------------------------+-----------+--------------+-----------------+
      | Item                              | Description                                            | Input     | Input method | Restrictions    |
      |                                   |                                                        |           |              |                 |
      +===================================+========================================================+===========+==============+=================+
      | Management system item number     | Displays an automatically numbered string of 36 char\  | ー        | Automatic    | ー              |
      |                                   | acters.                                                |           |              |                 |
      +-----------------------------------+--------------------------------------------------------+-----------+--------------+-----------------+
      | HW device type                    | Select HW device type.                                 | ー        | List\        | Same as descri\ |
      |                                   |                                                        |           | selection    | ption           |
      |                                   | + | NW (network)                                       |           |              |                 |
      |                                   | + | ST (storage)                                       |           |              |                 |
      |                                   | + | SV (server)                                        |           |              |                 |
      |                                   |                                                        |           |              |                 |
      +-----------------------------------+--------------------------------------------------------+-----------+--------------+-----------------+
      | Host name                         | Input host name.                                       | ○        | Manual       | Max length\     |
      |                                   |                                                        |           |              |  255 bytes      |
      |                                   | This will be used as inventory host when \             |           |              |                 |
      |                                   | executing Ansible.                                     |           |              |                 |
      +-----------------------------------+--------------------------------------------------------+-----------+--------------+-----------------+
      | DNS host name                     | Use the DNS server and input a name that can resolve \ | ー        | Manual       | Max length\     |
      |                                   | the Host name                                          |           |              |  255 bytes      |
      +-----------------------------------+--------------------------------------------------------+-----------+--------------+-----------------+
      | IP address                        | Input IP address\                                      | ー        | Manual       | Max length\     |
      |                                   |  (xxx.xxx.xxx.xxxIPv4 format)                          |           |              |  15 bytes       |
      +-----------------+-----------------+--------------------------------------------------------+-----------+--------------+-----------------+
      | Login\          | User            | Input the username of the login user.                  | ー        | Manual       | Max length\     |
      | Password        |                 |                                                        |           |              |  255 bytes      |
      |                 +-----------------+--------------------------------------------------------+-----------+--------------+-----------------+
      |                 | Password        | Input password                                         | ー        | Manual       | Max length\     |
      |                 |                 | executing Ansible.                                     |           |              |   255 bytes     |
      +-----------------+-----------------+--------------------------------------------------------+-----------+--------------+-----------------+
      | ssh\            | ssh secret key\ | Input a secret key file if the authentication requi\   | ー        | File\        | Max size\       |
      | key\            | file            | res it.\                                               |           |  selection   | 100MB           |
      | authentication\ |                 |                                                        |           |              |                 |
      | information     |                 | The uploaded file is saved in an encrypted state.      |           |              |                 |
      |                 |                 | ※Not downloadable after registered.                   |           |              |                 |
      |                 +-----------------+--------------------------------------------------------+-----------+--------------+-----------------+
      |                 | Passphrase      | If the ssh hidden key file has a passphrase co\        | ー        | Manual       | Max length\     |
      |                 |                 | nfigured to it, input the passphrase.                  |           |              |  255 bytes      |
      +--------+--------+-----------------+--------------------------------------------------------+-----------+--------------+-----------------+
      | Ansib\ | Legacy\| Authentication\ | Select the authentication for connecting to the tar\   | ー        | List\        | Same as descri\ |
      | le\    | /Role\ | method          | get from Ansible core・Ansible Automation Controller.  |           |  selection   | ption           |
      | infor\ | infor\ |                 |                                                        |           |              |                 |
      | mation | mation |                 | + | Password authentication                            |           |              |                 |
      |        |        |                 |   | Login password is required.                        |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 | + | Key authentication (No passphrase)                 |           |              |                 |
      |        |        |                 |   | ssh key file  (id_ras)  upload\                    |           |              |                 |
      |        |        |                 |     is required                                        |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 | + | Key authentication (Passphrase)                    |           |              |                 |
      |        |        |                 |   | ssh key file  (id_ras)  upload\                    |           |              |                 |
      |        |        |                 |     and passphrase input is required                   |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 | + | Password authentication (winrm)                    |           |              |                 |
      |        |        |                 |   | Input WinR connection information if needed.       |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        +--------+--------+--------------------------------------------------------+-----------+--------------+-----------------+
      |        |        | WinRM\ | Port\  | Input a port number to WinRM connect to the Windows \  | ー        | Manual       | 0～65,535       |
      |        |        | connec\| No.    | Server.                                                |           |              |                 |
      |        |        | tion i\|        |                                                        |           |              |                 |
      |        |        | nforma\|        | If nothing is input, the default value will be us.     |           |              |                 |
      |        |        | tion   |        | ed to connect (5985 :http).                            |           |              |                 |
      |        |        |        +--------+--------------------------------------------------------+-----------+--------------+-----------------+
      |        |        |        | Serve\ | Input a server certificate if a https port number wa\  | ー        | File\        | Maximum size\   |
      |        |        |        | r cer\ | s specified for the WinRM connection port.             |           |  selection   | 100MB           |
      |        |        |        | tifi\  |                                                        |           |              |                 |
      |        |        |        | cate   | The uploaded file is saved in an encrypted state.      |           |              |                 |
      |        |        |        |        |                                                        |           |              |                 |
      |        |        |        |        |                                                        |           |              |                 |
      |        |        |        |        | ※Not downloadable after registered.                   |           |              |                 |
      |        |        |        |        |                                                        |           |              |                 |
      |        |        |        |        | If ommiting server certification, add the followin\    |           |              |                 |
      |        |        |        |        | g to the Inventory file's options.                     |           |              |                 |
      |        |        |        |        |                                                        |           |              |                 |
      |        |        |        |        | .. code-block:: yaml                                   |           |              |                 |
      |        |        |        |        |                                                        |           |              |                 |
      |        |        |        |        |    ansible_winrm_server_cert_validation: ignore        |           |              |                 |
      |        |        |        |        |                                                        |           |              |                 |
      |        +--------+--------+--------+--------------------------------------------------------+-----------+--------------+-----------------+
      |        | Pione\ | Protocol        | Select the protocol that will be used to connect fro\  | ー        | List\        | Same as \       |
      |        | er\    |                 | m Pioneer to the target.                               |           |  selection   | description     |
      |        | inform\|                 |                                                        |           |              |                 |
      |        | ation  |                 | + | ssh                                                |           |              |                 |
      |        |        |                 |   | Select something else than "Password authenticati\ |           |              |                 |
      |        |        |                 |     on (winrm)" for the :menuselection:`Authe\         |           |              |                 |
      |        |        |                 |     ntication method`.                                 |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 | + | telnet                                             |           |              |                 |
      |        |        |                 |   | Connect without using the authentication metho\    |           |              |                 |
      |        |        |                 |     d selected in :menuselection:`Authenticatio\       |           |              |                 |
      |        |        |                 |     n method` and connect using telnet.                |           |              |                 |
      |        |        |                 |   | Both :menuselection:`User` and :menuselection:`Pa\ |           |              |                 |
      |        |        |                 |     ssword is required.                                |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        +-----------------+--------------------------------------------------------+-----------+--------------+-----------------+
      |        |        | OS type         | Select the OS of the target.                           | ー        | List\        | Same as \       |
      |        |        |                 |                                                        |           |  selection   | description     |
      |        |        |                 | OS types can be registered from :menuselection:`An\    |           |              |                 |
      |        |        |                 | sible-Pioneer --> OS type`.                            |           |              |                 |
      |        |        +-----------------+--------------------------------------------------------+-----------+--------------+-----------------+
      |        |        | LANG            | Select the LANG :menuselection:`login user` のLANG\    | ー        | List\        | Same as \       |
      |        |        |                 |                                                        | ー        |  selection   | description     |
      |        |        |                 | If nothing is input, the default value, \              |           |              |                 |
      |        |        |                 | "utf-8" will be used.                                  |           |              |                 |
      |        +--------+-----------------+--------------------------------------------------------+-----------+--------------+-----------------+
      |        | Connection option        | Input the options that will be configured when \       | ー        | Manual       | Maximum length\ |
      |        |                          | connecting to the target.                              |           |              |  4000 bytes     |
      |        |                          |                                                        |           |              |                 |
      |        |                          | + | For ssh connections                                |           |              |                 |
      |        |                          |   | Configure options other than ssh options conf\     |           |              |                 |
      |        |                          |     igured to :file:`/etc/ansible.cfg/ssh_args`\       |           |              |                 |
      |        |                          |      and :file:`/etc/ansible/ansible.cfg`\             |           |              |                 |
      |        |                          |                                                        |           |              |                 |
      |        |                          | + | For telnet                                         |           |              |                 |
      |        |                          |   | Input options for when conencting to telnet.       |           |              |                 |
      |        |                          |                                                        |           |              |                 |
      |        +--------------------------+--------------------------------------------------------+-----------+--------------+-----------------+
      |        | Inventory file\          | If adding parameters to the Inventory file created \   | ー        | Manual       | Maximum length\ |
      |        | option                   | by ITA, input the parameters in yaml format.           |           |              |  4000 bytes     |
      |        |                          |                                                        |           |              |                 |
      |        |                          | This will not be applied with Ansible-Pioneer.         |           |              |                 |
      |        |                          |                                                        |           |              |                 |
      |        |                          | For more information regarding the Inventory file, see\|           |              |                 |
      |        |                          |  ":ref:`ansible_common_inventory_file`".               |           |              |                 |
      |        |                          |                                                        |           |              |                 |
      |        |                          | e.g.)                                                  |           |              |                 |
      |        |                          |                                                        |           |              |                 |
      |        |                          | .. code-block:: yaml                                   |           |              |                 |
      |        |                          |                                                        |           |              |                 |
      |        |                          |    ansible_connection: network_cli                     |           |              |                 |
      |        |                          |    ansible_network_os: ios                             |           |              |                 |
      |        |                          |    ansible_become: yes                                 |           |              |                 |
      |        |                          |    ansible_become_method: enable                       |           |              |                 |
      |        |                          |                                                        |           |              |                 |
      |        |                          | It is possible to describe parater values with va\     |           |              |                 |
      |        |                          | riables.                                               |           |              |                 |
      |        |                          | .. code-block:: yaml                                   |           |              |                 |
      |        |                          |                                                        |           |              |                 |
      |        |                          |    ansible_become_password: '{{△vvv△}}'              |           |              |                 |
      |        |                          |                                                        |           |              |                 |
      |        |                          |    △：Half-width space                                |           |              |                 |
      |        |                          |    ':Must be enclosed with single or double quotati\   |           |              |                 |
      |        |                          |      on marks.                                         |           |              |                 |
      |        |                          | For more information regarding describing parameter v\ |           |              |                 |
      |        |                          |  alues with variables, see":ref:`ansible_common_op \   |           |              |                 |
      |        |                          | tion_var_listup`" 。                                   |           |              |                 |
      
      |        |                          | Variable specific values are registered from :menuse\  |           |              |                 |
      |        |                          | lection:`Mode --> Susbtitute value auto registrati\    |           |              |                 |
      |        |                          | on settings`.                                          |           |              |                 |
      |        +--------+-----------------+--------------------------------------------------------+-----------+--------------+-----------------+
      |        | Ansi\  | Instance\       | If the Ansible Automation Controller is in a clus\     | ー        | List \       | Same as \       |
      |        | ble \  | group name※1   | ter configuration, select which instance group \       |           | selection    | description     |
      |        | Autom\ |                 | will be used for the execution.                        |           |              |                 |
      |        | ation \|                 |                                                        |           |              |                 |
      |        | Contr\ |                 | If nothing is selected, the default instance group c\  |           |              |                 |
      |        | oller \|                 | onfigured to the Ansible Automation Controlle\         |           |              |                 |
      |        | use in\|                 | r will be used.                                        |           |              |                 |
      |        | forma\ |                 |                                                        |           |              |                 |
      |        | tion   |                 | If the Ansible Automation Controller is not \          |           |              |                 |
      |        |        |                 | in a cluster configuration, this item can be l\        |           |              |                 |
      |        |        |                 | eft unselected.                                        |           |              |                 |
      |        |        +-----------------+--------------------------------------------------------+-----------+--------------+-----------------+
      |        |        | Connection type | Select the Ansible Automation Controller's au\         | ○        | List \       | Same as \       |
      |        |        |                 | thentication information's connection type.            |           | selection    | description     |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 | Standard is "machine".                                 |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 | For Network OS that must have "ansible_connection" t\  |           |              |                 |
      |        |        |                 | o "local", select "Network".                           |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 | + | If  "Network" is selected, the                     |           |              |                 |
      |        |        |                 |   |  :menuselection:`Add inventory file op\            |           |              |                 |
      |        |        |                 |      tion must be added to Platform Options\           |           |              |                 |
      |        |        |                 |      (other than ansible_connection)                   |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 | e.g.)                                                  |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 | Inventory file additional option configuration example |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 | Setting value when Network OS is "ios".                |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 | .. code-block:: yaml                                   |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 |    ansible_network_os: ios                             |           |              |                 |
      |        |        |                 |    ansible_become: yes                                 |           |              |                 |
      |        |        |                 |    ansible_become_method: enable                       |           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 | For more information regarding connection types, \     |           |              |                 |
      |        |        |                 | see the official Ansible Automation Controller manuals.|           |              |                 |
      |        |        |                 |                                                        |           |              |                 |
      |        |        |                 | For more information regarding Platform options, Net\  |           |              |                 |
      |        |        |                 | work OS and ansible_connection, see the official Ans\  |           |              |                 | 
      |        |        |                 | ible documents' Platform options.                      |           |              |                 |
      +--------+--------+-----------------+--------------------------------------------------------+-----------+--------------+-----------------+
      | Remarks                           | Free description field                                 | ー        | Manually     | Max length\     |
      |                                   |                                                        |           |              |  4000 bytes     |
      +-----------------------------------+--------------------------------------------------------+-----------+--------------+-----------------+

   .. tip:: | ※1 Select from data fetched with :ref:`ansible_common_aac_sync`. 


.. _ansible_common_interface_information:

Interface information
--------------------

#. | Select the Ansible Core or the Ansible Automation Controller to be the execution engine and maintain (view/edit) connection interface information for connecting to the execution engine's server.

   .. figure:: /images/ja/ansible_common/Interface_information/interface_information.png
      :width: 800px
      :alt: Submenu (Interface information) 

      Submenu (Interface information) 

#. | Press the :guilabel:`Edit` button to edit Interface information.

   .. figure:: /images/ja/ansible_common/Interface_information/registration_interface_information.gif
      :width: 800px
      :alt: Registration page (Interface information) 

      Registration page (Interface information) 


#. | The items found in the Registration page are as following.

   .. table:: Registration page item list (Interface information) 
      :widths: 8 8 8 40 8 8 10
      :align: left

      +-----------------+--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      | Item                              | Description                                                   | Input req\| Input method | Restrictions                                          |
      |                                   |                                                               | uired     |              |                                                       |
      +=================+========+========+===============================================================+===========+==============+=======================================================+
      | Number                            | Displays an automatically numbered string of 36 characters.   | ー        | Automatic    | ー                                                    |
      +-----------------+--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      | Execution engine                  | Select one of the 2 following\                                | ○        | List\        | Same as description                                   |
      |                                   | execution engines.                                            |           | selection    |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   | + | Ansible Core                                              |           |              |                                                       |
      |                                   | + | Ansible Automation Controller                             |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      +-----------------+--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      | Ansible \       | Host            | Select the Ansible Automation Controller that communicates w\ | ー        | List\        | Required if :menuselection:`Execution engine` is\     |
      | Automation \    |                 | ith ITA from the Hybrid node registered in :menuselection:`\  |           |  selection   | Ansible Automation Controller                         |
      | Controller \    |                 | Ansiblecommon --> Ansible Automation ControllerHost list`\    |           |              |                                                       |
      | Interface       |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 +--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      |                 | Protocol        | Select either \                                               | ー        | Manual       | Required if :menuselection:`Execution engine` is\     |
      |                 |                 | "http" or "https"\                                            |           |              | Ansible Automation Controller                         |
      |                 |                 | For the connection protocol to the\                           |           |              |                                                       |
      |                 |                 | Ansible Automation Controller                                 |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 +--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      |                 | Port            | Input the port for the Ansible Automation Controller\         | ー        | Manual       | Required if :menuselection:`Execution engine` is\     |
      |                 |                 | Ansible Automation Controller connection port.                |           |              | Ansible Automation Controller                         |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 | Standard value is https (443).                                |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 +--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      |                 | Organization\   | Select an Organization name registered to Ansible Au\         | ー        | List sele\   | Required if :menuselection:`Execution engine` is\     |
      |                 | name            | tomation Controller.                                          |           | ction        | Ansible Automation Controller                         |
      |                 | ※1             |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 +--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      |                 | Authentication\ | Input a user authentication token to connect to \             |           |              | Maximum 255 bytes                                     |
      |                 |  token          | Ansible Automation Controller.                                |           |              |                                                       |
      |                 |                 |                                                               |           |              | Required if :menuselection:`Execution engine` is\     |
      |                 |                 |                                                               |           |              | Ansible Automation Controller                         |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 +--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      |                 | Execution\      | Select whether to delete the data automatically generated b\  | ー        | List select\ | Required if :menuselection:`Execution engine` is\     |
      |                 |  data deletion  | y Ansible Automation Controller during operation executio\    |           | ion          | Ansible Automation Controller                         |
      |                 |                 | n after operation is done.                                    |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |  If set to "True", the data will be deleted.                  |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 | For more information regarding data resources that will\      |           |              |                                                       |
      |                 |                 |  be deleted, see ":ref:`ansible_common_aac_resources_list`".  |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 +--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      |                 | REST API timeo\ | Input a timeout value for the the RestAPI connection \        | ー        | Manual       | 60～3,600                                             |
      |                 | ut value (\     | from ITA to Ansible Automation Controller\                    |           |              |                                                       |
      |                 | seconds)        |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 | The standard time is around 60 seconds.                       |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 | If nothing is input, the default value (60) will be used.     |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      +-----------------+--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      | Proxy           | Address         | Input the address for the proxy server.                       | ー        | Manual       | Maximum 255 bytes                                     |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 | If ITA is under a proxy server, the user might have to co\    |           |              |                                                       |
      |                 |                 | nfigure settings in order to connect with \                   |           |              |                                                       |
      |                 |                 | Ansible Core/Ansible Automation Controller.                   |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 | If the Proxy server URL is \                                  |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 | \http://\                                                     |           |              |                                                       |
      |                 |                 | proxy.gate.co.jp:8080\                                        |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 | Input http://proxy.gate.co.jp into the Address                |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 |                 | Input 8080 for the Port.                                      |           |              |                                                       |
      |                 |                 |                                                               |           |              |                                                       |
      |                 +--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      |                 | Port            | Input a port for the proxy server.                            | ー        | Manual       | 1～65,535                                             |
      |                 |                 |                                                               |           |              |                                                       |
      +-----------------+--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      | Ansible-vault password            | Input a password if the variable's specific values are encr\  | ー        | Manual       | Maximum length 64 btyes                               |
      |                                   | ypted with an ansible-vault command\                          |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   | If nothing is input, the default value will be used.          |           |              |                                                       |
      +-----------------+--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      | Option parameter                  | Input an Optiom parameter for all Movements.\                 | ー        | Manual       | Maximum length 4000 bytes                             |
      |                                   |                                                               |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   | For more information regarding Option parameters, see \       |           |              |                                                       |
      |                                   |  " :ref:`ansible_common_option_parameter_list` " \            |           |              |                                                       |
      |                                   | を参照してください。                                          |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   | + | If the :menuselection:`Execution engine` is  "Ansi\       |           |              |                                                       |
      |                                   |   | ble Core"  Input the ansible-playbook command's option pa\|           |              |                                                       |
      |                                   |     rameter.                                                  |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   | + | If the :menuselection:`Execution engine` is\              |           |              |                                                       |
      |                                   |      "Ansible Automation Controller",                         |           |              |                                                       |
      |                                   |   | Input Job template's parameter.                           |           |              |                                                       |
      |                                   |   | For more information regarding job tempaltes, see th\     |           |              |                                                       |
      |                                   |     e official Ansible Automation Controller manuals\         |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   | Movement fixed option parameters are input from \             |           |              |                                                       |
      |                                   | :menuselection:`Mode --> Movement list`.                      |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      +-----------------+--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      | NULL link                         | If the specific value for the parameter sheet in :menuselecti\| ○        | List select  | Same as description                                   |
      |                                   | on:`Mode --> Substitute value management`is NULL, se\         |           | \ion         |                                                       |
      |                                   | lect whether the registration to the substitute value manage\ |           |              |                                                       |
      |                                   | ment registration should be done with NULL value or not.\     |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   | If the :menuselection:`NULL link` value is not selected, t\   |           |              |                                                       |
      |                                   | his value will be used. :menuselection:`.                     |           |              |                                                       |
      |                                   | + | True                                                      |           |              |                                                       |
      |                                   |   | Registers the value to \                                  |           |              |                                                       |
      |                                   |     :menuselection:`Mode --> Substitute value management` \   |           |              |                                                       |
      |                                   |     menu no matter the value                                  |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   | + | False                                                     |           |              |                                                       |
      |                                   |   | Registers only the value if there is a value input to th\ |           |              |                                                       |
      |                                   |     e :menuselection:`Mode --> Substitute value management`   |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   | If not selected, "False" will be used.                        |           |              |                                                       |
      +-----------------+--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      | Status monitoring cycle(Milisec   | Input the interval time for when the information displays i\  | ○        | Manual       | 1,000～2,147,483,647                                  |
      | onds                              | n :menuselection:`Mode --> Operation status confirmatio\      |           |              |                                                       |
      |                                   | n` is refreshed.                                              |           |              |                                                       |
      |                                   | 1000 miliseconds is the recommended value                     |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      +-----------------+--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      | Progress status dispaly lines     | Display the number of maximum lines that will be displaye に\ | ○        | Manual       | 0～2,147,483,647                                      |
      |                                   | d in the progress log and error log in :menuselection:`Mode\  |           |              |                                                       |
      |                                   |  --> Operation status confirmation`.                          |           |              |                                                       |
      |                                   | If the :menuselection:`Status` is one of the following, the \ |           |              |                                                       |
      |                                   | log will output the specified amount of lines.                |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   | + |  "Not executed"                                           |           |              |                                                       |
      |                                   | + |  "Preparing"                                              |           |              |                                                       |
      |                                   | + |  "Executing"                                              |           |              |                                                       |
      |                                   | + |  "Executing (Delayed)"                                   |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   | If the :menuselection:`Status` is one of the following, the \ |           |              |                                                       |
      |                                   | log will output all lines.                                    |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   | + |  "Complete"                                               |           |              |                                                       |
      |                                   | + |  "Complete (Error)"                                      |           |              |                                                       |
      |                                   | + |  "Unexpected error"                                       |           |              |                                                       |
      |                                   | + |  "Emergency stop"                                         |           |              |                                                       |
      |                                   | + |  "Not executed (Reserved)"                                |           |              |                                                       |
      |                                   | + |  "Reservation deleted"                                    |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      |                                   | We recommend tuning this number depending on the use\         |           |              |                                                       |
      |                                   | r environment. The standard recommended value is 1000 lines.  |           |              |                                                       |
      |                                   |                                                               |           |              |                                                       |
      +-----------------+--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+
      | Remarks                           | Free description field                                        | ー        | Manual       | Maximum length 4000 bytes                             |
      +-----------------+--------+--------+---------------------------------------------------------------+-----------+--------------+-------------------------------------------------------+


   .. tip:: | ※1 Select from data fetched with " :ref:`ansible_common_aac_sync` ".


.. _ansible_common_ansible_automation_controller_hosts:

Ansible Automation Controller host list
----------------------------------------

#. | In the users can maintain (view/register/edit/discard) information required to execute RestAPI to the Ansible Automation Controller and information required to transfer files to Ansible Automation Controller.
   | If it is in a cluster configuration, regsiter all hosts.
   | The user does not need to register Ansible Automation Controller's hop node.

   .. figure:: /images/ja/ansible_common/ansible_automation_controller/ansible_automation_controller_host_list.png
      :width: 800px
      :alt: Submenu (Ansible Automation Controller Host list) 

      Submenu (Ansible Automation Controller Host list) 

#. | Press the :guilabel:`Register` button to register Ansible Automation Controller host information.

   .. figure:: /images/ja/ansible_common/ansible_automation_controller/ansible_automation_controller_host_list.gif
      :width: 800px
      :alt: Registration page (Ansible Automation Controller Host list) 

      Registration page (Ansible Automation Controller Host list) 

#. | The items found in the Registration page are as following.

   .. table:: Registration page item list (Ansible Automation Controller Host list) 
      :align: left

      +-------------+--------------------------------------------------------+-------+-------+-------------------------------+
      | Item　      | Descriptopn                                            | Input\| Input\| Restrictions                  |
      |             |                                                        |  requ\|  meth\|                               |
      |             |                                                        | ired  | od    |                               |
      +=============+========================================================+=======+=======+===============================+
      | Item number | Displays an automatically numbered string of 36 char\  | ー    |       | ー                            |
      |             | acters.                                                |       |       |                               |
      +-------------+--------------------------------------------------------+-------+-------+-------------------------------+
      | Host        | Input a host name of IP address for the Ansible Aut\   | ○    | Manua\| Maximum length 255 bytes      |
      |             | omation Controller\                                    |       | lly   |                               |
      |             |                                                        |       |       |                               |
      |             |                                                        |       |       |                               |
      |             |                                                        |       |       |                               |
      +-------------+--------------------------------------------------------+-------+-------+-------------------------------+
      | Authenticat\| Select the authentication method for sending file \    | ○    | List\ | Same as description          |
      | ion method  | s (scp) to Ansible Automation Controller.              |       | Sele\ |                               |
      |             |                                                        |       | ction |                               |
      |             | + |  Password authentication                           |       |       |                               |
      |             |   | Login password is required.                        |       |       |                               |
      |             |                                                        |       |       |                               |
      |             |                                                        |       |       |                               |
      |             | + | Key authentication (No passphrase)                 |       |       |                               |
      |             |   | ssh key file  (id_ras)  upload\                    |       |       |                               |
      |             |                                                        |       |       |                               |
      |             | + | Key authentication (Passphrase)                    |       |       |                               |
      |             |   | ssh key file  (id_ras)  upload\                    |       |       |                               |
      |             |     and passphrase input is required.                  |       |       |                               |
      |             |                                                        |       |       |                               |
      +-------------+--------------------------------------------------------+-------+-------+-------------------------------+
      | User        | Input the login user for sending files (scp) to Ans\   | ○    | Manua\| Maximum length 255 bytes      |
      |             | ible AutomationController.                             |       | lly   |                               |
      |             |                                                        |       |       |                               |
      |             | Configure a password to the awx user generated when A\ |       |       |                               |
      |             | nsible Automation Controller is installed and in\      |       |       |                               |
      |             | put the awx user.                                      |       |       |                               |
      +-------------+--------------------------------------------------------+-------+-------+-------------------------------+
      | Password    | Required if :menuselection:`Authentication method` i\  | ー    | Manua\| Maximum length 4000 bytes     |
      |             | s set to Password authentication.                      |       | lly   |                               |
      |             |                                                        |       |       |                               |
      |             | Input the login user's password.\                      |       |       |                               |
      +-----+-------+--------------------------------------------------------+-------+-------+-------------------------------+
      | ssh\| ssh\  | Required if the :menuselection:`Authentication metho\  | ー    | File\ | Maximum size 100mb            |
      |  ke\|  hidd\| d` is set to Key configuration.\                       |       |  Sel\ |                               |
      | y a\| en ke\| Input a secret key file if the authentication require\ |       | ection|                               |
      | uth\| y fi\ | s it.                                                  |       |       |                               |
      | ent\| le    |                                                        |       |       |                               |
      | ica\|       | The uploaded file is saved in an encrypted state.\     |       |       |                               |
      | tio\|       |                                                        |       |       |                               |
      | n i\|       |                                                        |       |       |                               |
      | nfo\|       | ※Not downloadable after registered.\                  |       |       |                               |
      | rma\|       |                                                        |       |       |                               |
      | tio\+-------+--------------------------------------------------------+-------+-------+-------------------------------+
      | n   | Passp\| If the ssh hidden key file has a passphrase configur\  | ー    | Manua\| Maximum length 255 bytes      |
      |     | hrase\| ed to it, input the passphrase                         |       | lly   |                               |
      +-----+-------+--------------------------------------------------------+-------+-------+-------------------------------+
      | Port        | Input a port number for ssh connect to Ansib\          | ー    | Manua\| Numeric value                 |
      |             | le Automation Controller.                              |       | lly   |                               |
      |             |                                                        |       |       |                               |
      |             | Default value is 22.                                   |       |       |                               |
      +-------------+--------------------------------------------------------+-------+-------+-------------------------------+
      | Exe\        | Select "True" if the target host is set to Executio\   | ー    | List\ | Same as description           |
      | cut\        | n mode and the "Ansible Automation Controller" i\      |       |  Sel\ |                               |
      | ion \       | s in a cluster configuration.                          |       | ection|                               |
      | node\       |                                                        |       |       |                               |
      |             |                                                        |       |       |                               |
      |             | If "Execution node" is set to  "True" this will not b\ |       |       |                               |
      |             | e displayed to the  \                                  |       |       |                               |
      |             | :menuselection:`Ansible common --> Interface informa\  |       |       |                               |
      |             | tion`'s :menuselection:`Host`.                         |       |       |                               |
      +-------------+--------------------------------------------------------+-------+-------+-------------------------------+
      | Remarks     | Free description field                                 | ー    | Manua\| Maximum length 4000 bytes     |
      |             |                                                        |       | lly   |                               |
      +-------------+--------------------------------------------------------+-------+-------+-------------------------------+


.. _ansible_common_global_variable_list:

Global variable management
------------------

#. | Maintains (view/register/edit/discard) global variable names used by Playbooks and interactive files.

   .. figure:: /images/ja/ansible_common/global_variable/global_variable_list.png
      :width: 800px
      :alt: Submenu (Global variable management) 

      Submenu (Global variable management) 

#. | Press the :guilabel:`Register` button to register Global variables.

   .. figure:: /images/ja/ansible_common/global_variable/global_variable_list.gif
      :width: 800px
      :alt: Registration page (Global variable management) 

      Registration page (Global variable management) 

#. | The items found in the Registration page are as following.

   .. list-table:: Registration page item list (Global variable management) 
      :widths: 20 80 10 10 10
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
        - Automatic input
        - ー 
      * - Global variable name
        - | Input a name for the variable.
          | The name must follow the following format "GBL_****".
          | \****：The name can contain half-width alphanumeric characters and underscore ( _ ). (Minimum value:1 byte, Maximum value:255 bytes)
        - ○ 
        - Manual input
        - Same as description
      * - Specific value.
        - Input a specific Value. Multiple lines of specific values can be input, but if the Pioneer mode's interactive file uses global variables with multiple specific values, an error occur.
        - ー 
        - Manual input
        - Maximum length 4000 bytes
      * - Variable name description
        - Input comments or descriptions regarding the variable.
        - ー 
        - Manual input
        - Maximum length 4000 bytes
      * - Remarks
        - Free description field   - ー 
        - Manual input
        - Maximum length 4000 bytes


.. _ansible_common_file_list:

File management
------------


#. | Maintains (view/register/edit/discard) File materials and file embedded variables used by Playbook and Interactive files.
   | By uploading file materials, users can specify what file material to use within the playbook by specifying file embedded variable names.

   .. figure:: /images/ja/ansible_common/file_management/contents_list.png
      :width: 800px
      :alt: Submenu (File management) 

      Submenu (File management) 

#. | Press the :guilabel:`Register` button to register file embedded variables.

   .. figure:: /images/ja/ansible_common/file_management/contents_list.gif
      :width: 800px
      :alt: Registration page (File management) 

      Registration page (File management) 


#. | The items found in the Registration page are as following.

   .. list-table:: Registration page item list (File management) 
      :widths: 15 50 5 10 20
      :header-rows: 1
      :align: left

      * - Item
        - Description
        - Input required
        - Input method
        - Restrictions
      * - File ID
        - | Displays an automatically numbered string of 36 characters.
        - ー 
        - Automatic
        - ー 
      * - File embedded variable name
        - | Input a variable name that will be embedded to the Playbook.
          | The name must follow the following format "GBL_****".
          | \****：The name can contain half-width alphanumeric characters and underscore ( _ ). (Minimum value:1 byte, Maximum value:255 bytes)
        - ○
        - Manual
        - Same as description
      * - File
        - Upload a file.
        - ○
        - Register file
        - Maximum size 100mb
      * - Remarks
        - Free description field   - ー
        - Manual
        - Maximum length 4000 bytes


.. tip:: | **Ansible-Legacy・Ansible-LegacyRole file embedded variable example**
   | This section contains examples of File embedded file names when describing File materials registered in :menuselection:`Ansible common --> File management` to Playbooks.
   | ※If the file name has a space in it, make sure to enclose it in quotation marks. Not doing so will end in an error.


   | Example)
   
   - | Using the file embedded variables to copy the hosts file registered in :menuselection:`Ansible common --> File management` to the target server's /etc/

     #. | Register hosts file from :menuselection:`Ansible common --> File management`.

        .. list-table:: File management registration contents
           :widths: 30 40
           :header-rows: 1
           :align: left

           * - File embedded variable name
             - File material
           * - CPF_hosts
             - hosts


     #. | Describe a Playbook similar to the one below.
        | ※Input file name for dest. If there is no file name, The Files with ITA Management numbers applied to their names will be processed before the registered file material's file name. 
        | 　For example, for dest=/etc/, the file name will be /etc/"String with 36 characters"_hosts.

        | **Writing Playbooks**

        .. code-block:: yaml

           - copy: src='{{ CPF_hosts }}' dest=/etc/hosts

   - | Unzipping the tool.tgz file registered in :menuselection:`Ansible common --> File management`  under the Target server's /usr/local/bin/ path using the file's file embedded variables.

     #. | Register tool.tgz file from :menuselection:`Ansible common --> File management`.

        .. list-table:: File management registration contents
           :widths: 30 40
           :header-rows: 1
           :align: left

           * - File embedded variable name
             - File collection
           * - CPF_tool_tgz
             - tool.tgz


     #. | Describe a Playbook similar to the one below.

        | **Writing Playbooks**

        .. code-block:: yaml

           - unarchive: src={{ CPF_tool_tgz }} dest=/usr/local/bin

.. tip:: | **Ansible-Pioneer file embedded variable example**
   | This section contains examples of File embedded file names when describing File materials registered in :menuselection:`Ansible common --> File management` to Playbooks.
   | ※If the file name has a space in it, make sure to enclose it in quotation marks. Not doing so will end in an error.


   | e.g.)

   - | Using the file embedded variables to copy the hosts file registered in :menuselection:`Ansible common --> File management` to the target server's /etc/

     #. | Register hosts file from :menuselection:`Ansible common --> File management`.

        .. list-table:: File management registration contents
           :widths: 30 40
           :header-rows: 1
           :align: left

           * - File embedded variable names
             - File collection
           * - CPF_hosts
             - hosts


     #. | The following is an example of writing an interactive file.
        | ※Make sure to describe the file name for the destination as well. If there is no file name, The Files with ITA Management numbers applied to their names will be processed before the registered file material's file name. 
        | 　For example: For /etc/, the file name will be /etc/"String with 36 characters"_hosts.

        | **Writing Interactive files**

        .. code-block:: yaml

          conf:
            # Adjust timeout value according to the file size
            timeout: 60
          exec_list:
            # Authenticate login password for the target device.
            - expect: 'password:'
              exec: '{{ __loginpassword__ }}'
            # Transfer target to file deployed on the AAC side through scp command.
            - expect: '{{ __loginuser__ }}@{{ __dnshostname__ }}'
              exec: 'scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null {{ VAR_scp_user }}@{{ VAR_aac_host }}:{{ CPF_hosts }} /etc/hosts'
            # Password login authentication for scp command (AAC side)
            - expect: 'password:'
              exec: '{{ VAR_scp_user_password }}'
            # end of interactive file
            - expect: '{{ __loginuser__ }}@{{ __dnshostname__ }}'
              exec: exit

        .. list-table:: Variable specific values
           :widths: 30 40
           :header-rows: 1
           :align: left

           * - Variable
             - Specific value
           * - VAR_scp_user
             - awx
           * - VAR_scp_user_password
             - awx user password
           * - VAR_aac_host
             - Ansible Automation Controller

.. _ansible_common_template_list:

Template management
----------------

#. | Maintains (view/register/edit/discard) Template materials and Template embedded variables used by Playbook and Interactive files.
   | By uploading template file materials, , users can specify what template file materials to use within the playbook by specifying template embedded variable names.

   .. figure:: /images/ja/ansible_common/template_management/template_list.png
      :width: 800px
      :alt: Submenu (Template management) 

      Submenu (Template management) 

#. | Press the :guilabel:`Register` button to register template embedded variables.

   .. figure:: /images/ja/ansible_common/template_management/template_list.gif
      :width: 800px
      :alt: Registration page (Template management) 

      Registration page (Template management) 


#. | The items found in the Registration page are as following.

   .. list-table:: Registration page item list (Template management) 
      :widths: 15 50 5 10 20
      :header-rows: 1
      :align: left

      * - Item
        - Description
        - Input required
        - Input method
        - Restrictions
      * - Material ID
        - | Displays an automatically numbered string of 36 characters.
        - ー 
        - Automatic
        - ー 
      * - Template embedded variable name
        - | Input a variable name that will be embedded to the Playbook.
          | The name must follow the following format: "TPF_****".
          | \****：The name can contain half-width alphanumeric characters and underscore ( _ ). (Minimum value:1 byte, Maximum value:255 bytes)
        - ○
        - Manual
        - Same as description
      * - Template material
        - Upload a template file.
        - ○
        - Register file
        - | Text format
          | Maximum size 100mb
      * - Variable definition
        - | Define the variables used within the Template file materials.
          | There are 5 types of variables that can be used within template file materials.※1
        - ー
        - Manual
        - Maximum length 4000 bytes
      * - Remarks
        - Free description field   - ー
        - Manual
        - Maximum length 4000 bytes


.. warning:: | **When variables defined within the templates are extracted**
   | The variables defined within the template files are extracted by internal processes.
   | The variables can have specific values registered to them in :menuselection:`Mode --> Susbtitute value auto registration settings`.
   | The variables are not extracted in realtime, meaning that it may take time before they can be used in :menuselection:`Mode --> Susbtitute value auto registration settings`.

.. tip:: | ※1 **Warnings regarding Variable definition**
   | The variables used within template files must be defined in :menuselection:`Variable definition`.
   | There are a total of 5 different types of variables that can be used within template files. see below for more information.
   | If there are multiple variables with the same name defined, the variable structure must match. If the variable structure does not match, the registration will end in an error.

   .. table:: Variable definition warnings
      :widths: 10 30
      :align: left

      +---------------+------------------------------------------------------+
      | Type          | Warning                                              |
      +===============+======================================================+
      | Normal vari\  | Can shorten specific values.                         |
      | able          |                                                      |
      |               | e.g.)                                                |
      |               |                                                      |
      |               | .. code-block:: yaml                                 |
      |               |                                                      |
      |               |    vvv: value                                        |
      |               |                                                      |
      +---------------+------------------------------------------------------+
      | Multiple spec\| Can shorten specific values.                         |
      | ific value va\|                                                      |
      | riables       | e.g.)                                                |
      |               |                                                      |
      |               | .. code-block:: yaml                                 |
      |               |                                                      |
      |               |    vvv:                                              |
      |               |      - vaule                                         |
      |               |    vvv: []                                           |
      |               |                                                      |
      +---------------+------------------------------------------------------+
      | Multistage    | Multistate variable structures can be defined.       |
      |               |                                                      |
      |               | e.g.)                                                |
      |               |                                                      |
      |               | .. code-block:: yaml                                 |
      |               |                                                      |
      |               |    vvv:                                              |
      |               |      - item1: value       ←Member variable          |
      |               |        item2:             ←Member variable          |
      |               |    vvv:                                              |
      |               |      - array:                                        |
      |               |          - item1: value   ←Member variable          |
      |               |            item2:         ←Member variable          |
      |               |                                                      |
      |               | Templates with multistage variables can only be use\ |
      |               | d in Ansible-LegacyRole.                             |
      |               |                                                      |
      |               | If there are multiple variables with the same name d\|
      |               | efined, the variable structure must match. If the v\ |
      |               | ariable structure does not match, the registratio\   |
      |               | n will end in an error.                              |
      +---------------+------------------------------------------------------+
      | Global variab\| Can shorten specific values.                         |
      | les           |                                                      |
      |               | e.g.)                                                |
      |               |                                                      |
      |               | .. code-block:: yaml                                 |
      |               |                                                      |
      |               |    GBL_xxx: vaule                                    |
      |               |    GBL_xxx_2:                                        |
      |               |                                                      |
      +---------------+------------------------------------------------------+
      | ITA origina\  | does not need definition.                            |
      | l variables   |                                                      |
      +---------------+------------------------------------------------------+

.. tip:: | Variable name supplementary information
    | vvv: Must be within 255 bytes and can contain half-width alphanumeric characters and underscores (_). 
    | xxx: Must be within 251 bytes half-width alphanumeric characters and underscores (_). 
    | Member variables can use all ascii characters (0x20～0x7e) except for the following 7 characters.
    | " . [ ] ' \\ :
    | Note that some characters cannot be used at the start of the variable name unless they are enclosed by quotation marks.
    | For more inforamtion, see the official Ansible documents.

.. include:: ../../include/ansible_option_template_list_legacy_example.rst

.. include:: ../../include/ansible_option_template_list_pioneer_example.rst

.. _ansible_common_unmanaged_var_list:

Unmanaged target variable list
--------------------

#. | Maintains (view/register/edit/discard) variables extracted from ":ref:`ansible_common_var_listup`" the user dont want to display to :menuselection:`Mode --> Susbtitute value auto registration settings`'s  :menuselection:`Movement name:Variable name` 
   | Ansible magic variables are registered when ITA is installed.

   .. figure:: /images/ja/ansible_common/unmanaged_variables/unmanaged_var_list.png
      :width: 800px
      :alt: Submenu (Unmanaged target variable list) 

      Submenu (Unmanaged target variable list) 

#. | Press the :guilabel:`Register` button to register umnamaged variables.

   .. figure:: /images/ja/ansible_common/unmanaged_variables/unmanaged_var_list.gif
      :width: 800px
      :alt: Registration page (Unmanaged target variable list) 

      Registration page (Unmanaged target variable list) 

#. | The items found in the Registration page are as following.

   .. list-table:: Registration page item list (Unmanaged target variable list) 
      :widths: 30 120 30 30 30
      :header-rows: 1
      :align: left

      * - Item
        - Warning
        - Input required
        - Input method
        - Restrictions
      * - Item number
        - | Displays an automatically numbered string of 36 characters.
        - ー 
        - Automatic
        - ー 
      * - Variable name
        - |  Input variable names the user dont want to display in :menuselection:`Mode --> Susbtitute value auto registration settings`'s :menuselection:`Movement name:Variable name`.
          | Variable names can be input as regular expressions.
          | e.g.) \ansible_\*  \*:Wildcard
          |       \ansible_\[0\-9a\-zA\-Z]\*
        - 〇
        - Manual
        - Maximum 255 bytes
      * - Remarks
        - Free description field   - ー
        - Manual
        - Maximum length 4000 bytes

Appendix
====

.. _ansible_common_backyard_content:

BackYard contents
------------------


.. _ansible_common_aac_sync:

Ansible Automation Controller data synchronization
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
| Fetches resources registered to Ansible Automation Controller if the :menuselection:`Execution engine` in :menuselection:`Ansible common --> Interface information` is set to "Ansible Automation Controller".

.. list-table:: Resources fetched from Ansible Automation Controller
   :widths: 10 50
   :header-rows: 1
   :align: left

   * - Resource
     - Application
   * - Organization name
     - | Used with the :menuselection:`Organization name`  list selection in :menuselection:`Ansible common --> Interface information`.
       | Organizations can be seen by users who input the :menuselection:`Ansible common --> Interface information`'s :menuselection:`Authentication token`.
   * - Instance group
     - | Used with the :menuselection:`Instance group` list selection in :menuselection:`Ansible common --> Device list`.
       | Instance groups can be seen by organizations selected in :menuselection:`Ansible common --> Interface information`'s :menuselection:`Organization name`.
   * - Execution environment
     - | Used with the :menuselection:`Execution environment` list selection in :menuselection:`Ansible mode --> Movement list`.
       | Execution envrionments can be seen by organizations selected in :menuselection:`Ansible common --> Interface information`'s :menuselection:`Organization name`.


.. _ansible_common_inventory_file:

Inventory files created by ITA.
----------------------------------

| This section explains inventory files created by ITA.
| The inventory files created by ITA are as following.

.. code-block:: yaml

   all:
     children:
       hostgroups:
         hosts:
           Inventory_host: 
             Inventory_host_parameters:
             Inventory_host_option_parameters:


| Inventory_host has :menuselection:`Ansible common --> Device list`'s :menuselection:`Host name` configured to it.
| Inventory_host_option_parameters has :menuselection:`Ansible common --> Device list`'s :menuselection:`Inventory file additional option` configured to it.
| The parameters configured to Inventory_host_parameters are as following.
| If the setting value items have empty parameters, they will not be configured to Inventory_host_parameters


.. table::   Inventory_host_parameters parameter list
   :widths: 30 20 20 20 20 20 50
   :align: left

   +-------------------------------+-----------------------+------------------------+------------------------+------------------------+-----------------------+-----------------------------------------------------------------------------------------------------------------------------+
   | Parameter name                | :menuselection:`Ansible common --> Device list`'s :menuselection:`Authentication method`                                 | Setting value                                                                                                               |
   +                               +-----------------------+------------------------+------------------------+------------------------+-----------------------+                                                                                                                             +
   |                               | Password authentica\  | Key authentication     | Key authentication     | Key authentication     | Password authenticati\|                                                                                                                             |
   |                               | tion                  |                        |                        |                        | on                    |                                                                                                                             |
   |                               |                       |  (No passphrase)       |  (With passphrase)     |  (Key changed)         | Authentication (winrm)|                                                                                                                             |
   +===============================+=======================+========================+========================+========================+=======================+=============================================================================================================================+
   | ansible_host                  | 〇                    | 〇                     | 〇                     | 〇                     | 〇                    | :menuselection:`Ansible common --> Device list`'s :menuselection:`DNS host` or :menuselection:`DNS host IP address`.        |
   |                               |                       |                        |                        |                        |                       | Changes depending on the contents selected in :menuselection:`Mode --> Movement list`'s :menuselection:`host specificatio\  |
   |                               |                       |                        |                        |                        |                       | n format`.                                                                                                                  |
   +-------------------------------+-----------------------+------------------------+------------------------+------------------------+-----------------------+-----------------------------------------------------------------------------------------------------------------------------+
   | ansible_user                  | 〇                    | 〇                     | 〇                     | 〇                     | 〇                    | :menuselection:`Ansible common --> Device list`'s :menuselection:` login user`                                              |
   +-------------------------------+-----------------------+------------------------+------------------------+------------------------+-----------------------+-----------------------------------------------------------------------------------------------------------------------------+
   | ansible_password              | 〇                    |                        |                        |                        | 〇                    | :menuselection:`Ansible common --> Device list`'s :menuselection:`login password`                                           |
   +-------------------------------+-----------------------+------------------------+------------------------+------------------------+-----------------------+-----------------------------------------------------------------------------------------------------------------------------+
   | ansible_ssh_private_key_file  |                       | 〇                     | 〇                     |                        |                       | :menuselection:`Ansible common --> Device list`'s :menuselection:`ssh secret key file`                                      |
   +-------------------------------+-----------------------+------------------------+------------------------+------------------------+-----------------------+-----------------------------------------------------------------------------------------------------------------------------+
   | ansible_ssh_extra_args        | 〇                    | 〇                     | 〇                     | 〇                     |                       | :menuselection:`Ansible common --> Device list`'s :menuselection:`connection option`                                        |
   +-------------------------------+-----------------------+------------------------+------------------------+------------------------+-----------------------+-----------------------------------------------------------------------------------------------------------------------------+
   | ansible_connection:           |                       |                        |                        |                        | 〇                    | winrm                                                                                                                       |
   +-------------------------------+-----------------------+------------------------+------------------------+------------------------+-----------------------+-----------------------------------------------------------------------------------------------------------------------------+
   | ansible_port                  |                       |                        |                        |                        | 〇                    | :menuselection:`Ansible common --> Device list`'s :menuselection:`WinRM connection information --> Port number`             |
   +-------------------------------+-----------------------+------------------------+------------------------+------------------------+-----------------------+-----------------------------------------------------------------------------------------------------------------------------+
   | ansible_winrm_ca_trust_path   |                       |                        |                        |                        | 〇                    | :menuselection:`Ansible common --> Device list`'s :menuselection:`WinRM connection information --> Server certificate`      |
   +-------------------------------+-----------------------+------------------------+------------------------+------------------------+-----------------------+-----------------------------------------------------------------------------------------------------------------------------+

.. tip:: | 〇: Setting target
 
 
.. _ansible_common_option_parameter_list:

Option parameter list
------------------------

.. include:: ../../include/ansible_option_option_parameter_list.rst


.. _ansible_common_aac_resources_list:

Data resources deleted when executed
-------------------------------------------

.. include:: ../../include/ansible_option_data-resources-deleted.rst


.. _ansible_common_ita_org_var_ipoint_note:

Using ITA original variables in Ansible Automation Controller
--------------------------------------------------------------------------------------------------------------------

.. include:: ../../include/ansible_option_using-ita-original-variables-in-aac.rst

