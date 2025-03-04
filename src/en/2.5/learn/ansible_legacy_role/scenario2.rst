==============
Package management
==============

| In this scenario, the user will learn techniques on how to manage and operate parameter sheets better by installing and uninstalling packages.

.. tip:: We highly recommend that the user finishes the :doc:`previous scenario <scenario1>` before starting this one.


Design parameters
==============

| The parameter sheet setting items used in this scenario are "Package name" and "Desired install state".
| With these items, we can:

- Manage whether the state of the package should be "Installed" or "Not installed" with The "Desired install state" item.
- Manage multiple indefinite packages.

| Let us now see how we can design parameter sheets to do this.

Create selectable options
------------

| Registering parameters through manual input will always come with the risk of typing mistakes or other errors.
| By making the parameters selectable, we can prevent such mistakes.

| First, we will create the options for the "Desired install state" item, being :kbd:`present` (Installed) and :kbd:`absent` (Not installed).
| More specifically, we will create a data sheet and input parameters that will be selectable options.

.. glossary:: Data sheet
   Data structure that manages fixed parameter values used by Exastro IT Automation.

.. _quickstart_create_datasheet:

Create data sheet
^^^^^^^^^^^^^^^^^^

| Create a data sheet

| From the :menuselection:`Create parameter sheet --> Define/create parameter sheet` menu, create a data sheet.

.. figure:: ../../../../images/learn/quickstart/scenario2/データシートの作成.gif
   :width: 1200px
   :alt: Data sheet creation

.. list-table:: Data sheet item setting values
   :widths: 10 10
   :header-rows: 1

   * - Setting item
     - Item 1 setting value
   * - Item name
     - :kbd:`present-absent`
   * - Item name(for Rest API) 
     - :kbd:`present-absent`
   * - Input method
     - :kbd:`String(Single line)`
   * - Maximum byte number
     - :kbd:`16`
   * - Regular expression
     - 
   * - Default value
     - 
   * - Required
     - ✓
   * - Unique restriction
     - 
   * - Description
     - 
   * - Remarks
     - 

.. list-table:: Parameter sheet creation information setting values
   :widths: 5 10
   :header-rows: 1

   * - Setting item
     - Setting value
   * - Item number
     - (Automatic)
   * - Parameter sheet name
     - :kbd:`State`
   * - Parameter sheet name(REST)
     - :kbd:`state`
   * - Creation target
     - :kbd:`Data sheet`
   * - Dispaly order
     - :kbd:`99999`
   * - Last updated date/time
     - (Automatic)
   * - Last updated by
     - (Automatic)

Register options
^^^^^^^^^^^^

| In this step, we will register that parameters that will be displayed as selectable options in the parameter list.
| In the :menuselection:`Input --> State` menu, register the desired install state of the packages.

.. figure:: ../../../../images/learn/quickstart/scenario2/選択肢を登録.gif
   :width: 1200px
   :alt: Selectable option registration

.. list-table:: State setting values
   :widths: 10 10
   :header-rows: 2

   * - Parameter
     - Remarks
   * - present-absent
     - 
   * - :kbd:`present`
     - Install
   * - :kbd:`absent`
     - Uninstall

Create parameter sheet
----------------------

| When managing parameters for server and network devices, the user might need to manage multiple parameters for single items.
| For example, IP addresses, users and other items that might have multiple values on a single machine.
| For cases like this, we can manage the parameters in a table format. This allows the user to freely add IP addresses and users later without having to fix the format of the parameter sheet. 

| Therefore, in this scenario, we will use bundled parameter sheets, which allows us to manage multiple parameters.

| In the :menuselection:`Create paramete sheet --> Define/create parameter sheet` menu, register a parameter sheet.
| By configuring item 1's :menuselection:`Input method` to :kbd:`Pulldown selection`, the user can reference the data sheet created in :ref:`quickstart_legacy_create_datasheet`.

.. figure:: ../../../../images/learn/quickstart/scenario2/パラメータ項目設定.gif
   :width: 1200px
   :alt: Parameter sheet creation information settings

.. list-table:: Parameter item settings
   :widths: 10 10 10
   :header-rows: 1
   :class: filter-table

   * - Setting item
     - Item 1 setting value
     - Item 2 setting value
   * - Item name
     - :kbd:`Package name`
     - :kbd:`State`
   * - Item name(for Rest API) 
     - :kbd:`package_name`
     - :kbd:`state`
   * - Input method
     - :kbd:`String(Single line)`
     - :kbd:`Pulldown selection`
   * - Maximum byte number
     - :kbd:`64`
     - (No item)
   * - Regular expression
     - 
     - (No item)
   * - Select item
     - (No item)
     - :kbd:`Input:State:present-absent`
   * - Reference item
     - (No item)
     - 

   * - Default value
     - 
     - 
   * - Required
     - ✓
     - ✓
   * - Unique restriction
     - 
     - 
   * - Description
     - 
     - 
   * - Remarks
     - 
     - 

| In the parameter sheet creation information, we can check the  :menuselection:`Use bundles` option to configure multiple parameters for single items.

.. figure:: ../../../../images/learn/quickstart/scenario2/パラメータシートの作成情報設定.png
   :width: 1200px
   :alt: Parameter sheet creation information settings

.. list-table:: Parameter sheet creation information setting values
   :widths: 5 10
   :header-rows: 1
   :class: filter-table

   * - Setting item
     - Setting value
   * - Item number
     - (Automatic)
   * - Parameter sheet name
     - :kbd:`Install package`
   * - Parameter sheet name(REST)
     - :kbd:`packages`
   * - Creation target
     - :kbd:`Parameter sheet（With host/operation）`
   * - Display order
     - :kbd:`2`
   * - Use bundles
     - Check (Activate)
   * - Last updated date/time
     - (Automatic)
   * - Last updated by
     - (Automatic)


Register operation procedure
==============

| In order to register the operation procedure, the user must define a Movement(job), which is a unit of operation in Exastro IT Automation.
| We will then link the an Ansible Role package to the defined Movement, and then link the variables within the Ansible Role package with the parameter sheet items.

Register Movement
-------------

 From the :menuselection:`Ansible-LegacyRole --> Movement list` menu, register a Movement for the Package management.

.. figure:: ../../../../images/learn/quickstart/scenario2/Movement一覧登録1.png
   :width: 1200px
   :alt: Movement registration

.. list-table:: Movement information setting values
   :widths: 10 10 10
   :header-rows: 2

   * - Movement name
     - Ansible use information
     - 
   * - 
     - Host specification format
     - Header section
   * - :kbd:`Package management`
     - :kbd:`IP`
     - :kbd:`※See header section`

.. code-block:: bash
   :caption: Header section

   - hosts: all
     remote_user: "{{ __loginuser__ }}"
     gather_facts: no
     become: yes

Register Ansible Role package
-----------------

| This scenario uses the `Exastro Playbook Collection <https://github.com/exastro-suite/playbook-collection-docs/blob/master/ansible_role_packages/README.md>` registered in the :doc:`previous scenario <scenario1>`. No additional registration or configuration is required. 

Link Movement and Ansible Role
---------------------------------

| From the :menuselection:`Ansible-LegacyRole --> Movement-Role link` menu, register a link between the Movement and the Ansible Role package.
| In this scenario, we will use the `Ansible role package for RPM management <https://github.com/exastro-playbook-collection/OS-RHEL8/tree/master/RH_rpm/OS_build>`.

.. figure:: ../../../../images/learn/quickstart/scenario2/MovementとRole紐づけ.png
   :width: 1200px
   :alt: Movement-Role link

.. list-table:: Movement-Role link information registration
  :widths: 10 30 10
  :header-rows: 1

  * - Movement name
    - Role package name:Role name
    - Include order
  * - :kbd:`Package management`
    - :kbd:`OS-RHEL8:OS-RHEL8/RH_rpm/OS_build`
    - :kbd:`1`

Variable nest management
--------------

| Each server can only have 1 host name registered to them, meaning that VAR_RH_hostname is defined to be handled as a simple variable.

.. code-block:: yaml
   :caption: VAR_RH_hostname variable structure

   # Only 1 value for VAR_RH_hostname
   VAR_RH_hostname: myhostname

| On the other hand, it is normal for each server to manage multiple packages, meaning that VAR_RH_rpm is defined to handled as multi stage variables that manages multiple sets of variables.。

.. code-block:: yaml
   :caption: VAR_RH_rpm variable structure(=Multi-stage variable)

   # Indefinite number variable set (action and pkg name) repeats for VAR_RH_rpm
   VAR_RH_rpm:
   - action: absent
     pkg_name: httpd
   - action: present
     pkg_name: vsftpd
     ...

| For multi-stage variables such as VAR_RH_rpm, the user must determine a max number in advance.
| For this scenario, we will set the max number of managed packages to 10.

| From :menuselection:`Ansible-LegacyRole --> Variable nest management`, configure a max value for the number of allowed managed packages.

.. figure:: ../../../../images/learn/quickstart/scenario2/変数ネスト管理.gif
   :width: 1200px
   :alt: Variable nest management

.. list-table:: Variable nest information registration
   :widths: 10 10 20 10
   :header-rows: 1

   * - Movement name
     - Variable name
     - Member variable name(Repeating)
     - Maximum repetitions
   * - Package management
     - VAR_RH_rpm
     - 0
     - :kbd:`10`

Substitute value auto registration settings
------------------

| By substituting the :kbd:`VAR_RH_rpm` variable in the OS-RHEL8 Ansible Role package with the managed package names and their state, we can configure the packages on the target server.

| From the :menuselection:`Ansible-LegacyRole --> Substitute value auto registration settings` menu, link the variables within the Ansible role package's :kbd:`VAR_RH_rpm` together with the Package name and State item parameters from the Input Package parameter sheet.

.. figure:: ../../../../images/learn/quickstart/scenario2/代入値自動登録設定.png
   :width: 1200px
   :alt: Substitute value auto registration settings

.. list-table:: Substitute value auto registration settings setting values
  :widths: 40 10 10 20 20 30
  :header-rows: 2

  * - Parameter sheet(From)
    -
    - Registration method
    - Movement name
    - IaC variable(To)
    -
  * - Menu group:Menu:Item
    - Substitute order
    -
    -
    - Movement name:Variable name
    - Movement name:Variable name:Member variable
  * - :kbd:`Substitute value auto registration:Input package:Package name`
    - :kbd:`1`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[0].pkg_name`
  * - :kbd:`Substitute value auto registration:Input package:State`
    - :kbd:`1`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[0].action`
  * - :kbd:`Substitute value auto registration:Input package:Package name`
    - :kbd:`2`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[1].pkg_name`
  * - :kbd:`Substitute value auto registration:Input package:State`
    - :kbd:`2`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[1].action`
  * - :kbd:`Substitute value auto registration:Input package:Package name`
    - :kbd:`3`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[2].pkg_name`
  * - :kbd:`Substitute value auto registration:Input package:State`
    - :kbd:`3`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[2].action`
  * - :kbd:`Substitute value auto registration:Input package:Package name`
    - :kbd:`4`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[3].pkg_name`
  * - :kbd:`Substitute value auto registration:Input package:State`
    - :kbd:`4`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[3].action`
  * - :kbd:`Substitute value auto registration:Input package:Package name`
    - :kbd:`5`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[4].pkg_name`
  * - :kbd:`Substitute value auto registration:Input package:State`
    - :kbd:`5`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[4].action`
  * - :kbd:`Substitute value auto registration:Input package:Package name`
    - :kbd:`6`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[5].pkg_name`
  * - :kbd:`Substitute value auto registration:Input package:State`
    - :kbd:`6`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[5].action`
  * - :kbd:`Substitute value auto registration:Input package:Package name`
    - :kbd:`7`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[6].pkg_name`
  * - :kbd:`Substitute value auto registration:Input package:State`
    - :kbd:`7`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[6].action`
  * - :kbd:`Substitute value auto registration:Input package:Package name`
    - :kbd:`8`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[7].pkg_name`
  * - :kbd:`Substitute value auto registration:Input package:State`
    - :kbd:`8`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[7].action`
  * - :kbd:`Substitute value auto registration:Input package:Package name`
    - :kbd:`9`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[8].pkg_name`
  * - :kbd:`Substitute value auto registration:Input package:State`
    - :kbd:`9`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[8].action`
  * - :kbd:`Substitute value auto registration:Input package:Package name`
    - :kbd:`10`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[9].pkg_name`
  * - :kbd:`Substitute value auto registration:Input package:State`
    - :kbd:`10`
    - :kbd:`Value type`
    - :kbd:`Package management`
    - :kbd:`Package name:VAR_RH_rpm`
    - :kbd:`Package name:VAR_RH_rpm:[9].action`

| Manually inputting all these values through the Web UI would be unrealistic.
| For cases where the users wants to register large amounts of data, they can use the Download all/file bulk registration function to register data using a file.
| From :menuselection:`Ansible-LegacyRole --> Substitute value auto registration settings` --> Download all/File bulk registration, download the file for new registrations. Users can then edit the file to register files and substitute value auto registration settings more easily.

.. figure:: ../../../../images/learn/quickstart/scenario2/代入値自動登録設定_一括登録.gif
   :width: 1200px
   :alt: Substitute value auto registration settings(bulk registration)

Register target
==============

| In this section we will register the device that will be the target machine for our operations.

Register device
--------

| This scenario uses the "db01" server registered in the :doc:`previous scenario <scenario1>`. No additional registration or configuration is required.


Run package install operation(1st time)
===================================

Create Operation overview
--------------

| Similarly to the :doc:`previous scenario <scenario1>`, start with planning the operation.

.. list-table:: Operation overview
   :widths: 15 10
   :header-rows: 0

   * - Execution date/time
     - 2023/04/02 12:00:00
   * - Target
     - db01(RHEL8)
   * - Contents
     - Install/Uninstall packages

Register operation overview
------------

| From :menuselection:`Basic console --> Operation list`, register the execution date and execution name.

.. figure:: ../../../../images/learn/quickstart/scenario2/オペレーション登録.png
   :width: 1200px
   :alt: Conductor execution

.. list-table:: Operation registration contents
   :widths: 15 10
   :header-rows: 1

   * - Operation name
     - Execution date/time
   * - :kbd:`RHEL8 package management`
     - :kbd:`2023/04/02 12:00:00`


Configure Parameters
--------------

| In the parameter sheets, register the desired values for each of the machines.
| In this scenario, we will install a package called :kbd:`postgresql-server` to the db01 host and construct a DB server.

| From :menuselection:`Input --> Input package` register the parameters for the host.

.. figure:: ../../../../images/learn/quickstart/scenario2/パラメータ設定.gif
   :width: 1200px
   :alt: Parameter settings

.. list-table:: Install package parameter setting values
  :widths: 5 20 5 10 5
  :header-rows: 2

  * - Host name
    - Operation
    - Substitute order
    - Parameter
    - 
  * - 
    - Operation name
    - 
    - Package name
    - State
  * - db01
    - :kbd:`2023/04/02 12:00:00_RHEL8 package management`
    - :kbd:`1`
    - :kbd:`postgresql-server`
    - :kbd:`present`

Run operation
--------

1. Pre-confirmation

   | First, confirm the current state of the server.
   | SSH login to the server and check that the install state of postgresql-server.

   .. code-block:: bash
      :caption: Command

      rpm -q postgresql-server

   .. code-block:: bash
      :caption: Results

      package postgresql-server is not installed

2. Run operation

   | From :menuselection:`Ansible-LegacyRole --> Execution`, select the :kbd:`Package management` Movement and press :guilabel:` Execute`.
   | Next, in the :menuselection:`Execution settings`, select :kbd:`RHEL8 package management` and press :guilabel:`Execute`.

   | This opens the  :menuselection:`Execuction status confirmation` page. In here, check that the status says "Complete" after the execution has finished.

   .. figure:: ../../../../images/learn/quickstart/scenario2/作業実行.gif
      :width: 1200px
      :alt: Execute

3. Post-confirmation

   | Relogin to the server with SSH and check the install state of postgresql-server. It should be installed.

   .. code-block:: bash
      :caption: Command

      rpm -q postgresql-server

   .. code-block:: bash
      :caption: Results

      # Version depends on environment
      postgresql-server-10.23-1.module+el8.7.0+17280+3a452e1f.x86_64


Run package install operation(2nd time)
===================================

Create Operation overview
--------------

| Similarly to the :doc:`previous scenario <scenario1>`, start planning the operation.

.. list-table:: Operation overview
   :widths: 15 10
   :header-rows: 0

   * - Execution date/time
     - 2024/05/02 12:00:00
   * - Target
     - db01(RHEL8)
   * - Contents
     - Change to DB package

Register operation overview
------------

| From :menuselection:`Basic console --> Operation list`, register the execution date and execution name.

.. figure:: ../../../../images/learn/quickstart/scenario2/変更用オペレーション登録.png
   :width: 1200px
   :alt: Conductor execution

.. list-table:: Operation registration contents
   :widths: 15 10
   :header-rows: 1

   * - Operation name
     - Execution date/time
   * - :kbd:`Change RHEL8 to DB package`
     - :kbd:`2024/05/02 12:00:00`


Configure Parameters
--------------

| In this scenario, we installed a package called :kbd:`postgresql-server` to the db01 host and constructed a DB server.
| However, what should we do if we want to change it to a mariadb-server?

| From :menuselection:`Input --> Input package` register new parameters.

.. figure:: ../../../../images/learn/quickstart/scenario2/更新用パラメータ設定.png
   :width: 1200px
   :alt: Parameter settings 2

.. list-table:: Input package parameter setting values
  :widths: 5 20 5 10 5
  :header-rows: 2

  * - Host name
    - Operation
    - Substitute order
    - Parameter
    - 
  * - 
    - Operation name
    - 
    - Package name
    - State
  * - db01
    - :kbd:`2024/05/02 12:00:00_Change RHEL8 to DB package`
    - :kbd:`1`
    - :kbd:`postgresql-server`
    - :kbd:`absent`
  * - db01
    - :kbd:`2024/05/02 12:00:00_Change RHEL8 to DB package`
    - :kbd:`2`
    - :kbd:`mariadb-server`
    - :kbd:`present`

Execute
--------

1. Pre-confirmation

   | First, confirm the current state of the server.
   | SSH login to the server and check the install state of the packages.

   .. code-block:: bash
      :caption: Command

      rpm -q postgresql-server

   .. code-block:: bash
      :caption: Results

      # Version depends on environment
      postgresql-server-10.23-1.module+el8.7.0+17280+3a452e1f.x86_64

   .. code-block:: bash
      :caption: Command

      rpm -q mariadb-server

   .. code-block:: bash
      :caption: Results

      package mariadb-server is not installed

2. Run operation

   | From :menuselection:`Ansible-LegacyRole --> Execution`, select the :kbd:`Package management` Movement and press :guilabel:` Execute`.
   | Next, in the :menuselection:`Execution settings`, select :kbd:`Change RHEL8 to DB package` and press :guilabel:`Execute`.

   | This opens the  :menuselection:`Execuction status confirmation` page. In here, check that the status says "Done" after the execution has finished.

   .. figure:: ../../../../images/learn/quickstart/scenario2/作業実行2.gif
      :width: 1200px
      :alt: Execution 2

3. Post-confirmation

   | Relogin to the server with SSH and check that postgresql-server has been uninstalled and that mariadb-server has been installed.

   .. code-block:: bash
      :caption: Command

      rpm -q postgresql-server

   .. code-block:: bash
      :caption: Results

      package postgresql-server is not installed

   .. code-block:: bash
      :caption: Command

      rpm -q mariadb-server

   .. code-block:: bash
      :caption: Results

      mariadb-server-10.3.35-1.module+el8.6.0+15949+4ba4ec26.x86_64


Summary
======

| This guide taught the user a more efficient method of using Exastro IT Automation's parameter sheets through a scenario where they managed packages for a RHEL8 server.

- If the input values are fixed, users can use data sheets to prevent input mistakes.
- If the user wants to manage multiple indefinite parameters, they can use "Bundled" menus to manage parameters more flexibly.
- If the user wants to configure large amounts of parameters, they can use the "Download all/File bulk registration" function to upload a file containing the parameters.

| In the :doc:`next scenario <scenario3>` the user will learn how to run multiple jobs in succession.
