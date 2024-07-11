========
Compare function
========

Compare function overview
==============

| This document aims to explain how to use ITA's compare function.

| The Compare function can be used to compare parameter sheets created with the ITA menu creation function and output any differences.
|
| This function only supports ":menuselection:`Parameter sheet (Host/with operation）`".
| For more information regarding parameter sheets, see ":doc:`../create_param/menu_creation`".


Compare function overview figure
******************


| The following figure illustrates a standard workflow using Compare function.

.. figure:: /images/ja/menu_creation/comparison_function/overview_all.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Collect function overview figure.

   Collect function overview figure.


Compare function process diagram
******************

| The following figure illustrates the Compare function's process.
| Compare results are output following the conditions specified in :menuselection:`Comparison settings` and :menuselection:`Comparison advanced settings`.

.. figure:: /images/ja/menu_creation/comparison_function/overview_process.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Compare function process figure

   Compare function process figure


Compare function definition figure
******************

| The following figure illustrates paremeter sheet links and comparison results.
| Fore more information regarding the :menuselection:`Comparison settings` and :menuselection:`Comparison advanced settings` settings, see :ref:`about_how_to_use_compare`.
|
| ・Parameter sheet links (When the parameter sheet items matches)

.. figure:: /images/ja/menu_creation/comparison_function/example_parameter_sheet_match.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Comparison where parameter sheet items matches

   Comparison where parameter sheet items matches

|
| ・Parameter sheet links (When the parameter sheet items don't match)

.. figure:: /images/ja/menu_creation/comparison_function/example_parameter_sheet_unmatch.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Comparison where parameter sheet items don't match

   Comparison where parameter sheet items don't match


.. _about_base_datetime:

Standard date/time
^^^^^^^^^^^^^^^^
| If the corresponding operation has been executed in the past, the "Standard date/time" will be the "Last executed date/time".
| If it has not been executed before, the "Standard date/time" will be the "Scheduled execution date/time".
| For more information regarding "Standard date/time, see ":doc:`../create_param/menu_creation`".

.. figure:: /images/ja/menu_creation/comparison_function/basedate.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Standard date/time diagram

   Standard time/date diagram

.. tip::
        | The following is an example of a search result when a search is performed in the "For Reference" menu group using dates ① through ③ as "Standard date/time"
        | ① At 1/1, no values are configured, meaning there are no search results. "Blank".
        | ② At 3/15, the values set to Operation 1 will be displayed in the search results. "ParameterA:100".
        | ③ At 5/15, the values set to Operation 4 will be displayed in the search results. "ParameterA:200".




Comparing parameter sheets
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| The Compare function uses the item information of the linked parameter sheets in the :menuselection:`Comparison settings` and :menuselection:`Comparison advanced settings` to compare values.
|

Compare function requirements
******************

| The following ITA settings must be configured in order to use the Compare function.

- | A Parameter sheet (Host/With operation) must be created in the :menuselection:`Create/define Parameter sheets` menu.
- | The target parameter sheets must have a link configured in the :menuselection:`Comparison settings` menu.
- | The target items must have a link configured in the :menuselection:`Comparison advance settings` menu.

.. note::
          | Useres can only configure :menuselection:`Comparison advanced settings` if the :menuselection:`Detailed settings flag` in  :menuselection:`Comparison settings` are set to "True".
          | If the comparing parameter sheet item number and item names matches, (:menuselection:`Comparison advanced settings` = False), the user does not have to configure :menuselection:`Comparison advanced settings`.


Comparison execution parameters
******************

| The following can be configured as parameters and be compared.
| For more information regarding :menuselection:`Comparison settings`, see ":ref:`about_compare_list`".

.. figure:: /images/ja/menu_creation/comparison_function/compare_execute.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Submenu page（Comparison execution）

   Submenu page\(Comparison execution\)

.. list-table:: Comparison execution parameters
   :header-rows: 1
   :align: left

   * - | Parameter
     - | Description
     - | Input required
     - | Input format
     - | Restrictions
   * - | Select Comparison settings
     - | Select settings for the comparison.
     - | ○
     - | List selection
     - |
   * - | Standard date/time 1
     - | Input a date/time for Comparison settings' Parameter 1's "Standard date/time".
     - |
     - | Manual
     - | If nothing is input, the newest standard date/time will be applied.
   * - | Standard date/time 2
     - | Input a date/time for Comparison settings' Parameter 2's "Standard date/time".
     - |
     - | Manual
     - | If nothing is input, the newest standard date/time will be applied.
   * - | Select host
     - | Select a target host
       | Default: No filter. (Displays all comparison targets.)
     - |
     - | List selection
     - |


Compare function target items
============================

Comparison target items
^^^^^^^^^^^^

Comparison target parameter sheet items
********************************

| The parameter sheet items that can be used by the Compare function are as following.

.. list-table:: Parameter sheet comparison target items
   :header-rows: 1
   :align: left

   * - | Item type
     - | Restrictions
   * - | String\(single line\)
     - |
   * - | String\(multiple lines\)
     - |
   * - | Integer
     - |
   * - | Decimal
     - |
   * - | Time/date
     - |
   * - | Date
     - |
   * - | Pulldown selection
     - | Compares the lists' values.
       | Will display "ID conversion failure\(X\)" if the reference record has been deleted.
   * - | File upload
     - | Compares both file name and file contents if both items are File upload.
   * - | Link
     - |
   * - | Parameter sheet reference
     - | Compares the parameter sheets' values.
       | Will display "ID conversion failure\(X\)" if the reference record has been deleted.

Comparison target item combinations
************************************

| The following list contains all item combinations that can be compared.

.. list-table:: Comparison target item pattern combinations
   :widths: 13 10 10 10 10 10 10 10 10 10 15
   :header-rows: 1
   :stub-columns: 1
   :align: left

   * - |
     - | String
       | \(single line\)
     - | String
       | \(multiple lines\)
     - | Integer
     - | Decimal
     - | Time/date
     - | Date
     - | Pulldown
       | selection
     - | File
       | upload
     - | Link
     - | Parameter sheet
       | Reference
   * - | String
       | \(single line\)
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○※1
     - | ○
     - | ○
   * - | string
       | \(multiple lines\)
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○※1
     - | ○
     - | ○
   * - | Integer
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○※1
     - | ○
     - | ○
   * - | Decimal
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○※1
     - | ○
     - | ○
   * - | Pulldown
       | selection
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○※1
     - | ○
     - | ○
   * - | File
       | upload
     - | ○※1
     - | ○※1
     - | ○※1
     - | ○※1
     - | ○※1
     - | ○※1
     - | ○※1
     - | ○
     - | ○※1
     - | ○※1
   * - | Link
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○※1
     - | ○
     - | ○
   * - | Parameter sheet
       | Reference
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○
     - | ○※1
     - | ○
     - | ○

.. note::
          | ※1 Comparison targets will be displayed as having differences even if only the file name or the contents are different. Items other than File uploads will not have their contents compared.


Compare function menu structure
=====================

| This section explains the Compare function's menu structure.

Menu/Page list
^^^^^^^^^^^^^^^^^

| The Compare function's menus are as following.

.. figure:: /images/ja/menu_creation/comparison_function/compare_menu_list.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Compare menu list

   Compare menu list

.. list-table:: Compare page list
   :header-rows: 1
   :align: left

   * - | No
     - | Menu group
     - | Menu/Page
     - | Description
   * - | 1
     - | Comparison
     - | Comparison settings
     - | Create configuration name for the comparison.
       | Configure link between target parameter sheets.
       | Setting the "Advanced settings" flag to "true" will make the "Comparison advanced settings" available.
   * - | 2
     - | Comparison
     - | Comparison advanced settings
     - | Configure link between the target items within the linked parameter sheets.
   * - | 3
     - | 
     - | Comparison execution
     - | Execute comparisons configured
       | in the "Comparison settings" and "Comparison advanced settings" menus.


Compare function step-by-step guide
==================

| This section explains how to use the Compare function in a step-by-step format.

Operation flow
^^^^^^^^^^

| A standard operation flow for the Compare function is as following.

Compare function execution flow
************************

| The following is a standard flow from start to comparing parameter sheets.

- Operation flow details and references

  #. | Creating parameter sheets
     | Creae parameter sheets from the :menuselection:`Create parameter sheet\ --> Define/create parameter sheet` menu.
     | For more information, see ":doc:`../create_param/menu_creation`"
  #. | Registering data to parameter sheets
     | Register data to the parameter sheets created in the previous step.
     | For more information, see ":doc:`../create_param/menu_creation`"
  #. | Configuring Comparison settings
     | Configure Comparison settings from the :menuselection:`Compare\ --> Comparison settings` menu.
     | For more information, see ":ref:`about_compare_list`"
  #. | Configuring Comparison advanced settings
     | Configure Comparison advanced settings from the :menuselection:`Compare\ --> Comparison advanced settings` menu.
     | For more information, see ":ref:`about_compare_detail`"
  #. | Executing Comparison
     | Execute the Comparison from the :menuselection:`Compare\ --> Comparison execution` menu.
     | For more information, see ":ref:`about_compare_execute`"


.. _about_how_to_use_compare:

Operating the Compare function
======================

| This sections explains the menus used by the Compare function.

Compare
^^^^

.. _about_compare_list:

Comparison settings
********

#. |  The :menuselection:`Comparison settings` menu allows users to register and update links between parameter sheets that they want to compare.

   .. figure:: /images/ja/menu_creation/comparison_function/submenu_compare_list.png
      :width: 6.67391in
      :height: 3.20028in
      :align: left
      :alt: Submenu page（Comparison settings）

      Submenu page\(Comparison settings\)

#. | Press :menuselection:`List --> Register or Edit` to register :menuselection:`Comparison settings`.

   .. figure:: /images/ja/menu_creation/comparison_function/edit_compare_list.png
      :width: 6.67391in
      :height: 3.20028in
      :align: left
      :alt: Registration/Edit page\(Comparison settings)

      Registration/Edit page\(Comparison settings\)


|  The items in the :menuselection:`Comparison settings` menu are as following.

.. list-table:: Comparison settings item list
   :widths: 10 25 5 5 10
   :header-rows: 1
   :align: left

   * - | Item
     - | Description
     - | Input required
     - | Input method
     - | Restrictions
   * - | Comparison name
     - | Input comparison name.
     - | ○
     - | Manual
     - | Maximum length: 255 bytes
   * - | Parameter sheet 1
     - | Select a target parameter sheet.
     - | ○
     - | List selection
     - |
   * - | Parameter sheet 2
     - | Select a target parameter sheet.
     - | ○
     - | List selection
     - |
   * - | Detailed settings flag
     - | Select if the target parameter sheets' item names and 
       | item numbers matches.
       | \ False: Will not require Comparison advanced settings.
       | \ True: Will require Comparison advanced settings.
     - | -
     - | List selection
     - | ※1
   * - | Remarks
     - | Free description field.
     - | -
     - | Manual
     - |

.. note::
          | ※1  If the ":menuselection:`Advanced settings flag`" is set to "False", ":menuselection:`Comparison advanced settings`" will not be required. However, the items in the selected parameter sheets must have matching item numbers and item names.


.. _about_compare_detail:

Comparison advanced settings
************

#. |  Configure links between the target parameter sheet's items in the :menuselection:`Comparison advanced settings` menu.

   .. figure:: /images/ja/menu_creation/comparison_function/submenu_compare_detail.png
      :width: 6.67391in
      :height: 3.20028in
      :align: left
      :alt: Submenu page\(Comparison advanced settings\)

      Submenu page\(Comparison advanced settings\)


#. | Register comparison items with :menuselection:`List --> Register or  Edit`.

   .. figure:: /images/ja/menu_creation/comparison_function/edit_compare_detail.png
      :width: 6.67391in
      :height: 3.20028in
      :align: left
      :alt: Registration/Edit page\(Comparison advanced settings\)

      Registration/Edit page\(Comparison advanced settings\)


|  The items in the :menuselection:`Comparison item value management` page are as following.

.. list-table:: Registration page item list (Comparison settings)
   :widths: 10 25 5 6 7
   :header-rows: 1
   :align: left

   * - | Item
     - | Description
     - | Input required
     - | Input format
     - | Restrictions
   * - | Comparison name
     - | Select comparison settings
     - | ○
     - | List selection
     - | ※1
   * - | Comparison item name
     - | Input a display name for the item.
       | This name will be used for the item in Comparison results.
     - | ○
     - | Manual
     - | Max length is 255 bytes
   * - | Target item 1
     - | Select a target item.
     - | ○
     - | List selection
     - | ※2
   * - | Target item 2
     - | Select a target item.
     - | ○
     - | List selection
     - | ※3
   * - | Display order
     - | Input the display order.
       | Decides the display order in the Comparison results.
     - | ○
     - |
     - | Input range is 0～2,147,483 and 647.
   * - | Remarks
     - | Free description field
     - | -
     - |
     - |

.. note::
          | ※1  All comparisons with the :menuselection:`Advanced settings flag` in the  :menuselection:`Comparison settings` set to "True" will be displayed.
          | ※2  Select items from the :menuselection:`Target parameter sheet 1` registered in :menuselection:`Comparison settings`.
          | ※3  Select items from the :menuselection:`Target parameter sheet 2` registered in :menuselection:`Comparison settings`.

.. _about_compare_execute:

Comparison execution
********

|  The :menuselection:`Comparison execution` menu allows users to compare parameter sheets using the information defined in the :menuselection:`Comparison settings` and :menuselection:`Comparison advanced settings` menu.
| ・ The :menuselection:`Comparison name` registered in :menuselection:`Comparison settings` is displayed.
| ・ Pressing the Compare button starts the comparison process where the target parameter sheets and items are compared to each other.
| ・ Parameter sheet comparisons using bundles compares items that have the same names or the same input order set in ":menuselection:`Comparison advanced settings`".


.. figure:: /images/ja/menu_creation/comparison_function/compare_execute.gif
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Comparison execution page

   Comparison execution page


.. list-table:: Comparison execution requirements
   :header-rows: 1
   :align: left

   * - | Parameter
     - | Description
     - | Input required
     - | Input format
     - | Restrictions
   * - | Select Comparison settings
     - | Select settings for the comparison.
     - | ○
     - | List selection
     - |
   * - | Standard date/time 1
     - | Input a date/time for Comparison settings' Parameter 1's "Standard date/time". ※1
     - |
     - | Manual
     - | If nothing is input, the newest standard date/time will be applied.
   * - | Standard date/time 2
     - | Input a date/time for Comparison settings' Parameter 1's "Standard date/time". ※1
     - |
     - | Manual
     - | If nothing is input, the newest standard date/time will be applied.
   * - | Select host
     - | Select a target host.
       | Default: No filter. (Displays all comparison targets.)※2
     - | -
     - | List selection
     - | -

.. note::
          | ※1 If a standard date/time is input, the newest data from the specified date/time will be compared. If nothing is input, the newest data will be compared.
          | ※2 Hosts cannot be filtered by default. The comparison results from all the hosts from the parameter sheets linked within the Comparison settings menu will be output.


| Comparison results

- | Comparing parameter sheets

.. figure:: /images/ja/menu_creation/comparison_function/result_compare_execute.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Comparison execution page\(Comparison results\)

   Comparison execution page (Comparison results)

- | Comparing parameter sheets (When using bundles)

.. figure:: /images/ja/menu_creation/comparison_function/result_compare_execute_bundle.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Comparison execution page \(Comparison results: when using bundles\)

   Comparison execution page (Comparison results: when using bundles)

- | Comparing parameter sheets (File upload item)

.. figure:: /images/ja/menu_creation/comparison_function/result_compare_execute_file.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Comparison execution page \(Comparison results: file upload item\)

   Comparison execution page (Comparison results: file upload item)

| Comparison results

- | Target host
  | Displays comparison results per host.
  | Selecting a target will display more detailed comparison results.

.. list-table:: Target host output list
   :header-rows: 1
   :align: left

   * - | Item
     - | Description
     - | Restrictions
   * - | Target host
     - | Displays the Target host name.
     - |
   * - | Difference(s)
     - | Displays comparison results. If there are differences, "✓" will be displayed.
     - |

- | Comparison results
  | In the comparison results, the selected host name will be displayed together with detailed results.

.. list-table:: Comparison result display content list
   :header-rows: 1
   :align: left

   * - | Item
     - | Description
     - | Restrictions
   * - | Item
     - | Displays item name.
     -
   * - | Difference(s)
     - | Displays items' comparison results.
     - | Displays "✓" if there are differences.
   * - | Comparison target parameter sheet 1
     - | Displays the values from target parameter sheet 1.
     - | Displays parameter sheet name in the header.
   * - | Comparison target parameter sheet 1
     - | Displays the values from target parameter sheet 2.
     - | Displays parameter sheet name in the header.
   * - | Remarks
     - | Displays other information when items are compared.
     - | File upload: Displaysa button for checking the file content comparison results.

.. tip:: | Comparisons using bundles

         - | Comparison items are displayed in the following format: (Name[Substitute order]).
         - | Items with the same name or the same substitute order set in the :menuselection:`Comparison advanced settings` can be compared.
         - | The following items are not displayed: :menuselection:`Item number`, :menuselection:`Host name`, :menuselection:`Operation name`, :menuselection:`Standard date/time`.