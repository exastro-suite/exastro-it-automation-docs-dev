==========================================
Excel bulk export/import
==========================================

Introduction
========

| This document aims to explain ITA's Excel bulk export/import function.

Excel bulk export/import overview
=======================================

| This section aims to explain the Excel bulk export/import overview.

Excel bulk export/import
---------------------------------

Functions
^^^^^^^^^^^^

| The Bulk export/import function compiles all the different menus' downloadable excel files into one ZIP file. For more information regarding downloadable files, see "\ :ref:`Management console<management_console_download_all_and_edit_file_uploads>`\".
| Only menus where the "link" item in the :menuselection:`Role/Menu link management` is set to "View only" or "Edit" and contains editable Excel files can be exported.
| Only menus where the "link" item in the :menuselection:`Role/Menu link management` is set to "Edit" and contains editable Excel files can be imported.

Excel bulk export/import menu page
=====================================================

| This section aims to explain the Excel bulk export/import menu page.

Menu list
-------------

| The Excel bulk export/import menus are as following.

.. list-table:: ITA menu list
   :header-rows: 1
   :align: left

   * - No
     - Menu/Page
     - Description
   * - 1
     - Excel bulk export
     - Compiles all the different menus' downloadable excel files into one ZIP file and exports it.
   * - 2
     - Excel bulk import
     - Imports ZIP files containing downloadable files.
   * - 3
     - Excel bulk export/import management.
     - Manages export processes executed in the :menuselection:`Excel bulk export` menu and import processes executed in the  :menuselection:`Excel bulk import` menu.

Functions/Operation
==================

Menu bulk export
---------------------

| The menu bulk export allows users to compile downloadable Excel files from the different menus into one zip files before exporting it.

| (1) Select whether to export deleted data or not.
| The Deleted data list is as following.

.. list-table:: Deleted information list
   :header-rows: 1
   :align: left

   * - Name
     - Description
   * - All records
     - Exports all data.
   * - Exclude deleted data
     - Exports all data excluding data with the "deleted" status.
   * - Only deleted data
     - Exports only deleted data.

| (2) Select which menus to export.
| Only menus where the "link" item in the :menuselection:`Role/Menu link management` is set to "View only" or "Edit" and contains editable Excel files can be exported.

.. figure:: /images/ja/export_import/excel_export_menu_list.png
   :width: 800px
   :alt: Excel bulk export menu list
   :align: center

   Excel bulk export page

| (3) After selecting the menus. press the 《Export》 button.
| Doing so will display the Execution No. for the Export process. Use it to check the process status in the :menuselection:`Excel bulk export/import management` menu.

.. figure:: /images/ja/export_import/excel_export_execute.gif
   :width: 800px
   :alt: Excel bulk export  Export execution
   :align: center

   Excel bulk export page(2)

| (4) The contents of the exported files are as following.

.. code-block::
   :name: Export file composition

   ITA_FILES_YYYYMMDDhhmmss.zip …①                                     
   ├─ MENU_LIST.txt …②
   └─ 101_Management console …③
       └─ SystemSettings_20210708235959.xlsx …④
  
.. list-table:: Export file composition
   :header-rows: 1
   :align: left

   * - No
     - Name
     - Extension
     - Description
   * - 1
     - File name
     - File
     - The file name is generated in the following format: "ITA_FILES_YYYYMMDDhhmmss.zip".
   * - 2
     - MENU_LIST.txt
     - txt
     - Outputs a list of exported menu's REST and file names.
   * - 3
     - Menu group folder
     - Folder
     - | Each menu group has a folder generated.
       | The folder name is generated in the following format: "MenugroupID_MenugroupName".
       | If the folder name is larger than 200 characters, only the first 200 characters will be output.
   * - 4
     - Download file
     - xlsx
     - | Is output as an Excel file.
       | Deployed under the affiliated menu group folder.


Excel bulk import
-------------------

|  Allows users edit and import the data from the menus exported in :menuselection:`Excel bulk export`.

1. Edit Zip file

   #. | Create list of file that will be imported.
      | By editing the MENU_LIST.txt file in the zip file exported from the  :menuselection:`Excel bulk export` menu, the user can edit the list of files that will be imported.
      | MENU_LIST.txt contains the REST and File name of the menus from when they were exported.
      | Lines that starts with "#" can be used for commenting.
      | The format is as following.
      | MenuRESTName:FileName

      .. code-block::
         :name: MENU_LIST.txt

         #Management console
         system_settings:Systemsettings_20230425162004.xlsx                                     
         #Basic colsone
         operation_list:Operationlist_20230425162005.xlsx

      | ※The importing menus can be also be selected in the :menuselection:`Excel bulk import` menu.

   #. Edit the Import file.

   #. |  Compress the edited file into a zip file.
      | The required files for importing are as the following.
      | ・MENU_LIST.txt
      | ・The file that will be imported

   #. | The contents of the import file is as following.

      .. code-block::
         :name: Import file structure

         ITA_FILES_YYYYMMDDhhmmss.zip …①                                     
         ├─ MENU_LIST.txt …②
         └─ 101_Managementconsole …③
             └─ Systemsettings_20210708235959.xlsx …④

      .. list-table:: Import file structure
         :align: left

         * - No
           - Name
           - Extension
           - Description
         * - 1
           - File name
           - File
           - File names are optional.
         * - 2
           - MENU_LIST.txt
           - txt
           - Contains the imported menus' REST and file name.
         * - 3
           - Menu group folder
           - Folder
           - | Each menu group has a folder generated.
             | The folder names are as following "Menu group ID_Menu group name"
         * - 4
           - Excel file for editing
           - xlsx
           - The Excel file for editing is set under the menu group folder.

2. Import process

   #. | Press the 《Select File》 button and upload the zip file.

      .. figure:: /images/ja/export_import/excel_upload_execute.gif
         :width: 800px
         :alt: Excel bulk import Execute upload
         :align: center

         Excel bulk import page(1)

   #. | A list of menus from the imported file will be displayed. Select which menus to import and press the 《Import》 button.
      | Menus that have their checkbox ticked will be imported.
      | Make sure to untick the checkbox for menus that will be not imported.
      | Starting the process will display the Execution No. for the Import process. Use it to check the process status in the :menuselection:`Excel bulk export/import management` menu.

      .. figure:: /images/ja/export_import/excel_import_menu_list.png
         :width: 800px
         :alt: Excel bulk import menu list
         :align: center

         Excel bulk import page(2)

      | If one of the following rules are met, and error will occur and the checkbox will not be usable.
      | １．The MENU_LIST.txt specifies more than 2 menus with the same REST name
      | ２．The MENU_LIST.txt specifies more than 2 menus with the same File name
      | ３．The MENU_LIST.txt contains descriptions that does not meet the format requirements
      | ４．The MENU_LIST.txt contains REST names for non-existant menus
      | ５．The MENU_LIST.txt specifies files that does not exist within the imported zip file
      | ６．There are 2 or more files with the same name in a different folder
      | ７．The MENU_LIST.txt isnt included
      | ８．The menu group folder name does not match "MenuGroupID_MenuGroupName"
      | ９．The operating user does not have "edit" permission for the target menu

Excel bulk export/import management
-------------------------------------

| This menu manages the status of Export processes executed in the :menuselection:`Excel bulk export` menu and Import processes executed in the  :menuselection:`Excel bulk import` menu.

.. figure:: /images/ja/export_import/excel_export_import_list.png
   :width: 800px
   :alt: Excel bulk export/import management
   :align: center

   Excel bulk export/import management page

.. list-table:: Item list（Menu export/import）
   :header-rows: 1
   :align: left

   * - Item
     - Description
   * - Execution No.
     - An Unique Id is automatically given.
   * - Status
     - | The status changes to the following in order. 〔Not executed〕, 〔Executing〕, 〔Complete〕.  
       | If an error occurs, the status will display 〔Complete(Abnormal)〕.      
   * - Process type
     - | Export ・・・Export menu
       | Import ・・・Import menu 
   * - Deleted information
     - Displays〔All records〕, 〔Exclude deleted data〕 or 〔Only deleted data〕.
   * - Execution user
     - Displays the user which executed the export/import process.
   * - File name
     - | For exports, this item will display the export data when the status hits 〔Completed〕.
       | Press the file name to download it. 
       | For imports, the imported data will be displayed. 
   * - Language
     - | Displays the display language of the login user when the import process was executed.
       | The exported file is displayed in said language. 
   * - Results
     - | Displays a text file containing the imported results
       | Feel free to download and use it

| The following is an excerpt from the result files.
| Results are output per imported file.

.. code-block::

   101_Managementconsole:10101_SystemSettings
   Input file:SystemSettings_20230425155441.xlsx

   Register: 0 items
   Update: 2 items
   Delete: 1 items
   Restore: 1 items
   Error: 0 items

   202_Ansible-Legacy:20201_Movementlist
   Input file:Movementlist_20230425155442.xlsx

   Register: 0 items
   Update: 0 items
   Delete: 0 items
   Restore: 0 items
   Error: 1 items
   movement_name: ['This is an required item.:(line 12)']

   202_Ansible-Legacy:20202_Playbookfilecollection
   Input file:Playbookfilecolletion_20230425155443.xlsx
   This is not the Excel file for editing for this menu.
