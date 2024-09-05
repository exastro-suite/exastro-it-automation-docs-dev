========
Collect function
========

Introduction
========

| This document aims to explain how to use the ITA Collect function.

Collect function overview
============

| This section explains the Collect function.

Collect function
----------------

| The Collect function is a function that automatically registers values to parameters based on ITA execution results (source file output by a fixed format).
| This function can collect items from Ansible-Driver.
| For more information regarding Ansible, see the Official Ansible Product Manuals.
| For more information regarding the Ansible-Driver, see :doc:`./index`.
| For more information regarding Parameter sheets, see :doc:`../create_param/menu_creation`.

Collect function overview figure
~~~~~~~~~~~~~~
| The following figure illustrates using the Collect function.

.. _overview_all:

.. figure:: /images/ja/ansible_common/collect_flow/overview_all.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Collect function overview figure

   Collect function overview figure

Collect function data registration process figure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| The following figure illustrates using the Collect function to register data.
| File storage destination is edited/registeered to the Parameter sheet following the Collect item value mnagement settings.

.. figure:: /images/ja/ansible_common/collect_flow/overview_process.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Collect function data registration process figure

   Collect function data registration process figure

.. tip:: | ※For more information regarding Collect function data type examples, see :ref:`about_values_for_collected_files`.

Registering to Parameter sheets
------------------------------------

| The Collect function registers and edits registered setting values and file values to parameter sheets.

Collect function requirements
~~~~~~~~~~~~~~~~~~

| Make sure that the requirements below are met.

- | A parameter sheet (with host/operation) is created in the :menuselection:`Define/Create Parameter sheets` menu.
- | The registration information (source file) is linked to the items in the parameter sheet in :menuselection:`Collection item value management`.
- | Collect target device （Host name） is registered to the Device list.

| If the executed operations outputs any of the statuses below, it will be registered to the parameter sheet.

- | Operation execution result, the operation has successfully ended.
- | Directories and files are arranged in a specific structure as a result of the output of the operation execution.

.. note:: | Each user must prepare the IaC(Plabook, Role) that generates source files going to be registered to the parameter sheets.
          | Reference： Ansible Playbook Collection（OS settings collection）
          | https://github.com/exastro-suite/playbook-collection-docs/blob/master/README.ja.md

Collect function directory, file structure and Variable handling methods
====================================================

| This section explains directories, file structures and variables handled by the Collect function.

.. _target_directory_file_structure:

Collect target directory file structure
----------------------------------

1.  Collect target file format

    .. code-block:: bash
       :caption: Files output in YAML format.

       ■File name：RH_snmp.yml
       ■File contents：
       VAR_RH_sshd_config:
         - key: PermitRootLogin
           value: yes
         - key: PasswordAuthentication
           value: no


2.  Collect target directory structure

| The collectable directory path (output destination for the source file) can be handled as the following variable in IaC (Playbook, Role).

.. _table_ita_original_variable:
.. list-table:: Collect function target directory ITA original variables
   :widths: 10 15 3
   :header-rows: 1
   :align: left

   * - ITA original variable
     - Variable specified contents
     - Remarks
   * - __parameter_dir__
     -   "_parameters"  Operation result directory path
     -
   * - __parameters_file_dir__
     -   "_parameters_file" Operation result directory path
     -
   * -  __parameters_dir_for_epc__
     -   "_parameters" Operation result directory path
     -
   * - __parameters_file_dir_for_epc__
     -   "_parameters_file" Operation result directory path
     -

| The upper directory of the collectable directories (parameters) depends on the "Data relay storage path (Ansible”, Ansible driver execution mdoe and the No. of the operation. 

.. code-block:: bash
   :caption: Collect target directory path

   |-  _parameters           ※1
   |   |-  localhost         ※2
   |       |-  SAMPLE.yml    ※3
   |-  _parameters_file      ※4
   |   |-  localhost         ※2
           |-  test.txt      ※5

| ※Hierarchy structure after the upper directory path

- | Remarks
  | ※1 Collectable directory（Fixed name）
  | ※2 Host name（Items registered in the device list are collectable）
  | ※3 Collect target file
  | ※4 Collectable directory for file uploads（Fixed name）
  | ※5 Uploadable file


.. note:: | If ":ref:`table_ita_original_variable`" is not used for the output destination when creating a Playbook that generates source files, the following structure must be recognised and the Playbook written.


.. list-table:: Upper directory paths for the different Ansible-Driver modes
   :widths: 5 5 15 3
   :header-rows: 1
   :align: left

   * - Mode
     - Mode identifier
     - Hierarchy structure
     - Remarks
   * - Ansible-Legacy
     - legacy
     - /<Upper directory(Ansible）>/legacy/
     -
   * - Ansible-Pioneer
     - pioneer
     - /<Upper directory(Ansible）>/pioneer/
     -
   * - Ansible-LegacyRole
     - legacy_role
     - /<Upper directory(Ansible）>/legacy_role/
     -

.. note:: | ※Upper directory(Ansible） is :file:`/storage/<Organization>/<Workspace>/driver/ansible/`.

| ■　e.g.) File path and Directory structure for Collect target file.

.. code-block:: bash
   :caption: Collect targetfile path and directory structure

   Execution mode： Ansible-Legacy
   Execution No： 00000000-0000-0000-0000-000000000001
   Target： localhost
   Execution directory    ： /storage/Organization/Workspace/driver/ansible/legacy/00000000-0000-0000-0000-000000000001/in/
   Execution result directory： /storage/Organization/Workspace/driver/ansible/legacy/00000000-0000-0000-0000-000000000001/out/
   Collect target file path and directory structure:
     - /storage/Organization/Workspace/driver/ansible/legacy/00000000-0000-0000-0000-000000000001/in/_parameters/localhost/SAMPLE.yml
     - /storage/Organization/Workspace/driver/ansible/legacy/00000000-0000-0000-0000-000000000001/in/_parameters/localhost/OS/RH_snmpd.yml
     - /storage/Organization/Workspace/driver/ansible/legacy/00000000-0000-0000-0000-000000000001/in/_parameters_file/localhost/TEST.txt
     - /storage/Organization/Workspace/driver/ansible/legacy/00000000-0000-0000-0000-000000000001/out/_parameters/localhost/SAMPLE.yml
     - /storage/Organization/Workspace/driver/ansible/legacy/00000000-0000-0000-0000-000000000001/out/_parameters/localhost/OS/RH_snmpd.yml
     - /storage/Organization/Workspace/driver/ansible/legacy/00000000-0000-0000-0000-000000000001/out/_parameters_file/localhost/TEST.txt


| If the user wants the file upload menu to be collectable, a file with the same name as the value of the source file variable (file name) must be placed under _parameters_.
| For more information about Collection item value list settings, please refer to "Collection item value management".
| As the maximum file size for uploads depends on the server specifications, please refer to  ":doc:`../create_param/menu_creation`" for more information.
| The following description methods are available for specifying the files to be uploaded, which are placed under the \_parameters_file distribution.


.. list-table:: Upload target file specification method
   :widths: 5 15 3
   :header-rows: 1
   :align: left

   * - Specification method
     - YAML file input method
     - Remarks
   * - File name specification
     - VAR_FILE_NAME : <‘File name> ’
     -
   * - File path specification (Backwards match)
     - VAR_FILE_NAME : ‘/<HierarchyX>/<File name>’
     -

..   * - File path specification (Complete match)
     - VAR_FILE_NAME : ‘/<Upper directory>/_parameters_file/localhost/<HierarchyX>/<File name>’
     -

.. tip:: | If multiple corresponding files exists when specifying file names, the target file will be random.
         | When specifying file path (backwards match) and there are multiple corresponding files, the target file will be random.

..       | When specifying tile paths (Complete match), target file will be the file in the corresponding path.

| ■　e.g.) Directory structure and source file contents when using variables of Normal variable structure.

.. code-block:: bash
   :caption: Directory structure and source file contents when using variables of Normal variable structure.

    ■Structure
    【Upper directory】
       |-  _parameters
       |   |-  localhost
       |       |-  SAMPLE.yml             ※Source file
       |-  _parameters_file
       |   |-  localhost
       |      |-  test.txt                ※Upload target file
       |      |-  APP001
                 |-  config               ※Upload target file
    ■Collect target File name：SAMPLE.yml
    ■File contents
    VAR_upload_file: test.txt
    VAR_upload_fileX: config
    VAR_upload_fileZ: '/APP001/config'

..    VAR_upload_fileY: '/<Upper directory>/_parameters_file/localhost/APP001/config'

Variable and Variable types
------------------

| The following 3 types of variables can be handled in the Collect function source file.

- | Normal variable
  |  Can have one specific value defined per each variable name.

.. code-block:: yaml
   :caption: Normal variable

   VAR_users: root

- | Multiple specific value variable
  |  Can have multiple specific values defined per each variable name

.. code-block:: yaml
   :caption: Multiple specific value structure

    VAR_users:
      - root
      - mysql

- | Multistage variable
  |  Hierarchical variable.

.. code-block:: yaml
   :caption: 多段変数の構造の変数の場合

    VAR_users:
       - user-name: alice      #Member variable
         authorized: password

.. tip::
         | Member variable names can contain any ascii charactere xcluding the seven characters below. ( ‘0x20~0x7e can be used)
         |  " . [ ] ' \\ :
         | Keep in mind that there are a few characters that can’t be used at the beginning of a variable name unless they are enclosed in quotation marks.
         | For more information, see the official Ansible document, `Yamlsyntax <https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html#gotchas>`__\.

Collect function menu structure
=====================

| This section explains the Collect function menu structure

Menu list
-----------------

#. | :menuselection:`Ansible common` menus
   | The :menuselection:`Ansible common` menu list are as following.

.. list-table:: Ansible common Menu list
   :header-rows: 1
   :align: left

   * - No
     - Menu group
     - Menu
     - Description
   * - 1
     - Ansible common
     - Collection item value management
     - | Set up the connection between the executed operation output results (Source file) and the parameter sheet items and manages the Collect function parameter sheets.

.. figure:: /images/ja/ansible_common/collect_flow/collected_item_value_list.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Setting item value management menu

   Setting item value management menu


#. | Ansible driver menu
   | The Ansible common console menu list is as following.

.. list-table:: Ansible driver menu list
   :header-rows: 1
   :align: left

   * - No
     - Menu group
     - Menu
     - Description
   * - 1
     - Ansible-Legacy
     - Execution management
     - Manages operation execution history.  Refers to the registration status of the parameter sheet and execution log by the Collect function.
   * - 2
     - Ansible-LegacyRole
     - Execution management
     - Manages operation execution history.  Refers to the registration status of the parameter sheet and execution log by the Collect function.
   * - 3
     - Ansible-Pioneer
     - Execution management
     - Manages operation execution history.  Refers to the registration status of the parameter sheet and execution log by the Collect function.

.. figure:: /images/ja/ansible_common/collect_flow/execution_list_legacy.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Execution management menu

   Execution management menu


Collect function procedure
==================

| This section describes the how to use the Collect function.

Workflow
----------

| A standard workflow using the Collect function can be seen below.
| For more information regarding using the ITA Ansible-Driver, see ":doc:`./index`".
| For more information regarding using the ITA Basic console, see ":doc:`../it_automation_base/basic_console`".



Collect function workflow
~~~~~~~~~~~~~~~~~~

| The following workflow starts from executing Ansible to collecting the values to Parameter sheets.

-  Workflow details and references

   #. | Create Parameter sheet (with host/operation)
      | :menuselection:`Create Parameter sheet`'s  :menuselection:`Define/Create Parameter sheets` menu. For more information, see ":doc:`../create_param/menu_creation`".

   #. | Register :menuselection:`Collection item value management`
      | From the :menuselection:`Ansible common` and :menuselection:`Collection item value management` menus, link Source files and Parameter sheet items.
      | For more information, see ":ref:`about_collected_item_value_list`".

   #. | Prepare execution
      | Prepare for the execution.
      | For more information, see  ":doc:`./index`" and ":doc:`../it_automation_base/conductor`".

   #. | Execute
      | Select Execution date, Input operation and Movement and execute.
      | For more information regarding execution, see ":doc:`./index`" and ":doc:`../it_automation_base/conductor`".

   #. | Execute Collect function
      | Use the Execution number from the Finished execution and use the Collect function to register the values to the parameter sheet.
      | For more information, see ":ref:`about_backyard`".

   #. | Check Collection status
      |  In the ":menuselection:`Ansible-Legacy` " / ":menuselection:`Ansible-Pioneer` " / ":menuselection:`Ansible-LegacyRole` "'s :menuselection:`Execution management` menu, users can check the status of the collection process and download the log file.
      | For more information, see ":ref:`about_collect_status`".


Collect function operation 
======================

| This section explains the menu functions used by the Collect function.
| For more information regarding registering information, see ":doc:`../it_automation_base/basic_console`".

Ansible common
-----------

| For more information regarding Ansible common menus, see :doc:`./ansible_common`


.. _about_collected_item_value_list:

Collection item value management
~~~~~~~~~~~~~~

#. | In the :menuselection:`Collection item value management` menu, users can configure links between the collect items and the paramter sheet items.

   .. figure:: /images/ja/ansible_common/collect_flow/submenu_collected_item_value_list.png
      :width: 6.67391in
      :height: 3.20028in
      :align: left
      :alt: Submenu （Collection item value management）

      Submenu （Collection item value management）

#. | Press :menuselection:`List --> Register or Edit` and register a collect item.

   .. figure:: /images/ja/ansible_common/collect_flow/edit_collected_item_value_list.png
      :width: 6.67391in
      :height: 3.20028in
      :align: left
      :alt: Registration/Edit page（Collection item value management）

      Registration/Edit page（Collection item value management）


#. | The items found in the :menuselection:`Collection item value management` menu are as following.

.. list-table:: Registration page item list（Collection item value management）：Collect item(From)
   :header-rows: 1
   :align: left

   * - Item：Collect item(From)
     - Description
     - Input required
     - Restriction
   * - Parse format
     - YAML: Analyses YAML format file and generates Parameter.
     - 〇
     - ※1
   * - PREFIX（File name）
     - Input the File name without the format extention.
     - 〇
     - ※1
   * - Variable name
     - | Input the Collect target's variable name.
       | If the variable name is an Array or hash structure, the user must input Member variable as well.
     - 〇
     - ※1
   * - Member variable
     - Input if the variable is multiple specific values or multistage variable.
     -
     - ※1


.. list-table:: Registration page item list（Collection item value management）：Parameter sheet(To)
   :header-rows: 1
   :align: left

   * - Item：Parameter sheet(To)
     - Description
     - Input required
     - Restrictions
   * - Menu group:Menu:Item
     - | Select an Item.
       | The items are displayed in the following format with the Menu group, Menu name and Item name divided with ":".
     -
     - ※2

.. note:: | ※1 File name, Variable, Variable, Member variable input value example.
          | ※2 If multiple ":menuselection:`PREFIX(File name)` - :menuselection:`Variable names` are defined to single ":menuselection:`Parameter sheet(To)` - :menuselection:`Menu group：Menu：Items`", the execution will follow the file order. For more information, see ":ref:`about_execute_example`".


| ■e.g.) If the variable has a normal variable structure.

.. code-block:: bash
   :caption: If the variable has a normal variable structure.

   ■File name: SAMPLE.yml
   ■File contents

   VAR_sample_config_1: yes
   VAR_sample_config_2: test_parameter

   ■Values that can be input to Collect item value management's Collect item(FROM)

   PREFIX(File name): SAMPLE
   Variable name: VAR_sample_config_1
            VAR_sample_config_2


| ■ e.g.) If the variable has a multiple variable structure 1


.. code-block:: bash
   :caption: If the variable has a multiple variable structure 1

   ■File name: SAMPLE_2.yml
   ■File contents

   VAR_sample2_conf:
     - SAMPLE1
     - SAMPLE2
     - SAMPLE3

   ■Values that can be input to Collect item value management's Collect item(FROM)
   PREFIX(File name): SAMPLE_2
   Variable name: VAR_sample2_conf
   Member variable：  [0]
                [1]
                [2]


| ■ e.g.) If the variable has a multiple variable structure 2

.. code-block:: bash
   :caption: If the variable has a multiple variable structure 2

   ■File name: RH_sshd.yml
   ■File contents

   VAR_RH_sshd_config:
     - key: PermitRootLogin
       value: yes
     - key: PasswordAuthentication
       value: no

    ■Values that can be input to Collect item value management's Collect item(FROM)
    PREFIX(File name): RH_sshd
    Variable name: VAR_RH_sshd_config:
    Member variable：  [0].key
                 [0].value
                 [1].key
                 [1].value


| ■e.g.)If the variable has a multiple variable structure 3

.. code-block:: bash
   :caption: If the variable has a multiple variable structure 3

   ■File name: RH_snmp.yml
   ■File contents

   VAR_RH_snmpd_info:
     com2sec:
       - sec_name: "testsec"
         source: "192.168.1.0/24"
         community: "public"
       - sec_name: "local"
         source: "localhost"
         community: "private"

   ■Values that can be input to Collect item value management's Collect item(FROM)
   PREFIX(File name): RH_snmp
   Variable name: VAR_RH_snmp_config:
   Member variable：  com2sec[0].sec_name
                com2sec[0].source
                com2sec[0].community
                com2sec[1].sec_name
                com2sec[1].source
                com2sec[1].community


Ansible-Legacy、Ansible-Pioneer、Ansible-LegacyRole
-------------------------------------------------------------

.. _about_collect_status:

Check Collect status
~~~~~~~~~~~~~~

| Users can check the status of completed operations and download the log files from the different console's (:menuselection:`Ansible-Legacy` /:menuselection:`Ansible-Pioneer` /:menuselection:`Ansible-LegacyRole` ) :menuselection:`Execution management` menu.

.. figure:: /images/ja/ansible_common/collect_flow/submenu_execution_list_legacy.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Execution management menu

   Execution management menu


.. list-table:: Execution management collect status details
   :header-rows: 1
   :align: left

   * - Item
     - Description
     - Remarks
   * - Status
     - | Collect function execution status
       | Not target; Not a Collect function target (No target file)
       | Collected: Collect function executed.
       | Collected (with notification): If any errors occurred during registration/update.
       | Collection error：There is something wrong with the Movement operation or Host.
     - ※
   * - Collect log
     - Downloads the Collect function execution log
     -

.. list-table:: Collect status details
   :header-rows: 1
   :align: left

   * - | Operation status
       | Status
     - Collect function target
     - Target file
     - | Collect status
       | Status
     - Collect log
     - Remarks
   * - Other than Complete
     - No
     - Not target
     - Blank
     - Blank
     -
   * - Other than Complete
     - Yes
     - Not target
     - Blank
     - Blank
     -
   * - Complete
     - No
     - Target
     - Not target
     - With log file
     -
   * - Complete
     - Yes
     - Target
     - Collected
     - With log file
     -
   * - Complete
     - Yes
     - Target
     - Collected(with notification）
     - With log file
     -
   * - Complete
     - Yes
     - Target
     - Collect error
     - With log file
     -


.. note:: | ※Status notations
          | If the Operation status shows “Not complete”, the :menuselection:`Collect status` will not be updated because it is not subject to the Collect function. 
          | If the operation status shows as “Complete” and there are no files to collect, the status will show as “Collected” and the collection log will be blank.
          | Even if the RESTAPI registration process fails during collecting the “ Collection interface information, :menuselection:`Setting item value management` or “ Menu access rights/permission roles”, the collection will show as “ Complete (with notification)”. 

| **Logfile Output contents example**


| ■ e.g.) Logfile Output contents example

.. code-block:: bash
   :caption: Logfile Output contents example - Collected

    Collect START (host name: exastro-test-1 file name: ['Ansible_conf'])
    REST DATA (host name: exastro-test-1 menu ID: collect_001 operation NO: 4001e182-51d2-4918-96e0-5981c4dc6d5f)
    Collect END (host name: exastro-test-1 file name: ['Ansible_conf'])
    Collect START (host name: exastro-test-2 file name: ['Ansible_conf'])
    REST DATA (host name: exastro-test-2 menu ID: collect_001 operation NO: 4001e182-51d2-4918-96e0-5981c4dc6d5f)
    Collect END (host name: exastro-test-2 file name: ['Ansible_conf'])
    Collect START (host name: exastro-test-3 file name: ['Ansible_conf'])
    REST DATA (host name: exastro-test-3 menu ID: collect_001 operation NO: 4001e182-51d2-4918-96e0-5981c4dc6d5f)
    Collect END (host name: exastro-test-3 file name: ['Ansible_conf'])


.. code-block:: bash
   :caption: Logfile Output contents example - Collected(with notification)

   Collect START (host name: exastro-test-1 file name: ['Ansible_conf'])
   {'item_1': [{'status_code': '', 'msg_args': '', 'msg': 'Regular expression error (1,Value:sample_value)'}]}
   [Process] Failed to register or update data in CMDB. (1/1)
   Collect END (host name: exastro-test-1 file name: ['Ansible_conf'])
   Collect START (host name: exastro-test-2 file name: ['Ansible_conf'])
   {'item_1': [{'status_code': '', 'msg_args': '', 'msg': 'Regular expression error (1,Value:sample_value)'}]}
   [Process] Failed to register or update data in CMDB. (1/1)
   Collect END (host name: exastro-test-2 file name: ['Ansible_conf'])
   Collect START (host name: exastro-test-3 file name: ['Ansible_conf'])
   {'item_1': [{'status_code': '', 'msg_args': '', 'msg': 'Regular expression error (1,Value:sample_value)'}]}
   [Process] Failed to register or update data in CMDB. (1/1)
   Collect END (host name: exastro-test-3 file name: ['Ansible_conf'])


.. code-block:: bash
   :caption: Logfile Output contents example - Collect error [Operation]

   [Process] Operation is abolished, so registration and update processing is skipped (Operation No: 4001e182-51d2-4918-96e0-5981c4dc6d5f)


.. code-block:: bash
   :caption: Logfile Output contents example - Collect error [host]

   [Process] The registration / update process is skipped because the target device has not been registered or has been abolished (host name: exastro-test-1).
   [Process] The registration / update process is skipped because the target device has not been registered or has been abolished (host name: exastro-test-2).
   [Process] The registration / update process is skipped because the target device has not been registered or has been abolished (host name: exastro-test-3).


.. code-block:: bash
   :caption: Logfile Output contents example - Not target

   [Process] There is no file in the collection target directory.


.. _about_backyard:

BackYard contents
------------------

#.  Acquire Collection interface information

    #. | Acquire list over completed operations (with Normal end)
       | Collect targetStatus： Complete

    #. | Acquire the following information from the collectable operation no.
       | - Operation information
       | - Target host
       | - Target source file

    #. | Inquire wether the target host is registered in the Device list or not

       | Registered： Collect target
       | Not registered： Not target

    #. | Acquire the Menu ID of the target Parameter sheet from the source file and the Collection item value list
       | ※If there are multiple Target soruce files, the File names will be processed in rising order.

    #. | Create RESTAPI Parameter with the information gathered in Step 1-4.
       | Query the Menu ID for data and determine the RESTAPI Execution type.
       | Register：　Unique operation and Host combination data is not registered.
       | Update：　 Unique operation and Host combination data is registered.

    #. | Register/Update the data using ITA Standard RESTAPI functions

    #. | Update the status of the Collection status to the Operation No.



| Keep in mind that the timing of the data registration to the Parameter sheet depends on the startup cycle of the Automatic process.
| For more information regarding Target execution results, see ":doc:`./index`".


Appendix
====

References
--------

| Below are examples of IaCs (Playbook and Role)

#. | Exastro Playbook Collection
   | https://github.com/exastro-suite/playbook-collection-docs/blob/master/README.ja.md

#. | 2.	Ansible config collecting and Parameter creating Playbook.

   .. code-block:: yaml
      :name: makeYml_Ansible.yml
      :caption: makeYml_Ansible.yml

       - name: make yaml file
         blockinfile:
           create: yes
           mode: 0644
           insertbefore: EOF
           marker: ""
           dest: "{{ __parameter_dir__  }}/{{ inventory_hostname }}/Ansible_conf.yml"
           content: |
            ansible_architecture: {{ ansible_architecture }}
            ansible_bios_version: {{ ansible_bios_version }}
            ansible_default_ipv4__address: {{ ansible_default_ipv4.address }}
            ansible_default_ipv4__interface: {{ ansible_default_ipv4.interface }}
            ansible_default_ipv4__network: {{ ansible_default_ipv4.network }}
            ansible_distribution: {{ ansible_distribution }}
            ansible_distribution_file_path: {{ ansible_distribution_file_path }}
            ansible_distribution_file_variety: {{ ansible_distribution_file_variety }}
            ansible_distribution_major_version: {{ ansible_distribution_major_version }}
            ansible_distribution_release: {{ ansible_distribution_release }}
            ansible_distribution_version: {{ ansible_distribution_version }}
            ansible_machine: {{ ansible_machine }}
            ansible_memtotal_mb: {{ ansible_memtotal_mb }}
            ansible_nodename: {{ ansible_nodename }}
            ansible_os_family: {{ ansible_os_family }}
            ansible_pkg_mgr: {{ ansible_pkg_mgr }}
            ansible_processor_cores: {{ ansible_processor_cores }}
            ansible_processor_count: {{ ansible_processor_count }}
            ansible_processor_threads_per_core: {{ ansible_processor_threads_per_core }}
            ansible_processor_vcpus: {{ ansible_processor_vcpus }}
            ansible_product_name: {{ ansible_product_name }}
            ansible_product_serial: {{ ansible_product_serial }}
            ansible_product_uuid: {{ ansible_product_uuid }}
            ansible_product_version: {{ ansible_product_version }}
            ansible_python__executable: {{ ansible_python.executable }}
            ansible_python_version: {{ ansible_python_version }}
            ansible_service_mgr: {{ ansible_service_mgr }}
            vconsole_config: vconsole.conf
            yum_config: yum.conf

      - name: get vconsole config
        fetch:
          src: /etc/vconsole.conf
          dest: "{{ __parameters_file_dir__ }}/{{ inventory_hostname }}/"
          flat: yes

      - name: get yum config
        fetch:
          src: /etc/yum.conf
          dest: "{{ __parameters_file_dir__ }}/{{ inventory_hostname }}/"
          flat: yes

.. note::
         | ※　When executing makeYML_Ansible.yml and generate the Collectable source file (yaml), gather_facts must be enabled.
         | When editing the Movement list in Ansible Legacy, enter the following in the header section.
         | For more information, see ":doc:`./index`".


.. code-block:: yaml
   :caption: gather_facts valid setting example

   - hosts: all
     remote_user: "{{ __loginuser__ }}"
     gather_facts: yes
     become: yes

.. _about_execute_example:

Collect function examples
----------

When target have multiple files for single menu
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| The following section shows an example of the directory and the collect process when multiple "PREFIX (file name)-Variable names" are set to a single "Menu-Item" and there are multiple corresponding source files in the target host's collect directory.


.. code-block:: bash
   :name: Collect target file
   :caption: Collect target file

   【Upper directory】
      |-  _parameters
          |-  ita-sample01
              |-  SAMPLE_01.yml
              |-  SAMPLE_02.yml


| **■ Collection item value management settings**

| ■File name：SAMPLE_01.yml ,SAMPLE_02.yml

.. list-table:: File contents
   :widths: 10 10
   :header-rows: 1
   :align: left

   * - SAMPLE_01.yml
     - SAMPLE_02.yml
   * - | VAR_sample_config_1: 1
       | VAR_sample_config_2: 2
       | VAR_sample_config_3: 3
     - | VAR_sample_config_1: “A”
       | VAR_sample_config_B: “B”
       | VAR_sample_config_X: “X”


| **■ Collecting target menu items and configuring collected value item lists**

1. Collecting target menu items and configuring collected value item lists

.. figure:: /images/ja/ansible_common/collect_flow/link_parameter_collected_item_value_list.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Collect value item target settings and parameter sheet

   Collect value item target settings and parameter sheet

| **■Execute Collect process per File according to the Collect value item management's setting contents**

1. SAMPLE_01.yml registration process（Register）

.. figure:: /images/ja/ansible_common/collect_flow/var_sample_01_register.png
   :alt: SAMPLE_01.yml registration process（Register）
   :width: 6.00785in
   :height: 0.51786in

2. SAMPLE_02.yml registration process（Update）

.. figure:: /images/ja/ansible_common/collect_flow/var_sample_02_update.png
   :alt: SAMPLE_02.yml registration process（Update）
   :width: 6.06086in
   :height: 0.52304in

3. Record status after running the collect function.

.. figure:: /images/ja/ansible_common/collect_flow/var_sample_03_end.png
   :alt: Record status after running the collect function.
   :width: 6.06086in
   :height: 0.52834in


.. _about_values_for_collected_files:

Handling Collect target file values
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| For Collect target files output in Yaml format, the handling of values during the registration process in the parameter sheet are handled as following.

.. code-block:: yaml
   :name: Collect target file例
   :caption: Sample.yml

   VAR_TEST: TEST
   VAR_STR_TEST1: 'TEST1'
   VAR_STR_TEST2: "TEST2"
   VAR_null: null
   VAR_NULL: NULL
   VAR_STR_null: "null"
   VAR_STR_NULL: "NULL"
   VAR_true: true
   VAR_false: false
   VAR_STR_true: "true"
   VAR_STR_false: "false"
   VAR_YES: YES
   VAR_NO: NO
   VAR_STR_YES: "YES"
   VAR_STR_NO: "NO"
   VAR_NON:
   VAR_Quotation: ''
   VAR_WQuotation: ""


| ■ Collect target YAML (sample.yml) key and value

.. list-table:: Collect target YAML (sample.yml) key and value
   :widths: 3 10 10 5
   :header-rows: 1
   :align: left

   * - No
     - Key
     - Value
     - Remarks
   * - 1
     - VAR_TEST
     - TEST
     -
   * - 2
     - VAR_STR_TEST1
     - 'TEST1'
     -
   * - 3
     - VAR_STR_TEST2
     - "TEST2"
     -
   * - 4
     - VAR_null
     - null
     -
   * - 5
     - VAR_NULL
     - NULL
     -
   * - 6
     - VAR_STR_null
     - "null"
     -
   * - 7
     - VAR_STR_NULL
     -  "NULL"
     -
   * - 8
     - VAR_true
     - true
     -
   * - 9
     - VAR_false
     - false
     -
   * - 10
     - VAR_STR_true
     -  "true"
     -
   * - 11
     - VAR_STR_false
     - "false"
     -
   * - 12
     - VAR_YES
     - YES
     -
   * - 13
     - VAR_NO
     - NO
     -
   * - 14
     - VAR_STR_YES
     - "YES"
     -
   * - 15
     - VAR_STR_NO
     - "NO"
     -
   * - 16
     - VAR_NON
     -
     -
   * - 17
     - VAR_Quotation
     - ''
     -
   * - 18
     - VAR_WQuotation
     - ""
     -

| ■ Collecting YAML(sample.yml)

.. list-table:: Collecting YAML(sample.yml)
   :header-rows: 1
   :align: left

   * - No
     - Collect target (Key:Value)
     - | Parameter sheet
       | Item name
     - | RESTAPI response
       | Value
     - | RESTAPI response
       | Data type
     - WEB page display
   * - 1
     - VAR_TEST: TEST
     - Parameter/VAR_TEST
     - "TEST"
     - string
     - TEST
   * - 2
     - VAR_STR_TEST1: 'TEST1'
     - Parameter/VAR_STR_TEST1
     - "TEST1"
     - string
     - TEST1
   * - 3
     - VAR_STR_TEST2: "TEST2"
     - Parameter/VAR_STR_TEST2
     - "TEST2"
     - string
     - TEST2
   * - 4
     - VAR_null: null
     - Parameter/VAR_null
     - null
     - null
     -
   * - 5
     - VAR_NULL: NULL
     - Parameter/VAR_NULL
     - null
     - null
     -
   * - 6
     - VAR_STR_null: "null"
     - Parameter/VAR_STR_null
     - "null"
     - string
     -  null
   * - 7
     - VAR_STR_NULL: "NULL"
     - Parameter/VAR_STR_NULL
     -  "NULL"
     -  string
     -  NULL
   * - 8
     - VAR_true: true
     - Parameter/VAR_true
     - true
     - boolean
     - true
   * - 9
     - VAR_false: false
     - Parameter/VAR_false
     - false
     - boolean
     - false
   * - 10
     - VAR_STR_true: "true"
     - Parameter/VAR_STR_true
     - "true"
     - string
     - true
   * - 11
     - VAR_STR_false: "false"
     - Parameter/VAR_STR_false
     - "false"
     - string
     - false
   * - 12
     - VAR_YES: YES
     - Parameter/VAR_YES
     - true
     - boolean
     - true
   * - 13
     - VAR_NO: NO
     - Parameter/VAR_NO
     - false
     - boolean
     - false
   * - 14
     - VAR_STR_YES: "YES"
     - Parameter/VAR_STR_YES
     - "YES"
     - string
     - YES
   * - 15
     - VAR_STR_NO: "NO"
     - Parameter/VAR_STR_NO
     - "NO"
     - string
     - NO
   * - 16
     - VAR_NON:
     - Parameter/VAR_NON
     - null
     - null
     -
   * - 17
     - VAR_Quotation: ''
     - Parameter/VAR_Quotation
     - ""
     - string
     -
   * - 18
     - VAR_WQuotation: ""
     - Parameter/VAR_WQuotation
     - ""
     - string
     -


| ※This section explains RESTAPI response values and Data types displayed on the WebUI.
| ※The Parameter sheet items are strings (single line).

-  Target parameter sheet on WebUI display result

.. figure:: /images/ja/ansible_common/collect_flow/val_test_filter_item1_9.png
   :alt: Target parameter sheet on WebUI display result 1
   :width: 6.96252in
   :height: 1.98221in

   Target parameter sheet on WebUI display result 1

.. figure:: /images/ja/ansible_common/collect_flow/val_test_filter_item10_18.png
   :alt: Target parameter sheet on WebUI display result 2
   :width: 6.96252in
   :height: 1.98221in

   Target parameter sheet on WebUI display result 2

-  Results fetched with Target Parameter sheet's RESTAPI(filter)

.. code-block:: json
   :caption: RESTAPI(filter) response

   {
       "data": [
           {
               "file": {},
               "parameter": {
                   "base_datetime": "2023/05/17 13:58:47",
                   "discard": "0",
                   "host_name": "exastro-test-1",
                   "item_1": "TEST",
                   "item_10": "true",
                   "item_11": "false",
                   "item_12": true,
                   "item_13": false,
                   "item_14": "YES",
                   "item_15": "NO",
                   "item_16": null,
                   "item_17": "",
                   "item_18": "",
                   "item_2": "TEST1",
                   "item_3": "TEST2",
                   "item_4": null,
                   "item_5": null,
                   "item_6": "null",
                   "item_7": "NULL",
                   "item_8": true,
                   "item_9": false,
                   "last_execute_timestamp": "2023/05/17 13:58:47",
                   "last_update_date_time": "2023/05/17 14:00:07.944031",
                   "last_updated_user": "Collect execute function",
                   "operation_date": "2023/01/01 00:00:00",
                   "operation_name_disp": "OP1",
                   "operation_name_select": "2023/01/01 00:00_OP1",
                   "remarks": null,
                   "uuid": "ede113f8-14b1-48bf-8b3f-409f68b107ae"
               }
           }
       ],
       "message": "SUCCESS",
       "result": "000-00000",
       "ts": "2023-05-17T05:54:03.937Z"
   }


If multiple files with the same file names are Upload target files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| This section describes an example of specifying an Upload target file for a Collect target file output in Yaml format, when the same file name needs to be handled on the same host and by hierarchy.

.. code-block:: bash
   :caption: Collect target file File path and Directory structure (Multiple file with same file name)

   【Upper directory】
      |-  _parameters
      |   |-  localhost
      |       |-  SAMPLE.yml
      |-  _parameters_file
      |   |-  localhost
                |-  APP001
                    |-  config                   #①
                |-  APP002
                    |-  config                   #②
                |-  APP003
                    |-  config                   #③
                |-  APP002
                    |-  config                   #④

     ■Collect target file name：SAMPLE.yml
     ■File contents
     VAR_upload_file_1: config
     VAR_upload_file_2: ‘/APP002/config’
     VAR_upload_file_3: ‘/APP001/config’
     VAR_upload_file_4: ‘/APP003/APP002/config’

..     VAR_upload_file_2: ‘/<Upper directory>/_parameters_file/localhost/APP002/config’

| ※For more information regarding Upper directories, see ":ref:`target_directory_file_structure`".
|  The target Collect file when collected are as following.

.. list-table:: Collect target file
   :widths: 10 10 5
   :header-rows: 1
   :align: left

   * - Collect item(FROM)/Variable name
     - Target file
     - Remarks
   * - VAR_upload_file_1
     - Random from File ①、②、③、④
     -
   * - VAR_upload_file_2
     - Random from File ②、④
     -
   * - VAR_upload_file_3
     - File ① is Target
     -
   * - VAR_upload_file_4
     - File ④ is Target
     -

..   * - VAR_upload_file_2
     - File ② is Target

Target file contents when File is deleted.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| This section contains Collect target file specification examples for deleting File upload items.
| Files being deleted must have the Target variable name's value be blank.

.. code-block:: bash
   :caption: Collect target file's File path and Directory structure when deleting File upload item

   【Upper directory】
      |-  _parameters
      |   |-  localhost
      |       |-  SAMPLE.yml   ※Source file
      |-  _parameters_file
      |   |-  localhost

    ■Collect target file name: SAMPLE.yml
    ■File contents
    VAR_upload_file: ""         ※Upload target file
