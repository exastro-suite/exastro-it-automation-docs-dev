==============
Management console
==============

Introduction
========

| This document aims to explains the ITA system's management console and how to operate it.

Overview
====

| In the Management console, If the information for non-default menu parts are managed on the ITA database, users can create individual menus fitting the management level.
| We recommend that the user contacts the product support when registering/updating or deleting individual menus.

.. table:: Web contents menu list
   :align: left

   +----------+------------------------+------------------------------+
   | **No.**  | **Menu group**         |  **Menu**                    |
   |          |                        |                              |
   +==========+========================+==============================+
   | 1        | Management console     | Main menu                    |
   +----------+                        +------------------------------+
   | 2        |                        | System settings              |
   +----------+                        +------------------------------+
   | 3        |                        | Menu group management        |
   +----------+                        +------------------------------+
   | 4        |                        | Menu management              |
   +----------+                        +------------------------------+
   | 5        |                        | Role/Menu link management    |
   +----------+                        +------------------------------+
   | 6        |                        | Operation deletion management|
   +----------+                        +------------------------------+
   | 7        |                        | File deletion management     |
   +----------+------------------------+------------------------------+


Page description
========

| This section explains the Management console page.

Accessing the Management console.
------------------------------

| The user is moved to the ITA main menu when they log in to the system successfully.
| From the Main menu dash board, the user can select the Management console to move to the Management console menu group.
| While in the Management console menu group, the user can access the different menus within the menu group.

.. figure:: /images/ja/management_console/menu_group_list/MainMenu.gif
   :alt: Main menu
   :width: 800px
   :align: center

.. _menu_unique_operation:

Menu unique information
==================

| This section explains menus and their unique information.

.. _system_setting:

System settings
------------

| This menu allows users to update information used when using ITA.

.. table:: System settings
   :align: Left

   +---------+--------------------+-----------------------------------------+
   | **No.** | **Item name**      | **Description**                         |
   +=========+====================+=========================================+
   | 1       | ID                 | ID for system settings.                 |
   +---------+--------------------+-----------------------------------------+
   | 2       | Item name          | Names of items in the System settings.  |
   +---------+--------------------+-----------------------------------------+
   | 3       | Setting value      | System setting values.                  |
   +---------+--------------------+-----------------------------------------+
   | 4       | Remarks            | Contains a description for the items.   |
   +---------+--------------------+-----------------------------------------+

.. danger::
   | Do not change the ID. Doing so might cause ITA to not function properly.


Menu group management
--------------------

| Menus (child) belongs to Menu groups (parent). This menu allows users to register/update and discard menu groups(parent).

.. table:: Menu group management
   :align: Left

   +---------+--------------------+---------------------------------------------------------+
   | **No.** | **Item name**      | **Description**                                         |
   +=========+====================+=========================================================+
   | 1       | Menu group ID      | ID for the menu group.                                  |
   +---------+--------------------+---------------------------------------------------------+
   | 2       | Parent menu group  | Configures the parent menu group.                       |
   +---------+--------------------+---------------------------------------------------------+
   | 3       | Menu group name(ja)| Configures the name of the menu group (Japanese).       |
   +---------+--------------------+---------------------------------------------------------+
   | 4       | Menu group name(en)| Configures the name of the menu group (English).        |
   +---------+--------------------+---------------------------------------------------------+
   | 5       | Panel image        | Configures the panel image for the menu group.\         |
   +---------+--------------------+---------------------------------------------------------+
   | 6       | Flag for parameter\| A flag that allows users to select whether the menu gr\ |
   |         |  sheet creation    | oup can be used as a "Target menu group" in the Paramet\|
   |         |                    | er sheet creation function.                             |
   +---------+--------------------+---------------------------------------------------------+
   | 7       | Display order      | Configures the display order of the menu group in the d\|
   |         |                    | ash board.                                              |
   +---------+--------------------+---------------------------------------------------------+
   | 8       | Remarks            | Free description field.                                 |
   +---------+--------------------+---------------------------------------------------------+

.. warning::
   - | This menu is mainly used to update data. Make sure to be logged in as the System admin in order to get access to everything.
   - | Menu group names must be \ **unique**\ and cannot overlap with other menu groups.
   - | The menu groups are displayed in the main menu in the order of the "Display order" (rising). If there are multiple menus with the same display order, the "menu group ID" will be used.
   - | \ **Only PNG files**\ can be used as menu group panel images.

.. note::
   | The "Remarks" field is optional.

.. _menu_list:

Menu management
------------

| This menu allows users to register/update/discard menus.

.. table:: Menu management
   :align: Left

   +---------+--------------------+---------------------------------------------------------+
   | **No.** | **Item name**      | **Description**                                         |
   +=========+====================+=========================================================+
   | 1       | Menu ID            | ID of the menu.                                         |
   +---------+--------------------+---------------------------------------------------------+
   | 2       | Menu group         | Configure the parent menu group.                        |
   +---------+--------------------+---------------------------------------------------------+
   | 3       | Menu name(ja)      | Configure the name of the menu (Japanese).              |
   +---------+--------------------+---------------------------------------------------------+
   | 4       | Menu name(ja)      | Configure the name of the menu (English).               |
   +---------+--------------------+---------------------------------------------------------+
   | 5       | Menu name(rest)    | Configure the name of the menu (REST).                  |
   +---------+--------------------+---------------------------------------------------------+
   | 6       | Display order in m\| Configure the order in which the menu will be displayed\|
   |         | enu group          |  in the menu group.                                     |
   +---------+--------------------+---------------------------------------------------------+
   | 7       | Auto filter check\ | Configure whether to automatically tick the "Auto filte\|
   |         |                    | r" checkbox when display the menu.                      |
   +---------+--------------------+---------------------------------------------------------+
   | 8       | First time filter  | Configure wheter to display the menu in a state where t\|
   |         |                    | he "Filter" button is clicked.                          |
   +---------+--------------------+---------------------------------------------------------+
   | 9       | Original menu files| Register ZIP file to display original menus.            |
   |         |                    |                                                         |
   +---------+--------------------+---------------------------------------------------------+
   | 10      | Web display maxim\ | Configure the maximum amount of lines that will be disp\|
   |         | um lines           | layed in the "List".                                    |
   +---------+--------------------+---------------------------------------------------------+
   | 11      | Web display pre-co\| Configure the max amount of lines that will be displaye\|
   |         | nfirmation maximu\ | d lines the confirmation pop-up window can contain bef\ |
   |         | m lines.           | ore outputting the "List".                              |
   +---------+--------------------+---------------------------------------------------------+
   | 12      | Excel output maxim\| Configure the maximum amount of lines output to the Exc\|
   |         | um lines.          | el files.                                               |
   +---------+--------------------+---------------------------------------------------------+
   | 13      | Sort key           | Configure what order the items in the "List" will be d\ |
   |         | m lines.           | isplayed in.                                            |
   +---------+--------------------+---------------------------------------------------------+

.. warning::
   - | Menu names must be \ **unique**\.
   - | The sort key must be written and configured in JSON format.

.. note::
   - | The Excel output maximum lines can range from 0 to 1048576.
   - | For the sort key, enter ASC/DESC for the item name and the key column name for the value. Example: {"ASC": "display_order"}
   - | The "Remarks" field is optional.

| The "Web display maximum lines" and "Web display pre-confirmation maximum lines" works as following.

.. figure:: /images/ja/diagram/Web表示最大行数の処理概要.png
   :alt:  Web display maximum lines overview
   :align: center
   :width: 6in

   Web display maximum lines overview

| If the "Menu item list" or the "Menu item list total history number" exceeds the "Excel output maximum lines" and the user is downloading the data by pressing the "Download all files" or "File bulk register", the file download will stop midway. 
| For those cases, the user can download the file in a JSON format.
| The "Download all items" button is maibnly used for viewing purposes. This file cannot be uploaded.

"Original menu file" function overview
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| These files are used to directly register menus from the :menuselection:`Menu management` menu.
| They can not be used if they are registered to existing menus or menus created using the Parameter sheet creation function.
| Compress the HTML, Javascrip and CSS files into a ZIP file and register it.
| The main HTML file must be called "main.html".
| The file name within "main.html" can be whatever the user wants.
| All the files within the ZIP file must be directly put directly under the folder.
| If a new menu is created without registering any "Original menu file", said menu will not display anything.
| The user will also have to give themselves permission to view the menu they have created. After registering the file, access the :menuselection:`Role/Menu link management` menu and give themselves either "View" or "Edit" permission to their desired menu.

See :ref:`custom_menu_sample` for file samples and information on how to use them.

Role/Menu link management
------------------------

| This menu allows users to register/update/discard permissions between roles and menus.

| The roles registered in the Exastro Platform's "Role management" and the menus registered in :ref:`menu_list` is displayed in a list box, so select all of them (1 and 2 in the figure below) and the link type (3 in the figure below).

.. figure:: /images/ja/management_console/role_menu_link_list/ロール・メニュー紐付管理_設定画面.png
   :alt:  Group menu permission configuration page (Role/Menu link management)
   :align: center
   :width: 5in

.. warning::
   | Menus that are not linked with the user's role will not be displayed in the menu group.

.. table:: Role/Menu link management
   :align: Left

   +---------+--------------------+--------------------------------------------+
   | **No.** | **Item name**      | **Description**                            |
   +=========+====================+============================================+
   | 1       | UUID               | Role/Menu link management ID               |
   +---------+--------------------+--------------------------------------------+
   | 2       | Role               | Manage roles that are linked.              |
   +---------+--------------------+--------------------------------------------+
   | 3       | Menu               | Manages menus that are linked.             |
   +---------+--------------------+--------------------------------------------+
   | 4       | Link               | Configure whether to make menus editable o\|
   |         |                    | r visible depending on the role.           |
   +---------+--------------------+--------------------------------------------+
   | 5       | Remarks            | Free description field.                    |
   +---------+--------------------+--------------------------------------------+

.. note::
   | The "Remarks" field is optional.


Operation deletion management
----------------------

For more information, see ":doc:`../maintenance/operation_autoclean`".

File deletion management
----------------

For more information, see ":doc:`../maintenance/file_autoclean`".

Appendix
====

.. _custom_menu_sample:

Using original menus
--------------------

Guide
^^^^^^^^

| (1) In the :menuselection:`Menu management` menu, register "Original menu files" and create a new menu.
| See :ref:`sample_file` for sample files.

.. figure:: /images/ja/management_console/custom_menu/sample1_menu_regist.png
   :alt: Register new menu
   :width: 800px
   :align: center
   
   Register new menu
   
| (2) Go to the :menuselection:`Role/Menu link management` menu and give either "View" or "Edit" permissions to the users.

.. figure:: /images/ja/management_console/custom_menu/sample1_role_regist.png
   :alt: Role/Menu link management registration
   :width: 800px
   :align: center
   
   Role/Menu link management registration

| (3) The registered menu is displayed.

.. _sample_file:

Original menu file samples
^^^^^^^^^^^^^^^^^^^^^^^^^^

| Sample①
| Press the first picture and the :guilabel:`Hello` button, and an alert saying "Hello" will display.
| :download:`Sample①file <../../files/sample.zip>`

.. figure:: /images/ja/management_console/custom_menu/sample_menu1.png
   :alt: Sample①
   :width: 800px
   :align: center
   
   Sample①

| Sample②
| A menu similar to other ITA menus will be displayed.
| :download:`Sample②file <../../files/sample2.zip>`

.. figure:: /images/ja/management_console/custom_menu/sample_menu2.png
   :alt: Sample②
   :width: 800px
   :align: center
   
   Sample②

| Sample③
| Creating a menu without registering a file.

.. figure:: /images/ja/management_console/custom_menu/sample_menu3.png
   :alt: Sample③
   :width: 800px
   :align: center
   
   Sample③