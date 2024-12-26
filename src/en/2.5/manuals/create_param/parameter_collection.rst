============
Parameter collection
============

Introduction
========

| This document aims to explain how to operate the ITA Parameter collection function.

Parameter collection overview
==================

| This section explains the Parameter collection function.

Parameter collection
------------

Function
^^^^^^^^^^^^

| The parameter collection function acclows users to acquire multiple parameter sheets created with the :menuselection:`Create parameter sheet` menu based on search functions, and register data to parameter sheets.


Parameter collection menu/page structure
================================

| This section explains the Parameter collection function's menus and page structure.

Menu list
-------------

| The Parameter collection function's menus are as following.

.. list-table:: ITA menu list
   :header-rows: 1
   :align: left

   * - No
     - Menu/Page
     - Description
   * - 1
     - Parameter collection
     - Can acquire multiple created parameter sheets based on search requirements and register data to parameter sheets.


Function/Operation 
==================

Parameter display
--------------

| Acquires parameter sheets based on search requirements.

.. figure:: /images/ja/parameter_collection/initial_display.png
   :width: 800px
   :alt: Parameter collection default display
   :align: center

   Parameter collection default display

| (1) ①Select Parameter mode.
| The parameter modes are as following.

.. list-table:: Parameter mode list
   :header-rows: 1
   :align: left

   * - Name
     - Description
   * - Host
     - Select 1 host to link with the parameter sheet and acquire multiple operation data from the parameter sheets based on said host.
   * - Operation
     - Select 1 host to link with the parameter sheet and acquire multiple host data from the parameter sheets based on the operation.

| (2) ②Select Operation.
| Select an Operation from the operation time line.
| If the Parameter mode is set to "Host", select multiple operations.
| If the Parameter mode is set to "Operation", select 1 operation.

| (3) ③Select target parameter.
| Click the :guilabel:`Select` button and select a parameter from the parameter sheet list.
| Parameter sheets that can be selected must have their "link" item in the :menuselection:`Role/Menu link management` menu set to either "Edit" or "View only".
| Select substitute value auto registration parameter sheet if the Parameter sheets uses host groups.
| The order of the selected parameter sheets can be changed by dragging and dropping them.
| Clicking the :guilabel:`Clear` button unselects the parameter sheets.

| (4) ④Select target host.
| Click the :guilabel:`Select` button and select a host from the host list.
| If the Parameter mode is set to "Host", select a single host (includes "No host") from the selected host.
| If the Parameter mode is set to "Operation", the selected host will be the target選択したホストは取得対象となり、ホスト無しを取得対象とするか選択します。
| Displays the target hosts in the order they were selected.
| Only hosts that have been registered to the parameter sheet can be selected.
| Clicking the :guilabel:`Clear` button unselects the selected hosts.

| (5) ⑤Display parameter
| Click the :guilabel:`Display Parameter` button to display the parameters.
| If the Parameter mode is set to "Host", item values for each of the parameter sheets will be displayed for each operation.
| If the Parameter mode is set to "Operation", the Parameter sheets' item values will be displayed for each host.
| The Display order is the same as the Target parameters.
| If the Parameter mode is set to "Operation", the display order for Hosts will be the same as the target hosts ("No host" will come last).

.. note::
   | Parameters will be displayed automatically if the following requirements are met.
   | ①When a target host is selected when both Parameter mode and target parameter is selected.
   | ②When a target parameter is selected when both Parameter mode and target host is selected.
   | ③When changing an operation when the Parameter mode is set to "Operation" and both target parameter and target host is selected.

.. figure:: /images/ja/parameter_collection/mode_host_execute.png
   :width: 800px
   :alt: Displaying parameters when Parameter mode is "Host"
   :align: center

   Displaying parameters when Parameter mode is "Host"

.. figure:: /images/ja/parameter_collection/mode_operation_execute.png
   :width: 800px                                    
   :alt: Displaying parameters when Parameter mode is "Operation"
   :align: center

   Displaying parameters when Parameter mode is "Operation"

Parameter item display direction settings
--------------------------

| (1) Select which direction the Parameter sheet items are displayed in.
| Click the :guilabel:`Display settings` button and to select the display direction (horizontal or vertical).

.. figure:: /images/ja/parameter_collection/display_setting.gif
   :width: 800px
   :alt: Parameter item display direction settings
   :align: center

   Parameter item display direction settings
   
Registering presets
--------------

| (1) Allows users to register search requirements as presets.
| Click the :guilabel:`Register Preset` button.
| After inputting a name, click the :guilabel:`Register Preset` button to save the current search requirements as a preset.
| Selecting a registered preset will reopen the page with the preset configured.
| Users can update, change the name and delete registered presets.
| Presets are registered per workspace.

.. figure:: /images/ja/parameter_collection/preset.gif
   :width: 800px
   :alt: preset registration
   :align: center

   preset registration

Operatiom timeline display settings
----------------------------------

| (1) Allows users to configure whether to display or hide the operation timeline.
| Click the :guilabel:`Operation timeline` button to select whether to display or hide the operation timeline.

.. figure:: /images/ja/parameter_collection/operation_timeline.gif
   :width: 800px
   :alt: Operatiom timeline display settings page
   :align: center

   Operatiom timeline display settings page

Editing Parameter sheets（Register/Update/Delete/Restore）
-----------------------------------------------------

| (1) Allows users to edit the Parameter sheet data（Register/Update/Delete/Restore）.
| Click the "Edit Parameter" button after the parameters have been displayed.
| Note that the initial display is filtered with search conditions.
| The "Link" item in the :menuselection:`Role/Menu link list` menu can only be viewed.
| Parameter sheets that uses Host groups will have their "Input" parameter sheet displayed.

.. figure:: /images/ja/parameter_collection/parameter_maintanance.gif
   :width: 800px
   :alt: Parameter sheet edit page
   :align: center

   Parameter sheet edit page

Print parameter display results
--------------------------------
| (1) Allows users to print out the parameter display results.
| After displaying the parameters, click the print tab.

.. figure:: /images/ja/parameter_collection/print.png
   :width: 800px
   :alt: Print tab
   :align: center

   Print tab

.. note::
   | Depending on the results, the width might be cut off.
   | See here for solutions: :ref:`parameter_collection_print`.

Parameter display results EXCEL output.
---------------------------------
| (1) Allows the user to output the parameter display results in an Excel file.
| After the Parameters are displayed, click the EXCEL download tab.
| The file will contain 1 parameter sheet per excel sheet.
| The sheets are output in the order of the parameter display order.

.. figure:: /images/ja/parameter_collection/excel_download.png
   :width: 800px
   :alt: EXCEL download tab
   :align: center

   EXCEL download tab


Appendix
====

.. _parameter_collection_print:

If the Parameter display results' widths are cut off.
-------------------------------------------

| There are 4 different solutions.

1. Change the layout direction
2. Change the size of the paper
3. Change the margins
4. Change the magnification

.. figure:: /images/ja/parameter_collection/parameter_collection_print.png
   :width: 400px
   :alt: Parameter display results' width cut off
   :align: center

   Parameter display results' width cut off

1. Change the layout direction

   1.	Click the :guilabel:`Horizontal` button under the Layout.

.. figure:: /images/ja/parameter_collection/parameter_collection_print_beside.png
   :width: 600px
   :alt: Change the layout direction
   :align: center

   Change the layout direction

2. Change the size of the paper

   1.  Click :guilabel:`Advanced settings`.

   2. Click the paper size, :guilabel:`A4`, and select a size larger than A4, such as A3.

.. figure:: /images/ja/parameter_collection/parameter_collection_print_size.png
   :width: 400px
   :alt: Changing the paper size to A3
   :align: center

   Changing the paper size to A3

3. Change the margins

   1.  Click :guilabel:`Advanced settings`.

   2. Click :guilabel:`Default` under margins and select a smaller margin.

.. figure:: /images/ja/parameter_collection/parameter_collection_print_margin.png
   :width: 400px
   :alt: Changing to "No margin"
   :align: center

   Changing to "No margin"

4. Change the magnification

   1.  Click :guilabel:`Advanced settings`.

   2. Click :guilabel:`Normal` under magnification and select "Custom".

   3. Change the numeric value to a number less than 100.

.. figure:: /images/ja/parameter_collection/parameter_collection_print_magnification.png
   :width: 400px
   :alt: Changing the Magnification to 90
   :align: center

   Changing the Magnification to 90
