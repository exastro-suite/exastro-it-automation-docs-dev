============
Host name management
============

| In this scenario, the user will learn how to use Exastro IT Automation by configuring host names.


Design parameters
==============

| In this step, users will design the format of the system's configuration information.

| While users doesnt have to manage all the system information as parameters, we recommend that they add more if needed later.

.. _quickstart_server_information_parmeter:

Create parameter sheet
----------------------

| In the :menuselection:`Create parameter sheet` menu, users can manage parameter sheets where they can register setting values (parameters).

.. glossary:: Parameter sheet
   Data structure that manages system's parameter information.

| Create a parameter sheet for managing the host names.
| From the :menuselection:`Create parameter sheet --> Define/create parameter sheet` menu, create a parameter sheet called "Server basic information".

.. figure:: /images/learn/quickstart/Legacy_scenario1/パラメータシート作成定義.png
   :width: 1200px
   :alt: Create parameter sheet

.. list-table:: Create parameter sheet (Server basic information) item setting values
   :widths: 10 10
   :header-rows: 1

   * - Setting item
     - Item 1 setting value
   * - Item name
     - :kbd:`Host name`
   * - Item name(for Rest API) 
     - :kbd:`hostname`
   * - Input method
     - :kbd:`String(Single line)`
   * - Maximum byte number
     - :kbd:`64`
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

.. list-table:: Create parameter sheet(Server basic information) parameter sheet creation information setting values
   :widths: 5 10
   :header-rows: 1

   * - Setting item
     - Setting value
   * - Item number
     - (Automatic)
   * - Parameter sheet name
     - :kbd:`Server basic information`
   * - Parameter sheet name(REST)
     - :kbd:`server_information`
   * - Creation target
     - :kbd:`Parameter sheet（With host/operation）`
   * - Display order
     - :kbd:`1`
   * - Use bundles
     - Leave unchecked (deactivate)
   * - Last updated date/time
     - (Automatic)
   * - Last updated by
     - (Automatic)

Register operation procedure
==============

| In order to register the operation procedure, the user must define a Movement(job), which is an unit of operation in Exastro IT Automation.
| We will then link an Ansible Playbook to the defined Movement, and then link the variables within the Ansible Playbook with the parameter sheet items registered in :ref:`quickstart_server_information_parmeter`.

.. glossary:: Movement
   The smallest operation unit in Exastro IT Automation.
   1 Movement is the same as 1 ansible-playbook command.

Configure operation items
--------------

| In Exastro IT Automation, operations and tasks are managed as units called Movement. Movements corresponds to the operation items in the operation procedure.
| Movements are used when linking IaCs(Infrastructure as Code(Ansible Playbooks, etc)) and the variables within together with the parameter sheet's setting values.

| From the :menuselection:`Ansible-Legacy --> Movement list`, register a Movement for host name settings.

.. figure:: /images/learn/quickstart/Legacy_scenario1/Movement登録.png
   :width: 1200px
   :alt: Register Movement

.. list-table:: Movement information setting value
   :widths: 10 10 10
   :header-rows: 2

   * - Movement name
     - Ansible use information
     - 
   * - 
     - Host specification format
     - Header section
   * - :kbd:`Host name settings`
     - :kbd:`IP`
     - :kbd:`※See header section`

.. code-block:: bash
   :caption: Header section

   - hosts: all
     remote_user: "{{ __loginuser__ }}"
     gather_facts: no
     become: yes

Register Ansible Playbook
---------------------

| In this step, we will register an Ansible Playbook. Ansible Playbooks corresponds to the commands written in operation manual.
| The Ansible-Legacy mode assumes that the user is using Playbooks that the user has written themselves.
| One of the merits of using the Ansible-Legacy mode is that users can create Playbooks that suits their purpose.
| However, since the Ansible-Legacy mode requires that the users use their own Playbooks, using the mode requires the user to know how to write Playbooks.

| This scenario uses the following Playbook. Copy it, and save it as a yml file with the name "hostname.yml".

.. code-block:: bash
   :caption: hostname.yml

   - name: Set a hostname
     ansible.builtin.hostname:
       name: "{{ hostname }}"

| From :menuselection:`Ansible-Legacy --> Playbook file collection`, register the Playbook above.

.. figure:: /images/learn/quickstart/Legacy_scenario1/Playbook素材集.png
   :width: 1200px
   :alt: Playbook registration

.. list-table:: Ansible Playbook information registration
  :widths: 10 10
  :header-rows: 1

  * - Playbook file name
    - Playbook file
  * - :kbd:`hostname`
    - :file:`hostname.yml`

Link Movement and Ansible Playbook
-------------------------------------

| From the :menuselection:`Ansible-Legacy --> Movement-Playbook link` menu, register a link between the Movement and the Ansible Playbook.
| In this scenario, we will use hostname.yml.

.. figure:: /images/learn/quickstart/Legacy_scenario1/Movement-Playbook紐付.png
   :width: 1200px
   :alt: Movement-Playbook link

.. list-table:: Movement-Playbook link information registration
  :widths: 10 10 10
  :header-rows: 1

  * - Movement name
    - Playbook file
    - Include order
  * - :kbd:`Host name settings`
    - :kbd:`hostname.yml`
    - :kbd:`1`

Link Parameter sheet item and Ansible Playbook
--------------------------------------------------------

| By substituting the :kbd:`hostname` variable within the hostname.yml file with the actual host name, we can configure the host name of the target server.

| From the :menuselection:`Ansible-Legacy --> Substitute value auto registration settings` menu, configure the Parameters from the Host name item in the Server basic information parameter sheet to substitute the :kbd:`hostname` variable in the Ansible Playbook.

.. figure:: /images/learn/quickstart/Legacy_scenario1/代入値自動登録.png
   :width: 1200px
   :alt: Substitute value auto registration settings

.. list-table:: Substitute value auto registration settings
  :widths: 40 10 20 20
  :header-rows: 2

  * - Parameter sheet(From)
    - Registration method
    - Movement name
    - IaC variable(To)
  * - Menu group:Menu:Item
    -
    -
    - Movement name:Variable name
  * - :kbd:`Substitute value auto registration:Server basic information:Host name`
    - :kbd:`Value type`
    - :kbd:`Host name settings`
    - :kbd:`Host name settings:hostname`

Register operation target
==============

| In this step, we will register the device which will have operations run to them.

Register device
--------

| Register the target server to the Device list.

| From the :menuselection:`Ansible common --> device list` menu, register the connection information to the server that will be the operation target.

.. figure:: /images/learn/quickstart/Legacy_scenario1/機器一覧登録設定.gif
   :width: 1200px
   :alt: Device list registration

.. list-table:: Device list setting values
   :widths: 10 10 15 10 10 10
   :header-rows: 3

   * - HW device type
     - Host name
     - IP address
     - Login password
     - ssh key authentication information
     - Ansible use information
   * - 
     - 
     - 
     - User
     - ssh secret key file
     - Legacy/Role use information
   * - 
     - 
     - 
     - 
     - 
     - Authentication method
   * - :kbd:`SV`
     - :kbd:`server01`
     - :kbd:`192.168.0.1 ※Configure correct IP address`
     - :kbd:`Connecting user name`
     - :kbd:`(Secret key file)`
     - :kbd:`Key authentication(No passphrase)`

.. tip::
   | In this scenario, we will execute to the target machine using key authentication, but users can also use Password authentication.
   | Change the authentication method to fit the preffered login method of the target operation server.

Run Change host name operation(1st time)
===========================

Create Operation overview
--------------

| Before configuring specific parameters or operation procedures, we recommend that the user starts with a plan.
| First, let's quicky organize information for what kind of task should be done to what device, and when.

.. list-table:: Operation objective
   :widths: 10 10
   :header-rows: 0

   * - Operation execution date/time
     - 2024/04/01 12:00:00
   * - Operation target
     - Target operation server(RHEL8)
   * - Operation contents
     - Change host name

Register operation overview
------------

| In the Operation registration step, we will define the overview of the operation. We will create 1 operation per task. We recommend not reusing the operations.
| Use the operation objective from before as a base and input the operation information.

.. glossary:: Operation
   An Operation in Exastro IT Automation is a task that can be run and can have target machines and parameters link to them.

| From the :menuselection:`Basic console --> Operation list` menu, register the execution date/time and operation name.

.. figure:: /images/learn/quickstart/Legacy_scenario1/オペレーション登録.png
   :width: 1200px
   :alt: Operation registration

.. list-table:: Operation registration contents
   :widths: 15 10
   :header-rows: 1

   * - Operation name
     - Scheduled execution date/time
   * - :kbd:`RHEL8 host name change operation`
     - :kbd:`2024/04/01 12:00:00`

.. tip::
   | In this scenario, the execution date/time can be set to any date. However, we recommend specifying a specific date if the user has a planned date for the execution.
   | If the operation does not have a set date or is planned to be executed multiple times over a period, the user can set the current date.

Configure parameters
--------------

| In the parameter sheet, register the desired parameters for each of the devices.
| For the operation, select :kbd:`RHEL8 host name change operation` created in the previous step. By selecting the operation, we can link the parameters and the target server.
| In this scenario, we will configure the host name :kbd:`server01` to the target server.

| From the :menuselection:`Input --> Server basic information` menu, register the parameters for the host.

.. figure:: /images/learn/quickstart/Legacy_scenario1/パラメータ登録.png
   :width: 1200px
   :alt: Parameter registration

.. list-table:: Server basic information parameter setting values
  :widths: 5 20 5
  :header-rows: 2

  * - Host name
    - Operation
    - Parameter
  * - 
    - Operation name
    - Host name
  * - :kbd:`server01`
    - :kbd:`2024/04/01 12:00:00_RHEL8 host name change operation`
    - :kbd:`server01`

Execute
--------

1. Pre-confirmation

   | First, confirm the status of the current server.
   | Log in to the target server through SSH and confirm the current host name.

   .. code-block:: bash
      :caption: Command

      # Fetch host name
      hostnamectl status --static

   .. code-block:: bash
      :caption: Execution results

      # Depends on the environment
      localhost

2. Execute

   | From the :menuselection:`Ansible-Legacy --> Execute` menu, select the :kbd:`Host name settings` Movement and press the :guilabel:` Execute` button.
   | Next, in the :menuselection:`Execution settings`, select :kbd:`RHEL8 host name change operation` for the operation and press the :guilabel:`Select` button.
   | Lastly, confirm the contents of the execution and press :guilabel:`Execute`.

   | This opens the  :menuselection:`Execution status confirmation` menu. Check that ths status says "Complete" after the execution has finished.

.. figure:: /images/learn/quickstart/Legacy_scenario1/作業実行.gif
   :width: 1200px
   :alt: Execution

3. Post-confirmation

   | Log in to the target server through SSH again and check that the host name has been changed.

   .. code-block:: bash
      :caption: Command

      # Fetch host name
      hostnamectl status --static

   .. code-block:: bash
      :caption: Execution results

      server01


Run Change host name operation(2nd time)
===========================

Create Operation overview
--------------

| Before configuring specific parameters or operation procedures, we recommend that the user starts with a plan.
| First, let's quicky organize information for what kind of task should be done to what device, and when.

.. list-table:: Operation objective
   :widths: 10 10
   :header-rows: 0

   * - Operation execution date/time
     - 2024/05/01 12:00:00
   * - Operation target
     - Target operation server(RHEL8)
   * - Operation contents
     - Update Host name

Register operation overview
------------

| In the Operation registration step, we will define the overview of the operation. We will create 1 operation per task. We recommend not reusing the operations.
| Use the operation objective from before as a base and input the operation information.

.. glossary:: Operation
   An Operation in Exastro IT Automation is a task that can be run and can have target machines and parameters link to them.

| From the :menuselection:`Basic console --> Operation list` menu, register the execution date/time and operation name.

.. figure:: /images/learn/quickstart/Legacy_scenario1/更新用オペレーション登録.png
   :width: 1200px
   :alt: Operation registration

.. list-table:: Operation registration contents
   :widths: 15 10
   :header-rows: 1

   * - Operation name
     - Scheduled execution date/time
   * - :kbd:`RHEL8 host name change operation`
     - :kbd:`2024/05/01 12:00:00`

.. tip::
   | In this scenario, the execution date/time can be set to any date. However, we recommend specifying a specific date if the user has a planned date for the execution.
   | If the operation does not have a set date or is planned to be executed multiple times over a period, the user can set the current date.


Configure parameters
--------------

| In this scenario, we will configure the host name :kbd:`server01` as a parameter value.
| However, the host name is also managed in the :menuselection:`Device list` menu. This will cause the host name to be managed multiple times. 

| In Exastro IT Automation, device information can be fetched with :ref:`ansible_common_ita_original_variable`, and the host name can be fetched as the :kbd:`__inventory_hostname__` variable. This means that we can centrally manage it.

| In the :menuselection:`Input --> Server basic information` menu, use ITA original variables to register the host name registered in the device list.

.. figure:: /images/learn/quickstart/Legacy_scenario1/更新用パラメータ設定.png
   :width: 1200px
   :alt: Parameter registration

.. list-table:: Server basic information parameter setting value
  :widths: 5 10 5
  :header-rows: 2

  * - Host name
    - Operation
    - Parameter
  * - 
    - Operation name
    - Host name
  * - :kbd:`server01`
    - :kbd:`2024/05/01 12:00:00_RHEL8 host name change operation`
    - :kbd:`"{{ __inventory_hostname__ }}"`


Update device information
--------------

| In this section, we will change the host name of the target server to db01.

| From the :menuselection:`Ansible common --> Device list` menu, update the host name of the target server to db01.

.. figure:: /images/learn/quickstart/Legacy_scenario1/機器一覧ホスト名変更.gif
   :width: 1200px
   :alt: Parameter registration

.. list-table:: Device list setting values
   :widths: 10 10 15 10 10 10
   :header-rows: 3

   * - HW device type
     - Host name
     - IP address
     - Login password
     - ssh key authentication information
     - Ansible use information
   * - 
     - 
     - 
     - User
     - ssh secret key file
     - Legacy/Role use information
   * - 
     - 
     - 
     - 
     - 
     - Authentication method
   * - :kbd:`SV`
     - :kbd:`db01`
     - :kbd:`192.168.0.1 ※Configure correct IP address`
     - :kbd:`Connecting user name`
     - :kbd:`(Secret key file)`
     - :kbd:`Key authentication(No passphrase)`


Execute
--------

1. Execute

   | From the :menuselection:`Ansible-Legacy --> Execute` menu, select the :kbd:`Host name settings` Movement and press the :guilabel:` Execute` button.
   | Next, in the :menuselection:`Execution settings`, select :kbd:`RHEL8 host name change operation` for the operation and press the :guilabel:`Select` button.
   | Lastly, confirm the contents of the execution and press :guilabel:`Execute`.

   | This opens the  :menuselection:`Execution status confirmation` menu. Check that ths status says "Complete" after the execution has finished.

.. figure:: /images/learn/quickstart/Legacy_scenario1/更新作業実行.gif
   :width: 1200px
   :alt: Execution

2. Post-confirmation

   | Log in to the target server through SSH again and check that the host name has been changed.

   .. code-block:: bash
      :caption: Command

      # Fetch host name
      hostnamectl status --static

   .. code-block:: bash
      :caption: Execution results

      db01

| Now, the user can change the host name by changing the host name in  :menuselection:`Ansible common --> Device list` and executing the operation.


Summary
======

| This guide taught the user the basics of Exastro IT Automation by having them go through a scenario where they had to configure host names to a RHEL8 server.
| The user also learned about one of Exastro IT Automation biggest merits when it comes to automation, being able to reuse tasks to optimize workflows.
| In the :doc:`next scenario <../ansible_legacy/Legacy_scenario2>`, the user will learn how to manage parameter sheets.
