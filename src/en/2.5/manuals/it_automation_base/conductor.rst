=========
Conductor
=========

Introduction
========

This document aims to explain the Exastro IT Automation's Conductor function and how to operate it.

Conductor overview
===============

| This section explains the Conductor function and how to use it.
| The Conductor function Conductor provides the following commonly used Exastro IT Automation functions.

Conductor menu page structure.
===============================

| This section explains the Conductor menu's page structure.


Conductor menu list
-----------------------

| The menus found in the :menuselection:`Conductor menu group` are as following.

.. table:: Exastro IT Automation Conductor menu list
   :align: left

   +--------+----------------------+---------------------------------+------------------------------------------------------------------------------------------+
   | **No** | **Menu group**       | **Menu**                        | **Description**                                                                          |
   |        |                      |                                 |                                                                                          |
   |        |                      |                                 |                                                                                          |
   |        |                      |                                 |                                                                                          |
   |        |                      |                                 |                                                                                          |
   |        |                      |                                 |                                                                                          |
   |        |                      |                                 |                                                                                          |
   +========+======================+=================================+==========================================================================================+
   | 1      | Conductor            | Conductor interface information | Allows users to maintain (view/edit) Conductor interface information.                    |
   |        |                      |                                 |                                                                                          |
   |        |                      |                                 | This menu must have 1 record.                                                            |
   +--------+                      +---------------------------------+------------------------------------------------------------------------------------------+
   | 2      |                      | Conductor notification definiti\| Allows users to maintain (view/register/update) definitions regarding Conductor execu\   |
   |        |                      | on                              | tion notifications.                                                                      |
   +--------+                      +---------------------------------+------------------------------------------------------------------------------------------+
   | 3      |                      | Conductor list                  | Allows users to maintain (view/discard) Conductors.                                      |
   |        |                      |                                 |                                                                                          |
   |        |                      |                                 | Click the :guilabel:`Details` button to move to the Conductor edit/execution menu.       |
   +--------+                      +---------------------------------+------------------------------------------------------------------------------------------+
   | 4      |                      | Conductor class edit            | Allows users to edit and execute Conductors.                                             |
   +--------+                      +---------------------------------+------------------------------------------------------------------------------------------+
   | 5      |                      | Conductor operation list        | Allows users to view the Conductor list (Execution history).                             |
   |        |                      |                                 |                                                                                          |
   |        |                      |                                 | Click the :guilabel:`Details` button to move to the Conductor confirmation menu.         |
   +--------+                      +---------------------------------+------------------------------------------------------------------------------------------+
   | 6      |                      | Conductor confirmation          | Allows the user to check the Conductor execution results.                                |
   +--------+                      +---------------------------------+------------------------------------------------------------------------------------------+
   | 7      |                      | Conductor scheduled execution   | Allows users to maintain (view/register)update Conductors that are regularly executed.   |
   |        |                      |                                 |                                                                                          |
   |        |                      |                                 | Click the :guilabel:`Operation list confirmation` button to move to the Conductor \      |
   |        |                      |                                 | list menu.                                                                               |
   +--------+----------------------+---------------------------------+------------------------------------------------------------------------------------------+

ITA Conductor procedure
=====================

Jobflow
----------

| The following jobflow illustrates a common ITA Conductor jobflow.

#. | Register/confirm device information (Ansible common)
#. | Register/confirm operation (Basic console)
#. | Register Movement from ITA driver
#. | Confirm Movement (Basic console)
#. | Register Conductor's interface information
#. | Register Conductor
#. | Confirm Conductor
#. | Execute Conductor
#. | Confirm Conductor results
#. | Confirm Conductor history

- | For more information regarding registering "Device information", see "Ansible common :ref:`ansible_common_device_list`".
- | For more information regarding registering "Operations", see "Basic console - :ref:`basic_console_operation`".
- | For more information regarding registering "Movements", see the different drivers' manuals.
- | The directory paths shared between the movements when the Conductor is executed.
  | In order to deliver information between Movements, the user can use a shared directory path.
  | "Ansible driver" can be used for shared targets.
  | For more information regarding "Ansible driver", see ":doc:`../ansible-driver/index`".

  .. | Both Ansible driver and Terraform driver can be used for shared targets.
  .. | For more information regarding "Ansible driver", see "Exastro-ITA_User_instruction_manual_Ansible-driver"
  .. | For more information regarding "Terraform driver", see "Exastro-ITA_User_instruction_manual_Terraform-driver"

- | Workflows executed with "Conductor call" have their own shared directory paths.
  | (Movements that strides over the workflows are not shared)


Function/Operation description
==================

Conductor interface information
------------------------------

1. In the :menuselection:`"Conductor interface information" menu,`users can configure the shared directory path for each Conductor executed movement and the refresh interval for the :menuselection:`"Conductor confirmation" menu` menu.

   .. figure:: /images/ja/conductor/conductor_interface/conductor_interface.png
      :width: 800px
      :alt: Conductor interface information

      Conductor interface information

2. See the following for more information regarding the :menuselection:`"Conductor interface information" menu--> "List" submenu`.

   .. table:: "List" submenu
      :widths: 10 30 8 8 8
      :align: left

      +-----------------------------+----------------------------------------------------------------------------------------------------------------------------+----------+-----------+-------------------+
      | Item                        | Description                                                                                                                | Input \  | Input \   | Restrictions      |
      |                             |                                                                                                                            | required | method    |                   |
      +=============================+============================================================================================================================+==========+===========+===================+
      | Conductor interface ID      | Automatically given by the system. Cannot be edited.                                                                       |          | Automatic |                   |
      +-----------------------------+----------------------------------------------------------------------------------------------------------------------------+----------+-----------+-------------------+
      | Status monitoring cycle \   |  Enter the interval for refreshing the "Conductor execution" display. The default (and recommended) value is 1000ms.       |  ○      | Manual    | Minimum value     |
      | (seconds)                   |                                                                                                                            |          |           | 1000ms            |
      +-----------------------------+----------------------------------------------------------------------------------------------------------------------------+----------+-----------+-------------------+
      | Remarks                     | Free description field.                                                                                                    | ー       | Manual    | ー                |
      +-----------------------------+----------------------------------------------------------------------------------------------------------------------------+----------+-----------+-------------------+

.. _conductor_notice:


Conductor notification definition
-------------------

1. The :menuselection:`"Conductor notification definition"` menu allows users to configure definitions regarding notifications from Conductor executions.

   .. figure:: /images/ja/conductor/conductor_notice/conductor_notice.png
      :width: 800px
      :alt: Conductor notification definition

      Conductor notification definition

2. See the following for more information regarding the :menuselection:`"Conductor notification definition" menu-->"List" submenu`.

   .. list-table:: "List" submenu
      :header-rows: 1
      :align: left

      * - Item
        - Description
        - Input required
        - Input method
      * - Conductor notification ID
        - Automatically given by the system. Cannot be edited.
        -
        - Automatic
      * - Notification name
        - Input a notification name.
        - ○
        - Manual
      * - Notification destination URL
        - Input a URL for the notification destination.
        - ○
        - Manual
      * - Header
        - Input a HTTP header in JSON format.
        - ○
        - Manual
      * - Message
        - Enter message according to service specifications.
        - ○
        - Manual
      * - PROXY URL
        - Enter URL if PROXY setting is needed.
        - ○
        - Manual
      * - PROXY PORT
        - Enter PORT if PROXY setting is needed.
        - ○
        - Manual
      * - Confirmation URL
        - Enter FQDN  used in input variable for confirmation URL
        - ○
        - Manual
      * - Start time
        - Enter to stop notifications.
        - ○
        - Manual
      * - End time
        - Enter to stop notifications.
        - ○
        - Manual
      * - Remarks
        - Free description field.
        - ー
        - Manual

   ※For more information regarding ITA variables that can be used in messages, see the following.

   .. list-table:: Conductor notification destination definition ITA variables.
      :header-rows: 1
      :align: left

      * - ITA original variable
        - Variable specification contents
      * - __CONDUCTOR_INSTANCE_ID__
        - Conductor instance ID
      * - __CONDUCTOR_NAME__
        - Conductor instance name 
      * - __STATUS_ID__
        - Status ID
      * - __OPERATION_ID__
        - Operation ID
      * - __OPERATION_NAME__
        - Operation name
      * - __EXECUTION_USER__
        - Execution user
      * - __PARENT_CONDUCTOR_INSTANCE_ID__
        - Parent instance ID
      * - __PARENT_CONDUCTOR_NAME__
        - Parent Conductor name
      * - __TOP_CONDUCTOR_INSTANCE_ID__
        - Top Conductor instance ID
      * - __TOP_CONDUCTOR_NAME__
        - Top Conductor name
      * - __ABORT_EXECUTE_FLAG__
        - Emergency stop flag
      * - __REGISTER_TIME__
        - Registration time
      * - __TIME_BOOK__
        - Reservation time
      * - __TIME_START__
        - Start time
      * - __TIME_END__
        - End time
      * - __NOTICE_NAME__
        - Notification log
      * - __NOTE__
        - Remarks
      * - __JUMP_URL__
        - Conductor operation confirmation page URL(Use URL for confirmation)

   | ※The status IDs and names are as following.

   .. list-table:: Status list
      :header-rows: 1
      :align: left

      * - Status ID
        - Status name
      * - 3
        - Executing
      * - 4
        - 
        Executing(Delayed)
      * - 5
        - Pause
      * - 6
        - Success
      * - 7
        - Error
      * - 8
        - Warning
      * - 9
        - Emergency stop
      * - 10
        - Reservation deleted
      * - 11
        - Unexpected error

   | ※The output contents of the Confirmation URL uses the "Confirmation URL(FQDN )" input contents and outputs it in the following format.

    Example: If the Confirmation URL(FQDN) value is set to "http://localhost:38000".
    http://localhost:38000/org002/workspaces/workspace1/ita/?menu=conductor_confirmation&conductor_instance_id=X

.. _conductor_list:


Conductor list
-------------

#. | The :menuselection:`"Conductor list"` menu allows users to view and discard registered conductors.

   |Click the :guilabel:`Details` button in the :menuselection:`"List" submenu` and move to the :ref:`conductor_editandexcute` page.

.. figure:: /images/ja/conductor/conductor_class_list/conductor-list.gif
   :width: 800px
   :alt: "Conductor list" menu

   "Conductor list" menu

.. _conductor_editandexcute:


Conductor edit/execution
----------------------

.. table:: Mode list
   :widths: 15,30
   :align: left

   +------------+---------------------------------------------------------------------------------------------------------+
   | **Mode**   | **Description**                                                                                         |
   +============+=========================================================================================================+
   | Edit mode  | - | Allows users to create new Conductors.                                                              |
   |            |                                                                                                         |
   |            | - | Is the default mode in the "Conductor Edit/Execution" menu.                                         |
   |            |                                                                                                         |
   |            | - |Click :guilabel:`Select` and select a Conductor to change to "View" mode.                            |
   +------------+---------------------------------------------------------------------------------------------------------+
   | View mode  | - | Allows users to view Conductors                                                                     |
   |            |                                                                                                         |
   |            | - | Clicking the :guilabel:`Details` button in the "Conductor list" menu moves the user to this mode.   |
   |            |                                                                                                         |
   |            | - | Click :guilabel:`Edit` button to change to "Edit" mode.                                             |
   +------------+---------------------------------------------------------------------------------------------------------+
   | Update mode| - | Allows users to edit existing Conductors.                                                           |
   |            |                                                                                                         |
   |            | - | Click the :guilabel:`Update` button to change to the "View" mode.                                   |
   +------------+---------------------------------------------------------------------------------------------------------+


| ※For more information regarding the different modes, see ":ref:`conductor_editandexcute_list` ".


"Edit" mode
~~~~~~~~~~~~~~~~~~~~~~

* | Allows users to register Conductor names and jobflow parts (Nodes).
* | The detailed information displayed on the page depends on the selected Node.

.. figure:: /images/ja/conductor/condudtor_edit_and_excute/conductor_edit_mode.png
   :width: 800px
   :alt: Conductor Edit/Execute menu (Edit mode)

   Conductor Edit/Execute menu (Edit mode)


.. _node_list:

Node list
^^^^^^^^

* | The bottom right part of the page displays available Nodes.
* | They are configured from the following tabs.

  * | Movement tab

    * | Registrated Movement name list

  * | Function tab

    * | Conductor end
    * | Conductor pause
    * | Conductor call
    * | Conditional branch
    * | Parallel branch
    * | Parallel merge
    * | Status File branch

* | For more information regarding the different nodes, see below.

.. table:: Node list
   :widths: 10 10 30
   :align: left

   +----------------+------------------------------+-----------------------------------+
   | **Figure**     | **Name**                     | **Description**                   |
   +================+==============================+===================================+
   | |image1|       | Conductor start              | Start of the Conductor            |
   +----------------+------------------------------+-----------------------------------+
   | |image2|       | Conductor end                | End of the Conductor              |
   |                |                              |                                   |
   |                |                              | ※If there are multiple "Conducto\|
   |                |                              | r end" nodes, the operation will \|
   |                |                              | end after all of them are finish\ |
   |                |                              | ed.                               |
   +----------------+------------------------------+-----------------------------------+
   | |image3|       | Conductor pause              | Pauses the jobflow.               |
   |                |                              |                                   |
   |                |                              | Resuming while paused continues t\|
   |                |                              | he process.                       |
   +----------------+------------------------------+-----------------------------------+
   | |image4|       | Conductor call               | Calls another registered Conducto\|
   |                |                              | r and executes it.                |
   |                |                              |                                   |
   |                |                              | ※\                               |
   |                |                              | If the called Conductor ends in a\|
   |                |                              |  warning, the original Conductor \|
   |                |                              | will keep on going. The end statu\|
   |                |                              | s of the called Conductor does no\|
   |                |                              | t affect the original Conductor.  |
   +----------------+------------------------------+-----------------------------------+
   | |image6|       | Conditional branch           | Branches the process according to\|
   |                |                              |  the results of the connected   \ |
   |                |                              | "Movement/Conductor call".\       |
   |                |                              |                                   |
   |                |                              | The statuses are as following     |
   |                |                              |                                   |
   |                |                              | ・Success                         |
   |                |                              |                                   |
   |                |                              | ・Error                           |
   |                |                              |                                   |
   |                |                              | ・Emergency stop                  |
   |                |                              |                                   |
   |                |                              | ・Preparation error               |
   |                |                              |                                   |
   |                |                              | ・Unexpected error                |
   |                |                              |                                   |
   |                |                              | ・SKIP complete                   |
   |                |                              |                                   |
   |                |                              | ・Warning                         |
   +----------------+------------------------------+-----------------------------------+
   | |image7|       | Parallel branch              | Executes multiple "Movement/Condu\|
   |                |                              | ctor call" in parallel.           |
   |                |                              |                                   |
   |                |                              | ※The maximum amount of processes\|
   |                |                              |  that can be executed in parallel\|
   |                |                              |  depends on the ITA server specs. |
   +----------------+------------------------------+-----------------------------------+
   | |image8|       | Parallel merge               | Resumes the jobflow only after al\|
   |                |                              | l the connected nodes finished.   |
   +----------------+------------------------------+-----------------------------------+
   | |image9|       | Status file branch           | Branchess processes based on the \|
   |                |                              | contents of the status file found\|
   |                |                              |  in the connected Movement result\|
   |                |                              |  directory.                       |
   +----------------+------------------------------+-----------------------------------+
   | |image10|      | Movement                     | Executes Movement.                |
   +----------------+------------------------------+-----------------------------------+



.. |image1| image:: /images/ja/conductor/condudtor_edit_and_excute/conductor_start.png
   :width: 1.1811in
   :height: 0.4086in
.. |image2| image:: /images/ja/conductor/condudtor_edit_and_excute/conductor_end.png
   :width: 1.1811in
   :height: 0.4086in
.. |image3| image:: /images/ja/conductor/condudtor_edit_and_excute/conductor_pause.png
   :width: 1.1811in
   :height: 0.31287in
.. |image4| image:: /images/ja/conductor/condudtor_edit_and_excute/node_conductor_call.png
   :width: 1.22047in
   :height: 0.34259in
.. |image6| image:: /images/ja/conductor/condudtor_edit_and_excute/conductor_branch.png
   :width: 1.1811in
   :height: 0.67068in
.. |image7| image:: /images/ja/conductor/condudtor_edit_and_excute/parallel_branch.png
   :width: 1.1811in
   :height: 0.9765in
.. |image8| image:: /images/ja/conductor/condudtor_edit_and_excute/parallel_merge.png
   :width: 1.1811in
   :height: 0.67667in
.. |image9| image:: /images/ja/conductor/condudtor_edit_and_excute/status_file_branch.png
   :width: 1.12963in
   :height: 0.59834in
.. |image10| image:: /images/ja/conductor/condudtor_edit_and_excute/node_movement_alr.png
   :width: 1.1811in
   :height: 1.49864in


* | The different nodes have the following restrictions.

  * | All the "IN/OUT" parts must be conencted.

  .. figure:: /images/ja/conductor/condudtor_edit_and_excute/NodeRestrictions正常例Parallel_branch.png
      :width: 600px
      :alt: NodeRestrictions (Correct example: Parallel branch)

      NodeRestrictions (Correct example: Parallel branch)

  * | If Parallel merge is used, the user must also use Parallel branch.

  .. figure:: /images/ja/conductor/condudtor_edit_and_excute/NodeRestrictionsNG例Parallel_branch.png
     :width: 600px
     :alt: NodeRestrictions(Bad example: Parallel branch)

     NodeRestrictions(Bad example: Parallel branch)

  * | Flows branched with Conditional branches cannot be merged to Parallel merge.

  .. figure:: /images/ja/conductor/condudtor_edit_and_excute/NodeRestrictionsNG例Conditional_branch.png
     :width: 600px
     :alt: NodeRestrictions(Bad example: Conditional branch)

     NodeRestrictions(Bad example: Conditional branch)

  * | The following Nodes cannot be connected to the same node: Parallel branch, Conditional branch, Parallel merge, Conductor pause.

  .. figure:: /images/ja/conductor/condudtor_edit_and_excute/NodeRestrictionsNG例連続使用.png
     :width: 600px
     :alt: NodeRestrictions(Bad example: Continued use)

     NodeRestrictions(Bad example: Continued use)

  * | It is not possible to specify an updating Conductor with a Conductor call and then update it.

  * | The user can add nodes by dragging and dropping them from the bottom right of the screen.

  * | When selecting Nodes, the "Remarks" field in the "Detailed information" section in the top of the page can be used to contain descriptions and comments about the Nodes.

  * | The "Remarks" field and its' contents does not have any effect on the execution. 

  * | After setting a Node, click the :guilabel:`+Register` button and register a Conductor.

Node detailed information
^^^^^^^^^^^^^^
* | The upper left are of the page displays detailed information regarding the selected node.
* | The name of the tab changes depending on the selected node.


  #. | When no Node is selected (Conductor tab)

     * | Displayed when nothing is selected.

     * | The items found in the tab are as following.

     * | Clicking the :guilabel:`Notification settings` button displays the "Notification settings" pop-up window.

     .. figure:: /images/ja/conductor/condudtor_edit_and_excute/conductor_notice_popup.png
        :width: 600px
        :alt: Conductor notification settings pop-up window

        Conductor notification settings pop-up window

     .. list-table:: "Conductor" tab
        :widths: 8 25 5 5 5
        :header-rows: 1
        :align: left

        * - **Item**
          - **Description**
          - **Input required**
          - **Input method**
          - **Restrictions**
        * - ID
          - Unique ID automatically given by the system.
          - \-
          - Automatic
          - \-
        * - Name
          - Input a name for the Conductor.
          - ○
          - Manual
          - \-
        * - Update date/time
          - Automatically updated when the selected Conductor is updated.
          - \-
          - Automatic
          - \-
        * - Notification
          - | Select the executing notification.
            | Users can select multiple notifications.
            | The notifications registered in ":ref:`conductor_notice` " can be used.
          - \-
          - Checkbox
          - \-
        * - Movement shared display settings
          - Configure display settings (node width and Movement name display format) related to the Movement nodes.
          - \-
          - List selection
          - \-
        * - Remarks
          - Free description field. Can be used for descriptions and comments regarding the Conductor.
          - \-
          - Manual
          - \-

  #. | Selecting Movement

     * | Is displayed when a Node is selected in the "Movement" tab in the ":ref:`node_list` ".
     * | The name of the tab corresponds to the selected Movement's orchestrator name (Example: Ansible Legacy Role).

     .. (Orchestrator names：Ansible Legacy, Ansible Pioneer, Ansible Legacy Role, Terraform　)

     * | The items found in the tab are as following.

     .. list-table:: Orchestrator name (Ansible Legacy Role) tab
        :widths: 10 30 5 5 5
        :header-rows: 1
        :align: left

        * - **Item**
          - **Description**
          - **Input required**
          - **Input method**
          - **Restrictions**
        * - Movement ID
          - Displays the ID of the selected Movement.
          - \-
          - Automatic
          - \-
        * - Name
          - Displays the name of the selected Movement.
          - \-
          - Automatic
          - \-
        * - Skip
          - Tick the checkbox in order to skip the Movement. This parameter can be changed in the "Conductor execute" menu.
          - \-
          - Manual
          - \-
        * - Individual Operation
          - | Click the :guilabel:`Select Operation` and select an Operation from the displayed list.
            | The name of the selected Operation is displayed.
          - \-
          - Select
          - \-
        * - Remarks
          - Free description field. Can be used for descriptions and comments regarding the Node.
          - \-
          - Manual
          - \-


  #. "Remarks" field when selecting Nodes

     * | The "Remarks" field is displayed when a Node is selected in the "Function" tab in the "Movement" tab in the :ref:`node_list`.
     * | The items found in the tab are as following.

     .. list-table:: Node selection tab
        :widths: 10 30 5 5 5
        :header-rows: 1
        :align: left

        * - **Item**
          - **Description**
          - **Input required**
          - **Input method**
          - **Restrictions**
        * - Remarks
          - Free description field. Can be used for descriptions and comments regarding the Node.
          - \-
          - Manual
          - \-


  #. Selecting Conductor call

     * | This is displayed when a "Conductor call" is selected in the "Function" tab in the ":ref:`node_list` ".
     * | The items found in the tab are as following.

     .. list-table:: "Conductor call" tab
        :widths: 10 30 5 5 5
        :header-rows: 1
        :align: left

        * - **Item**
          - **Description**
          - **Input required**
          - **Input method**
          - **Restrictions**
        * - Skip
          - | Skips the target if the checkbox is ticked.
            | This parameter can be changed in the "Conductor execute" menu.
          - \-
          - Radio button
          - \-
        * - Called Conductor
          - | Click the :guilabel:`Select Conductor` and select an Conductor from the displayed list.
            | The name of the selected Conductor is displayed.
          - \-
          - Select
          - \-
        * - Individual Operation
          - | Click the :guilabel:`Select Operation` and select an Operation from the displayed list.
            | The name of the selected Operation is displayed.
          - \-
          - Select
          - \-

  #. Selecting Conditional branch

     * | Displayed if a "Conditional branch" is selected in the "Function tab" in the ":ref:`node_list`".
     * | The items found in the tab are as following.


     .. table:: "Conditional branch" tab
        :align: left

        +------+----------------------------------------------+---------------+---------------+---------------+
        | **It\| **Description**                              | **Input \     | **Input met\  | **Restric\    |
        | em** |                                              | required**    | hod**         | tions**       |
        |      |                                              |               |               |               |
        |      |                                              |               |               |               |
        |      |                                              |               |               |               |
        |      |                                              |               |               |               |
        |      |                                              |               |               |               |
        |      |                                              |               |               |               |
        |      |                                              |               |               |               |
        +======+==============================================+===============+===============+===============+
        | Cond\| Configures a branch.                         |  \-           |  Select       |  \-           |
        | itio\| Click :guilabel:`Add branch` /:guilabel:`Del\|               |               |               |
        | nal \| ete branch` to add or delete branches. Max \ |               |               |               |
        | bran\| 6 branches can be added.                     |               |               |               |
        | ch s\|                                              |               |               |               |
        | etti\|                                              |               |               |               |
        | ngs  |                                              |               |               |               |
        +------+----------------------------------------------+---------------+---------------+---------------+
        | case | Configures a branch depending on the result\ |  \-           |  Select       |  \-           |
        |      | s of a Movement or a called conductor.       |               |               |               |
        |      |                                              |               |               |               |
        |      | Users can change the conditions by dragg\    |               |               |               |
        |      | ing and dropping.                            |               |               |               |
        |      |                                              |               |               |               |
        |      | The default statuses are as following.       |               |               |               |
        |      |                                              |               |               |               |
        |      | +-----------------+-----------------------+  |               |               |               |
        |      | | **case1**       | Success               |  |               |               |               |
        |      | |                 |                       |  |               |               |               |
        |      | |                 |                       |  |               |               |               |
        |      | +-----------------+-----------------------+  |               |               |               |
        |      | | **Other**       | Error, Emergency stop\|  |               |               |               |
        |      | |                 | , Preparation error, \|  |               |               |               |
        |      | |                 | Unexpected error, S\  |  |               |               |               |
        |      | |                 | kip, Warning.         |  |               |               |               |
        |      | +-----------------+-----------------------+  |               |               |               |
        +------+----------------------------------------------+---------------+---------------+---------------+


  #. Selecting Parallel branch

     * | Displayed if a "Parallel branch" is selected in the "Function tab" in the ":ref:`node_list`".
     * | The items found in the tab are as following.

     .. list-table:: "Parallel branch" tab
        :widths: 10 30 5 5 5
        :header-rows: 1
        :align: left

        * - **Item**
          - **Description**
          - **Input required**
          - **Input method**
          - **Restrictions**
        * - Parallel branch settings
          - | Configures a branch. Click the :guilabel:`Add branch` / :guilabel:`Delete branch` to add or delete branches.
            | The default number is 2 branches. The minimum number of branches is 2.
          - \-
          - Select
          - \-


  #. Selecting Parallel Merge

     * | Displayed if a "Parallel merge" is selected in the "Function tab" in the :ref:`node_list`".
     * | The items found in the tab are as following.

     .. list-table:: "Parallel Merge" tab
        :widths: 10 30 5 5 5
        :header-rows: 1
        :align: left

        * - **Item**
          - **Description**
          - **Input required**
          - **Input method**
          - **Restrictions**
        * - case
          - | Configures a branch. Click the :guilabel:`Add merge` / :guilabel:`Delete merge` to add or delete branches.
            | The default number is 2 branches. The minimum number of branches is 2.
          - \-
          - Select
          - \-


  #. Selecting Conductor end

     * | Displayed if a "Conductor end" is selected in the "Function tab" in the :ref:`node_list`".
     * | The items found in the tab are as following.

     .. list-table:: "End" tab
        :widths: 10 30 5 5 5
        :header-rows: 1
        :align: left

        * - **Item**
          - **Description**
          - **Input required**
          - **Input method**
          - **Restrictions**
        * - End status
          - | Displays a status depending on the process.
            | - Success (Default value)
            | - Warning
            | - Error
            |
            | If there are multiple processed end nodes, the priority of which the status will be displayed are as following.
            |  Priority: Success < Warning < Error
          - \-
          - Select
          - \-

  #. Selecting Status file branch(Status file branch tab)

     * | Displayed if a "Status file branch" is selected in the "Function tab" in the :ref:`node_list`".
     * | The items found in the tab are as following.

     .. list-table:: "Status file branch" tab
        :widths: 10 30 5 5 5
        :header-rows: 1
        :align: left

        * - **Item**
          - **Description**
          - **Input required**
          - **Input method**
          - **Restrictions**
        * - Status file settings
          - | Configures a conditional branch based on the Movement's status file.
            |   Click the :guilabel:`Add condition` / :guilabel:`Delete condition` to add or delete branches.
            |The default branch is "if" and "else".
          - \-
          - Select
          - \-
        * - Remarks
          - Free description field. Can be used for descriptions and comments regarding the Node.
          - \-
          - Manual
          - \-

     .. note:: | **Referenced status files**

      * | The status files referenced are the "MOVEMENT_STATUS_FILE" file under the Movements' operation result directory.
      * | If there is no status file to refer, the "else" side is processed.
      * | If the contents of the status file consists of multiple lines (newlined code included), values after the newline will not be used.

      | Example) Status file with newlines

      .. code-block::

         1

         23

         4

      | In this file, "1" will be valued.

      .. list-table:: Status file ITA original variable
         :widths: 15 25 5
         :header-rows: 1
         :align: left

         * - **ITA original variable**
           - **Variable specified contents**
           - **Restrictions**
         * - __movement_status_filepath__
           - Path for the "MOVEMENT_STATUS_FILE" under the result directory.
           - ※

      .. | ※ oricessed with ":ref:`ansible_legacyrole_work_flow`".

  #. "Node" tab

     * Displayed if a Node is selected in the "Function" tab in the "Movement" tab in the :ref:`node_list`.
     * Allows users to allign nodes within the grid.
     * Drag and drop nodes in the seletion area or select multiple nodes by holding shift and clicking them in order to select multiple Nodes.
     * The items found in the tab are as following.

     .. figure:: /images/ja/conductor/condudtor_edit_and_excute/conductor_align_nodes.gif
        :width: 800px
        :alt: Node allignment

        Node allignment

     .. list-table:: "Node" tab
        :widths: 10 30 5 5 5
        :header-rows: 1
        :align: left

        * - **Item**
          - **Description**
          - **Input required**
          - **Input method**
          - **Restrictions**
        * - |image11|
          - Aligns the selected nodes to the left
          - \-
          - Select
          - \-
        * - |image12|
          - Aligns the selected nodes to the center vertically
          - \-
          - Select
          - \-
        * - |image13|
          - Aligns the selected nodes to the right.
          - \-
          - Select
          - \-
        * - |image14|
          - Aligns the selected nodes to the top
          - \-
          - Select
          - \-
        * - |image15|
          - Aligns the selected nodes to the horizontally
          - \-
          - Select
          - \-
        * - |image16|
          - Aligns the selected nodes to the bottom
          - \-
          - Select
          - \-
        * - |image17|
          - Aligns the selected nodes vertically with equally spacing in-between them
          - \-
          - Select
          - \-
        * - |image18|
          - Aligns the selected nodes horizontally with equally spacing in-between them
          - \-
          - Select
          - \-

.. |image11| image:: /images/ja/conductor/condudtor_edit_and_excute/left_align.png
   :width: 0.3937in
   :height: 0.3937in
.. |image12| image:: /images/ja/conductor/condudtor_edit_and_excute/LR_Center_align.png
   :width: 0.3937in
   :height: 0.43032in
.. |image13| image:: /images/ja/conductor/condudtor_edit_and_excute/right_align.png
   :width: 0.3937in
   :height: 0.41045in
.. |image14| image:: /images/ja/conductor/condudtor_edit_and_excute/top_align.png
   :width: 0.3937in
   :height: 0.38532in
.. |image15| image:: /images/ja/conductor/condudtor_edit_and_excute/TB_Center_align.png
   :width: 0.3937in
   :height: 0.41082in
.. |image16| image:: /images/ja/conductor/condudtor_edit_and_excute/bottom_align.png
   :width: 0.3937in
   :height: 0.40276in
.. |image17| image:: /images/ja/conductor/condudtor_edit_and_excute/LR_Equal_space.png
   :width: 0.37391in
   :height: 0.39758in
.. |image18| image:: /images/ja/conductor/condudtor_edit_and_excute/TB_Equal_space.png
   :width: 0.3937in
   :height: 0.40298in



* | The actions that can be performed in the "Conductor edit/execute" menu are as following.

.. _conductor_editandexcute_list:
.. table:: "Conductor edit/execute" menu operation list
   :align: left

   +-------------+-----------------------------------+----------+---------+---------+------+
   | **Item**    | **Description**                   | **New**  | **Update**        | **Re\|
   |             |                                   |          |                   | mark\|
   |             |                                   |          |                   | s**  |
   |             |                                   |          |                   |      |
   |             |                                   +----------+---------+---------+      |
   |             |                                   | **EDIT** | **VIEW**| **EDIT**|      |
   |             |                                   |          |         |         |      |
   |             |                                   |          |         |         |      |
   |             |                                   |          |         |         |      |
   +=============+===================================+==========+=========+=========+======+
   | Save JSON   | Outputs the configuration of th\  | 〇       |         |         |      |
   |             |e current Conductor in JSON format.|          |         |         |      |
   +-------------+-----------------------------------+----------+---------+---------+------+
   | Load JSON   | Loads Conductor configuration inf\|   〇     |         |         |      |
   |             | ormation from JSON format.        |          |         |         |      |
   +-------------+-----------------------------------+----------+---------+---------+------+
   | Cancel      | Cancels the previous action.      | 〇       |         |  〇     |      |
   |             |                                   |          |         |         |      |
   +-------------+-----------------------------------+----------+---------+---------+------+
   | Redo        | Redoes the canceled action.       | 〇       |         | 〇      |      |
   +-------------+-----------------------------------+----------+---------+---------+------+
   | Delete node | Deletes the selected Node.        | 〇       |         | 〇      |      |
   |             |                                   |          |         |         |      |
   +-------------+-----------------------------------+----------+---------+---------+------+
   | Register    | Starts a registration.            | 〇       |         | 〇      |      |
   +-------------+-----------------------------------+----------+---------+---------+------+
   | Reset       | Returns the conductor to the de\  |  〇      |         |         |      |
   |             | fault state                       |          |         |         |      |
   +-------------+-----------------------------------+----------+---------+---------+------+
   | Edit        | Changes the mode to EDIT mode.    |          | 〇      | 〇      |      |
   |             |                                   |          |         |         |      |
   +-------------+-----------------------------------+----------+---------+---------+------+
   | Diverse     | Creates a new conductor using the\|          | 〇      |  〇     |      |
   |             |  registered conductor as a base.  |          |         |         |      |
   +-------------+-----------------------------------+----------+---------+---------+------+
   | Update      | Saves the edited contents.        |          |         |  〇     |      |
   +-------------+-----------------------------------+----------+---------+---------+------+
   | Reload      | Cancels the edit and returns the \|          |         | 〇      |      |
   |             | conductor to before the edit s\   |          |         |         |      |
   |             | tarted.                           |          |         |         |      |
   +-------------+-----------------------------------+----------+---------+---------+------+
   | Cancel      | Cancels the edit and returns to \ |          |         | 〇      |      |
   |             | View mode.                        |          |         |         |      |
   +-------------+-----------------------------------+----------+---------+---------+------+
   | Snap to grid| Ticking this item snaps all the \ | 〇       |         | 〇      |      |
   |             | nodes to the grid.                |          |         |         |      |
   |             |                                   |          |         |         |      |
   +-------------+-----------------------------------+----------+---------+---------+------+

"View" mode
~~~~~~~~~~~~~~~~~~~~~~

| The "View" mode is  displayed whenever a conductor is registered or when the user moves from the "Conductor list" menu.

.. figure:: /images/ja/conductor/condudtor_edit_and_excute/conductor_view_mode.png
   :width: 800px
   :alt: "Conductor edit/execute" menu("View" mode)

   "Conductor edit/execute" menu("View" mode)

.. list-table:: "View" mode
   :widths: 10 30
   :header-rows: 1
   :align: left

   * - **Item**
     - **Description**
   * - :guilabel:`Select`
     - Allows users to view registered Conductors.
   * - :guilabel:`Edit`
     - Allows users to edit registered Conductors.
   * - :guilabel:`Execute`
     - Allows users to execute the selected Conductor.
   * - :guilabel:`Diverse`
     - Allows users to copy registered Conductors and register new ones.
   * - :guilabel:`New`
     - Allows users to create new Conductors.

"Update" mode
~~~~~~~~~~~~~~~~~~~~~~

| The "Update" mode is displayed whenever the :guilabel:`Edit` button in the "View" mode is clicked.

.. figure:: /images/ja/conductor/condudtor_edit_and_excute/conductor_update_mode.png
   :width: 800px
   :alt: "Conductor edit/execute" menu("Edit" mode)

   "Conductor edit/execute" menu("Edit" mode)

.. list-table:: "Edit" mode
   :widths: 10 30
   :header-rows: 1
   :align: left

   * - **Item**
     - **Description**
   * - :guilabel:`Update`
     - Saves the edited contents.
   * - :guilabel:`Reload`
     - Discards the edited contents and returns the registered contents.
   * - :guilabel:`Cancel`
     - Returns the Conductor the before the :guilabel:`Edit` button was clicked.
   * - :guilabel:`Full screen`
     - | Changes the browser to full screen mode. 
       | ※This button changes to :guilabel:`Exit full screen` when in full screen mode
   * - :guilabel:`Full display`
     - Changes the display to inlude all the nodes.


Conductor execute
~~~~~~~~~~~~~~~~~~~~~~~~~

| The "Execute" mode is displayed whenever the  :guilabel:`Execute` button in the "View" mode is clicked.

* | Clicking the :guilabel:`Select Operation` displays all the operations registered in :menuselection:`"Basic console" menu group --> " Operation list" menu`.
  | ※See "Basic console -  :ref:`basic_console_operation`" for more information.
* Selecting an Operation and clicking the :guilabel:`Execute` button moves the user to the :menuselection:`"Conductor confirmation" menu` where the operation will be traced.
* | Input a schedule date in the "Schedule" field and click the:guilabel:`Execute` button. This will create a reservation. The registered information can be seen in :ref:`conductor_conductor_job_list`.
  | ※It is not possible to input a date earlier than the current time/date.
* | Users can change the setting values for "Movement", "Conductor call Operation" and "Skip".
  | ※Editing any data regsitered in the Conductor edit page will not be reflected. Only executions can be performed.
* The users who have access to the executed Conductors are the one who belonged to the roles who had access to the selected Operation.


* The shared itms in the "Execution settings" are as following.

.. list-table:: "Execution settings" shared item list
   :widths: 10 25 5 5 5
   :header-rows: 1
   :align: left

   * - **Item**
     - **Description**
     - **Input required**
     - **Input method**
     - **Restrictions**
   * - Execution Conductor
     - Displays the selected Conductor.
     - \-
     - Automatic
     -
   * - Operation
     - Click the :guilabel:`Select Operation` button and select an Operation.
     - ○
     - Select
     -
   * - Schedule
     - Specifies the scheduled execution date.
     - \-
     - Manual
     - It is not possible to input a date earlier than the current date/time.
   * - Execution
     - Executes the registered Conductor.
     - ○
     - Button
     -

.. figure:: /images/ja/conductor/condudtor_edit_and_excute/conductor_execute.gif
   :width: 800px
   :alt: Execution

   Execution

.. tip:: | **Specifying Operations**
   | Select a "Movement" node within the grid and click the :guilabel:`Select Operation button to display a list of the avilable Operations.
   | Users can specify operations other than the ID of the operation specified in the Execution settings page.
   | By doing so,users can substitute specific values registered as other Operation IDs in said Movement's orchestrator's :ref:`ansible_legacy_substitution_value_list` menu.
   | The Individually specified Operation ID settings from the Conductor edit page are saved with Conductor :guilabel:`Register` / :guilabel:`Edit`.
   | Userse can specify Operations before executing the Conductor. As a result, Operations registered in :ref:`conductor_editandexcute` can also be changed before executing the Conductor.
   | Note that the settings in the Conductor execution page are only reflected in the Conductor execution page. The settings are in other words not saved.
   | Users can use this function to diverse the Movement to operate for other servers.
   |
   | **Skip**
   | Users can change whether to skip the operation or not.
   | The skip settings in the Edit/Update mode are saved by :guilabel:`Register` / :guilabel:`Edit`.
   | Users can specify whether to skip or not, even in view mode. This is also the case for Conductors saved in the "Conductor edit" mode, meaning that users can choose to skip or not skip operations right before they execute the Conductor.
   | Note that any settings configured in the "View" mode are only there for that execution. The settings are in other words not saved.
   | Users can use this function to temporarily skip Operations or choose to execute an Operation previously set to be skipped right before executing the Conductor.

.. _conductor_conductor_job_list:

Conductor list
-----------------

#. | In the [Conductor list] page, users can manage already executed Conductors.
   | Specify the desired conditions and click the :guilabel:`Filter` button to display a list of executed Conductors.
   | Clicking the :guilabel:`Details` button in the Display field moves the user to :ref:`conductor_check_conductor_job`.
   | Clicking the :guilabel:`Input data file(zip)` button compiles all the Movement input files (*) under the executed Conductor and downloads it for the user.
   | Clicking the :guilabel:`Result data file(zip)` button compiles the execution logs and the error logs and downloads it for the user.

   | ※If the Conductor is multitiered, the last Movement are also included.


.. _conductor_check_conductor_job:

Conductor confirmation
-----------------

| The :menuselection:`"Conductor confirmation" menu` displays the status of executing/executed Conductors.

*  | Clicking the execution status circle for Conductors with the status "Executing" or later moves the user to the driver's "Status confirmation" menu where they can see more detailed inforamtion regarding the status.
*  | Clicking the :guilabel:`Details` button in ":ref:`conductor_conductor_job_list`" opens up the a display where the selected Conductor status is monitored.Users can then delete reservations, resume pauses and call an Emergency stop depending on the situation. 
   | ※After selecting "Movement" and "Conductor Call" nodes, :guilabel:`Operation information confirmation` is displayed on the right side of the screen where the user can move to the "Operation information confirmation" menu.

.. figure:: /images/ja/conductor/condudtor_edit_and_excute/conductor_job_detail.gif
   :width: 800px
   :alt: Conductor execution

   Conductor execution


.. tip:: | Editing a Conductor executed in the :menuselection:`"Conductor execution" menu` in the " :ref:`conductor_editandexcute` " menu will cause the Conductor to change status from when it was executing. This might cause an issue where the process status won't be displayed even if the user clicks the :guilabel:`Details` button.
   | If the user wants to edit and execute an already executed Conductor, we recommend they go to the :menuselection:`"Conductor edit/execute" menu` and use the :guilabel:`Diverse` function to create a different Conductor.

* | If the selected Conductor has a reservation date configured and is not executed, the  :guilabel:`Delete reservation` button will be displayed.
* | Clicking the :guilabel:`Delete reservation` button changes the status in the " :ref:`conductor_conductor_job_list`" menu to "Reservation deleted" and can no longer be executed.
* | The shared items in the :menuselection:`"Conductor confirmation" menu` are as following.

.. list-table:: "Conductor confirmation" shared item list
      :widths: 4 15 5 5 10
      :header-rows: 1
      :align: left

      * - **Item**
        - **Description**
        - **Input required**
        - **Input method**
        - **Restrictions**
      * - Resume
        - Clicking the triangle icon in the "Couductor pause" Node resumes it.
        - \-
        - Button
        -
      * - Emergency stop
        - Stops executing Conductors.
        - \-
        - Button
        -
      * - Delete reservation
        - Removes Conductor execution reservations.
        - \-
        - Button
        - Is only displayed if the Conductor has a reservation date configured and not executed.

.. figure:: /images/ja/conductor/conductor_verification/conductor_pause_status.png
   :width: 800px
   :alt: Conductor executing /Conductor Pause status

   Conductor executing /Conductor Pause status

.. figure:: /images/ja/conductor/conductor_verification/conductor_reserved.png
   :width: 800px
   :alt: Reserved Conductor execution (Not executed)

   Reserved Conductor execution (Not executed)

* The are in the upper left part of the screen displays detailed information.
* If a Node is selected, the area will display detailed information regarding the Node.

  #. "Conductor" tab

     * Dispalyed when no Node is selected.
     * The items found in the tab are as following.

     .. table:: "Conductor" tab
        :align: left

        +---------------------------------+------------------------------------------+
        | **Item**                        | **Description**                          |
        +==================+==============+==========================================+
        | Conductor instan\| ID           | Unique ID automatically given by the \   |
        | ce information   |              | system.                                  |
        |                  +--------------+------------------------------------------+
        |                  | Name         | Displays the name of the executing C\    |
        |                  |              | onductor.                                |
        |                  +--------------+------------------------------------------+
        |                  | Status       | Displays the status of the executing Co\ |
        |                  |              | nductor. The displayed statuses are as f\|
        |                  |              | ollowing.                                |
        |                  |              |                                          |
        |                  |              | ・Not executed                           |
        |                  |              |                                          |
        |                  |              | ・Not executed (Reserved)                |
        |                  |              |                                          |
        |                  |              | ・Executing                              |
        |                  |              |                                          |
        |                  |              | ・Executing(Delayed)                     |
        |                  |              |                                          |
        |                  |              | ・Pause                                  |
        |                  |              |                                          |
        |                  |              | ・Success                                |
        |                  |              |                                          |
        |                  |              | ・Error                                  |
        |                  |              |                                          |
        |                  |              | ・Warning                                |
        |                  |              |                                          |
        |                  |              | ・Emergency stop                         |
        |                  |              |                                          |
        |                  |              | ・Reservation deleted                    |
        |                  |              |                                          |
        |                  |              | ・Unexpected error                       |
        |                  +--------------+------------------------------------------+
        |                  | Start time   | Displays the start time of the execution.|
        |                  +--------------+------------------------------------------+
        |                  | End time     | Displays the end time of the execution.  |
        |                  +--------------+------------------------------------------+
        |                  | Execution u\ | Displays the user who executed the Cond\ |
        |                  | ser          | uctor.                                   |
        |                  +--------------+------------------------------------------+
        |                  | Reservation \| Displays the execution date/time of rese\|
        |                  | date/time    | rved Conductors.                         |
        |                  +--------------+------------------------------------------+
        |                  | Emergency st\| Displays "True" if the Conductor as been\|
        |                  | op           | stopped with the "Emergency stop" funct\ |
        |                  |              | ion.                                     |
        |                  |              | Displays "False" for everything else.    |
        +------------------+--------------+------------------------------------------+
        | Operation                       | Displays the name of the operation       |
        +---------------------------------+------------------------------------------+
        | Remarks                         | Free description field. Can be used to \ |
        |                                 | contain descriptions and comments.       |
        +---------------------------------+------------------------------------------+

  #. "Node" tab

     *  Is displayed when a Node is selected.
     *  The items found in the tab are as following.

     .. table:: "Node" tab
        :align: left

        +---------------------------------+------------------------------------------+
        | **Item**                        | **Description**                          |
        +==================+==============+==========================================+
        | Node \           | ID           | Unique ID automatically given by the \   |
        | instance \       |              | system.                                  |
        | information      +--------------+------------------------------------------+
        |                  | Type         | Displays the type of the selected Node.  |
        |                  +--------------+------------------------------------------+
        |                  | Node ID      | Displays the Node ID on the Conductor \  |
        |                  |              | structure information (JSON format).     |
        |                  +--------------+------------------------------------------+
        |                  | Status       | Displays the status of the executing Co\ |
        |                  |              | nductor. The displayed statuses are as f\|
        |                  |              | ollowing.                                |
        |                  |              |                                          |
        |                  |              | ・Not executed                           |
        |                  |              |                                          |
        |                  |              | ・Executing                              |
        |                  |              |                                          |
        |                  |              | ・Executing(Delayed)                     |
        |                  |              |                                          |
        |                  |              | ・Pause                                  |
        |                  |              |                                          |
        |                  |              | ・Success                                |
        |                  |              |                                          |
        |                  |              | ・Error                                  |
        |                  |              |                                          |
        |                  |              | ・Unexpected error                       |
        |                  |              |                                          |
        |                  |              | ・Emergency stop                         |
        |                  |              |                                          |
        |                  |              | ・Pause                                  |
        |                  |              |                                          |
        |                  |              | ・Preparation error                      |
        |                  |              |                                          |
        |                  |              | ・Skip complete                          |
        |                  |              |                                          |
        |                  |              | ・Warning                                |
        |                  +--------------+------------------------------------------+
        |                  | St file      | Displays the Status file values if the s\|
        |                  |              | elected Node is a Movement.              |
        |                  +--------------+------------------------------------------+
        |                  | Start time   | Displays the start time of the execution.|
        |                  +--------------+------------------------------------------+
        |                  | End time     | Displays the end time of the execution.  |
        +------------------+--------------+------------------------------------------+
        | Individual operation            | Displays the name of the operation if an\|
        |                                 |  Operation has been specified to the M\  |
        |                                 | ovement.                                 |
        +---------------------------------+------------------------------------------+
        | Remarks                         | Free description field. Can be used to \ |
        |                                 | contain descriptions and comments.       |
        +---------------------------------+------------------------------------------+

Conductor scheduled execution
---------------------

1. The :menuselection:`"Conductor scheduled execution" menu` allows users to manage Conductor operations that are regularly executed on a schedule.
2. | Clicking the :guilabel:`Confirm Operation list` button in the  :menuselection:`"Conductor scheduled execution" menu-->"List" submenu` moves the user to the 
   | :ref:`conductor_conductor_job_list` menu.

3. Click the :guilabel:`Register` button to register a scheduled execution.

.. figure:: /images/ja/conductor/conductor_scheduled_execution/conductor_scheduled_execution_register.gif
   :width: 800px
   :alt: Conductor scheduled execution registration

   Conductor scheduled execution

   For more a more detailed schedule, click the :guilabel:`Schedule settings` button to display a window where they can be configured.

.. figure:: /images/ja/conductor/conductor_scheduled_execution/conductor_scheduled_execution.png
   :width: 600px
   :alt: Conductor scheduled execution Schedule settings

   Conductor scheduled execution Schedule settings

.. table:: Conductor scheduled execution registration item lists
   :widths: 5 5 30 5 5 5
   :align: left

   +---------------------------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   | **Item**                        | **Description**                                              | **Input \    | **Input \     | **Restrictions**      |
   |                                 |                                                              | required**   | method**      |                       |
   +=================================+==============================================================+==============+===============+=======================+
   | Scheduled execution ID          | Unique ID automatically given by the system.                 | ー           | Automatic     |                       |
   +---------------------------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   | Conductor name                  | Displays the names of the Conductors registered in \         | ○           | List \        | ー                    |
   |                                 | ":ref:`conductor_list`".                                     |              | selection     |                       |
   +---------------------------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   | Operation name                  | Displays the names of the Operations registered in \         | ○           | List \        | ー                    |
   |                                 | "Basic console - :ref:`basic_console_operation`".            |              | selection     |                       |
   +---------------------------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   | Status                          | See ":ref:`status_list`" for more information.               | ー           | Automatic     |                       |
   +---------------------------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   | Execution user                  | Registers the user to either "Registered" or "Updated" the \ | ー           | Automatic     |                       |
   |                                 | conductor as the Execution user.                             |              |               |                       |
   |                                 | When Scheduled operations are registered to the :ref:`condu\ |              |               |                       |
   |                                 | ctor_list`", the same user is automatically registered.      |              |               |                       |
   +---------------------------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   | Schedule settings               | Button that allows users to configure detailed schedule set\ | ー           | ー            | ー                    |
   |                                 | tings.                                                       |              |               |                       |
   +------------------+--------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   | Schedule         | Next executi\| Automatically updated based on the scheduled settings.       | ー           | Automatic     | ー                    |
   |                  | on date      |                                                              |              |               |                       |
   +                  +--------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   |                  | Start date   | Input a date for when the scheduled execution will start.    | ○           | Manual        | Can only be input fro\|
   |                  |              | The "Next execution date" is always updated with a date lat\ |              |               | m the Schedule settin\|
   |                  |              |er than the "Start date".                                     |              |               | ngs.                  |
   +                  +--------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   |                  | End date     | Input a date for when the scheduled execution will end.      | ー           | Manual        | Can only be input fro\|
   |                  |              | If the "Next execution date" exceeds the "End date", the st\ |              |               | m the Schedule settin\|
   |                  |              | atus will change to "Complete".                              |              |               | ngs.                  |
   +                  +--------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   |                  | Cycle        | Select the cycle in which the conductor will be executed.    | ○           | Radio button  | Can only be input fro\|
   |                  |              | The user can choose between "Time", "Day", "Week", "Month(Sp\|              |               | m the Schedule settin\|
   |                  |              | ecify day)", "Month(Specify day of week)" and "End of month".|              |               | ngs.                  |
   +                  +--------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   |                  | Interval     | Input an interval time for based on the configured Cycle.    | ○           | Manual        | Can only be input fro\|
   |                  |              |                                                              |              |               | m the Schedule settin\|
   |                  |              |                                                              |              |               | ngs.                  |
   +                  +--------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   |                  | Week number  | Use when "Month(Specify day of week) is selected.            | ※1          | List selection| Can only be input fro\|
   |                  |              | Specifies which week the conductor will be executed.         |              |               | m the Schedule settin\|
   |                  |              |                                                              |              |               | ngs.                  |
   +                  +--------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   |                  | Day of week  | Use when "Month(Specify day of week) is selected.            | ※2          | List selection| Can only be input fro\|
   |                  |              | Specifies which day of the week the conductor will b\        |              |               | m the Schedule settin\|
   |                  |              | e executed.                                                  |              |               | ngs.                  |
   +                  +--------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   |                  | Day          | Use when "Month(Specify day) is selected.                    | ※3          | Manual        | Can only be input fro\|
   |                  |              | Specifies the date in which the conductor will be executed.  |              |               | m the Schedule settin\|
   |                  |              |                                                              |              |               | ngs.                  |
   +                  +--------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   |                  | Time         | Input the time in which the conductor will be executed.      | ※4          | Manual        | Can only be input fro\|
   |                  |              |                                                              |              |               | m the Schedule settin\|
   |                  |              |                                                              |              |               | ngs.                  |
   +------------------+--------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   | Suspension period| Start        | Input the start date of the period in which the conductor \  | ※5          | Manual        | Can only be input fro\|
   |                  |              | will not be registered.                                      |              |               | m the Schedule settin\|
   |                  |              | The Conductor will not be registered between the suspesion \ |              |               | ngs.                  |
   |                  |              | period start date and the suspension period end date.        |              |               |                       |
   |                  |              |                                                              |              |               |                       |
   +                  +--------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   |                  | End          | Input the end date of the period in which the conductor \    | ※5          | Manual        | Can only be input fro\|
   |                  |              | will not be registered.                                      |              |               | ngs.                  |
   |                  |              | The Conductor will not be registered between the suspesion \ |              |               |                       |
   |                  |              | period start date and the suspension period end date.        |              |               |                       |
   +------------------+--------------+--------------------------------------------------------------+--------------+---------------+-----------------------+
   | Remarks                         | Free description field.                                      | ー           | Manual        | ー                    |
   +------------------+--------------+--------------------------------------------------------------+--------------+---------------+-----------------------+

| ※1 Week number is required when period is "Month (Specify day of week)".
| ※2 Day of week is required when period is "Month (Specify day of week)".
| ※3 Day is required when period is "Month (Specify day)".
| ※4 Time is required when period is "Day", "Week", "Month (Specify day)", "Month (Specify day of week)", "End of month".
| ※5 When setting work suspension period, both "Start" and "End" are required.

.. _status_list:

.. table:: Status list
   :align: left

   +-------------------------+---------------------------------------------------------------------------------+
   | **Status name**         | **Description**                                                                 |
   +=========================+=================================================================================+
   | Preparing               | Status displayed immediately after registration                                 |
   |                         | The status will automatically change to "Operating" when the backyard \         |
   |                         | updates the "Next execution date".                                              |
   +-------------------------+---------------------------------------------------------------------------------+
   | Operating               | Status displayed when the conductor is operating normally.                      |
   |                         | The system automatically registers the conductor to ":ref:`conductor_list`" \   |
   |                         | based on the registered "Conudctor interval time settings" value and updates t\ |
   |                         | he "Next execution date" based on the schedule settings.                        |
   +-------------------------+---------------------------------------------------------------------------------+
   | Success                 | Status displayed when "Next execution date" passes the "End date".              |
   |                         | No further Conductors will be registered.                                       |
   +-------------------------+---------------------------------------------------------------------------------+
   | Mismatch error          | Status displayed when the Schedule settings contains an invalid value           |
   +-------------------------+---------------------------------------------------------------------------------+
   | Link error              | Status displayed when the registration to ":ref:`conductor_list`" fails.        |
   |                         | Similarly to the "Operating" status, the system automatically registers a condu\|
   |                         | ctor to the  ":ref:`conductor_list`"  and updates the "Next execution date".    |
   |                         | If the that registration fails, the status will keep displaying "Link error".   |
   +-------------------------+---------------------------------------------------------------------------------+
   | Unexpected error        | Status displayed when an error other than "Mismatch error"\                     |
   |                         |  and "Link error" displays.                                                     |
   +-------------------------+---------------------------------------------------------------------------------+
   | Conductor discarded     | Status dispalyed when the registered Conductor has been discarded.              |
   |                         | Restoring the discarded Conductor will change the status to "Preparing".        |
   +-------------------------+---------------------------------------------------------------------------------+
   | Operation discarded     | Status dispalyed when the registered Operation has been discarded.              |
   |                         | Restoring the discarded Operation will change the status to "Preparing".        |
   +-------------------------+---------------------------------------------------------------------------------+

1. | After a schedule is registered, the status change to "Preparing" The Backyard will update the "Next execution date" based on the schedule and change the status to "Operating".
   .(Conductors with the status (Operating) or (Link error) are registered to the :ref:`conductor_list` before the time configured in the "Conductor interval time settings" and are updates the "Next execution date" based on the schedule settings.

2. | The Conductor interval time settings allows users to decide how many minutes the registration will happen before the "Next execution date" in "Management console - :ref:`system_setting`".
   |

.. tip::
  | If a menu is imported between diffeerent organizations using the ":ref:`menu_export_import`" fuction, the import destination's scheduled execution's execution user will meet an ID conversion failure and executing the conductor in that status in the Scheduled settings, the status will display "Link error". 
  | To prevent this, update the record and make sure the execution user does not meet an ID conversion failure.


Appendix
====

Conductor notification definition
-------------------

Conductor notification definition setting example
~~~~~~~~~~~~~~~~~~~~~~~~~
.. table:: Teams setting example
   :align: left

   +-----------------------+--------------------------------------------------+
   | Item                  | Setting value                                    |
   +=======================+==================================================+
   | Notification name     | test                                             |
   +-----------------------+--------------------------------------------------+
   | Header                |  [ "Content-Type: application/json" ]            |
   | (CURLOPT_HTTPHEADER)  |                                                  |
   +-----------------------+--------------------------------------------------+
   | Message(C\            | {"text": "Notification name:__NOTICE_NAME__, <br>|
   | URLOPT_POSTFIELDS)    | Conductor name: \__CONDUCTOR_NAME__, <br>        |
   |                       | Con                                              |
   |                       | ductor instance ID:__CONDUCTOR_INSTANCE_ID__,    |
   |                       | <br>Status  ID: \__STATUS_ID__,                  |
   |                       | Operation URL: \__JUMP_URL__, <br> "}            |
   +-----------------------+--------------------------------------------------+
   | PROXY / URL           |                                                  |
   | (CURLOPT_PROXY)       |                                                  |
   +-----------------------+--------------------------------------------------+
   | PROXY / PORT          |                                                  |
   | (\                    |                                                  |
   | CURLOPT_PROXYPORT)    |                                                  |
   +-----------------------+--------------------------------------------------+
   | Operation confirm\    | http://localhost:38000                           |
   | ation URL(FQDN)       |                                                  |
   +-----------------------+--------------------------------------------------+
   | Other                 |                                                  |
   +-----------------------+--------------------------------------------------+
   | Start time            |                                                  |
   +-----------------------+--------------------------------------------------+
   | End time              |                                                  |
   +-----------------------+--------------------------------------------------+

.. figure:: /images/ja/conductor/conductor_notice/conductor_teams_notice.png
   :alt: Teams notification display example

   Teams notification display example

.. table:: Slack setting example
   :align: left

   +-----------------------+--------------------------------------------------+
   | Item                  | Setting value                                    |
   +=======================+==================================================+
   | Notification name     | test2                                            |
   +-----------------------+--------------------------------------------------+
   | Notification destin\  | Input the notification destination's Slack \     |
   | ation(CURLOPT_URL)    | Webhook URL.                                     |
   +-----------------------+--------------------------------------------------+
   | Header(C\             | [ "Content-Type: application/json" ]             |
   | URLOPT_HTTPHEADER)    |                                                  |
   +-----------------------+--------------------------------------------------+
   | Message(C\            | {"text": "Notification name:__NOTICE_NAME__, <br>|
   | URLOPT_POSTFIELDS)    | Conductor name: \__CONDUCTOR_NAME__, <br>        |
   |                       | Con                                              |
   |                       | ductor instance ID:__CONDUCTOR_INSTANCE_ID__,    |
   |                       | <br>Status ID: \__STATUS_ID__,                   |
   |                       | Operation URL: \__JUMP_URL__, <br> "}            |
   +-----------------------+--------------------------------------------------+
   | PROXY / URL           |                                                  |
   | (CURLOPT_PROXY)       |                                                  |
   +-----------------------+--------------------------------------------------+
   | PROXY / PORT          |                                                  |
   | (\                    |                                                  |
   | CURLOPT_PROXYPORT)    |                                                  |
   +-----------------------+--------------------------------------------------+
   | Operation confirm\    | http://localhost:38000                           |
   | ation URL(FQDN)       |                                                  |
   +-----------------------+--------------------------------------------------+
   | Other                 |                                                  |
   +-----------------------+--------------------------------------------------+
   | Start time            |                                                  |
   +-----------------------+--------------------------------------------------+
   | End time              |                                                  |
   +-----------------------+--------------------------------------------------+

.. figure:: /images/ja/conductor/conductor_notice/conductor_slack_notice.png
   :alt: Slack notification display example

   Slack notification display example

.. table:: Setting sample (with Proxy settings, notification stop settings and other settings)
   :align: left

   +--------------------+-------------------------------------------------+
   | Notification name  | Notification sample                             |
   +====================+=================================================+
   | Notification desti\| https://sample.webhook.xxx.com/yyyyyyyy         |
   | nation(CURLOPT_URL)|                                                 |
   +--------------------+-------------------------------------------------+
   | Header(C\          | [ "Content-Type: application/json" ]            |
   | URLOPT_HTTPHEADER) |                                                 |
   +--------------------+-------------------------------------------------+
   | Message(C\         | {"text": "Notification contents"}               |
   | URLOPT_POSTFIELDS) |                                                 |
   +--------------------+-------------------------------------------------+
   | PROXY / URL        | http://proxy.co.jp                              |
   | (CURLOPT_PROXY)    |                                                 |
   +--------------------+-------------------------------------------------+
   | PROXY / PORT       | 8080                                            |
   | (\                 |                                                 |
   | CURLOPT_PROXYPORT) |                                                 |
   +--------------------+-------------------------------------------------+
   | Operation confirm\ | http://exastro-it-automation.local              |
   | ation URL(FQDN)    |                                                 |
   +--------------------+-------------------------------------------------+
   | Other              | {"CURLOPT_TIMEOUT":"10"}                        |
   +--------------------+-------------------------------------------------+
   | Start time         | 2020/01/01 00:00:00                             |
   +--------------------+-------------------------------------------------+
   | End time           | 2020/01/01 00:00:00                             |
   +--------------------+-------------------------------------------------+
   | Remarks            | Free description field                          |
   +--------------------+-------------------------------------------------+

.. _conductor_notification_log:

Notification log output example
~~~~~~~~~~~~~~

Notification log structure
^^^^^^^^^^^^^^

.. code-block::

   [
    {
        "conductor_status_id": "XXX",
        "exec_time": "YYYY/MM/dd HH:ii:ss",
        "result": [
            {
                "notice_name": "XXX",
                "notice_info": [
                    XXX
                ],
                "status_code": "XXX",
                "response.headers": {
                      "XXX": "XXX"
                  },
                "response.text": "XXX"
            }
        ]
     }
   ]

Example) Notification execution log (Success)
^^^^^^^^^^^^^^^^^^^^^^
.. code-block::

  [
      {
          "conductor_status_id": "3",
          "exec_time": "2023/07/05 16:29:50",
          "result": [
              {
                  "notice_name": "test",
                  "notice_info": [
                      "3",
                      "4",
                      "5",
                      "6",
                      "7",
                      "8",
                      "9",
                      "10",
                      "11"
                  ],
                  "status_code": 200,
                  "response.headers": {
                      "XXX": "XXX"
                  },
                  "response.text": "1"
              }
          ]
      }
  ]


Example) Notification execution log (Error)
^^^^^^^^^^^^^^^^^^^^^^

.. code-block::

  [
      {
          "conductor_status_id": "3",
          "exec_time": "2023/07/05 19:46:06",
          "result": [
              {
                  "notice_name": "test",
                  "notice_info": [
                      "3",
                      "6"
                  ],
                  "status_code": 400,
                  "response.headers": {
                      "XXX": "XXX"
                  },
                  "response.text": "Invalid webhook URL",
                  "err_type": "HTTPError"
              }
          ]
      }
  ]
