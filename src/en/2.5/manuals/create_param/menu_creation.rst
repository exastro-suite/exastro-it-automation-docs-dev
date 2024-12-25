========================
Parameter sheet creation function
========================

Introduction
========

| This document aims to explain the Parameter sheet creation function and how to use it.


Parameter sheet creation function overview
==============================

| The Parameter creation function allows userse to create menus that can be used in ITA.
| There are 2 different types of menus that can be created. "Parameter sheets" and "Data sheets".
| Created menus (Parameter sheets/Data sheets) can be operated through the Web UI, Excel and RestAPI.
| Users can freely customize the Menu (Parameter sheets/Data sheets) items, including the number of items, their format, size and input restrictions. 
| Users are also able to reference other menus through a pulldown selection item in order to prevent inconsistencies.

Parameter sheet
----------------

- | **Managing IaC variable values**
  | Useres can create parameter sheets that can be configured in the different drivers'"Substitute value automatic registration settings".
  | In the "Creation target" item found in "Parameter sheet creation" menu group > "Define/Create parameter sheet" menu > "Parameter sheet creation" information tab > Basic information slot, created menus with Parameter sheets (With Host/Operation) and Parameter sheet (With operations) are called Parameter sheets.
  | By configuring the target parameter sheet and IaC variables in the different drivers' "Substitute value automatic registration settings" menu, users can automatically substitute values that are input into parameter sheets' "Parameter" items.

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/paramsheet1m.png
     :width: 6.67391in
     :height: 3.20028in
     :align: left
     :alt: Parameter sheet (With host/operation) definition page

     Parameter sheet (With host/operation) definition page

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_done_operation1.gif
     :width: 6.67391in
     :height: 3.20028in
     :align: left
     :alt: Parameter sheet use example

     Parameter sheet use example

- | Items that can be selected in Parameter sheets

  - | **Host/with operation**
    | Creates parameter sheets in units of "Hosts" and "Operations".
  - | **With operation**
    | Creates parameter sheets in units of Operations.
  - | **Using host group**
    | Links ":ref:`host_group`" and allows users to manage IaC variable values 
  - | **Using bundles**
    | Allows for bundling items together when configuring repeating parameters.

Data sheet 
------------

- | **Managing data within ITA**
  | Users can create data sheets where items can be freely created. Note that Data sheets can not be used by the different drivers' "Substitute value automatic registration settings".
  | Data sheets can however be used as a CMDB (Configuration Management Database, Structure management database) to manage information in ITA.
  | More specifically, they can be used as items on a pulldown list.

  .. warning::
     | Note that in order to access them from pulldown lists, the items must have both :menuselection:`Required` and :menuselection:`Unique contraint` checked.

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/datasheet1m.png
     :width: 6.67391in
     :height: 3.20028in
     :align: left
     :alt: Data sheet definition page

     Data sheet definition page

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_done_operation2.gif
     :width: 6.67391in
     :height: 3.20028in
     :align: left
     :alt: Data sheet use example

     Data sheet use example

Parameter sheet creation function main functions
==================================

| The Parameter sheet creation function can be divided into the following categories

-  | Web
   | Web content. Allows users to use the Parameter sheet creation function through the Browser.
-  | Backyard
   | A resident process that runs on a server independently from the Web content.

Parameter sheet creation function menu group
==========================================

|  The menu "Parameter sheet creation" menu group and the belonging menus are as following.

-  | When creating parameter sheets or data sheets in the "Create/define parameter sheet" menu, data is automatically registered to the "Parameter sheet definition list", "Collumn group management" and "Menu item creation information" items.
-  | In order to display hidden menus, restore the target menus in "Role/Menu link list".
   | For more information regarding restoring and deleting menus, see :doc:` "Exastro-ITA_User_Instruction_Manual_Management_Console"  <../it_automation_base/management_console>`
   |

   .. table::  Menus belonging to the "Parameter sheet creation" menu group
      :align: left

      +--------+-----------------+---------------------------------------+-------------------------------------+
      | **Menu | **Menu**        | **Section**                           | **Description**                     |
      | Group**|                 |                                       |                                     |
      |        |                 |                                       |                                     |
      |        |                 |                                       |                                     |
      +========+=================+=======================================+=====================================+
      | Crea\  | Create/define \ |\ :ref:`about_operation`\ \            | Allows users to create Parameter/Da\|
      | te/Def\| parameter sheet |                                       | ta sheets as well as the items that\|
      | ine pa\|                 |                                       |  are linked to them.                |
      | ramete\|                 |                                       |                                     |
      | r sheet|                 |                                       | Can also be used to update Paramete\|
      |        |                 |                                       | r sheets and data sheets.           |
      |        +-----------------+---------------------------------------+-------------------------------------+
      |        | Parameter sheet\| \ :ref:`menu_confirmation`\           | Allows users to maintain(View/Upda\ |
      |        |  definition list|                                       | te/Delete/Restore) created paramet\ |
      |        |                 |                                       | er sheets and data sheets.          |
      |        +-----------------+---------------------------------------+-------------------------------------+
      |        | Parameter sheet\| \ :ref:`checking_status`\             | Allows users to check the status \  |
      |        |  creation histo\|                                       | of created parameter sheets.        |
      |        | ry              |                                       |                                     |
      |        +-----------------+---------------------------------------+-------------------------------------+
      |        | Column group cr\| \ :ref:`registering_column_g`\        | Allows users to maintain(View/Upda\ |
      |        | eation informat\|                                       | te/Delete/Restore) created paramet\ |
      |        | ion             |                                       | er sheet and data sheet column gro\ |
      |        |                 |                                       | ups.                                |
      |        |                 |                                       | ※This menu is hidden by default.\  |
      |        |                 |                                       |                                     |
      |        +-----------------+---------------------------------------+-------------------------------------+
      |        | Parameter sheet\| \ :ref:`registering_menu_items`\      | Allows users tom aintain(View/Upda\ |
      |        |  item creation \|                                       | te/Delete/Restore) items managed b\ |
      |        | information     |                                       | y created parameter sheets and da   |
      |        |                 |                                       | ta sheets.                          |
      |        |                 |                                       | ※This menu is hidden by default.   |
      |        |                 |                                       |                                     |
      |        +-----------------+---------------------------------------+-------------------------------------+
      |        | Parameter sheet\| \ :ref:`registering_menu_role`\       | Allows users to maintain(View/Upda\ |
      |        |  role creation\ |                                       | te/Delete/Restore) created paramet\ |
      |        |  information    |                                       | er sheet's and data sheets' access \|
      |        |                 |                                       | permission roles.                   |
      |        |                 |                                       |                                     |
      |        |                 |                                       | ※This menu is hidden by default.   |
      |        |                 |                                       |                                     |
      |        +-----------------+---------------------------------------+-------------------------------------+
      |        | Unique restrict\| \-                                    | Allows users to maintain(View/Upda\ |
      |        | ions(multiple\  |                                       | te/Delete/Restore) unique constrai\ |
      |        |  items)creatio\ |                                       | nts found in parameter sheets an\   |
      |        | n information   |                                       | d data sheets.                      |
      |        |                 |                                       |                                     |
      |        |                 |                                       | ※This menu is hidden by default.   |
      |        |                 |                                       |                                     |
      |        +-----------------+---------------------------------------+-------------------------------------+
      |        | Parameter sheet\|\ :ref:`mapping_menu_table`\           |  Displays the link between create\  |
      |        |  definition - t\|                                       | d parameters and DB tables.         |
      |        | able link manag\|                                       |                                     |
      |        | ement           |                                       | ※This menu is hidden by default.   |
      |        |                 |                                       |                                     |
      |        +-----------------+---------------------------------------+-------------------------------------+
      |        | Other menu link | \ :ref:`work_with_other_table`\       | Displays the link between created p\|
      |        |                 |                                       | arameters' menu group, menu, item a\|
      |        |                 |                                       | nd DB tables.                       |
      |        |                 |                                       |                                     |
      |        |                 |                                       | ※This menu is hidden by default.   |
      |        |                 |                                       |                                     |
      |        +-----------------+---------------------------------------+-------------------------------------+
      |        | Selection 1     | \ :ref:`selection1`\                  | Menu for managing items that can be\|
      |        |                 |                                       |  used by pulldown menus \           |
      |        |                 |                                       | (For selection 1).                  |
      |        |                 |                                       | ※This menu is hidden by default.   |
      |        |                 |                                       |                                     |
      |        +-----------------+---------------------------------------+-------------------------------------+
      |        | Selection 2     | \ :ref:`selection2`\                  | Menu for managing items that can be\|
      |        |                 |                                       |  used by pulldown menus \           |
      |        |                 |                                       | (For selection 1).                  |
      |        |                 |                                       | ※This menu is hidden by default.   |
      |        |                 |                                       |                                     |
      |        +-----------------+---------------------------------------+-------------------------------------+
      |        | Reference item \| \ :ref:`info_item_ro`\                | Displays items that can be used a\  |
      |        | info            |                                       | s reference items.                  |
      |        |                 |                                       |                                     |
      |        |                 |                                       | ※This menu is hidden by default.   |
      |        |                 |                                       |                                     |
      +--------+-----------------+---------------------------------------+-------------------------------------+

.. note:: |  While the "Create/Define parameter sheets" menu allows users to maintain parameter and data sheets, doing so from the menu limits the user to only maintaining 1 at a time. If the user wants to maintain multiple, they will have to do so using Excel.

Parameter sheets and Data sheets
==========================================

- | Types of sheets that can be created
  | Users can create 2 different types of sheets by changing the "Creation target" field in the "Parameter sheet creation information" tab in the  :menuselection:` "Parameter creation" menu group -->  "Create/Define parameter sheets" menu,`.

  - |  Select "Parameter sheet" and execute to create a parameter sheet.
    | This will create a (\ **Parameter sheet) **\ which can be have items configured in the different driver menu groups' "Substitute value automatic registration settings" menu.

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_done_operation1.gif
     :width: 5.21378in
     :height: 1.64681in
     :align: left
     :alt:  Menu (Parameter sheet) created with "Parameter sheet" selected

      Menu (Parameter sheet) created with "Parameter sheet" selected

  - |  Select "Data sheet" and execute to create a data sheet.
    |  This will create a (\ **Data sheet) **\" which can not be used by "Substitute value automatic registration settings" menus.

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_done_operation2.gif
     :width: 5.21378in
     :height: 1.64681in
     :align: left
     :alt:  Menu (Data sheet) created with "Data sheet" selected 

      Menu (Data sheet) created with "Data sheet" selected 

  .. table:: Parameter sheet and Data sheet differences
     :align: left

     +---------------+--------------+---------------------+---------------------+
     | **Creation t\ | **Substitu\  | **Menu item**       | **Host/Operation re\|
     | arget sele\   | te value aut\|                     | lationship**        |
     | cted value**  | o registrati\|                     |                     |
     |               | on settings**|                     |                     |
     +===============+==============+=====================+=====================+
     | Parameter she\| Configurable |  Links with specifi\| Links with specifi\ |
     | et (With hos\ |              | ed "Host/Operation"\| ed "Host/Operation".|
     | t/operation)  |              | Items related to "H\|                     |
     |               |              | ost name" and "Oper\|                     |
     |               |              | ation" are automati\|                     |
     |               |              | cally applied.      |                     |
     |               |              | Items other than t\ |                     |
     |               |              | hat can be create\  |                     |
     |               |              | d freely.           |                     |
     +---------------+--------------+---------------------+---------------------+
     | Parameter sh\ | Configurable | Items related to "O\| Links with specifie\|
     | eet (With ope\|              | peration" are autom\| d "Operation".      |
     | ration)       |              | atically applied.   |                     |
     |               |              |                     |                     |
     |               |              | Items other than th\|                     |
     |               |              | at can be created f\|                     |
     |               |              | reely.              |                     |
     +---------------+--------------+---------------------+---------------------+
     | Data sheet    | Not config\  | Users can create \  | Does not link wit\  |
     |               | urable       | items freely        | h either "Host" or \|
     |               |              |                     | "Operation".        |
     +---------------+--------------+---------------------+---------------------+

  .. note:: | Data sheets are intended to be used as reference sources for items that can be selected from pulldown menus 
            | and to be used as a CMDB (Configuration Management Database, Structure management database) for managing data on ITA.

  |
- | Parameter sheet patterns

  | There are 5 different patterns in which Parameter sheets can be created.

  #. | Parameter sheet using "Host group" and "Bundle"
  #. | Parameter sheet using "Host group"
  #. | Parameter sheet using "Bundle"
  #. | Parameter sheet only
  #. | Data sheet

  | If Parameter sheet is selected, the same menu (Parameter sheet) will be created in the following 3 menu groups.

  - | A. Input
  - | B. Substitute value auto registration
  - | C. Reference

  | If Data sheet is selected, the same menu (Data sheet) will be created in the following menu.

  - | A) Input

    | The only menu that can be maintained (Register/Update/Delete/Restore) is the menus in the "A) Input" menu group. 

    .. table:: Parameter sheet patterns
       :align: left

       +---------------+--------------+---------------------+
       | **Menu type\  | **Menu group\| **Maintainable**    |
       | **            | **           |                     |
       +===============+==============+=====================+
       | Parameter \   | Input        |      Yes            |
       | sheet         +--------------+---------------------+
       |               | Susbtitute \ |     No              |
       |               | value auto \ |                     |
       |               | registration |                     |
       |               +--------------+---------------------+
       |               | Reference    |     No              |
       +---------------+--------------+---------------------+
       | Data sheet    | Input        |    Yes              |
       |               |              |                     |
       +---------------+--------------+---------------------+


    - | Using host groups
      | We recommend using Host groups if the user is grouping the target host using the host group function.
      | for more information regarding the host group function, see ":ref:`host_group`".

  | The following displays the different menus for "Input", "Substitute value auto registration" and "Reference" 
  | when a parameter sheet called "Parameter sheet 1" and a data sheet called "Data sheet 1" has been created.

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_3_groups.gif
     :width: 5.09378in
     :height: 1.64681in
     :align: left
     :alt: Created menus in Menu groups

     Created menus in Menu groups

.. _about_operation:

 Operating the "Define/Create Parameter sheets" menu
================================================

|  "Parameter sheet creation" menu group "Define/Create parameter sheets" menu

.. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_definition_m.png
   :width: 6.69236in
   :height: 4.15903in
   :align: left

    "Define/Create parameter sheets"

(A) Configure item/group
------------------------

| Create an item configured to the Parameter sheet

-  |  "Item" button

   Pressing the :guilabel:`Item` button outputs and lets the user configure an item.

   .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_add_item.gif
      :width: 5.90486in
      :height: 1.59306in
      :align: left
      :alt: Adding items

      Adding items

   | This allows users to input items that can be added to the parameter sheet.

   .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_part_item.png
      :width: 5.90486in
      :height: 1.59306in
      :align: left
      :alt: Item definition

-  |  "Group" button
   | Configures column groups.
   | The default value is "Group 1". Both "/ (Slash) " and "\\ (Backslash) " are not usable.
   | Items can be added to the group by dragging the items into the group area.
   | Multiple items can be set to a single group.

   .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_grouping.gif
      :width: 6.08396in
      :height: 1.41856in
      :align: left
      :alt: Creating column group

   .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_grouping_result.png
      :width: 6.08396in
      :height: 1.41856in
      :align: left
      :alt: Column group in menu

      Column group in menu

-  |  "Delete" button
   | Returns the button to default state.

   .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_cancel.png
      :width: 6.08396in
      :height: 1.41856in
      :align: left
      :alt: Cancel button

      Cancel button

-  |  "Undo" button
   |  Returns the item before the "Delete button" was pressed.

   .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_redo.png
      :width: 6.08396in
      :height: 1.41856in
      :align: left
      :alt: Undo button

      Undo button

-  | Define Item name
   | The default value is "Item 1". Both "/ (Slash) " and "\\ (Backslash) " are not usable.

   .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_item_definition1.png
      :width: 3.90486in
      :height: 1.59306in
      :align: left
      :alt: Item name definition

      Item name definition

-  | Item name definition (For REST API)
   | Input a Item name (For REST API). The default value is "item_1".
   | Half-width characters and -_ (Hyphens and underscores) can be used.

   .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_item_definition2.png
      :width: 3.90486in
      :height: 1.59306in
      :align: left
      :alt: Item definition (For REST API)

      Item definition (For REST API)

-  | Input method selection
   | Select an input method from the pulldown menu.

   .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_item_definition3.png
      :width: 3.90486in
      :height: 1.59306in
      :align: left
      :alt: Selecting input method

      Selecting input method

.. _setting_of_item:
.. table:: Input method settings items
   :align: left


   +-----------------------------+-----+---------------------------------------------------------+
   | **Setting area**            |     | **Description/Created item**                            |
   +=============================+=====+=========================================================+
   | String (Single line)        | Single line: Textbox that can only contain 1 line             |
   |                             +---------------------------------------------------------------+
   | String (Multiple lines)     | Multiple lines: Textbox that can contain multiple lines       |
   |                             +-----+-----+---------------------------------------------------+
   |                             | In\ | Ma\ | Input maximum number of bytes.                    |
   |                             | pu\ | xi\ |                                                   |
   |                             | t \ | mu\ | Maximum value is 8192 bytes.                      |
   |                             | it\ | m \ |                                                   |
   |                             | em  | by\ | Using half-width characters uses the number of ch\|
   |                             |     | tes | aracters.                                         |
   |                             |     |     | Whole-width characters uses the number of charact\|
   |                             |     |     | ers x 3 + 2.                                      |
   |                             |     |     | If the "Input method" is "String (Single line), \ |
   |                             |     |     | the item is required.                             |
   |                             |     +-----+---------------------------------------------------+
   |                             |     | Re\ | Input a regular expression to check input values \|
   |                             |     | gu\ | with said expression.                             |
   |                             |     | la\ | ます                                              |
   |                             |     | r \ |                                                   |
   |                             |     | ex\ | E.g.: For half-width numeric items of 0 bytes or \|
   |                             |     | pr\ | more: ^[0-9]*$.                                   |
   |                             |     | es\ | For half-width alphanumeric characters of 1 byte \|
   |                             |     | sion| or more:^[a-zA-Z0-9]+$                            |
   |                             |     |     |                                                   |
   |                             |     +-----+---------------------------------------------------+
   |                             |     | De\ | Input the default value of data that will be used\|
   |                             |     | fa\ |  when data is registered.                         |
   |                             |     | ul\ |                                                   |
   |                             |     | t \ | It is not possible to input a value larger than t\|
   |                             |     | va\ | he maximum byte size.                             |
   |                             |     | lue |                                                   |
   |                             |     |     | When the menu's data is output as an Excel file, \|
   |                             |     |     | the default value will be set by default\         |
   |                             |     |     |                                                   |
   +-----------------------------+-----+-----+---------------------------------------------------+
   | Integer                     | Checks if the input value is an integer or not                |
   |                             +-----+-----+---------------------------------------------------+
   |                             | In\ | Mi\ | Input the minimum amount of bytes.                |
   |                             | pu\ | ni\ |                                                   |
   |                             | t \ | mu\ | Integer value from -2147483648 to 2147483647 ca\  |
   |                             | it\ | m \ | n be entered.                                     |
   |                             | em  | by\ | If nothing is input, -2147483648 will be used.    |
   |                             |     | tes |                                                   |
   |                             |     |     | Input a value smaller than the maximum bytes.     |
   |                             |     |     |                                                   |
   |                             |     +-----+---------------------------------------------------+
   |                             |     | Re\ | Input a regular expression to check input values \|
   |                             |     | gu\ | with said expression.                             |
   |                             |     | la\ | ます                                              |
   |                             |     | r \ |                                                   |
   |                             |     | ex\ | E.g.: For half-width numeric items of 0 bytes or \|
   |                             |     | pr\ | more: ^[0-9]*$.                                   |
   |                             |     | es\ | For half-width alphanumeric characters of 1 byte \|
   |                             |     | sion| or more:^[a-zA-Z0-9]+$                            |
   |                             |     |     |                                                   |
   |                             |     +-----+---------------------------------------------------+
   |                             |     | De\ | Input the default value of data that will be used\|
   |                             |     | fa\ |  when data is registered.                         |
   |                             |     | ul\ |                                                   |
   |                             |     | t \ | It is not possible to input a value larger than t\|
   |                             |     | va\ | he maximum byte size.                             |
   |                             |     | lue |                                                   |
   |                             |     |     | When the menu's data is output as an Excel file, \|
   |                             |     |     | the default value will be set by default\         |
   |                             |     |     |                                                   |
   +-----------------------------+-----+-----+---------------------------------------------------+
   | Decimal                     | Checks if the input value is a decimal or not                 |
   |                             +-----+-----+---------------------------------------------------+
   |                             | In\ | Mi\ | Input the minimum amount of bytes.                |
   |                             | pu\ | ni\ |                                                   |
   |                             | t \ | mu\ | Integer value from -99999999999999 to 9999999999\ |
   |                             | it\ | m \ | 9999 with total digit for whole number + fracti\  |
   |                             | em  | by\ | on part less than 14 digits can be entered.       |
   |                             |     | tes |                                                   |
   |                             |     |     | If nothing is input -99999999999999 will be used. |
   |                             |     |     |                                                   |
   |                             |     |     | Input a value smaller than the maximum bytes.     |
   |                             |     |     |                                                   |
   |                             |     +-----+---------------------------------------------------+
   |                             |     | Ma\ | Input maximum amount of bytes.                    |
   |                             |     | xi\ |                                                   |
   |                             |     | mu\ | Integer value from -99999999999999 to 9999999999\ |
   |                             |     | m \ | 9999 with total digit for whole number + fracti\  |
   |                             |     | by\ | on part less than 14 digits can be entered.       |
   |                             |     | te\ |                                                   |
   |                             |     | s   | If nothing is input, "99999999999999" wi\         |
   |                             |     |     | ll be used.                                       |
   |                             |     |     | Input a value larger than the minimum bytes.      |
   |                             |     +-----+---------------------------------------------------+
   |                             |     | Li\ | Input the max lines of both decimals and integers.|
   |                             |     | nes |                                                   |
   |                             |     |     | E.g.: 0.123 becomes 4 lines (1 for integer, 4\    |
   |                             |     |     |  for decimals).                                   |
   |                             |     |     | 11.1111 becomes 6 lines (2 for integer, 4\        |
   |                             |     |     |  for decimals).                                   |
   |                             |     |     | The available integers are as following 1 to 14.  |
   |                             |     |     |                                                   |
   |                             |     |     | If nothing is input, "14" will be used.           |
   |                             |     +-----+---------------------------------------------------+
   |                             |     | De\ | Input the default value of data that will be used\|
   |                             |     | fa\ |  when data is registered.                         |
   |                             |     | ul\ |                                                   |
   |                             |     | t \ | It is not possible to input a value larger than t\|
   |                             |     | va\ | he maximum byte size.                             |
   |                             |     | lue |                                                   |
   |                             |     |     | When the menu's data is output as an Excel file, \|
   |                             |     |     | the default value will be set by default\         |
   |                             |     |     |                                                   |
   +-----------------------------+-----+-----+---------------------------------------------------+
   | Date/time                   | Calendar selection item                                       |
   |                             +-----+-----+---------------------------------------------------+
   |                             | In\ | De\ | Input the default value that will be used when da\|
   |                             | pu\ | fa\ | ta is registered to the parameter sheet.          |
   |                             | t \ | ul\ |                                                   |
   |                             | it\ | t \ | The following format can be used: \               |
   |                             | em  | va\ | "YYYY-MM-DD hh:mm:ss"                             |
   |                             |     | lue |                                                   |
   +-----------------------------+-----+-----+---------------------------------------------------+
   | Date                        | Calendar selection item                                       |
   |                             +-----+-----+---------------------------------------------------+
   |                             | In\ | De\ | Input the default value that will be used when da\|
   |                             | pu\ | fa\ | ta is registered to the parameter sheet.          |
   |                             | t \ | ul\ |                                                   |
   |                             | it\ | t \ | The following format can be used: \               |
   |                             | em  | va\ | "YYYY-MM-DD hh:mm:ss"                             |
   |                             |     | lue |                                                   |
   +-----------------------------+-----+-----+---------------------------------------------------+
   | Pulldown selection          | Pulldown item                                                 |
   |                             +-----+-----+---------------------------------------------------+
   |                             | In\ | Se\ | Allows users to select targets referenced from c\ |
   |                             | pu\ | le\ | reated parameter sheets in a pulldown menu.\      |
   |                             | t \ | ct\ |                                                   |
   |                             | it\ | io\ | The "Selection item" row's character string"\     |
   |                             | em  | n \ | is structured as follows: Menu group: Menu : Item.|
   |                             |     | it\ |                                                   |
   |                             |     | em\ | This item is required if the "Input method" is \  |
   |                             |     |     | set to "Pulldown selection".                      |
   |                             |     |     |                                                   |
   |                             |     |     | ※ For more information regarding "Selection ite\ |
   |                             |     |     | ms", see\ :ref:`target_available`\ \              |
   |                             |     |     |                                                   |
   |                             |     +-----+---------------------------------------------------+
   |                             |     | Re\ | Use this item to select an item as an "Select it\ |
   |                             |     | fe\ | em" to display a different item that exi\         |
   |                             |     | re\ | st in the same menu.                              |
   |                             |     | nc\ |                                                   |
   |                             |     | e \ | Pressing the "Select reference item" to display t\|
   |                             |     | it\ | he available items. Tick the checkbox and press t\|
   |                             |     | em  | he "OK" button to specify the target.\            |
   |                             |     |     |                                                   |
   |                             |     |     | For more information, see\                        |
   |                             |     |     | \ :ref:`reference_item`\ \                        |
   |                             |     |     |                                                   |
   |                             |     +-----+---------------------------------------------------+
   |                             |     | De\ | Input the default value of data that will be used\|
   |                             |     | fa\ |  when data is registered.                         |
   |                             |     | ul\ |                                                   |
   |                             |     | t \ | It is not possible to input a value larger than t\|
   |                             |     | va\ | he maximum byte size.                             |
   |                             |     | lue |                                                   |
   |                             |     |     | When the menu's data is output as an Excel file, \|
   |                             |     |     | the default value will be set by default\         |
   |                             |     |     |                                                   |
   +-----------------------------+-----+-----+---------------------------------------------------+
   | Password                    | Item that hides the string with "*"                           |
   |                             +-----+-----+---------------------------------------------------+
   |                             | In\ | Ma\ | Input maximum number of bytes.                    |
   |                             | pu\ | xi\ |                                                   |
   |                             | t \ | mu\ | Maximum value is 8192 bytes.                      |
   |                             | it\ | m \ |                                                   |
   |                             | em  | by\ | Using half-width characters uses the number of ch\|
   |                             |     | tes | aracters.                                         |
   |                             |     |     | Whole-width characters uses the number of charact\|
   |                             |     |     | ers x 3 + 2.                                      |
   |                             |     |     | This item is required if the input method is se\  |
   |                             |     |     | t to "Password".                                  |
   +-----------------------------+-----+-----+---------------------------------------------------+
   | File upload                 | Item with a button for browsing files and a button for upl\   |
   |                             | oading it.                                                    |
   |                             +-----+-----+---------------------------------------------------+
   |                             | In\ | Ma\ | Input the maximum amount of bytes for the file \  |
   |                             | pu\ | im\ | uploads                                           |
   |                             | t \ | mu\ | Maximum value is 104857600 bytes.                 |
   |                             | it\ | m \ |                                                   |
   |                             | em  | Fi\ |  This item is required if the input method is se\ |
   |                             |     | le\ |  t to "File upload".                              |
   |                             |     |  b\ |                                                   |
   |                             |     | yt\ |                                                   |
   |                             |     | es  |                                                   |
   |                             |     |     |                                                   |
   +-----------------------------+-----+-----+---------------------------------------------------+
   | Link                        | Displays the input URL as a link                              |
   |                             +-----+-----+---------------------------------------------------+
   |                             | In\ | Ma\ | Input maximum number of bytes.                    |
   |                             | pu\ | xi\ |                                                   |
   |                             | t \ | mu\ | Maximum value is 8192 bytes.                      |
   |                             | it\ | m \ |                                                   |
   |                             | em  | by\ | Using half-width characters uses the number of ch\|
   |                             |     | tes | aracters.                                         |
   |                             |     |     | Whole-width characters uses the number of charact\|
   |                             |     |     | ers x 3 + 2.                                      |
   |                             |     |     | This item is required if the "Input method" is s\ |
   |                             |     |     | et to "Link".                                     |
   |                             |     +-----+---------------------------------------------------+
   |                             |     | De\ | Input the default value of data that will be used\|
   |                             |     | fa\ |  when data is registered.                         |
   |                             |     | ul\ |                                                   |
   |                             |     | t \ | It is not possible to input a value larger than t\|
   |                             |     | va\ | he maximum byte size.                             |
   |                             |     | lue |                                                   |
   |                             |     |     | When the menu's data is output as an Excel file, \|
   |                             |     |     | the default value will be set by default\         |
   |                             |     |     |                                                   |
   +-----------------------------+-----+-----+---------------------------------------------------+
   | Parameter sheet reference   | This item can reference values from data matching operations \|
   |                             | if the menu item is from a  "Parameter sheet (with op\        |
   |                             | eration)".                                                    |
   |                             +-----+-----+---------------------------------------------------+
   |                             | In\ | Se\ | Can select items from user created "Parameter (w\ |
   |                             | pu\ | le\ | ith operation) from a pulldown selection.\        |
   |                             | t \ | ct\ |                                                   |
   |                             | it\ | io\ | The following input method items can be selected:\|
   |                             | em  | n \ | "String (single line)", "String (multiple lines)"\|
   |                             |     | it\ | , "Integer", "Decimal", "Date/time", "Date", \    |
   |                             |     | em  |  "Password", "File upload" and "link".            |
   |                             |     |     |                                                   |
   +-----------------------------+-----+-----+---------------------------------------------------+


.. table:: Input method shared setting items
   :align: left

   +-----------------------------+--------------------------------------------------------------------------------+
   | **Setting area**            | **Description**                                                                |
   +=============================+================================================================================+
   | Required                    | A checkbox that decides if the item should be an input required item or not    |
   +-----------------------------+--------------------------------------------------------------------------------+
   | Unique restriction items    | A checkbox that decides if the item should be an unique restricted item or not.|
   +-----------------------------+--------------------------------------------------------------------------------+
   | Description                 |                                                                                |
   +-----------------------------+--------------------------------------------------------------------------------+
   | Remarks                     | Free description field.                                                        |
   +-----------------------------+--------------------------------------------------------------------------------+

(B)  "Parameter sheet creation information" tab
------------------------------------

- | Input information required in order to create a parameter sheet.

  - |  "Basic information" field

    .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_base_info.png
       :width: 4.08396in
       :height: 1.41856in
       :align: left
       :alt:  "Basic information" field

        "Basic information" field

    .. _setting_of_base_info:
    
    .. table::  "Basic information" setting value
       :align: left


       +----------+-------------------------------------------+-------+------+
       | **Settin\| **Description**                           | **Creation \ |
       | g area** |                                           | target **    |
       |          |                                           |              |
       |          |                                           |              |
       |          |                                           |              |
       |          |                                           +-------+------+
       |          |                                           | **Par\| **Da\|
       |          |                                           | amete\| ta s\|
       |          |                                           | r she\| heet\|
       |          |                                           | et**  | **   |
       |          |                                           |       |      |
       |          |                                           |       |      |
       +==========+===========================================+=======+======+
       | Item num\| Displays "Auto-input" when creating para\ | Disp\ | Dis\ |
       | ber      | meter sheets. The item number is display\ | lay   | play |
       |          | ed when editing an existing menu (Param\  |       |      |
       |          | eter sheet/Data sheet).                   |       |      |
       +----------+-------------------------------------------+-------+------+
       | Paramete\| Input the name of the Parameter sheet.    | Disp\ | Dis\ |
       | r sheet \| The name "Main menu" is not usable.       | lay   | play |
       | name     |                                           |       |      |
       +----------+-------------------------------------------+-------+------+
       | Creation\| Select one of the following from the pull\| Disp\ | Dis\ |
       |  target  | down selection: "Parameter sheet (with h\ | lay   | play |
       |          | ost/operation), "Parameter sheet (with op\|       |      |
       |          | eration)" or "Data sheet".                |       |      |
       |          |                                           |       |      |
       |          | If "Data sheet" is selected, the the "Inp\|       |      |
       |          | ut" row will be displayed in the "Target\ |       |      |
       |          |  menu group" area.                        |       |      |
       |          |                                           |       |      |
       |          |  If either "Parameter sheet (with host/op\|       |      |
       |          | eration) or "Parameter sheet (with operat\|       |      |
       |          | ion) is selected, the "Host group" and "B\|       |      |
       |          | undle" checkbox will be dispalyed in the \|       |      |
       |          |  "Basic information" area, and the "Input\|       |      |
       |          | ", "Substitute value auto registration" \ |       |      |
       |          | and "Reference" menu groups will be disp\ |       |      |
       |          | layed in the "Target menu group" area.    |       |      |
       |          |                                           |       |      |
       +----------+-------------------------------------------+-------+------+
       | Display \| Input the display order of the column.\   | Disp\ | Dis\ |
       | order    | They are displayed in ascending order.    | lay   | play |
       +----------+-------------------------------------------+-------+------+
       | Host gro\|  Is displayed if the creation target \    | Disp\ | Hidd\|
       | up       | is set to "Parameter sheet (with host\    | lay   | den  |
       |          | /operation).                              |       |      |
       |          |                                           |       |      |
       |          |  Will create parameter sheets per host gr\|       |      |
       |          | oup if the "use" checkbox is ticked.\     |       |      |
       |          |                                           |       |      |
       |          | Will create parameter sheets per host if\ |       |      |
       |          | the "Use" checkbox is not ticked.\        |       |      |
       +----------+-------------------------------------------+-------+------+
       | Bundle   | Is displayed if the creation target \     | Disp\ | Hidd\|
       |          | is "Parameter sheet"\                     | lay   | en   |
       |          |                                           |       |      |
       |          |  Will create a parameter sheet that supp\ |       |      |
       |          | orts bundles if the "Use" checkbo\        |       |      |
       |          | x is ticked.                              |       |      |
       +----------+-------------------------------------------+-------+------+
       | Last upd\| Set to "Auto-input" by default.           | Disp\ | Dis\ |
       | ated dat\|                                           | lay   | play |
       | e/time   | Is displayed in both "View" and "Edit"\   |       |      |
       |          | mode.                                     |       |      |
       |          | If the last updated user "Parameter sheet\|       |      |
       |          |  creation function" (The user used when \ |       |      |
       |          | the record is updated by Backyard), the \ |       |      |
       |          | record displayed will be the one before \ |       |      |
       |          | that.                                     |       |      |
       +----------+-------------------------------------------+-------+------+
       | Last upd\| Set to "Auto-input" by default.           | Disp\ | Dis\ |
       | ated by: |                                           | lay   | play |
       |          | Is displayed in both "View" and "Edit"\   |       |      |
       |          | mode.                                     |       |      |
       |          | If the last updated user "Parameter sheet\|       |      |
       |          |  creation function" (The user used when \ |       |      |
       |          | the record is updated by Backyard), the \ |       |      |
       |          | record displayed will be the one before \ |       |      |
       |          | that.                                     |       |      |
       +----------+-------------------------------------------+-------+------+


    | This section contains usable patterns of Creation target selections and the different driver's substitute value auto registration.

    .. list-table:: Creation targets and Substitute value auto registration targets
       :header-rows: 1
       :align: center

       * - | 
         - | Parameter sheet
           | (With host/operation)
         - | Parameter sheet
           | (With operation)
         - | Data sheet
       * - | :ref:`ansible_driver`
         - | ○
         - | △
         - | ▲
       * - | :ref:`terraform_driver`
         - | ×		
         - | ○
         - | ▲

    .. note::
              - | ○	：Selectable in the Substitute value auto registration menu.			
              - | ×	：Not selectable in the Substitute value auto registration menu.	
              - | △	：Not selectable in the Substitute value auto registration menu, but can use values from parameter sheets using Parameter sheet reference.
                | 　　 ":menuselection:`Creation target` is Parameter sheet (with host/operation) with "Parameter sheet reference" item.
              - | ▲	：Not selectable in the Substitute value auto registration menu, but can use values from parameter sheets using Parameter sheet reference.
                | 　　 ":menuselection:`Creation target` is Parameter sheet (with host/operation"/Parameter sheet (with operation) with "Pulldown" item.

              | ※ For more information regarding :menuselection:`Creation targets` see :ref:`setting_of_base_info`.
              | ※ For more information regarding "Parameter sheet reference" and "Pulldown" items, see, :ref:`setting_of_item`.
    |
  - |  "Target menu group" field
    |  Displays the menu group used when creating the parameter sheets.
    |  Pressing the "Select target menu group" displays the "Target menu group" selection window where the user can select which menu group they want to use.

    .. table::  "Target menu group" field setting value
       :align: left

       +------+----------------------------------------------+-------+-------+
       | **Se\| **Description**                              | **Creation \  |
       | tti\ |                                              | target**      |
       | ng \ |                                              |               |
       | area\|                                              |               |
       | **   |                                              |               |
       |      |                                              +-------+-------+
       |      |                                              | **Par\| **Dat\|
       |      |                                              | amete\| a she\|
       |      |                                              | r she\| et**  |
       |      |                                              | et**  |       |
       |      |                                              |       |       |
       |      |                                              |       |       |
       |      |                                              |       |       |
       +======+==============================================+=======+=======+
       | Input| The default is "Input" menu group            | Displ\| Displ\|
       |      |                                              | ayed  | ayed  |
       |      | The menu group name selected in the "Input" \|       |       |
       |      | row on the "Menu Group Selection" screen w\  |       |       |
       |      | ill be displayed.                            |       |       |
       |      | ※This item is required.                     |       |       |
       +------+----------------------------------------------+-------+-------+
       | Subs\| The default is "Substite value auto regist\  | Displ\| Hidde\|
       | titu\| ration" menu group.                          | ayed  | n     |
       | te v\|                                              |       |       |
       | alue\| If the "Creation target" row is "Parameter \ |       |       |
       |  aut\| sheet", the menu group name selected in the \|       |       |
       | o re\| "Automatic registration substitution value" \|       |       |
       | gist\| row on the "Menu group selection" screen \   |       |       |
       | rati\| will be displayed.                           |       |       |
       | ion  | ※ This item is required if displayed in th\ |       |       |
       |      | e "Target menu group" area.                  |       |       |
       +------+----------------------------------------------+-------+-------+
       | Refe\| The default is "Reference" menu group.       | Displ\| Hidde\|
       | rence|                                              | ayed  | n     |
       |      |                                              |       |       |
       |      | If the "Creation target" row is "Parameter s\|       |       |
       |      | heet", the menu group name selected in the "\|       |       |
       |      | Reference" row on the "Menu group selection\ |       |       |
       |      | " screen will be displayed.                  |       |       |
       |      |                                              |       |       |
       +------+----------------------------------------------+-------+-------+

    .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_target_group.gif
       :width: 6.29921in
       :height: 3.12575in
       :align: left
       :alt:  "Target menu group" selection page

        "Target menu group" selection page

    .. note:: | The picture above depicts when the "Creation target" is set to "Parameter sheet".

    - |  "Target menu group" selection page

      - | Allows the user to select the target menu groups where the parameter sheet will be created to.
      - | By default, the "Input,", "Substitute value auto registration" and "Reference" menu groups will be selected.
      - | Select the desired menus and click the "OK" button.
      - | Pressing the "OK" button whith the default values set creates a menu for for the "Input", "Substitute value auto registration" and "Reference" menu groups automatically. ( If the "Creation target" is set to "Data sheet", the menu will only be created to the "Input" menu group.) 
      - | (For more information, see  :doc:`"Exastro-ITA_Instruction_User_Manual_Management_Console"<../it_automation_base/management_console>`.)
      - |  Press the "delete" button in the "Define/Create parameter sheets" menu.


  - |  "Unique restriction(Multiple items)" field
    | This function makes it so its not possible to register multiple of the same combinations of records and items when registering data to created menus.

    .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_unique_restriction2.gif
       :width: 5.91544in
       :height: 5.18333in
       :alt:  Menus with "Unique restriction(Multiple items)" configured

        Menus with "Unique restriction(Multiple items)" configured

    |  Clicking the "Select Unique restriction(Multiple items)" button displays the "Unique restriction(Multiple items)" where users can configure combinations of unique items.

    - |  "Unique restriction(Multiple items)" settings page

      - |  Pressing the "Add pattern" adds another pattern. It is possible to configure multiple patterns.
      - | The patterns displays all current items. Clicking one of the items allows the user to configure the unique restriction combination.
      - | Press the "Delete" button in order to delete undesired patterns.
      - |  Pressing the "Delete" button allows the user to close the settings menu without displaying the settings.
      - |  Pressing the "OK" button displays the configured combinations.

      .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_unique_restriction.gif
         :width: 6.26679in
         :height: 3.65152in
         :align: left
         :alt:  "Unique restriction(Multiple items)" settings page

          "Unique restriction(Multiple items)" settings page

      - | The following patterns wil lead to validation errors.
        | ① When there is only 1 item selected in a pattern.
        | ② If there are multiple patterns with the same item combinations.

      .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_unique_restriction_wrong1.png
         :width: 4.23577in
         :height: 1.98283in
         :align: left
         :alt: When there is only 1 item selected in a pattern

         When there is only 1 item selected in a pattern

      .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_unique_restriction_wrong2.png
         :width: 4.23577in
         :height: 1.98283in
         :align: left
         :alt: If there are multiple patterns with the same item combinations

         If there are multiple patterns with the same item combinations


  - |  "Access permission role" field

    - | If a role is selected
      | The seleted role(s) can access the Parameter sheet menus (menus under the "Parameter sheet creation" menu group). 
      | The roles selected in the "Role/Menu link management" menu can access the created menus (Parameter sheets/Data sheets).
    - | If no role is selected.
      | All roles can access the Parameter sheet menus (menus udner the "Parameter sheet creation" menu group).
      | Created menus (Parameter sheets/Data sheets) can only be accessed by users that has the System admin role and/or the same role as the user that created the menu.

      .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_access_control.gif
         :width: 6.26679in
         :height: 3.65152in
         :align: left
         :alt:  "Access permission role" settings page

          "Access permission role" settings page

(C)  "Preview" 
------------------

- |  "Preview" tab
  | Displays items in a table format.

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_preview.png
     :width: 6.08396in
     :height: 1.41856in
     :align: left
     :alt:  "Preview" tab

      "Preview" tab

- |  "Log" tab
  |  The "Log" tab displays the creation results after the "Create" button is pressed.

.. _create_menu:

(D)  "Create" 
------------

- |  "Create" button
  | Creates the parameter sheet if all the input required items are filled in.

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_creation_button.gif
     :width: 6.08396in
     :height: 1.41856in
     :align: left
     :alt:  "Create" button

      "Create" button

  | After the parameter sheet has been created, the user can press the "Parameter sheet creation information" button to move to the "Parameter sheet creation history" menu where they can check if the parameter sheet was created successfully or not.

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_history_button.png
     :width: 6.08396in
     :height: 1.41856in
     :align: left
     :alt: Parameter sheet creation history

     Parameter sheet creation history

  |  "Define/Create parameter sheets"
  |  Data is automatically input to the "Parameter sheet definition list", "Collumn managment", "Parameter sheet item creation information", "Unique restriction (Multiple items) creation information" and "Parameter sheet role creation information" menus.

 "Define/Create parameter sheets" menu after creating a parameter sheet
--------------------------------------------------------------------------

|  "Define/Create parameter sheets"

- | View page

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_after_creation.gif
     :width: 6.08396in
     :height: 1.41856in
     :align: left
     :alt: View page

     View page

  | After the user creates a menu, they will be moved to a page resembling the picture above.
  | It is not possible to edit or create parameter sheets in the view page.
  | If order to edit or create parameter sheets again, press one of the following button on the screen: "Edit", "Initialize" or the "Reuse" button.
  | If "Create(New)" button is displayed instead of the "Edit" and "Initialize" buttons, that means that the backyard proccess hasnt finished creating the parameter sheet yet.
  | Updating the browser after the parameter sheet has been created should display the "Edit" and "Initialize" button again.
  | The status of the parameter sheet can be displayed by clicking the "Parameter sheet creation history" button.

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_button_on_browse1.png
     :width: 3.07895in
     :height: 0.69767in
     :align: left
     :alt: Button layout when the Backyard process isnt finished

     Button layout when the Backyard process isnt finished

  |

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_button_on_browse2.png
     :width: 3.07895in
     :height: 0.69767in
     :align: left
     :alt: Button layout when the Backyard process is finished

     Button layout when the Backyard process is finished

  - |  "Create(New)" button (Before the Backyard is finished)
    |  Clicking the "Create(New)" button moves the user from the view page to the edit page. In the edit page, the user can add and delete items while keeping the data registered in the "Input" menu group. Edit the parameter sheet and press the "Create(Edit)" to save the changes.
  - |  "Create(New)" button(After the Backyard is finished)
    |  Clicking the "Create(New)" button moves the user from the view page to the edit page. In the edit page, the user can add and delete items while keeping the data registered in the "Input" menu group.
    |  (It is not possible to edit values configured to existing items and Basic information) 
    |  Edit the parameter sheet and press the "Create(Edit)" to save the changes.

  - |  "Initialize" button
    |  Clicking the "Initialize" button moves the user from the view pqage to the initialize page. This page allows users to edit values and press the "Create(Initialize) button to recreate the parameter sheet. When recreated, the data registered in the "Input" menu group will be deleted.
  - |  "Reuse" button
    |  Clicking the "Reuse" button moves the user to a new creation page where the displayed parameter sheet is used as a template. Make sure to input a new name and display order before creating it.
    | The parameter sheet name must differ from existing parameter sheets.
  - |  "Parameter sheet creation information" button
    | Moves the user to the "Parameter sheet creation history" for the displaying parameter sheet.
    |
    |
- | Edit page

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_not_editable.png
     :width: 5.20712in
     :height: 2.76691in
     :align: left
     :alt: Edit page

     Edit page

  | In the Edit page, the user can edit the parameter sheet while keeping the data registered in the "Input" menu group.
  | This menu allows users to change the following item values: "Item name", "Regular expression", "Description" and "Remarks".
  | The following items can only have their values edited to a larger number than the previously set value: "Maximum byte size", "Minimum value", "Maximum value", "Line number" and "Maximum file byte number".
  | If the "Regular expression" item was edited, already registered data will be saved, even if it causes inconsistency error with the new "Regular expression".
  | If a created item is deleted, data input into that data will also be deleted.
  | If a new item is added, it will be added with no record registered to it (blank).
  | This is also the case for records with "Required" and "Unique constraint" checked, meaning that there might be inconsistency errors.
  | If the target menu groups are changed, the menu will be deleted from non-selected menu groups and will have a new one created to the newly selected menu groups (Data will be saved). 
  | It is not possible to change the setting value for the following items: "Basic information"'s "Parameter sheet name", "Creation target", "Using host group" and "Using bundle".
  | If the item data is updated in the "Parameter data sheet item creation information" menu and the "Create(Edit)" button is clicked, inconsistency errors might occur.

  - |  "Create (Edit)" button
    | Starts editing the displayed parameter sheet with it's data saved.

    .. note:: | Note that it is not possible to exchange item names between items when editing parameter sheets. Changing the item name might cause errors when saving changes.

  - |  "Reload" button
    | Removes all edited information.
  - |  "Cancel" button
    |  Returns it to the state before the "Edit" button was clicked.

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_edit_button.png
     :width: 5.20712in
     :height: 2.76691in
     :align: left
     :alt: Edit page buttons

     Edit page buttons

- | Initialize page

  .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_not_editable2.png
     :width: 4.85375in
     :height: 2.58022in
     :align: left
     :alt: Initialize page

     Initialize page

  | In the initialize page, users can edit the parameter sheet displayed.
  | If the target menu group is edited, the menu will be deleted from non-selected menu groups and will have a new one created to the newly selected menu groups.
  | It is not possible to edit the "Basic information"'s' "Parameter sheet name".

  |  There are no other edit restrictions for the "Parameter name", but doing so will delete all data registered from the menu in the "Input" menu group.

  - |  "Create(Initialize)" button
    | Recreates the displayed parameter sheet.

  .. note:: | Note that it is not possible to exchange item names between items when editing parameter sheets. Changing the item name might cause errors when saving changes.

  - |  "Reload" button
    | Removes all edited contents.
  - |  "Cancel" button
    | Returns the parameter shet to before the "Edit" button was clicked.

    .. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_init_button.png
       :width: 4.85375in
       :height: 2.58022in
       :align: left
       :alt: Initialize page buttons

       Initialize page buttons

.. _menu_confirmation:

 Check parameter sheet in the "Parameter sheet defintiion list" menu
------------------------------------------------------------

|  The following actions can be performed in the "Parameter sheet definition list" menu.

- | Display list of created parameter sheets
- | Maintain (View/Update/Delete/Restore) created parameter sheets

| It is possible to maintain (View/Update/Delete/Restore) parameter sheets.
| Pressing the "Parameter sheet definition list" from the menu list on the left displays the following page.

.. figure:: /images/ja/menu_creation/menu_definition_list/menu_list.gif
   :width: 6.69236in
   :height: 2.95903in
   :align: left
   :alt:  "Parameter sheet definition list" menu

    "Parameter sheet definition list" menu

Press the :guilabel:`Filter button` in order to display the created parameter sheets.

.. figure:: /images/ja/menu_creation/menu_definition_list/menu_definition_filter.png
   :width: 4.69236in
   :height: 2.95903in
   :align: left
   :alt: Filter button

   Filter button

Press the :guilabel:`Define/Create parameter sheets` to "Define/Create parameter sheets"

.. figure:: /images/ja/menu_creation/menu_definition_list/menu_list_items_for_entry.png
   :width: 4.69236in
   :height: 2.95903in
   :align: left
   :alt: Parameter sheet edit page

   Parameter sheet edit page

Pressing the :guilabel:`Register button` moves the user to a page where they can define a new parameter sheet.

.. figure:: /images/ja/menu_creation/menu_definition_list/menu_definition_reg.png
   :width: 4.69236in
   :height: 2.95903in
   :align: left
   :alt: Menu edit page

   Menu edit page

|  It is possible to use set values to use as filter options in order to narrow down definitions.

.. table::  "Parameter sheet definition list" menu setting values
   :align: left

   +---------+---------------------------------------------+------+------+
   | **Setti\| **Description**                             | **Cr\|      |
   | ng are\ |                                             | eati\|      |
   | a**     |                                             | on t\|      |
   |         |                                             | arge\|      |
   |         |                                             | t**  |      |
   +---------+---------------------------------------------+------+------+
   |         |                                             | **Pa\| **Da\|
   |         |                                             | rame\| ta s\|
   |         |                                             | ter \| heet\|
   |         |                                             | shee\| **   |
   |         |                                             | t**  |      |
   +=========+=============================================+======+======+
   | Define/\| Pressing the buttons on the lines moves the\| Dis\ | Dis\ |
   | Create \|  user to the target parameter sheet's edit \| play | play |
   | paramet\| page.                                       |      |      |
   | er sheet|                                             |      |      |
   |         |                                             |      |      |
   +---------+---------------------------------------------+------+------+
   | Paramet\| Input the Japanese name of the parameter   \| Dis\ | Dis\ |
   | er shee\| sheet. The name "Main menu" is not    \     | play | play |
   | t name\ | usable.                                     |      |      |
   | (ja)    |                                             |      |      |
   |         | The name cannot be changed after the param\ |      |      |
   |         | eter sheet's creation status has changed to\|      |      |
   |         |  "Created".                                 |      |      |
   +---------+---------------------------------------------+------+------+
   | Paramet\| Input the English name of the parameter she\| Dis\ | Dis\ |
   | er shee\| et. The name "Main menu" is not usable.     | play | play |
   | t name\ |                                             |      |      |
   | (en)    |                                             |      |      |
   |         | The name cannot be changed after the param\ |      |      |
   |         | eter sheet's creation status has changed to\|      |      |
   |         |  "Created".                                 |      |      |
   +---------+---------------------------------------------+------+------+
   | Paramet\| Input the parameter sheet's REST name.\     | Dis\ | Dis\ |
   | er shee\|                                             | play | play |
   | t name\ |                                             |      |      |
   | (rest)  |                                             |      |      |
   |         | The name cannot be changed after the param\ |      |      |
   |         | eter sheet's creation status has changed to\|      |      |
   |         |  "Created".                                 |      |      |
   +---------+---------------------------------------------+------+------+
   |Sheet \  | Input the type of Creation target.          | Dis\ | Dis\ |
   |type     |                                             | play | play |
   |         |                                             |      |      |
   |         | Select either "Parameter sheet (with host/\ |      |      |
   |         | operation)", "Parameter sheet (with operat\ |      |      |
   |         | ion)"" or "Data sheet".                     |      |      |
   |         |                                             |      |      |
   |         |                                             |      |      |
   +---------+---------------------------------------------+------+------+
   | Display\| Enter the display order in the menu group.  | Dis\ | Dis\ |
   |  order  |They are displayed in ascending order.       | play | play |
   +---------+---------------------------------------------+------+------+
   | Bundle  |  Can set to "True" if the creation target \ | Dis\ | Hid\ |
   |         | is "Parameter sheet"                        | play | den  |
   |         |                                             |      |      |
   |         |                                             |      |      |
   |         | If set to True, the parameter sheet \       |      |      |
   |         | will support bundles                        |      |      |
   +---------+---------------------------------------------+------+------+
   | Host \  |  Can set to "True" if the creation target \ | Dis\ | Hid\ |
   | group   | is "Parameter sheet (with host/operation)   | play | den  |
   |         |                                             |      |      |
   |         | If set to True, the parameter sheet will \  |      |      |
   |         | support Host groups.                        |      |      |
   +---------+---------------------------------------------+------+------+
   | Input m\| Select which menu group the Data sheet or \ | Dis\ | Dis\ |
   | enu gro\| Parameter sheet will have their Input \     | play | play |
   | up※    | menu created to.                            |      |      |
   |         |                                             |      |      |
   |         |                                             |      |      |
   +---------+---------------------------------------------+------+------+
   | Susbtit\|  If the "Creation target" column is "Param\ | Dis\ | Hid\ |
   | ute val\| eter sheet", the "Susbtitute value auto re\ | play | den  |
   | ue aut\ | gistration menu group" column will be disp\ |      |      |
   | o regis\| layed.                                      |      |      |
   | tratio\ | Select the Menu group for substitution val\ |      |      |
   | n menu \| ue automatic registration where the Paramet\|      |      |
   |  group※| er sheet will be created in from the pulld\ |      |      |
   |         | own selection.                              |      |      |
   +---------+---------------------------------------------+------+------+
   | Referen\| If the "Creation target" column is "Param\  | Dis\ | Hid\ |
   | ce men\ | eter sheet", the "Reference menu group" c\  | play | den  |
   | u group\| olumn will be displayed.                    |      |      |
   | ※      |                                             |      |      |
   |         | If the user is not using the default menu \ |      |      |
   |         | groups, make sure to create a menu group t\ |      |      |
   |         | hat can be used in the "Management console\ |      |      |
   |         | " menu group.                               |      |      |
   +---------+---------------------------------------------+------+------+
   | Paramet\| Displays a flag depending on if the parame\ | Dis\ | Dis\ |
   | er cre\ | ter sheet creation process has been execu\  | play | play |
   | ation\  | ted or not.                                 |      |      |
   |  status | If it has been created before, the status w\|      |      |
   |         | ill display "Created”. If not, it will \   |      |      |
   |         | display "Not created".                      |      |      |
   |         |                                             |      |      |
   |         | If the status displays "Created", the       |      |      |
   |         | menu name cannot be changed.                |      |      |
   |         |                                             |      |      |
   +---------+---------------------------------------------+------+------+
   | Descrip\| Input the contents that will be disp\       | Dis\ | Dis\ |
   | tion(ja)| layed in the description field (Japanese).  | play | play |
   +---------+---------------------------------------------+------+------+
   | Descrip\| Input the contents that will be disp\       | Dis\ | Dis\ |
   | tion(en)| layed in the description field (English).   | play | play |
   +---------+---------------------------------------------+------+------+
   | Remarks | Free description field.                     | Dis\ | Dis\ |
   |         |                                             | play | play |
   +---------+---------------------------------------------+------+------+

.. note:: | XXXIf the user is not using the default menu groups, make sure to create a menu group that can be used in the "Management console" menu group. (For more information, see :doc:` "Exastro-ITA manual Management Console"  <../it_automation_base/management_console>`.) 

.. tip:: | Deleting records in the Parameter sheet defintiion list
 | The :menuselection:`Parameter sheet defintiion list` menu has the setting information used to create the parameter sheets.
 | Even if records are deleted from menus in the :menuselection:`Parameter sheet defintiion list` menu, menus in the :menuselection:`Managedment console --> Menu list` (created menus) will not be changed.
 | In order to delete created parameter sheets, see :ref:`delete_restore_parameter_sheet` .

.. _checking_status:

 Check creation status in the "Parameter sheet creation information" menu
----------------------------------------------------

| This menu allows users to check the creation status of parameter sheets.

.. figure:: /images/ja/menu_creation/menu_creation_history/menu_history.gif
   :width: 5.90718in
   :height: 2.82691in
   :align: left
   :alt:  "Parameter sheet creation history" menu

    "Parameter sheet creation history" menu

| The "Not executed" status is monitored by Backyard, and it uses not executed data menus setting files, executes SQL to create tables and deploys and registers the menu page program.
| After a couple of seconds after the status has changed to "Completed", the menu will be added to the menu group.

.. table::  "Parameter sheet creation information" menu items
   :align: left

   +------------+---------------------------------------------------------+
   | **Item \   | **Description**                                         |
   | name**     |                                                         |
   +============+=========================================================+
   | Parameter \| Name of the target parameter sheet.                     |
   | sheet name |                                                         |
   +------------+---------------------------------------------------------+
   | Status     | Displays what status of the Parameter sheet creation \  |
   |            | process.                                                |
   |            |                                                         |
   |            | Not executed：\                                         |
   |            | Status before the parameter sheet creation process \    |
   |            | starts.                                                 |
   |            |                                                         |
   |            | Executing：\                                            |
   |            | Status where the Backyard is running the parameter shee\|
   |            | t creation proccess.                                    |
   |            |                                                         |
   |            | Complete：\                                             |
   |            | Status when the parameter sheet creation process has \  |
   |            | ended successfully                                      |
   |            |                                                         |
   |            | Complete (error) ：\                                    |
   |            | Status when the parameter sheet ends in an error.       |
   +------------+---------------------------------------------------------+
   | Creation \ | The following are the available creation types.         |
   | type       |                                                         |
   |            | Create new: Newly created parameter sheets.             |
   |            |                                                         |
   |            | Initialize: For Initialized parameter sheets            |
   |            |                                                         |
   |            | Edit: Edited parameter sheets.                          |
   +------------+---------------------------------------------------------+
   | Remarks    | Free description field.                                 |
   +------------+---------------------------------------------------------+

Check created parameter sheets
--------------------------------

| The following section describes the different patterns of parameter sheets that can be created depending on the values selected in the "Create Parameter sheet" menu group> "Define/Create parameter sheets"> "Parameter creation inforamtion" tab> "Basic information" area.

#. | **Data sheet**
   | A. Input menu group

#. | **Parameter sheet**
   | A. Input menu group
   | B. Susbtitute value auto registration menu group
   | C. Reference menu group
#. | **Parameter sheet & using bundle**
   | A. Input menu group
   | B. Susbtitute value auto registration menu group
   | C. Reference menu group

#. | **Parameter sheet & using host group**
   | A. Input menu group
   | B. Susbtitute value auto registration menu group
   | C. Reference menu group

.. figure:: /images/ja/menu_creation/menu_definition_and_create/selection_of_basic_information_frame.png
   :width: 9.68725in
   :height: 6.43354in
   :align: left
   :alt:  "Basic information" field selection

    "Basic information" field selection

1. Selecting "Datasheet" in the "Creation target" tab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Selecting "Data sheet" for the "Selection target" in the "Define/Create parameter sheets" (or Parameter sheet definition list menu) will create a data sheet when the "Create" button is clicked.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/data_sheet_creation.png
   :width: 9.54048in
   :height: 6.28686in
   :align: left
   :alt: Creating data sheet

   Creating data sheet

|  Check that the data sheet has been added in the menu group specified in the "Input (Menu group)" field.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_group_for_input.png
   :width: 9.29401in
   :height: 6.7088in
   :align: left
   :alt:  "Input" menu group

    "Input" menu group

A) Input menu group
*************************
Creates a data sheet that can be maintained (View/Update/Delete/Restore).

.. figure:: /images/ja/menu_creation/menu_definition_and_create/data_sheet_for_input.png
   :width: 9.90718in
   :height: 6.76682in
   :align: left
   :alt: Data sheet created under the Input menu group

   Data sheet created under the Input menu group

The items are as following

.. table:: Item list ( "Data sheet" input menu) 
    :widths: 1 1 1 4 1 1 1
    :align: left

    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | **Item**                          | **Description**              | **Input \ | **Input \    | **Restrictions**|
    |                                   |                              | required**| method**     |                 |
    |                                   |                              |           |              |                 |
    +=================+========+========+==============================+===========+==============+=================+
    | Parameter       | [Created item \ |  The item created in the \   | Depends o\| Depends on t\| Depends on the \|
    |                 | name]           | "Define/Create parameter \   | n the set\| he setings \ | settings of the\|
    |                 |                 | sheet" menu will be \        | tings of\ | of the creat\|  created item.  |
    |                 |                 | displayed.                   |  the crea\| ed item.     |                 |
    |                 |                 |                              | ted item. |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 |                 |                              |           |              |                 |
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | Remarks                           | Free description field.      | ー        | Manual       | Maximum length\ |
    |                                   |                              |           |              |  4000 bytes     |
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+

.. note:: | Data sheet are not linked to specified hosts or operations, meaning that Operation items will not be displayed.

.. note:: |  Data sheet menus will not be created under the "Substitute value auto registration" or "reference" menu groups.

2. Selecting "Parameter sheet (With host/operation)" in the "Creation target" tab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Selecting "Parameter sheet (With host/operation) as the "Creation target" in the "Define/Create parameter sheets" or "Parameter sheet definition list" menu creates a Parameter sheet.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parametersheet_with_host_operation_creation.png
   :width: 9.16042in
   :height: 6.37986in
   :align: left
   :alt: Creating parameter sheet

   Creating parameter sheet

|  Check that the created parameter sheet has been added to the following menu groups: "Input", "Substitute auto value registration" and "Reference".

.. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_group_for_input_sub_ref.png
   :width: 9.66197in
   :height: 6.38541in
   :align: left
   :alt:  "Input", "Substitute value auto registration" and "Reference" menu group

    "Input", "Substitute value auto registration" and "Reference" menu group

A) Input menu group
*************************

Creates a data sheet that can be maintained (View/Update/Delete/Restore).

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_for_input.gif
   :width: 9.06711in
   :height: 6.9135in
   :align: left
   :alt: Parameter sheet created under the Input menu group

   Parameter sheet created under the Input menu group

The item list is as following.

.. table:: Item list ( "Parameter sheet (With host/operation)" Input menu) 
    :widths: 1 1 1 4 1 1 1
    :align: left

    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | **Item**                          | **Description**              | **Input \ | **Input \    | **Restrictions**|
    |                                   |                              | required**| method**     |                 |
    |                                   |                              |           |              |                 |
    +=================+========+========+==============================+===========+==============+=================+
    | Host name                         | Select a host name regis\    | ○        | List \       | Is not displa\  |
    |                                   | tered in Ansible common \    |           | selection    | yed for parame\ |
    |                                   | --> Device list              |           |              | ter sheets (wit\|
    |                                   |                              |           |              | h operation).   |
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | Operation       | Operation name  | Select operation name regist\| ○        | List \       | ー              |
    |                 |                 | ered Basic console\          |           | selection    |                 |
    |                 |                 | --> Operation list.          |           |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
    |                 | Standard date\  | If there is a vlue in the se\| ー        | ー           | Automatically i\|
    |                 | /time           | lected operation's "Last exe\|           |              | nput based \    |
    |                 |                 | cuted date/time", that valu\ |           |              | on the operation|
    |                 |                 | e will be input. if not, th\ |           |              |                 |
    |                 |                 | e "Scheduled execution date\ |           |              |                 |
    |                 |                 |" value will be input.        |           |              |                 |
    |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
    |                 | Scheduled execu\| The selected operation's \   | ー        | ー           | Automatically i\|
    |                 | tion date       | scheduled execution date \   |           |              | nput based \    |
    |                 |                 | will be input.               |           |              | on the operation|
    |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
    |                 | Last executed \ | The selected operation's \   | ー        | ー           | Automatically i\|
    |                 | date/time       | last executed date/time \    |           |              | nput based \    |
    |                 |                 | will be input.               |           |              | on the operation|
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | Parameter       | [Name of create\|  The items created in the \  | Depends o\| Depends on \ | Depends on the \|
    |                 | d item]         | "Define/Create parameter she\| n the it\ | the item se\ | item settings.  |
    |                 |                 | ets" menu will be displayed. | em setti\ | ttings.      |                 |
    |                 |                 |                              | ngs.      |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 |                 |                              |           |              |                 |
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | Remarks                           | Free description field       | ー        | Manual       | Max length\     |
    |                                   |                              |           |              | 4000 bytes      |
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+

B) Susbtitute value auto registration menu group
***********************************

This menu is for view purposes only. Contents registered in the "Input" menu group is displayed in the "List" submenu.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_for_substitution_value_automatic_registration.png
   :width: 9.36046in
   :height: 6.50022in
   :align: left
   :alt: Parameter sheet in the Substitute value auto registration menu group

   Parameter sheet in the Substitute value auto registration menu group

C) Reference menu group
*************************

This menu is for view purposes only. The settings enabled at the time of the specified date and time in the "Operation: Reference date and time" column of the "Display Filter" sub menu will be displayed in the "List" sub menu.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_for_reference.png
   :width: 6.85384in
   :height: 6.91359in
   :align: left
   :alt: Parameter sheet in the Reference menu group

   Parameter sheet in the Reference menu group

.. note:: |  If the filter button is clicked when the "Operation: Reference date" field in the "Display filter" submenu is blank, only the latest data in the "Reference Date" field for each operation will be displayed in the "list" submenu.
          |
          | ※ If the Operation's "Last executed date/time" contains a value, the "Standard date/time" will take the same value. If the "Last executed data/time" contains no value, it will take from "Scheduled execution date".

3. Selecting "Parameter sheet (With operation)" in the "Creation target" tab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Selecting "Parameter sheet (With operation) as the "Creation target" in the "Define/Create parameter sheets" or "Parameter sheet definition list" menu creates a Parameter sheet.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parametersheet_with_operation_creation.png
   :width: 9.16042in
   :height: 6.37986in
   :align: left
   :alt: Creating parameter sheet

   Creating parameter sheet

|  Check that the created parameter sheet has been added to the following menu groups: "Input", "Substitute auto value registration" and "Reference".

.. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_group_for_input_sub_ref.png
   :width: 9.66197in
   :height: 6.38541in
   :align: left
   :alt:  "Input", "Substitute value auto registration" and "Reference" menu group

    "Input", "Substitute value auto registration" and "Reference" menu group

A) Input menu group
*************************

Creates a data sheet that can be maintained (View/Update/Delete/Restore).

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_for_operation_input.gif
   :width: 9.06711in
   :height: 6.9135in
   :align: left
   :alt: Parameter sheet created under the Input menu group

   Parameter sheet created under the Input menu group

The item list is as following.

.. table:: Item list ( "Parameter sheet (with operation) " Input menu) 
    :widths: 1 1 1 4 1 1 1
    :align: left

    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | **Item**                          | **Description**              | **Input \ | **Input \    | **Restrictions**|
    |                                   |                              | required**| method**     |                 |
    |                                   |                              |           |              |                 |
    +=================+========+========+==============================+===========+==============+=================+
    | Operation       | Operation name  | Select operation name regist\| ○        | List \       | ー              |
    |                 |                 | ered Basic console\          |           | selection    |                 |
    |                 |                 | --> Operation list.          |           |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
    |                 | Standard date\  | If there is a vlue in the se\| ー        | ー           | Automatically i\|
    |                 | /time           | lected operation's "Last exe\|           |              | nput based \    |
    |                 |                 | cuted date/time", that valu\ |           |              | on the operation|
    |                 |                 | e will be input. if not, th\ |           |              |                 |
    |                 |                 | e "Scheduled execution date\ |           |              |                 |
    |                 |                 |" value will be input.        |           |              |                 |
    |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
    |                 | Scheduled execu\| The selected operation's \   | ー        | ー           | Automatically i\|
    |                 | tion date       | scheduled execution date \   |           |              | nput based \    |
    |                 |                 | will be input.               |           |              | on the operation|
    |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
    |                 | Last executed \ | The selected operation's \   | ー        | ー           | Automatically i\|
    |                 | date/time       | last executed date/time \    |           |              | nput based \    |
    |                 |                 | will be input.               |           |              | on the operation|
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | Parameter       | [Name of create\|  The items created in the \  | Depends o\| Depends on \ | Depends on the \|
    |                 | d item]         | "Define/Create parameter she\| n the it\ | the item se\ | item settings.  |
    |                 |                 | ets" menu will be displayed. | em setti\ | ttings.      |                 |
    |                 |                 |                              | ngs.      |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 |                 |                              |           |              |                 |
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | Remarks                           | Free description field       | ー        | Manual       | Max length\     |
    |                                   |                              |           |              | 4000 bytes      |
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+

B) Substitute value auto registration menu group
***********************************

This menu is for view purposes only. Contents registered in the "Input" menu group is displayed in the "List" submenu.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_for_operation_substitution_value_automatic_registration.png
   :width: 9.36046in
   :height: 6.50022in
   :align: left
   :alt: Parameter sheet created under the Substitute auto registration value menu group

   Parameter sheet created under the Substitute auto registration value menu group

C) Referemce menu group
*************************

This menu is for view purposes only. The settings enabled at the time of the specified date and time in the "Operation: Reference date and time" column of the "Display Filter" sub menu will be displayed in the "List" sub menu.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_for_operation_reference.png
   :width: 6.85384in
   :height: 6.91359in
   :align: left
   :alt: Parameter sheet created under the Reference menu group

   Parameter sheet created under the Reference menu group

.. note:: | If the filter button is clicked when the "Operation: Reference date" field in the "Display filter" submenu is blank, only the latest data in the "Reference Date" field for each operation will be displayed in the "list" submenu.
          |
          | ※ If the Operation's "Last executed date/time" contains a value, the "Standard date/time" will take the same value. If the "Last executed data/time" contains no value, it will take from "Scheduled execution date".

4. Selecting "Parameter sheet" in the "Creation target" field and ticking the "Use bundle" checkbox
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Creating a parameter sheet(either "with host/operation" or "with operation") with the "Use bundle" checkbox ticked will create a parameter sheet in a bundled format.


.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_create_as_vertical_menu.png
   :width: 9.16042in
   :height: 6.37986in
   :align: left
   :alt: Creating Parameter sheet (using bundle)

   Creating Parameter sheet (using bundle)

 Check that the created parameter sheet has been added to the following menu groups: "Input", "Substitute auto value registration" and "Reference".

.. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_group_for_input_sub_ref.png
   :width: 9.66197in
   :height: 6.38541in
   :align: left
   :alt:  "Input", "Substitute value auto registration" and "Reference" menu group

    "Input", "Substitute value auto registration" and "Reference" menu group

A) Input menu group
*************************

| Creates a data sheet that can be maintained (View/Update/Delete/Restore).
|  In parameter sheets (with host/operation), it is possible to register multiple parameters for records with registered "host name" and "operation" combinations by using the "Substitute order" column.
|  In parameter sheets (with operation), it is possible to register multiple parameters for records with registered "operation" combinations by using the "Substitute order" column.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_for_input_2.gif
   :width: 9.06711in
   :height: 6.9135in
   :align: left
   :alt: Parameter sheet created under the Input menu group

   Parameter sheet created under the Input menu group

The item list is as following.

.. table:: Item list ( "Parameter sheet(using bundle)" Input menu) 
    :widths: 1 1 1 4 1 1 1
    :align: left

    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | **Item**                          | **Description**              | **Input \ | **Input \    | **Restrictions**|
    |                                   |                              | required**| method**     |                 |
    |                                   |                              |           |              |                 |
    +=================+========+========+==============================+===========+==============+=================+
    | Host name                         | Select a host name regis\    | ○        | List \       | Is not displa\  |
    |                                   | tered in Ansible common \    |           | selection    | yed for parame\ |
    |                                   | --> Device list              |           |              | ter sheets (wit\|
    |                                   |                              |           |              | h operation).   |
    |                                   |                              |           |              |                 |
    |                                   |                              |           |              |                 |
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | Operation       | Operation name  | Select operation name regist\| ○        | List \       | ー              |
    |                 |                 | ered Basic console\          |           | selection    |                 |
    |                 |                 | --> Operation list.          |           |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
    |                 | Standard date\  | If there is a vlue in the se\| ー        | ー           | Automatically i\|
    |                 | /time           | lected operation's "Last exe\|           |              | nput based \    |
    |                 |                 | cuted date/time", that valu\ |           |              | on the operation|
    |                 |                 | e will be input. if not, th\ |           |              |                 |
    |                 |                 | e "Scheduled execution date\ |           |              |                 |
    |                 |                 |" value will be input.        |           |              |                 |
    |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
    |                 | Scheduled execu\| The selected operation's \   | ー        | ー           | Automatically i\|
    |                 | tion date       | scheduled execution date \   |           |              | nput based \    |
    |                 |                 | will be input.               |           |              | on the operation|
    |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
    |                 | Last executed \ | The selected operation's \   | ー        | ー           | Automatically i\|
    |                 | date/time       | last executed date/time \    |           |              | nput based \    |
    |                 |                 | will be input.               |           |              | on the operation|
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | Susbtitute order                  |Input the substitute order.   | ー        | Manual       | Max length \    |
    |                                   |                              |           |              | 4000 bytes      |
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | Parameter       | [Name of create\|  The items created in the \  | Depends o\| Depends on \ | Depends on the \|
    |                 | d item]         | "Define/Create parameter she\| n the it\ | the item se\ | item settings.  |
    |                 |                 | ets" menu will be displayed. | em setti\ | ttings.      |                 |
    |                 |                 |                              | ngs.      |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 |                 |                              |           |              |                 |
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | Remarks                           | Free description field       | ー        | Manual       | Max length\     |
    |                                   |                              |           |              | 4000 bytes      |
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+


Example) If users attempts to register the information above without using bundles①
  | The user will not be able to register multiple parameters to registered "host name" and "operation" combinations.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_for_input_3.gif
   :width: 9.06711in
   :height: 6.9135in
   :align: left
   :alt: Parameter sheet created under the Input menu group

   Parameter sheet created under the Input menu group

.. note:: |  Trying to set 22.22.22.22 and "test2.com" while "11.11.11.11 and "test1.com" is already set for the combination of "host1" "ope_sample1" will cause an error.

Example) If users attempts to register the information above without using bundles
  | Whle the user can set multiple parameters for a registered combination of "host name " and "Operation" by increasing the number of items the parameter sheet will oriented horizontally and the visibility will be poor.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_defination_creation_menu.png
   :width: 9.16042in
   :height: 6.37986in
   :align: left
   :alt:  "Define/Create parameter sheets"

    "Define/Create parameter sheets"

.. note:: |  "Parameter sheet creation" menu group> "Define/Create parameter sheets"

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_for_input_4.gif
   :width: 9.06711in
   :height: 6.9135in
   :align: left
   :alt: Parameter sheet created under the Input menu group

   Parameter sheet created under the Input menu group

.. note:: | The example below creates items up until "IP_Address_3" and "Domain_3". Items later than that does not exist.
 | As those items does not exist, the user will not be able to register the contents("44.44.44.44" and "test4.com") for "IP_Address_4" and "Domain_4" for the same combination of host name and operation.

In order to create a parameter sheet with repeating items, use bundles (Data sheets cannot use bundles).

B) Substitute value auto registration menu group
***********************************

This menu is for view purposes only. Contents registered in the "Input" menu group is displayed in the "List" submenu.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_for_substitution_value_automatic_registration_2.png
   :width: 9.36046in
   :height: 6.50022in
   :align: left
   :alt: Parameter sheet created under the Substitute auto registration value menu group

   Parameter sheet created under the Substitute auto registration value menu group

C) Reference menu group
*************************

| This menu is for view purposes only. The settings enabled at the time of the specified date and time in the "Operation: Reference date and time" column of the "Display Filter" sub menu will be displayed in the "List" sub menu.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_for_reference_2.png
   :width: 9.85384in
   :height: 6.91359in
   :align: left
   :alt: Parameter sheet created under the Reference menu group

   Parameter sheet created under the Reference menu group

.. note:: |  For "Parameter sheet (with host/operation)", if the "Filter" button is pressed while in the "Display filter" submenu when the "Operation:Standard date/time" item is empty, The "Standard date/time" will only display the newest data per host name in the "list" submenu.
          |  For "Parameter sheet (with operation)", if the "Filter" button is pressed while in the "Display filter" submenu when the "Operation:Standard date/time" item is empty, The "Standard date/time" will only display the newest in the "list" submenu.
          |
          | ※ If the Operation's "Last executed date/time" contains a value, the "Standard date/time" will take the same value. If the "Last executed data/time" contains no value, it will take from "Scheduled execution date".


5. Selecting "Parameter sheet" in the "Creation target" field and ticking the "Use host group" checkbox
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| When creating Parameter sheets, select "Parameter sheet (with host/operation) for the the "Creation target" in the "Define/Create parameter sheets" ( or "Parameter sheet definition list") menu and tick the "Use" checkbox for "Use host group" to create a Parameter sheet for host groups.


.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_create_as_hostgroup.png
   :width: 9.16042in
   :height: 6.37986in
   :align: left
   :alt: Creating parameter sheet (using host group) 

   Creating parameter sheet (using host group) 

|  Check that the created parameter sheet has been added to the following menu groups: "Input", "Substitute value auto registration" and "Reference".

.. figure:: /images/ja/menu_creation/menu_definition_and_create/menu_group_for_input_sub_ref.png
   :width: 9.66197in
   :height: 6.38541in
   :align: left
   :alt:  "Input", "Substitute value auto registration" and "Reference" menu group

    "Input", "Substitute value auto registration" and "Reference" menu group

A) Input menu group
*************************

Creates a data sheet that can be maintained (View/Update/Delete/Restore) per host group and host name.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_as_hostgroup_for_input.gif
   :width: 9.06711in
   :height: 6.9135in
   :align: left
   :alt: Parameter sheet created under the Input menu group (Using host group) 

   Parameter sheet created under the Input menu group (Using host group) 

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parametersheet_hg_pulldown.png
   :align: left
   :alt: Pulldown values for host items when using host groups

   Pulldown values for host items when using host groups

The item list is as following.

.. table:: Item list ( "parameter sheet(using bundles)" Input menu) 
    :widths: 1 1 1 4 1 1 1
    :align: left

    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | **Item**                          | **Description**              | **Input \ | **Input \    | **Restrictions**|
    |                                   |                              | required**| method**     |                 |
    |                                   |                              |           |              |                 |
    +=================+========+========+==============================+===========+==============+=================+
    | Host name                         | Host name registered in Ansi\| ○        | List \       |                 |
    |                                   | ble common--> device list\   |           | selection    |                 |
    |                                   | or host group name register\ |           |              |                 |
    |                                   | ed in host group list \      |           |              |                 |
    |                                   | --> host group management.   |           |              |                 |
    |                                   |                              |           |              |                 |
    |                                   |                              |           |              |                 |
    |                                   |                              |           |              |                 |
    |                                   | Hosts will have [H] added to\|           |              |                 |
    |                                   | the start in the list selec¥ |           |              |                 |
    |                                   | tion. Host groups will have\ |           |              |                 |
    |                                   |  [HG] added.                 |           |              |                 |
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | Operation       | Operation name  | Select operation name regist\| ○        | List \       | ー              |
    |                 |                 | ered Basic console\          |           | selection    |                 |
    |                 |                 | --> Operation list.          |           |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
    |                 | Standard date\  | If there is a vlue in the se\| ー        | ー           | Automatically i\|
    |                 | /time           | lected operation's "Last exe\|           |              | nput based \    |
    |                 |                 | cuted date/time", that valu\ |           |              | on the operation|
    |                 |                 | e will be input. if not, th\ |           |              |                 |
    |                 |                 | e "Scheduled execution date\ |           |              |                 |
    |                 |                 |" value will be input.        |           |              |                 |
    |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
    |                 | Scheduled execu\| The selected operation's \   | ー        | ー           | Automatically i\|
    |                 | tion date       | scheduled execution date \   |           |              | nput based \    |
    |                 |                 | will be input.               |           |              | on the operation|
    |                 +--------+--------+------------------------------+-----------+--------------+-----------------+
    |                 | Last executed \ | The selected operation's \   | ー        | ー           | Automatically i\|
    |                 | date/time       | last executed date/time \    |           |              | nput based \    |
    |                 |                 | will be input.               |           |              | on the operation|
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | Parameter       | [Name of create\|  The items created in the \  | Depends o\| Depends on \ | Depends on the \|
    |                 | d item]         | "Define/Create parameter she\| n the it\ | the item se\ | item settings.  |
    |                 |                 | ets" menu will be displayed. | em setti\ | ttings.      |                 |
    |                 |                 |                              | ngs.      |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 |                 |                              |           |              |                 |
    |                 |                 |                              |           |              |                 |
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+
    | Remarks                           | Free description field       | ー        | Manual       | Max length\     |
    |                                   |                              |           |              | 4000 bytes      |
    +-----------------+--------+--------+------------------------------+-----------+--------------+-----------------+

.. note:: | If the parameter sheet is a "Parameter sheet( with host/operation)" and has "Use Host group" activated, the user will be able to select Host groups.
          | The Host group names will start with [HG], and Host names will start with [H].


B) Susbtitute value auto registration menu group
***********************************

This menu is for view purposes only. Contents registered in the "Input" menu group is displayed in the "List" submenu.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_for_substitution_value_automatic_registration.png
   :width: 9.36046in
   :height: 6.50022in
   :align: left
   :alt: Parameter sheet created under the Substitute auto registration value menu group

   Parameter sheet created under the Substitute auto registration value menu group

.. note:: |  If the parameter sheet is a "Parameter sheet( with host/operation)" and has "Use Host group" activated, the user can check data divided per host from host groups with ":ref:`host_group`".

C) Reference menu group
*************************

This menu is for view purposes only. The settings enabled at the time of the specified date and time in the "Operation: Reference date and time" column of the "Display Filter" sub menu will be displayed in the "List" sub menu.

.. figure:: /images/ja/menu_creation/menu_definition_and_create/parameter_sheet_for_reference.png
   :width: 6.85384in
   :height: 6.91359in
   :align: left
   :alt: Parameter sheet created under the Reference menu group

   Parameter sheet created under the Reference menu group

.. note:: |  For "Parameter sheet (with host/operation)", if the "Filter" button is pressed while in the "Display filter" submenu when the "Operation:Standard date/time" item is empty, The "Standard date/time" will only display the newest data per host name in the "list" submenu.
          |  If the parameter sheet is a "Parameter sheet( with host/operation)" and has "Use Host group" activated, the user can check data divided per host from host groups ":ref:`host_group`".
          |
          | ※ If the Operation's "Last executed date/time" contains a value, the "Standard date/time" will take the same value. If the "Last executed data/time" contains no value, it will take from "Scheduled execution date".

 "Create Parameter sheet" hidden menus
======================================================================

.. _registering_column_g:

 Registering column group in the "Column group management" menu
----------------------------------------------------

| The "Column group management" menu is hidden by default. This menu allows users to maintain parameter sheets' column group.

.. figure:: /images/ja/menu_creation/calam_group_creation_list/column_group_list_menu.png
   :width: 9.5739in
   :height: 6.92692in
   :align: left
   :alt: "Column group management" menu

    "Column group management" menu

| A column group is a group that contains the header section of items in parameter sheets.
| The Parameter sheet creation function allows users to create the column group of the items they are creating in the parameter sheet.
| The are marked with red is an example of a column group.

.. figure:: /images/ja/menu_creation/calam_group_creation_list/column_group_for_input.png
   :width: 9.78717in
   :height: 6.74024in
   :align: left
   :alt: Parameter sheet created under the Input menu group

   Parameter sheet created under the Input menu group

.. table::  "Column group management" menu setting values
   :align: left

   +------------+---------------------------------------------------------+
   | **Setting\ | **Description**                                         |
   | area**     |                                                         |
   +============+=========================================================+
   | Parent col\| Select the parent column group from the pulldown select\|
   | lmn group \| ion.                                                    |
   | name       | ※Displayed in the "List/Update" submenu's "Update" but\|
   |            |ton and "Register" submenu.                              |
   +------------+---------------------------------------------------------+
   | Column gro\| Input the name of the column group (Japanese).          |
   | up name \  | The item cannot include "/(slash)" or "\\ (backslash)". |
   | (ja)       |                                                         |
   |            | ※Displayed in the "List/Update" submenu's "Update" but\|
   |            | ton and "Register" submenu.                             |
   +------------+---------------------------------------------------------+
   | Column gro\| Input the name of the column group (English).           |
   | up name \  | The item cannot include "/(slash)" or "\\ (backslash)". |
   | (en)       |                                                         |
   |            | ※Displayed in the "List/Update" submenu's "Update" but\|
   |            | ton and "Register" submenu.                             |
   +------------+---------------------------------------------------------+
   | Full colom\| Displays both the group column name and the column name\|
   | n group na\|  connected with a "/"(Japanese).                        |
   | me (ja)    |                                                         |
   |            | ※Displayed in the "List/Update" submenu's "Update" but\|
   |            | ton and "Register" submenu.                             |
   +------------+---------------------------------------------------------+
   | Full colom\| Displays both the group column name and the column name\|
   | n group na\|  connected with a "/"(English).                         |
   | me (en)    |                                                         |
   |            | ※Displayed in the "List/Update" submenu's "Update" but\|
   |            | ton and "Register" submenu.                             |
   +------------+---------------------------------------------------------+
   | Remarks    | Free description field.                                 |
   +------------+---------------------------------------------------------+

| The system checks for the following when items are updated/deleted.

#. | The data itself cannot be selected in the parent column group.
#. | It is not possible to delete items when specifying parent groups for other data.
#. | It is not possible to configure a parent-child relationship that loops.
   |  (E.g. if a relation ship goes like this: A⇒B⇒C, C cannot be the parent of A) 

.. _registering_menu_items:

 Registering items configured to the "Parameter sheet item creation information" menu
------------------------------------------------------------

| The "Parameter sheet item creation information" is hidden by default.
| This menu allows users to maintain items managed in Parameter sheets and data sheets.XXX

.. figure:: /images/ja/menu_creation/menu_item_creation_info/menu_item_creation_information_menu.png
   :width: 9.25388in
   :height: 6.76691in
   :align: left
   :alt:  "Parameter sheet item creation information" menu

    "Parameter sheet item creation information" menu
.. table:: "Parameter sheet item creation information" menu setting values
   :align: left

   +-----------------+-----------------------------------------------------------+
   | **Setting area**| **Description**                                           |
   |                 |                                                           |
   +=================+===========================================================+
   | Parameter sheet\| Select the parameter sheet that will link with the item\  |
   | name            | from the pulldown selection                               |
   |                 |                                                           |
   +-----------------+-----------------------------------------------------------+
   | Item name(ja)   | Input the item name that will display in the parameter\   |
   |                 | sheet (Japanese).                                         |
   |                 |                                                           |
   |                 | Item names cannot contain "/ (Slash)" or "\\ (Backslash)  |
   |                 |                                                           |
   +-----------------+-----------------------------------------------------------+
   | Item name(en)   | Input the item name that will display in the parameter\   |
   |                 | sheet (Japanese).                                         |
   |                 |                                                           |
   |                 | Item names cannot contain "/ (Slash)" or "\\ (Backslash)  |
   |                 |                                                           |
   +-----------------+-----------------------------------------------------------+
   | Item name(rest) | Input the item name that will be used by RESTAPI.         |
   |                 |                                                           |
   |                 | Can only contain half-width roman letters and "_-".       |
   |                 |                                                           |
   +-----------------+-----------------------------------------------------------+
   | Description\    | Input the description that will be displayed whenever \   |
   |                 | a mouse hovers over the item (Japanese)                   |
   | (ja)            |                                                           |
   +-----------------+-----------------------------------------------------------+
   | Description\    | Input the description that will be displayed whenever \   |
   |                 | a mouse hovers over the item (English)                    |
   | (en)            |                                                           |
   +-----------------+-----------------------------------------------------------+
   | Column group\   | Select the belonging column group.                        |
   |                 |                                                           |
   |                 |                                                           |
   |                 |                                                           |
   |                 |                                                           |
   |                 |                                                           |
   +-----------------+-----------------------------------------------------------+
   | Column class    |  Select one of the following: \                           |
   |                 |   "SingleTextColumn", "MultiTextColumn",\                 |
   |                 |  "NumColumn", "FloatColumn", "DateTimeColumn" \           |
   |                 |  "DateColumn", "IDColumn", "PasswordColumn",\             |
   |                 |  "FileUploadColumn", "HostInsideLinkTextColumn",\         |
   |                 |  "ParameterSheetReference" \                              |
   |                 |                                                           |
   |                 |                                                           |
   |                 | If "SingleTextColumn" is selected, \                      |
   |                 | The item will be a text box that can only contain 1 line. |
   |                 |                                                           |
   |                 | If "MultiTextColumn" is selected, \                       |
   |                 | The item will be a text box that can contain multiple\    |
   |                 |  lines.                                                   |
   |                 |                                                           |
   |                 | If "NumColumn"is selected, the item will be a text box\   |
   |                 | that can only contain integers.                           |
   |                 |                                                           |
   |                 |  If "FloatColumn"is selected, the item will be a text box\|
   |                 | that can only contain float numbers (decimals).           |
   |                 |                                                           |
   |                 | If "DateTimeColumn" and "DateColumn" \                    |
   |                 | is selected, \                                            |
   |                 | the item will be a calendar box.                          |
   |                 |                                                           |
   |                 | If "IDColumn" is selected, the item will be a pulldown \  |
   |                 | selection. It is also possible to display records from \  |
   |                 | the same lines selected from "pulldown selections" by\    |
   |                 |  using "Reference item"                                   |
   |                 |                                                           |
   |                 | If "PasswordColumn" is selected,  the item will be a text\|
   |                 |  box where the text is hidden by "*" marks.\              |
   |                 |  (Pressing the eye icon within the box will display \     |
   |                 | the text).                                                |
   |                 |                                                           |
   |                 | If "FileUploadColumn" is selected, the item will be a \   |
   |                 | button where the user can browse and \                    |
   |                 | upload files to the record.\                              |
   |                 |                                                           |
   |                 | The item will display an URL to the file.                 |
   |                 |                                                           |
   |                 | If "HostInsideLinkTextColumn" is selected, the item will \|
   |                 | be a text box that displays the input URL as a link.      |
   |                 |                                                           |
   |                 | If "ParameterSheetReference" displays data values matchin\|
   |                 | g the operations when the selected item is from a paramet\|
   |                 | er sheet(with operation) and data is registered to it.    |
   |                 |                                                           |
   |                 | ※Substitute value automatic registration settings link  \|
   |                 | target items are the following:\                          |
   |                 | "String (single line)", "String (multiple lines)", \      |
   |                 | "Integer", "Decimal", "Password" and "Link" .             |
   |                 |                                                           |
   |                 |  The following items will not link.: "Time/date", "Date"\ |
   |                 | , and "File upload"."Date/time" and "Date" will not link\ |
   |                 |  if selected from pulldown selections.\                   |
   |                 | "Date/time" and "Date" will not link if selected\         |
   |                 |  from pulldown selections.                                |
   +-----------------+-----------------------------------------------------------+
   | Display order   | Input the display order of the column.\                   |
   |                 | They are displayed in ascending order.                    |
   |                 |                                                           |
   |                 |                                                           |
   +-----------------+-----------------------------------------------------------+
   | Required        | Select "True" from the pulldown menu in order to make it \|
   |                 |  a required item.                                         |
   +-----------------+-----------------------------------------------------------+
   | Unique一\       | Select "True" from the pulldown menu in order to make it \|
   | restriction     | an Unique restricted item.                                |
   |                 |                                                           |
   |                 |                                                           |
   +-----------------+-----------------------------------------------------------+
   | Remarks         | Free description field.                                   |
   |                 |                                                           |
   +-----------------+-----------------------------------------------------------+

 Registering Unique restrictions (multiple items) configured in the "Unique restrictions (multiple items) creation information" menu
------------------------------------------------------------------------

| The "Unique restrictions (multiple items)" menu is hidden by default.
| This menu allows users to maintain the parameter sheets' unique restrictions (multiple items)'s creation information.

.. figure:: /images/ja/menu_creation/unique_constraint_creation_info/unique_constraint_multiple_items_creation_information_menu.png
   :width: 9.16154in
   :height: 6.98153in
   :align: left
   :alt:  "Unique restrictions (multiple items)" menu

    ""Unique restrictions (multiple items)" menu

.. table:: "Unique restrictions (multiple items)" menu setting values
   :align: left

   +----------------+-----------------------------------------------------+
   | **Setting ite\ | **Description**                                     |
   | m**            |                                                     |
   +================+=====================================================+
   | Parameter she\ | Select the menu’s unique constraint you want to \  |
   | et name        | configure by choosing from the pulldown menu.       |
   +----------------+-----------------------------------------------------+
   | Unique restri\ | Input the combination of items for the unique cons\ |
   | ction (multipl\| traint. Separate the item IDs by commas.            |
   | e items)       |                                                     |
   |                | The item names(rest) from the selected parameter \  |
   |                | sheet name is listed with their combinations.       |
   |                |                                                     |
   |                |                                                     |
   |                | E.g.: If unique restriction (multiple items) is set\|
   |                |  for "item_1 and item_2" and "item_3 and item_4".   |
   |                |                                                     |
   |                |  [["item_1", "item_2"], ["item_3", "item_4"]]       |
   |                |                                                     |
   +----------------+-----------------------------------------------------+


 Registering roles configured in the "Parameter sheet role creation information" menu
----------------------------------------------------------------

| The "Parameter sheet role creation information" menu is hidden by default.
| This menu allows users to maintain parameter sheets' parameter sheet role creation information.

.. _registering_menu_role:

.. figure:: /images/ja/menu_creation/menu_role_creation_info/menu_role_information_menu.png
   :width: 9.16154in
   :height: 6.98153in
   :align: left
   :alt:  "Parameter sheet role creation information" menu

    "Parameter sheet role creation information" menu

.. table:: "Parameter sheet role creation information" menu setting values
   :align: left

   +----------------+-----------------------------------------------------+
   | **Setting\     | **Description**                                     |
   |  item**        |                                                     |
   +================+=====================================================+
   | Parameter shee\| Select parameter sheet that will configure the para\|
   | t name         | meter sheet role creation information from the pull\|
   |                | down selection                                      |
   +----------------+-----------------------------------------------------+
   | Role           | Select the role that will be linked to the selected\|
   |                | parameter sheet.                                    |
   +----------------+-----------------------------------------------------+

Appendix
====

.. _mapping_menu_table:

Parameter sheet definition - table link management
-------------------------------------

| This menu displayes the link between created parameter sheets and DB tables.
| This menu is hidden by default.                                  
| This menu is used by Backyard and cannot be operated by users.
| Changing the link right after the parameter sheet is created will not change this menu.

.. figure:: /images/ja/menu_creation/menu_definition_table_link/menu_table_link.png
   :width: 9.69236in
   :height: 6.09931in
   :align: left
   :alt: Parameter sheet definition - table link management

   Parameter sheet definition - table link management

.. table:: Setting item list
   :align: left

   +--------------------+-------------------------------------------------+
   | **Item name**      | **Description**                                 |
   +====================+=================================================+
   | Parameter sheet \  | Name of the parameter sheet linked to DB        |
   | name               |                                                 |
   +--------------------+-------------------------------------------------+
   | Parameter sheet \  | Rest name of the parameter sheet linked to DB   |
   | name (rest)        |                                                 |
   +--------------------+-------------------------------------------------+
   | Table name         | Name of the created table                       |
   +--------------------+-------------------------------------------------+
   | Main key           | Main key of the created table                   |
   +--------------------+-------------------------------------------------+
   | Table name \       | History table name of the created table         |
   | (history)          |                                                 |
   +--------------------+-------------------------------------------------+
   | Remarks            | Free description field.                         |
   +--------------------+-------------------------------------------------+

.. _work_with_other_table:

Link with other menus
--------------

| This menu is configured by default and displays links between DP tables, Items, and Menu groups from created parameter sheets.
| This menu is hidden by default.                                
| This menu is used by Backyard and cannot be operated by users.
| Even if a Parameter sheet is linked after being created, the data in this menu will not be edited.

.. figure:: /images/ja/menu_creation/other_menu_link/link_with_other_menus.png
   :width: 9.69236in
   :height: 6.84583in
   :align: left
   :alt: Link with other menus

   Link with other menus

.. table:: Setting item list
   :align: left

   +--------------------+-------------------------------------------------+
   | **Item name**      | **Description**                                 |
   +====================+=================================================+
   | Menu group name    | Name of the menu group linked to DB.            |
   +--------------------+-------------------------------------------------+
   | Menu name          | Name of the created parameter/data sheet.\      |
   |                    |                                                 |
   +--------------------+-------------------------------------------------+
   | Menu name(rest)    | rest name of the created menu.                  |
   +--------------------+-------------------------------------------------+
   | Item name(ja)      | Japanese name of the created item.              |
   +--------------------+-------------------------------------------------+
   | Item name(en)      | English name of the created item.               |
   +--------------------+-------------------------------------------------+
   | Menu group name: \ | Created Menu group name: Menu name: Item name \ |
   | Menu name \        | in Japanese.                                    |
   | :Item name(ja)     |                                                 |
   +--------------------+-------------------------------------------------+
   | Menu group name: \ | Created Menu group name: Menu name: Item name \ |
   | Menu name \        | in Japanese.                                    |
   | :Item name(en)     |                                                 |
   +--------------------+-------------------------------------------------+
   | ID link table      | Name of the link table.                         |
   +--------------------+-------------------------------------------------+
   | ID link table PK   | Link destination link table.                    |
   +--------------------+-------------------------------------------------+
   | ID link item name  | Name of the link item.                          |
   +--------------------+-------------------------------------------------+
   | ID link item name \| rest name of the link item.                     |
   |(rest):Item name(ja)|                                                 |
   +--------------------+-------------------------------------------------+
   | ID link sort       | The sort conditions of the ID link.             |
   | condition          |                                                 |
   +--------------------+-------------------------------------------------+
   | ID link Multilingu\| Set to "True" for multilingual support.         |
   | al support         |                                                 |
   +--------------------+-------------------------------------------------+
   | Column class       | Link destination target Coloumn class.          |
   +--------------------+-------------------------------------------------+
   | Parameter sheet Cr\| Set to "True" for parameter sheet creation targ\|
   | eation target flag | ets.                                            |
   +--------------------+-------------------------------------------------+
   | Remarks            | Free description field.                         |
   +--------------------+-------------------------------------------------+

.. _selection1:

Selection 1
-----

| Menu that manages items used in pulldown selections.(1st selections)
| This menu is hidden by default.                                  
| This menu cannot be operated by users.

.. figure:: /images/ja/menu_creation/selection_1/selection_1.png
   :width: 9.69236in
   :height: 6.36597in
   :align: left
   :alt: Selection 1

   Selection 1

.. table:: Item list
   :align: left

   +--------------------+-------------------------------------------------+
   | **Item name**      | **Description**                                 |
   +====================+=================================================+
   | \*-(Blank)         | Item for using "*" in pulldown selections.      |
   +--------------------+-------------------------------------------------+

.. _selection2:

Selection 2
-----

| Menu that manages items used in pulldown selections.(2nd selections)
| This menu is hidden by default.                                  
| This menu cannot be operated by users.

.. figure:: /images/ja/menu_creation/selection_2/selection_2.png
   :width: 9.69236in
   :height: 6.3125in
   :align: left
   :alt: Selection 2

   Selection 2

.. table:: Item list
   :align: left

   +--------------------+-------------------------------------------------+
   | **Item name**      | **Description**                                 |
   +====================+=================================================+
   | Yes-No             | Item for using "Yes" or "No" in pulldown select\|
   |                    | ions.                                           |
   +--------------------+-------------------------------------------------+
   | True-False         | Item for using "True" or "False" in pulldown se\|
   |                    | lections.                                       |
   +--------------------+-------------------------------------------------+

.. _target_available:

 Usable "Selection items" in "Pulldown selections"
--------------------------------------------------------

| The "Pulldown selection" can use the following "Selection items"

.. table:: Item list
   :align: left

   +-------------+--------------+-----------------+----------------------+
   | **Menu \    | **Menu**     | **Item**        | **Remarks**          |
   | group**     |              |                 |                      |
   +=============+==============+=================+======================+
   | Management \| Menu \       | Menu group name\|                      |
   | console     | management   |  + Menu name\   |                      |
   |             |              |                 |                      |
   +-------------+--------------+-----------------+----------------------+
   | Basic conso\| Operation \  | Operation name  |                      |
   | le          | list         |                 |                      |
   |             +--------------+-----------------+----------------------+
   |             | Movement list| Movement name   |                      |
   +-------------+--------------+-----------------+----------------------+
   | Ansible \   | Device list  | Host name       |                      |
   | common      |              |                 |                      |
   |             |              |                 |                      |
   |             +--------------+-----------------+----------------------+
   |             | File \       | File embedded \ |                      |
   |             | management   | variable name   |                      |
   |             +--------------+-----------------+----------------------+
   |             | Template \   | Template embedd\|                      |
   |             | management   | ed variable name|                      |
   +-------------+--------------+-----------------+----------------------+
   | Conductor   | Conduct\     | Conductor name  |                      |
   |             | or list      |                 |                      |
   +-------------+--------------+-----------------+----------------------+
   | Create para\| Selection 1  | \*-(blank)      |                      |
   | meter sheet |              |                 |                      |
   +-------------+--------------+-----------------+----------------------+
   | Create para\| Selection 2  | True-False      |                      |
   | meter sheet |              |                 |                      |
   +-------------+--------------+-----------------+----------------------+
   | Create para\| Selection 2  | Yes-No          |                      |
   | meter sheet |              |                 |                      |
   +-------------+--------------+-----------------+----------------------+


|Additionaly, the following items from created menus (Parameter sheets/Data sheets) can also be used if they have both "Required" and "Unique restriction" set to them: "String (single line)", "String (multiple lines)", "Integer", "Decimal", "Date/time" "Date" and "Link".

.. _reference_item:

 "Reference items" when using "Pulldown selections
----------------------------------------------

| When using "Pulldown selection" items, users can display different items based on the selected value.
| If the user has selected "Pulldown selection", users can press the "Select reference item" button to select what menu they want to reference items from.
| Tick the checkbox for the target items and press "OK" to input the values into the "Reference item".

.. figure:: /images/ja/menu_creation/menu_definition_and_create/reference_items_when_using_pulldown_selection.gif
   :width: 9.40859in
   :height: 6.05379in
   :align: left
   :alt: "Reference items" when using "Pulldown selections

    "Reference items" when using "Pulldown selections

|  Items that can be used as "Reference" items are as follows.

.. table:: Item list
   :align: left

   +---------------------------+----------+------------+------------------+----------------+
   | **Selection item**        | **Menu** | **Item \   | **Item name \    | **remarks**    |
   |                           |          | name**     | (rest)**         |                |
   +===========================+==========+============+==================+================+
   | Management console: \     | Menu man\| Menu name\ | menu_name_rest   |                |
   | menu management: Menu name| agement  |  (rest)    |                  |                |
   +---------------------------+----------+------------+------------------+----------------+
   | Ansible common: \         | Device l\| DNS host \ | host_dns_name    |                |
   | device list: host name    | ist      | name       |                  |                |
   |                           |          +------------+------------------+----------------+
   |                           |          | IP address | ip_address       |                |
   |                           |          +------------+------------------+----------------+
   |                           |          | User       | login_user       |                |
   |                           |          +------------+------------------+----------------+
   |                           |          | Password   | login_password   |                |
   +---------------------------+----------+------------+------------------+----------------+

| When the "Selection item" is a menu created using the "Create Parameter" function, the other column classes (string(single line), string(multiple lines), Integer, Float, Date/time, Date, Password, File upload, Link) are also target for the selection item.
| Creating a Parameter sheet with a "Reference item" selected, the "Register" will only display the Pulldown item field in the "Input" menu group, but pressing the "List/Update" button displays records on the same line as the value configured to the "Pulldown selection". 

.. figure:: /images/ja/menu_creation/menu_definition_and_create/reference_items_when_using_pulldown_selection_2.gif
   :width: 9.75315in
   :height: 6.85225in
   :align: left
   :alt:  "Reference items" when using "Pulldown selections"

    "Reference items" when using "Pulldown selections"
|  Displaying a menu created in the "Substitute value auto registration" or "Reference" menu group with the "List" button will also display the "Reference" item values.
|  "Reference" items displayed in menu groups created in the "Substitute value auto registration" menu group can be used the same as standard values in the different driver's "Substitute value automatic registration settings" menu.

.. _info_item_ro:

Reference item information
------------

| "Define/Create parameter sheets"
| This menu is hidden by default.                                  
| This menu is used by Backyard and cannot be operated by users.

.. figure:: /images/ja/menu_creation/refeerence_item_info/reference_item_info_menu.png
   :width: 9.68058in
   :height: 6.52697in
   :align: left
   :alt:  "Define/Create parameter sheets"

    "Define/Create parameter sheets"

.. table:: Item list
   :align: left

   +--------------------+-------------------------------------------------+
   | **Item name**      | **Description**                                 |
   +====================+=================================================+
   | Link ID with other\| ID of the reference source menu                 |
   |  menus             |                                                 |
   +--------------------+-------------------------------------------------+
   | Menu group name    | Name of the reference source target menu group  |
   +--------------------+-------------------------------------------------+
   | Menu name          | Name of the reference source target menu.       |
   +--------------------+-------------------------------------------------+
   | Display order      | Display order when selecting reference items. \ |
   |                    | Displayed in ascending order.                   |
   +--------------------+-------------------------------------------------+
   | Column class       | Reference source table's column class.          |
   +--------------------+-------------------------------------------------+
   | Item name(ja)      | Reference source item name (Japanese).          |
   +--------------------+-------------------------------------------------+
   | Item name(en)      | Reference source item name (English).           |
   +--------------------+-------------------------------------------------+
   | Item name(rest)    | Reference source item name (REST).              |
   +--------------------+-------------------------------------------------+
   | Column group       | Reference source column group.                  |
   +--------------------+-------------------------------------------------+
   | ID link table      | Reference source table name.                    |
   +--------------------+-------------------------------------------------+
   | ID link table PK   | Reference source table PK.                      |
   +--------------------+-------------------------------------------------+
   | ID link item name  | Reference source table's item name.             |
   +--------------------+-------------------------------------------------+
   | ID link item name\ | Reference source table's item name(REST).       |
   |                    |                                                 |
   +--------------------+-------------------------------------------------+
   | ID link sort condi\| Sord condition for the ID link.                 |
   | tions(REST)        |                                                 |
   +--------------------+-------------------------------------------------+
   | ID link multilangu\| Set to "True" if the reference source is \      |
   | age support        | multilingual supported.                         |
   +--------------------+-------------------------------------------------+
   | Sensitive settings | Set to "True" if the reference source target \  |
   |                    | item is "Password".                             |
   +--------------------+-------------------------------------------------+
   | Parameter sheet c\ | Set to "True" if the item is "Parameter \       |
   | reation target flag| creation target".                               |
   +--------------------+-------------------------------------------------+
   | Description(ja)    | Description for the target reference source.    |
   +--------------------+-------------------------------------------------+
   | Description(en)    | Description for the target reference source.    |
   +--------------------+-------------------------------------------------+
   | Remarks            | Free description field.                         |
   +--------------------+-------------------------------------------------+


.. _delete_restore_parameter_sheet:

Deleting/Restoring created parameter sheets
-------------------------------------------------------

| This section describes how to delete(delete logic) and restore created parameter sheets.

#. Access the :menuselection:`Management console --> Menu management` page.

#. Press the :guilabel:`Filter` button and use the following items to search for the target parameter sheet.

   - :menuselection:`Menu name(ja)` 
   - :menuselection:`Menu name(en)` 
   - :menuselection:`Menu name(rest)`

#. Press the :guilabel:`Edit` button to restore/delete the target parameter sheet.


Menus that can be deleted/restored are the ones that belongs to the menu groups that was specified when creating the parameter sheet.

:menuselection:`Create parameter sheet --> Define/Create parameter sheets  Target menu group` 

.. figure:: /images/ja/menu_creation/discard_restore_menu/menu_create_menu_groups_v2-4.drawio.png
   :width: 9.68058in
   :height: 6.52697in
   :align: left
   :alt: Target parameter sheet and menu group
   
.. tabs::

   .. tab:: Delete

      Select the Parameter sheet in the :menuselection:`Management console --> Menu management` menu and delete it.

      .. figure:: /images/ja/menu_creation/discard_restore_menu/menu_list_discard_v2-4.drawio.png
         :width: 9.68058in
         :height: 6.52697in
         :align: left
         :alt: Deleting parameter sheets

   .. tab:: Restore

      Select the Parameter sheet in the :menuselection:`Management console --> Menu management` menu and restore it.

      .. figure:: /images/ja/menu_creation/discard_restore_menu/menu_list_restore_v2-4.drawio.png
         :width: 9.68058in
         :height: 6.52697in
         :align: left
         :alt: Restoring parameter sheets


.. figure:: /images/ja/menu_creation/discard_restore_menu/parametersheet_list_1_v2-4.drawio.png
   :width: 9.68058in
   :height: 6.52697in
   :align: left
   :alt: Menu after deleting parameter sheets
   
   
.. warning::
   | Deleted parameter sheets can no longer be used.
   | If the parmeter sheets' pulldown item or reference items are used, an ID conversion failure (X) will occur.
   | If the parameter shete is used in the different drivers' :menuselection:`Susbtitute value auto registration` menu, an ID conversion failure (X) will occur.
   | Similarly, the same will happen for items that references deleted parameter sheets' menu name and item names.
