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

JavaScript library information
-------------------------

The JavaScript libraries used by ITA are as following.

jQuery
^^^^^^
Library that allows JavaScript codes to be written easier.

+---------------+-----------------------------------+
| URL           | https://jquery.com/               | 
+---------------+-----------------------------------+
| GitHub        | https://github.com/jquery/jquery  | 
+---------------+-----------------------------------+
| License       | MIT license                       | 
+---------------+-----------------------------------+
| Version       | 3.5.1                             | 
+---------------+-----------------------------------+

.. code-block::

 <script src="/_/ita/lib/jquery/jquery.js"></script>

select2
^^^^^^^
Library that makes selection boxes easier to use .jQuery must be loaded seperately.

+---------------+-----------------------------------+
| URL           | https://select2.org/              | 
+---------------+-----------------------------------+
| GitHub        | https://github.com/jquery/jquery  | 
+---------------+-----------------------------------+
| License       | MIT license                       | 
+---------------+-----------------------------------+
| Version       | 4.0.13                            | 
+---------------+-----------------------------------+

.. code-block::

 <script defer src="/_/ita/lib/select2/select2.min.js"></script>
 <link rel="stylesheet" href="/_/ita/lib/select2/select2.min.css">

Ace
^^^
High-functionality text editor for Web.

+---------------+----------------------------------------+
| URL           | https://ace.c9.io/                     | 
+---------------+----------------------------------------+
| GitHub        | https://github.com/ajaxorg/ace-builds/ | 
+---------------+----------------------------------------+
| License       | BSD license                            | 
+---------------+----------------------------------------+
| Version       | v1.5.0                                 | 
+---------------+----------------------------------------+
| モード        | json,python,terraform,text,yaml        | 
+---------------+----------------------------------------+
| テーマ        | chrome,monokai                         | 
+---------------+----------------------------------------+

.. code-block::

 <script defer src="/_/ita/lib/ace/ace.js"></script>

ExcelJS
^^^^^^^
Reads and operates spreadsheet data and styles. Also writes spreadsheets to either XLSX and JSON.

+---------------+----------------------------------------+
| GitHub        | https://github.com/exceljs/exceljs     | 
+---------------+----------------------------------------+
| License       | MIT license                            | 
+---------------+----------------------------------------+
| Version       | 4.3.0                                  | 
+---------------+----------------------------------------+

.. code-block:: 

 <script src="/_/ita/lib/exceljs/exceljs.js"></script>

diff2html
^^^^^^^^^
Generates HTML differences from git diff or unified diff.

+---------------+----------------------------------------+
| URL           | https://diff2html.xyz/                 | 
+---------------+----------------------------------------+
| GitHub        | https://github.com/rtfpessoa/diff2html | 
+---------------+----------------------------------------+
| License       | MIT license                            | 
+---------------+----------------------------------------+
| Version       | v2.11.3                                | 
+---------------+----------------------------------------+
.. code-block::

 <script src="/_/ita/lib/diff2html/diff2html.min.js"></script>
 <link rel="stylesheet" href="/_/ita/lib/diff2html/diff2html.css">

IT Automation JavaScript/CSS information
---------------------------------
Information regarding JavaScript/CSS used in ITA. Can be used when displaying a page similar to ITA when creating original menus.

When used, jQuery and language files must be loaded seperately.

.. code-block::

 <script src="/_/ita/lib/jquery/jquery.js"></script>
 <script>let getMessage;</script>
 <script type="module">
     import {messageid_ja} from '/_/ita/js/messageid_ja.js';
     getMessage = messageid_ja();
 </script>

common.js
^^^^^^^^^
gathers variable fns to basic functions.
Required when using other ITA JavaScripts.

.. code-block::
 
 <script src="/_/ita/js/common.js"></script>
 
Main functions are as following.

fn.fetch
""""""""

Sends requests to ITA API.

.. code-block:: javascript

 const result = await fn.fetch( URL, TOKEN, METHOD, BODY );

+--------+-------------------------------------------------------------------------------------------------------+
| URL    | API end point.Ommit "/api/{organization_id}/workspaces/{workspace_id}/ita".                           | 
+--------+-------------------------------------------------------------------------------------------------------+
| TOKEN  | Specify null for most cases. If using within Worker, fetch and give Token seperately.                 | 
+--------+-------------------------------------------------------------------------------------------------------+
| METHOD | Methods, such as POST and GET. If omitted, GET.                                                       | 
+--------+-------------------------------------------------------------------------------------------------------+
| BODY   | For POST, body data. can be omitted.                                                                  | 
+--------+-------------------------------------------------------------------------------------------------------+

**Usage example**

Fetch operation list.

.. code-block:: javascript

 async function operationList(){
     const result = await fn.fetch('/menu/operation_list/filter/', null, 'POST', {"discard": {"NORMAL": "0"}});
     console.log( result );
 }

fn.xhr
""""""

Register data.
※Data can be registered with fn.fetch, but this displays a progression var when registering data.

.. code-block:: javascript

 const result = await fn.xhr( URL, FORMDATA );

+----------+----------------------------------------------------------------------+
| URL      | API Endpoint. "/menu/{menu_name_rest}/maintenance/all/.              | 
+----------+----------------------------------------------------------------------+
| FORMDATA | Convert registration to form data.                                   | 
+----------+----------------------------------------------------------------------+

**Useage example**

Register 1 operation.

.. code-block:: javascript

 window.addEventListener('DOMContentLoaded', () => {
     registerOperation();
 });

 async function registerOperation(){
     // Form data
     const formData = new FormData();

     // Register data
     const regsterData = [
         {
             parameter: {
                 discard: '0',
                 operation_name: 'Operation name',
                 scheduled_date_for_execution: '2024/12/31 00:00:00'
             },
             file: {},
             type: 'Register'
         }
     ];

     // Add Formdata to Parameter (Convert regsterData to string）
     formData.append('json_parameters', JSON.stringify( regsterData ) );

     // Register
     const result = await fn.xhr('/menu/operation_list/maintenance/all/', formData );

     console.log( result );
 }

common.css
^^^^^^^^^^
Style for basic ITA pages. Must be loaded seperately if using ITA JavaScript.

.. code-block::
 
 <link rel="stylesheet" href="/_/ita/css/common.css">

ui.js
^^^^^
Generates common ITA pages.

.. code-block::
 
 <script defer src="/_/ita/js/ui.js"></script>

**Usage example**

Screates a page with 3 tabs.

.. code-block:: html
 
 <div id="content"></div>

.. code-block:: javascript

 window.addEventListener('DOMContentLoaded', () => {
     // Target
     const $content = $('#content');
     
     // ui.js
     const ui = new CommonUi();

     // Menu information
     ui.info = {
         menu_info: {
             menu_name: 'Tab menu sample',
             menu_info: 'This is a tab menu sample.'
         }
     };

     // HTML within tabs
     ui.tab1 = function(){ return 'Tab1 Contents'};
     ui.tab2 = function(){ return 'Tab2 Contents'};
     
     // Tab definition
     // name contains the functions configured above.It will also work as a tab ID.
     // title is displayed in the tab.
     // Specify type: 'blank' and a blank tab will be created.
     const tabs = [
       { name: 'tab1', title: 'Tab １'},
       { name: 'tab2', title: 'Tab ２'},
       { name: 'tab3', title: 'Tab ３', type: 'blank'}
     ];

     // Generates HTML tab
     const tabHtml = ui.contentTab( tabs );

     // Menu title/description field
     const menuHtml = ui.commonContainer( ui.info.menu_info.menu_name, ui.info.menu_info.menu_info, tabHtml );
     
     // Set tabContent class to the target and set HTML
     $content.addClass('tabContent').html( menuHtml );

     // Since the 3 blank tabs have been created, we will now set the HTML seperately.
     $('#tab3').find('.sectionBody').html('Tab3 Contents');

     // Set the Tab event. Specify the name of the first opened tab to the argument.
     ui.contentTabEvent('#tab1');

     // Set the detailed menu button event
     ui.setCommonEvents();
 });

table.js
^^^^^^^^
Allows users to viev and edit specified parameter sheet tables.

.. code-block::
 
 <script defer src="/_/ita/js/table.js"></script>

.. code-block:: javascript
 
 const table = new DataTable( ID, MODE, INFO, PARAMS );
 const $table = table.setup();

+--------+-------------------------------------------------------------------------------+
| ID     | Specify a unique ID.                                                          |
+--------+-------------------------------------------------------------------------------+
| MODE   | view（basic） or history（display history）.                                  |
+--------+-------------------------------------------------------------------------------+
| INFO   | Menu information. Specify the information fetched in \                        |
|        | "/menu/{menuNanmeRest}/info/".                                                |
+--------+-------------------------------------------------------------------------------+
| PARAMS | Specify required parameters. For more details, see the Usage examples below.  |
+--------+-------------------------------------------------------------------------------+

**Usage example**

Display a Operation list.

.. code-block:: html
 
 <div id="content"></div>

.. code-block:: javascript

 window.addEventListener('DOMContentLoaded', async () => {
     // Target
     const $content = $('#content');

     // Operation list and Menu name（REST）
     const menuNanmeRest = 'operation_list';

     // Fetch Menu information
     const info = await fn.fetch(`/menu/${menuNanmeRest}/info/`);

     // Fetch required parameters
     const params = fn.getCommonParams();
     params.menuNameRest = menuNanmeRest;

     // Create Table
     // The Table's jQuery object is returned in the table.setup().
     const table = new DataTable('operationList', 'view', info, params );
     $content.html( table.setup() );
 });

dialog.js
^^^^^^^^^
Display Dialog.

.. code-block::
 
 <script defer src="/_/ita/js/dialog.js"></script>
 <link rel="stylesheet" href="/_/ita/css/dialog.css">

.. code-block:: javascript
 
 const dialog = new Dialog( CONFIG, FUNCTIONS );
 dialog.open( CONTENTS );

+-----------+-------------------------------------------------------------------------------+
| CONFIG    | Dialog structure information.                                                 |
+-----------+-------------------------------------------------------------------------------+
| FUNCTIONS | Function when the Dialog button is pressed.                                   |
+-----------+-------------------------------------------------------------------------------+
| CONTENTS  | HTML of the Dialog body.                                                      |
+-----------+-------------------------------------------------------------------------------+

**Usage example**

Display Hello world and Dialog, and divide the OK and Close processes.

.. code-block:: javascript

 window.addEventListener('DOMContentLoaded', async () => {
     const flag = await helloWorld();
     if ( flag ) {
         console.log('OK!');
     } else {
         console.log('CLOSE!!')
     }
 });

 function helloWorld(){
     return new Promise(function( resolve ){
         // Action when the button is pressed
         const functions = {
             // Function when OK is pressed
             ok: function(){
                 this.close();
                 resolve( true );
             },
             // Function when Close is pressed.
             close: function(){
                 this.close();
                 resolve( false );
             }
         };
         // Dialog display definition
         const config = {
             // Modale position, top or center
             position: 'center',
             // Header information
             header: {
                 title: 'Dialog test'
             },
             // width
             width: '640px',
             // Footer information
             footer: {
                 // Button information
                 button: {
                     // Link the key name same as the functions.
                     // text: Display text.
                     // action: button role（positive,restore,duplicat,warning,danger,history,normal,negative）※Only the color will change.
                     // style: Specify Style.
                     ok: { text: 'OK', action: 'default', style: 'width:160px;'},
                     close: { text: 'Close', action: 'normal'}
                 }
             }
         };
         const dialog = new Dialog( config, functions );
         dialog.open('<div style="padding:24px;text-align:center;font-size:24px;">Hello World</div>');
     });
 }