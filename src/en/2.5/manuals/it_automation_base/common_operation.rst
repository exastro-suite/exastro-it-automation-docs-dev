==============
Common operations
==============

Introduction
========

| This document aims to explain the common operations used when using IT Automation.

Overview
====

This section explains the shared parts found in ITA menus and how to use them.

Page description
========

| This section explains the common ITA menu pages.

Page structure
--------

| The menus found in ITA are for the most part composed by the same components.
| The composition components are as following.

.. figure:: /images/ja/diagram/画面構成_v2-3.png
   :alt: Page structure
   :align: center
   :width: 800px

   Page structure


.. list-table:: Page structure list
   :header-rows: 1
   :align: left

   * - No.
     - Page name
     - Description
   * - 1
     - Menu name
     - | Displays the name of the current menu.
       | Click :guilabel:`︙` to display the menu description.
   * - 2
     - Menu
     - | Displays menu groups that can be operated and/or viewed.
       | It will also display the menus that can be operated and/or viewed in the current menu group.
   * - 3
     - Submenu
     - | Subsection of a menu where the user can register and configure items to menus.
       | ※More information is written further down.
   * - 4
     - Workspace information
     - | Displays the current workspace and workspaces the current user has access to.
       | Clicking it will provide the user access to the following operations.
       |  ・Change workspace
       |  ・Move to the workspace list page
   * - 5
     - Login information
     - | Displays the name of the account curently being used.
       | Clicking it will provide the user access to the following operations.
       |  ・Check current roles
       |  ・Page settings
       |  ・Check the version of the ITA system and the different drivers.
       |  ・Log out



Common menu operations
==================

| This section explains how to operate the common menu components.
| For information regarding menu specific information, see the corresponding manual.

List tab
--------

| This tab allows users to register/update/discard and restore items and check registered items.

- | **Register**
  | Registers a new item to the menu.
  | The contents of the item changes depending on the menu. For more informatoin, see the corresponding manuals.
  | For bulk registration using Excel or JSON files, see \ ":ref:`management_console_download_all_and_edit_file_uploads`".\ 

  .. figure:: /images/ja/management_console/menu_group_list/menu_register.gif
     :alt: Main menu
     :width: 800px
     :align: center

  #. Clicking the \ :guilabel:`Register`\ in the upper part of the "list" tab moves the user to the Register/Edit page
  #. Input the required information and click the \ :guilabel:`Confirm edits`\ button to display the Confirm edited contents page.
  #. Click the \ :guilabel:`Confirm edits`\ button to update the item.

  .. note:: | **Registration button**

              - | \ :guilabel:`Add`\
                | Adds a new record for registering data.
                | Use when registering multiple items at once.
              - | \ :guilabel:`Duplicate`\
                | Duplicates records with their checkbox ticked.
                | For more information, see \ :ref:`Duplicate<duplicate>`.\ 
              - | \ :guilabel:`Delete`\
                | Deletes records with their checkbox ticked.

  .. note:: | **Pulldown menu items**
            | An input item for registering and updating. Items that can be selected from a pulldown selection have the following features.

            .. figure:: /images/ja/management_console/menu_group_list/プルダウンによる入力項目.gif
               :alt:  Input item from pulldown
               :align: center
               :width: 6in

            #. | Displays a search window.
               | Users can input words and phrases in order to narrow down the items.
               | When searching capitalized and non-capitalized letters as well as full width and half width letters will be searched as the same.
            #. | Displays selection items.

  .. tip:: | **File upload items**
            | An input item for registering and updating. File upload items have the following features.

            .. figure:: /images/ja/management_console/common_operation/fileupload_operation_edit.gif
               :alt:  File upload input item
               :align: center
               :width: 6in

            #. | :guilabel:`+` :Allows users to select a file and upload it.
            #. | :guilabel:`` :Can create and edit text files.
               | When in an editable state, the following becomes available.
               | ・:guilabel:`Update` :Saves the edited contents in the file (It will not be saved to the record).
               | ・:guilabel:`Download` :Downloads the edited file.
            #. | :guilabel:`` :Allows users to delete the file.
               | :guilabel:`` After pressed and after :menuselection:`Confirm edits --> Confirm edits`, the item will also be deleted from the record.
            #. | The user can configure prohibited file types by changing the "FORBIDDEN_UPLOAD" value in  in "Management console - :ref:`system_setting`".

               .. warning::
                  Do note that allowing more file types that can be uploaded might open up security holes.


- | **Display filter**
  | Specifies search conditions used to display items registered in the menu.
  | Search conditions and search items differ depending on the menu. This section only explains the common functions.
  | Clicking the :guilabel:`Filter|Open/Close` button within the "List" tab hides or displays the menu.

  .. figure:: /images/ja/management_console/menu_group_list/表示フィルタ画面.gif
     :alt: Display filter page
     :align: center
     :width: 800px

  #. | Discard column
     | "Do not include deleted data" is set to it by default.
     | The user can change to "All records" and "Deleted data only" to display their desired records.
     | **One of them must be selected.**
  #. | Search conditions
     | Specifies conditions that will be used when searching.
     | ・In order to specify conditions for multiple items, search with an "AND" condition.
     | ・The user can filter with either "fuzzy search" or "pulldown search" when searching with string specification.
     | ・When filtering with "fuzzy search" and "pulldown search" for the same item, it will search with an "OR" condition.
     | ・Searching for file uploads will only search for the file name.
     | ・For items that can have Integer, float、Date、Date/time input to them, the user can filter with "Above", "Below" and "Within".
  #. | Auto filter
     | Ticking the Auto-filter checkbox automaticall displays a list that fits the selected filter conditions.
     | The user can set the wether to tick or untick the checkbox in the Management console "Menu management"'s Auto filter check.
  #. | Column description (Description)
     | Hovering the cursor over the item displays a popup window containing a description for the corresponding item.
  #. | Filter
     | Select search conditions from pulldown menu or manual input and press the Enter key or click the \ :guilabel:`Filter`\  button to display registered information.
  #. | Excel download
     | Allows users to download all files that meets the search conditions in an Excel format.
  #. | JSON download
     | Allows users to download all files that meets the search conditions in an JSON format.

  .. note::
            | Downloaded excel type and JSON files types from the display filter can be used in "\ :ref:`management_console_download_all_and_edit_file_uploads`\".

  .. tip:: | **File upload items**
            | Items that can have files uploaded to them in the list have the following functions.

            .. figure:: /images/ja/management_console/common_operation/fileupload_operation_filter.gif
               :alt:  File upload input item (List)
               :align: center
               :width: 6in

            #. | File name :Allows users to download the file by clicking the file name link.
            #. | :guilabel:`` :Displays textfile as a preview.
               | When in Preview mode, the following will be available.
               | ・:guilabel:`Download` :Downloads the file.

- | **Edit**
  | Update registered items.
  | The edit contents differs depending on the menu. For more information, see the corresponding manuals.

  .. figure:: /images/ja/management_console/menu_group_list/menu_update.gif
     :alt: Edit operations
     :align: center
     :width: 800px

  #. | Click the target item's \ :guilabel:`…`\  > \ :guilabel:`Edit`\ button to move to the Register/Edit page.
     | The user can also tick the target item's checkbox and click the \ :guilabel:`Edit`\ button in the upper part of the "List" tab.
     | Clicking the \ :guilabel:`Edit`\ button without ticking any checkbox will display and allow the user to edit all items.
  #. | Input the new information and click the \ :guilabel:`Edit`\ button in the upper part of the "List" tab to display the Edit confirmation page.
  #. | Click the \ :guilabel:`Confirm edit`\ to update the target.

  .. note:: | **Buttons when editing**

              - | \ :guilabel:`Add`\
                | Adds a new record for registering data.
                | Use when registering multiple items at once.
              - | \ :guilabel:`Duplicate`\
                | Duplicates records with their checkbox ticked.
                | For more information, see \ :ref:`Duplicate<duplicate>`.\ 
              - | \ :guilabel:`Delete`\
                | Deletes records with their checkbox ticked.
              - | \ :guilabel:`Discard`\
                | Changes the Discard flag to "True" for checked records.
                | The item will be discarded after being updated.

.. _Duplicate:

- | **Duplicate**
  | Users can reuse registered item to register new ones.

  #. | Click the target item's \ :guilabel:`…`\  > \ :guilabel:`Duplicate`\ button to move to the register/edit page.
     | The user can also tick the target item's checkbox and click the \ :guilabel:`Edit`\ button in the upper part of the "List" tab.
     | After having moved to the Register/edit page, click the \ :guilabel:`Duplicate`\ button.
  #. | Displays a registration records that contains the item values of the target item.

  .. figure:: /images/ja/management_console/menu_group_list/menu_copy.gif
     :alt: Edit operations
     :align: center
     :width: 800px

  .. warning:: - | The item will not be duplicated if the target item is a Password item.


- | **Table settings**
  | Users can change the table settings.
  | The settings are saved on the server, meaning that the changed settings will be displayed even if the user is acecssing from a different environment, browser or even device.

  - | Shared settings: Settings that applies to the shared submenu parts in all menus.
  - | Individual settings: Setting that applies to only the configured menu. If the items have "Shared settings" selected, the selected items in the shared settings will be applied.

.. figure:: /images/ja/management_console/common_operation/table_setting_individual.png
   :alt: Table_settings_Individual_settings
   :width: 300px
   :align: center

   Table_settings_Individual_settings

.. figure:: /images/ja/management_console/common_operation/table_setting_common.png
   :alt: Table_settings_Shared_settings
   :width: 300px
   :align: center

   Table_settings_Shared_settings

.. list-table:: Table settings:Individual settings
   :header-rows: 1
   :align: left

   * - | Item
     - | Description
     - | Setting value
     - | Remarks
   * - | Item display direction
     - | Configure the item display direction.
     - | Select one of the following.
       | ・Common settings
       | ・Vertical
       | ・Horizontal
     - |
   * - | Filter display position
     - | Configure the filter's display position.
       | If the item display direction is set to vertical, it will be set to Outside.
     - | Select one of the following.
       | ・Common settings
       | ・Inside
       | ・Outside
     - |
   * - | Item menu display
     - | Configure the item menu's display method.
     - | Select one of the following.
       | ・Common settings
       | ・Shortened
       | ・Display
     - |
   * - | Display/Hide item
     - | Configure whether to hide or display items.
     - | Select the target item.
     - |


.. list-table:: Table settings:Shared settings
   :header-rows: 1
   :align: left

   * - | Item
     - | Description
     - | Setting value
     - | Remarks
   * - | Item display direction
     - | Configure the item display direction.
     - | Select one of the following.
       | ・Vertical
       | ・Horizontal
     - |
   * - | Filter display position
     - | Confiure the filter's display position.
       | If the item display direction is set to vertical, it will be set to Outside.
     - | Select one of the following.
       | ・Inside
       | ・Outside
     - |
   * - | Item menu display
     - | Configure the item menu display method.
     - | Select one of the following.
       | ・Shortened
       | ・Display
     - |

.. note:: | **Display from item settings**
          | Users can change the item display direction: display direction.

          .. figure:: /images/ja/management_console/common_operation/filter_vertical.png
              :alt: Menu group(Item display direction:Vertical)
              :width: 300px
              :align: center

              Menu group( item display direction:Vertical)

          .. figure:: /images/ja/management_console/common_operation/filter_horizontal.png
              :alt: Menu group(Item display direction:Horizontal)
              :width: 300px
              :align: center

              Menu group(Item display direction:Horizontal)

          | Users can change the filter display position: display position.

          .. figure:: /images/ja/management_console/common_operation/filter_vertical.png
              :alt: Menu group(Filter display position:Inside)
              :width: 300px
              :align: center

              Menu group(Filter display position:Inside)

          .. figure:: /images/ja/management_console/common_operation/filter_vertical_outside.png
              :alt: Menu group(Filter display position:Outside)
              :width: 300px
              :align: center

              Menu group(Filter display position:Outside)

          | When "Item menu display:Shortened" is selected, the user can select the record's :guilabel:``  to display the item menu. 

          .. figure:: /images/ja/management_console/common_operation/filter_vertical_omit.png
              :alt: Menu group(Item menu display:shortened)
              :width: 300px
              :align: center

              Menu group(Item menu display:shortened)

          .. figure:: /images/ja/management_console/common_operation/filter_vertical_show.png
              :alt: Menu group(Item menu display:Display)
              :width: 300px
              :align: center

              Menu group(Item menu display:Display)

Change history tab
------------
| In the different menus, the user can display the change history of registered items.

- | **Checking change history**

  #. | By specifying the menu's main key, the user can display the change history for items that supports it.
     | They can also click the \ :guilabel:`…`\  > \ :guilabel:`History`\  button in the "list" tab of the target item to see the change history.
  #. | The change history is sorted by new-old, and changes that has happened since last time will be colored in orange letters.

  .. figure:: /images/ja/management_console/menu_group_list/変更履歴操作.gif
     :alt: Change history operation
     :width: 800px
     :align: center

- | **Change history for pulldown selections**
  | If the "Pulldown selection" reference source has been changed, the reference value will also be automatically changed.
  | "Change history" displays the value when the value has been edited (registered/updated/discarded/restored).
  | The following uses examples to explain.

  | Example: Parameter sheet "Param001"'s item "ParamB) references "Master001"'s "Master" item.

  #. | This example assumes that the following parameter sheet and data sheet has been created in the "Parameter sheet creation" menu group> "Define/Create parameter sheets" menu.

     - | Data sheet "Master001"

       .. figure:: /images/ja/menu_creation/menu_definition_and_create/データシート「マスタ001」.png
          :alt: Data sheet created in the "Define/Create parameter sheet" menu
          :align: center
          :width: 6in

          「Data sheet created in the "Define/Create parameter sheet" menu

     - | Parameter sheet "Param001"

       .. figure:: /images/ja/management_console/menu_group_list/パラメータシート「ぱらむ001」.png
          :alt:  Parameter sheet created in the "Define/Create parameter sheet" menu
          :align: center
          :width: 6in

           Parameter sheet created in the "Define/Create parameter sheet" menu

  #. | In the Input menu group>Master001 menu, register the value "mas1-1" to the "Master" parameter.
  #. | In the Input menu group>Param001 menu, register 1 item.
  #. | In the Input menu group>Master001 menu, edit the "Master" parameter's value to "mas1-2".
  #. | In the Input menu group>Master001 menu, edit the "Master" parameter's value to "mas1-3".
  #. | In the Input menu group>Param001 menu, edit the earlier registered target, "ParamA", and update.

     .. figure:: /images/ja/management_console/menu_group_list/プルダウン選択を含んだ変更履歴の操作.gif
        :alt: Change history with pulldown selections
        :align: center
        :width: 800px

  #. | In the Input menu group>Master001 menu, edit the "Master" parameter's value to "mas1-4".
  #. | In the Input menu group>Master001 menu, edit the "Master" parameter's value to "mas1-5".
  #. | In the Input menu group>Param001 menu, edit the earlier registered target, "ParamA", and update.

  #. | The following images depicts what results will be output.

  .. figure:: /images/ja/management_console/menu_group_list/マスタ001変更履歴.png
     :alt:  Data sheet "Master001" change history
     :align: center
     :width: 5in

     Data sheet "Master001" change history

  .. figure:: /images/ja/management_console/menu_group_list/ぱらむ001変更履歴.png
     :alt:  Parameter sheet "Param001" change history
     :align: center
     :width: 5in

     Parameter sheet "Param001" change history

.. _management_console_download_all_and_edit_file_uploads:

Download all items/ File bulk registration
----------------------------------
| Users can download all information registered to the menu page at once as an Excel file or an JSON file.
| They can also use the same file format to register information in bulks.

.. tabs::

   .. tab:: Excel

      .. figure:: /images/ja//management_console/menu_group_list/file_all_register.gif
         :alt: File bulk registration(Excel)
         :align: center
         :width: 800px

      #. | Downloads the files that are currently visible.

         - | In order to register/discard/restore registered information, click the \ :guilabel:`Download all items(Excel)`\ and download the file.
         - | In order to register new items, click the \ :guilabel:`Download file for new registrations(Excel)`\  and download the file.
      #. | Edit the downloaded file and save.
         | The edit contents differs depending on the menu. See the corresponding manuals for more information.
      #. | Click the \ :guilabel:`File bulk registration`\ button for the right format, select the target file and click the  \ :guilabel:`Start bulk registration`\ button.

      .. warning:: |  It is not possible to do bulk registration with the file downloaded by pressing the \ :guilabel:`Download all items change history(Excel)`\.
         | If the "Execute process type" is not selected or if the correct execution proccessing type is not selected, the item will not be registered.

   .. tab:: JSON

      .. figure:: /images/ja//management_console/menu_group_list/json_register.gif
         :alt: File bulk registration(JSON)
         :align: center
         :width: 800px

      #. |  Downloads the files that are currently visible.

         - | In order to register/discard/restore registered information, click the \ :guilabel:`Download all items(JSON)`\ and download the file.
         - | In order to register new items, click the \ :guilabel:`Download all items(JSON)`\  and download the file.
      #. | Edit the downloaded file and save.
         | The edit contents differs depending on the menu. See the corresponding manuals for more information.
      #. | Click the \ :guilabel:`File bulk registration`\ button for the right format, select the target file and click the  \ :guilabel:`Start bulk registration`\ button.
