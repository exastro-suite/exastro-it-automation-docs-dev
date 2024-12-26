.. _menu_export_import:

================================
Menu export/import
================================

Introduction
========

| This document aims to explain ITA's Menu export/import function and how to use it.

Menu export/import overview
======================================

| This section aims to explain the Menu export/import function.

Menu export/import
--------------------------------

Functions
^^^^^^^^^^^^

| The Menu export/import function allows users to select ITA menus in order to select what data they want to import and export.

.. figure:: /images/ja/export_import/overview/export_import_simple_diagram.png
  :width: 600px
  :align: center

Modes
^^^^^^^^^^^^^^

| The Menu export functions has 2 different modes.

1. Export environment

| Exports all data from the specified menus. This will overwrite all the data at the target machine when imported.

.. figure:: /images/ja/export_import/overview/environmental_transition_diagram.png
  :width: 600px
  :align: center

2. Time specified

| Exports only data after a specified time. If unique items (ID, No, etc.) overlaps with the ones at the target environment, the export data will be prioritized.

| Example: if 1/2/2023 17:00 is specified

.. figure:: /images/ja/export_import/overview/time_designation_transition_diagram.png
  :width: 720px
  :align: center

Example
^^^^^^

| The following uses 2 environments to demonstrate the export/import function, Workspace A and Workspace B.

| **Scenario ①: Cloning environments**

| In this scenario, all the data registered in Workspace A will be cloned to Workspace B.

| [Steps]

#. Use the Export environment mode to export all the data from Workspace A.
#. Import the exported data to Workspace B.

| ※The user is free to update and register data to Workspace B after the import is finished. Do not that doing so might cause issues if data from Workspace A is imported again.
| ※We do not recommend exporting and importing data both ways, as it can cause issues.

.. figure:: /images/ja/export_import/overview/environment_replication.png
  :width: 1000px
  :align: center

| **Scenario ②：Dividing workspace for data input and workspace for executing operations**

| This scenario is used for dividing workspaces between data input/testing purposes and executing operations.

| [Steps]

#. Use the Export environment mode to export all the data from Workspace A.
#. Import the exported data to Workspace B.
#. Use the Time specified export mode to export data from Workspace A to Workspace B whenever the data in Workspace A has been updated.

| ※ In the case of multiple exports and imports, registering or updating data to Workspace B might cause compatibility issues. Executing operations however has no effect and should not cause any problems.
| ※When importing data while an operation is being executed in Workspace B, make sure to use the Time specificied mode in order to not alter the executing data.
| ※We do not recommend exporting and importing data both ways, as it can cause issues.

.. figure:: /images/ja/export_import/overview/separate_servers.png
  :width: 1000px
  :align: center


Menu export/import page
====================================================

| This section aims to explain the Menu export/import menu page.

Menu list
-------------

| The Menu export/import menus are as following.

.. table:: ITA menu list
   :align: left

   +--------+----------------------+--------------------+------------------+
   | **No** | **Menu group**       | **Menu/page**      | **Description**  |
   +========+======================+====================+==================+
   | 1      | Export/Import        | Menu export/import | Exports\         |
   |        |                      |                    |  menu data       |
   |        |                      |                    |                  |
   +--------+                      +--------------------+------------------+
   | 2      |                      | Import menu        | Imports\         |
   |        |                      |                    | menu data\       |
   |        |                      |                    |                  |
   |        |                      |                    |                  |
   +--------+                      +--------------------+------------------+
   | 3      |                      | Menu export/import\| Manages the\     |
   |        |                      |  management        | status of\       |
   |        |                      |                    | import and\      |
   |        |                      |                    | export processes\|
   |        |                      |                    | from the Export\ |
   |        |                      |                    | menu and Import\ |
   |        |                      |                    | menu.            |
   |        |                      |                    |                  |
   |        |                      |                    |                  |
   +--------+----------------------+--------------------+------------------+


Functions/Operation
==================

Menu export
--------------------

| Exports data registered to the ITA system per menu.

.. note::
   | If the user is moving data to a different ITA environment, the data might not work well together unless they move all the data.

| Note that some menus cannot be exported. Said menus are listed in the table below.

.. table::
   :align: left

   +--------+--------------------------+-------------------------------------------------------+
   | **No** | **Menu group**           | **Menu/Page**                                         |
   +========+==========================+=======================================================+
   | 1      | Export/Import            | Export menu                                           |
   +--------+                          +-------------------------------------------------------+
   | 2      |                          | Import menu                                           |
   +--------+                          +-------------------------------------------------------+
   | 3      |                          | Menu export/import management                         |
   +--------+                          +-------------------------------------------------------+
   | 4      |                          | Excel bulk export                                     |
   +--------+                          +-------------------------------------------------------+
   | 5      |                          | Excel bulk import                                     |
   +--------+                          +-------------------------------------------------------+
   | 6      |                          | Excel bulk export/import management                   |
   +--------+--------------------------+-------------------------------------------------------+
   | 7      | Conductor                | Conductor edit/execution                              |
   +--------+                          +-------------------------------------------------------+
   | 8      |                          | Conductor operation list                              |
   +--------+                          +-------------------------------------------------------+
   | 9      |                          | Conductor confirmation                                |
   +--------+                          +-------------------------------------------------------+
   | 10     |                          | Conductor instance list                               |
   +--------+                          +-------------------------------------------------------+
   | 11     |                          | Conductor Node instance list                          |
   +--------+--------------------------+-------------------------------------------------------+
   | 12     | Parameter sheet creation | Create/define parameter sheet                         |
   +--------+                          +-------------------------------------------------------+
   | 13     |                          | Parameter sheet creation history                      |
   +--------+                          +-------------------------------------------------------+
   | 14     |                          | Selection 1                                           |
   +--------+                          +-------------------------------------------------------+
   | 15     |                          | Selection 2                                           |
   +--------+--------------------------+-------------------------------------------------------+
   | 16     | Compare                     | Execute comparison                                 |
   +--------+--------------------------+-------------------------------------------------------+
   | 17     | Ansible-Legacy           | Operation target host                                 |
   +--------+                          +-------------------------------------------------------+
   | 18     |                          | Substitute value management                           |
   +--------+                          +-------------------------------------------------------+
   | 19     |                          | Execute                                               |
   +--------+                          +-------------------------------------------------------+
   | 20     |                          | Operation status                                      |
   +--------+                          +-------------------------------------------------------+
   | 21     |                          | Operation management                                  |
   +--------+--------------------------+-------------------------------------------------------+
   | 22     | Ansible-Pioneer          | Operation target host                                 |
   +--------+                          +-------------------------------------------------------+
   | 23     |                          | Substitute value management                           |
   +--------+                          +-------------------------------------------------------+
   | 24     |                          | Execute                                               |
   +--------+                          +-------------------------------------------------------+
   | 25     |                          | Operation status                                      |
   +--------+                          +-------------------------------------------------------+
   | 26     |                          | Operation management                                  |
   +--------+--------------------------+-------------------------------------------------------+
   | 27     | Ansible-LegacyRole       | Operation target host                                 |
   +--------+                          +-------------------------------------------------------+
   | 28     |                          | Substitute value management                           |
   +--------+                          +-------------------------------------------------------+
   | 29     |                          | Execute                                               |
   +--------+                          +-------------------------------------------------------+
   | 30     |                          | Operation status                                      |
   +--------+                          +-------------------------------------------------------+
   | 31     |                          | Operation management                                  |
   +--------+--------------------------+-------------------------------------------------------+
   | 32     | Terraform-Cloud/EP       | Execute                                               |
   +--------+                          +-------------------------------------------------------+
   | 33     |                          | Operation status                                      |
   +--------+                          +-------------------------------------------------------+
   | 34     |                          | Operation management                                  |
   +--------+                          +-------------------------------------------------------+
   | 35     |                          | Substitute value management                           |
   +--------+                          +-------------------------------------------------------+
   | 36     |                          | Link Terraform management                             |
   +--------+--------------------------+-------------------------------------------------------+
   | 37     | Terraform-CLI            | Execute                                               |
   +--------+                          +-------------------------------------------------------+
   | 38     |                          | Operation status                                      |
   +--------+                          +-------------------------------------------------------+
   | 39     |                          | Operation management                                  |
   +--------+                          +-------------------------------------------------------+
   | 40     |                          | Substitute value management                           |
   +--------+--------------------------+-------------------------------------------------------+

| (1) Select whether to export deleted data or not.
| The mode list and deleted information list is as following.

.. table:: Mode list
   :align: left

   +------------+----------------------------------------------------------------------+
   | **Name**   | **Description**                                                      |
   +============+======================================================================+
   | Export\    | Overwrites all existing data when importing.                         |
   | evnrionment|                                                                      |
   +------------+----------------------------------------------------------------------+
   | Time\      | Inserts and overwrites data input after the specified time based on\ |
   | specified  | the unique items(ID, No, etc) from each menus when importing.        |
   +------------+----------------------------------------------------------------------+


.. table:: Deleted data list
   :align: left

   +-----------------------------+------------------------------------------------------------+
   | **Name**                    | **Description**                                            |
   +=============================+============================================================+
   | Include deleted information | Exports all data including data with the "deleted" status. |
   +-----------------------------+------------------------------------------------------------+
   | Exclude deleted information | Does not export data with the "deleted" status.            |
   +-----------------------------+------------------------------------------------------------+

| (2) Select which menus to export and press the 《Export》 button.

.. figure:: /images/ja/export_import/overview/menu_export_1.png
   :width: 1000px
   :alt: Export Menu page(1)
   :align: center

   Export Menu page(1)

.. note::
   | For first time exports and exports that contains menus that were newly created in the "Create Parameter sheet" function, make sure to include the following menus when exporting.
   | Not including them will cause an error when importing.
   | ・Menu management
   | ・Menu - Table link management
   | ・Menu - collumn link management
   | ・Role - Menu link management

| (3) A pop-up box for confirming the export will be displayed. Check the contents before pressing 《Start Export》.

.. figure:: /images/ja/export_import/overview/menu_export_2.png
   :width: 1000px
   :alt: Export Menu page(2)
   :align: center

   Export Menu page(2)

| (4) After selecting the menus. press the 《Export》 button.
| This will move the user to the Menu export/import management page where the user can check the status of the export process.

.. figure:: /images/ja/export_import/overview/menu_export_3.png
   :width: 1000px
   :alt: Menu export/import management page
   :align: center

   Menu export/import management page


.. _menu_import:

Import menu
------------------

| Imports the data from the menus exported in [Export menu].

| (1) Press the 《Select File》 button and select the desired file before pressing the 《Open》 button.

.. figure:: /images/ja/export_import/overview/menu_import_1.png
   :width: 1000px
   :alt: Import menu page(1)
   :align: center

   Import menu page(1)

.. figure:: /images/ja/export_import/overview/menu_import_2.png
   :width: 1000px
   :alt: Import menu page(2)
   :align: center

   Import menu page(2)

| (2) A list of menus from the imported file will be displayed. Select which menus to import and press the 《Import》 button.
| Menus that have their checkbox ticked will be imported.
| Make sure to untick the checkbox for menus that will be not imported.

.. figure:: /images/ja/export_import/overview/menu_import_3.png
   :width: 1000px
   :alt: Import menu page(3)
   :align: center

   Import menu page(3)

| (3) A pop-up box for confirming the import will be displayed. Check the contents before pressing 《Start Import》.

.. figure:: /images/ja/export_import/overview/menu_import_4.png
   :width: 1000px
   :alt: Import menu page(4)
   :align: center

   Import menu page(4)

| (4) The user will automatically be moved to the [Menu export/import management] page where they can check the status of the import process.

.. warning::
   | Performing an action right after the status of the import process displays "Executing" (Updating the page, moving to a different menu, etc.) might cause an system error  
   | depending on the timing in which the data is changed. It is therefore recommended that the user lets some time pass before performing an action.

.. figure:: /images/ja/export_import/overview/menu_import_5.png
   :width: 1000px
   :alt: Menu export/import management page
   :align: center

   Menu export/import management page

Menu export/import management page
------------------------------------

| This menu allows the users to manage the status of the exports and imports executed in the [Export Menu] and [Import Menu].

.. figure:: /images/ja/export_import/overview/menu_export_import_1.png
   :width: 1000px
   :alt: Menu export/import management page
   :align: center

   Menu export/import management page

.. table::  Item list（Menu export/import）
   :align: left

   +------------+--------------------------------------------------------------------------------------------------------------+
   | **Item**   | **Description**                                                                                              |
   +============+==============================================================================================================+
   | Execution\ | An Unique Id is automatically given.                                                                         |
   |  No.       |                                                                                                              |
   +------------+--------------------------------------------------------------------------------------------------------------+
   | Status     | | The status changes to the following in order. 〔Not executed〕, 〔Executing〕, 〔Complete〕.               |
   |            |                                                                                                              |
   |            | | If an error occurs, the status will display 〔Complete(Abnormal)〕                                         |
   |            |                                                                                                              |
   |            | | If the import status reaches 〔Complete(Abnormal)〕,\                                                      |
   |            | | the data status will return before it was imported with a rollback.                                        |
   +------------+--------------------------------------------------------------------------------------------------------------+
   | Process\   | | Export ・・・Export menu                                                                                   |
   |  type      | | Import ・・・Import menu                                                                                   |
   +------------+--------------------------------------------------------------------------------------------------------------+
   | Mode       | Displays either 〔Export environment〕 or 〔Time specified〕.                                                |
   +------------+--------------------------------------------------------------------------------------------------------------+
   | Deleted\   | Displays either 〔Include deleted data〕or〔Exclude deleted data〕.                                          |
   | information|                                                                                                              |
   +------------+--------------------------------------------------------------------------------------------------------------+
   | Time \     |                                                                                                              |
   |specified   | Displays only if the mode is〔Time specified〕.                                                              |
   +------------+--------------------------------------------------------------------------------------------------------------+
   | File name  | | For exports, this item will display the export data when the status hits 〔Completed〕.                    |
   |            | | Press the file name to download it.                                                                        |
   |            |                                                                                                              |
   |            | | For imports, the imported data will be displayed.                                                          |
   +------------+--------------------------------------------------------------------------------------------------------------+
   | Execution\ | | Displays the user which executed the export/import process.                                                |
   |  user      |                                                                                                              |
   +------------+--------------------------------------------------------------------------------------------------------------+
   | Language   | | Displays the display language of the login user when the import process was executed.                      |
   |            | | This item is automatically registered and cannot be edited.                                                |
   +------------+--------------------------------------------------------------------------------------------------------------+
   | Execution\ | | Displays the link to the log-file if the export/import process status displays 〔Complete(Abnormal)〕      |
   |  log       |                                                                                                              |
   |            |                                                                                                              |
   +------------+--------------------------------------------------------------------------------------------------------------+


.. note:: 
   | If the :menuselection:`Status` in the :menuselection:`Menu export/import management` menu displays "Complete (Abnormal)", the :menuselection:`Execution log` will display a link to the file.

   .. figure:: /images/ja/export_import/overview/menu_export_import_2_v2-4.drawio.png
      :width: 1000px
      :alt: Menu export/import management page: Complete (Abnormal)
      :align: center

      Menu export/import management page: Complete (Abnormal)

   .. code-block:: bash
     :caption: Example: Execution log when there is a problem with the KYM file composition.

     # import_9ceea0bd-b193-4245-b1e5-a2d3e93b8e49.log
     No corresponding files withing the KYM files. (T_COMN_MENU_TABLE_LINK_DATA)
