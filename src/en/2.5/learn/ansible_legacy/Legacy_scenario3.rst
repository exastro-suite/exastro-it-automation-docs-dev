============
Jobflow
============

| In this scenario, the user will learn how to run multiple jobs in succession by remaking the database server created in the :doc:`previous scenario<Legacy_scenario2>` to a Web server
| More specifically,

1. Change the host name from :doc:`Legacy_scenario1` from db01 to web01.
2. Use the Package installation job from :doc:`Legacy_scenario2` to uninstall the DB packages and then install the Web server packages.

.. tip:: We highly recommend that the user finishes both :doc:`Legacy_scenario1` and :doc:`Legacy_scenario2` before starting this one.


Design parameters
==============

| This scenario uses the parameter sheet(data sheet) created in :doc:`Legacy_scenario1` and :doc:`Legacy_scenario2`, meaning that there is no need to create any new parameter sheets.


Register operation procedure
==============

| This scenario uses the following Movements created in  :doc:`Legacy_scenario1` and :doc:`Legacy_scenario2`, meaning that there is no need to create ny new Movements.

- Host name settings
- Package management

| Note that in the previous scenarios, we have only run the Movements as single units. In this scenario, we will run them in succession.


Create Jobflow
------------------

| In order to run multiple Movements in succession, we will have to use the Conductor function.
| By using the Conductor function, not only can we run multiple Movements in succession, but we can also utilize more advanced logic, such as changing the succeeding movement depending on the previous movement's reults, pause the movements, etc.

| From :menuselection:`Conductor --> Conductor edit/execute`, define a jobflow.

.. figure:: /images/learn/quickstart/Legacy_scenario3/ジョブフローの作成.gif
   :width: 1200px
   :alt: Jobflow creation

| 1. In the :menuselection:`Conductor information --> Name` panel on the top left right of the page, input  :kbd:`Server construction`.
| 2. In the bottom left right panel of the page, the Movements :kbd:`Host name settings` and :kbd:`Package management` created in  :doc:`Legacy_scenario1` and :doc:`Legacy_scenario2` should be displayed. Drag and drop them into the center of the page.
| 3. Connect the nodes as seen below.
 
.. list-table:: Node connections
   :widths: 10 10
   :header-rows: 1

   * - OUT
     - IN
   * - :kbd:`Start`
     - :kbd:`Host name settings`
   * - :kbd:`Host name settings`
     - :kbd:`Package management`
   * - :kbd:`Package management`
     - :kbd:`End`

| 4. Press the  :guilabel:` Register` button on top of the page.


Register operation target
==============

| In this step, we will update the registration information of the target device.

Update device information
--------------

| The target device will be the db01 server that we registered in :doc:`previous scenario <Legacy_scenario2>`, but we will have to change the host name since we are changing it from a DB server to a Web server.
| In this scenario, we will change the host name from db01 to web01.

| From the :menuselection:`Ansible common --> device list` menu, change the db-1 host name to web01.

.. figure:: /images/learn/quickstart/Legacy_scenario3/機器情報の更新.gif
   :width: 1200px
   :alt: Device information update

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
     - :kbd:`web01`
     - :kbd:`192.168.0.1 ※Configure correct IP address`
     - :kbd:`Connecting user name`
     - :kbd:`(Secret key file)`
     - :kbd:`Key authentication(No passphrase)`


Run Server reconstruction operation
========================

Create Operation overview
--------------

| Similarly to the :doc:`previous scenario, <Legacy_scenario2>` start with planning the operation.

.. list-table:: Operation overview
   :widths: 5 10
   :header-rows: 0

   * - Execution date/time
     - 2024/04/03 12:00:00
   * - Target
     - db01(RHEL8)
   * - Contents
     - Remake Web server

Register operation overview
------------

| From :menuselection:`Basic console --> Operation list`, register the execution date and execution name.

.. figure:: /images/learn/quickstart/Legacy_scenario3/オペレーション登録.png
   :width: 1200px
   :alt: Conductor execution

.. list-table:: Operation registration contents
   :widths: 15 10
   :header-rows: 1

   * - Operation name
     - Execution date/time
   * - :kbd:`Remake Web server`
     - :kbd:`2024/04/03 12:00:00`

Configure Parameters
--------------

| In this scenario, we will install the :kbd:`httpd` package to the db01 host. However, because we are continuing from the previous scenario, the :kbd:`mariadb-server` package is already installed.
| Since we are rebuilding the db01 host to a Web server called web01, we will need to change both the host name and the install packages.

.. list-table:: Server rebuild operation changes.
   :widths: 10 15 15
   :header-rows: 1

   * - Item
     - Pre-change
     - Post-change
   * - Host name
     - :kbd:`db01`
     - :kbd:`web01`
   * - :kbd:`mariadb-server` package
     - Installed
     - Uninstalled
   * - :kbd:`httpd` package
     - Not installed
     - Installed

| From :menuselection:`Input --> Server basic information` register the parameters related to the host name.

.. figure:: /images/learn/quickstart/Legacy_scenario3/サーバ基本情報登録.png
   :width: 1200px
   :alt: Server basic information registration

.. list-table:: Server basic information parameter setting values
  :widths: 5 20 10
  :header-rows: 2

  * - Host name
    - Operation
    - Parameter
  * - 
    - Operation name
    - Host name
  * - :kbd:`web01`
    - :kbd:`2024/04/03 12:00:00_Remake Web server`
    - :kbd:`"{{ __inventory_hostname__ }}"`

| From :menuselection:`Input --> Input package` reigster parameter related to the packages,

.. figure:: /images/learn/quickstart/Legacy_scenario3/導入パッケージ登録.png
   :width: 1200px
   :alt: Input package registration

.. list-table:: Input package parameter setting values
  :widths: 5 20 5 10 5
  :header-rows: 2

  * - Host name
    - Operaiton
    - Substitute order
    - pARAMETER
    - 
  * - 
    - Operation name
    - 
    - Package name
    - State
  * - web01
    - :kbd:`2024/04/03 12:00:00_Remake Web server`
    - :kbd:`1`
    - :kbd:`mariadb-server`
    - :kbd:`absent`
  * - web01
    - :kbd:`2024/04/03 12:00:00_Remake Web server`
    - :kbd:`2`
    - :kbd:`httpd`
    - :kbd:`present`

Execute
--------

1. Pre-confirmation

   | First, confirm the current state of the server.

   | Check the host name.

   .. code-block:: bash
      :caption: Command

      # Fetch host name
      hostnamectl status --static

   .. code-block:: bash
      :caption: Results

      db01

   | SSH login to the server and check the install status of the packages.

   .. code-block:: bash
      :caption: Command

      rpm -q mariadb-server

   .. code-block:: bash
      :caption: Results

      # Version depends on environment
      mariadb-server-10.3.35-1.module+el8.6.0+15949+4ba4ec26.x86_64

   .. code-block:: bash
      :caption: Command

      rpm -q httpd

   .. code-block:: bash
      :caption: Results

      package httpd is not installed

2. Run operation
 
   | From :menuselection:`Conductor --> Conductor edit/execute` press the :guilabel:` Select` button.
   | Select the :kbd:`Construct server` Conductor and press :guilabel:`OK`.
   | Next, In the :guilabel:` Execute` field on the top of the page, select the :kbd:`Remake Web server` operation and press :guilabel:`Execute`.

   | This opens the  :menuselection:`Execuction status confirmation` page. In here, check that the status for all the Movements says "Done" after the execution has finished. 

   .. figure:: /images/learn/quickstart/Legacy_scenario3/作業実行.png
      :width: 1200px
      :alt: Conductor execution

3. Post-confirmation

   | Relogin to the server with SSH and check that the server has been remade to a Web server.

   | Check the host name.

   .. code-block:: bash
      :caption: Command

      # Fetch host name.
      hostnamectl status --static

   .. code-block:: bash
      :caption: Results

      web01

   | SSH login to the server and check the install state of the packages.

   .. code-block:: bash
      :caption: Command

      rpm -q mariadb-server

   .. code-block:: bash
      :caption: Results

      # Version depends on environment
      is not installed

   .. code-block:: bash
      :caption: Command

      rpm -q httpd

   .. code-block:: bash
      :caption: Results

      httpd-2.4.37-51.module+el8.7.0+18026+7b169787.1.x86_64


Summary
======

| This guide taught the user how to use Conductor, a function in Exastro IT Automation that allows users to run jobflows, by remaking a DB server to a Web server.

- By using Conductor, userse can run multiple Movements in succession.
- The Conductor function comes with a number of sub-functions.

| In the :doc:`Next scenario<Legacy_practice1>`, users can go through a scenario where they will use all the functions from the previous scenarios.
