===========================
Main menu (DashBoard)
===========================


Introduction
========
| This document explains the ITA Main menu (Dashboard).

Main menu
======================

| The main menu displays Widgets.
| The contents of each widget and their placements can be customized.
| The customized dashboard is saved on the system per user. The user will be able to use their own customized dashboard even when logging in from different environments.

1. | Page structure

   | Widgets No.1-5 are displayed by default.
   | Widgets No.6-9 are not displayed by default (Users can add them by pressing :guilabel:`Edit Dashboard` → :guilabel:`Add Widget`)

.. figure:: /images/ja/dashboard/dashboard_base.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Widget types

   Widget types


.. list-table:: Widget list（No.1～9）
   :header-rows: 1
   :align: left

   * - No
     - Widget name
     - Description
     - Default
   * - 1
     - Menu group
     - | Displays a panel for each of the menu groups.
       | The user can move to the specified menu group's main menu by pressing the corresponding panel.
       | Only the installed driver panels will be displayed.
       | It is not possible to delete the "Menu group" widget.
     - Display
   * - 2
     - Movement
     - | Displays all Movements registered to the different orchestrators in a pie graph.
       | Pressing either the graph or the number in the "SUM" row moves the user to the driver's "Movement list".
     - Display
   * - 3
     - Operation status
     - | Displays the status of all Conductors in a pie graph.
       | Pressing the number in the "CON" row moves the user to the "Conductor" menu group's "Conductor operation list" menu.
     - Display
   * - 4
     - Operation results
     - | Displays the Operation results of all the Conductor in a pie graph.
       | Pressing the number in the "CON" row moves the user to the "Conductor" menu group's "Conductor operation list" menu.
     - Display
   * - 5
     - Operation history
     - | Displays the Conductors' operation history divided by dates in a bar graph.
       | The user can view the number of items and detailed information by overing the cursor over the bar graph.
       | Pressing the number in the "CON" row moves the user to the "Conductor" menu group's "Conductor operation list" menu.
     - Display
   * - 6
     - Menu set
     - Allows the user to create a set of menu groups.
     - Hidden
   * - 7
     - Link
     - Allows the user to create a list of links.
     - Hidden
   * - 8
     - Reserved operation confirmation
     - | Displays all conductors with the "Not executed (reserved)" status in a list.
       | This widget allows users to check the Instance ID, Conductor name, Operation name, Reservation time/date and the remaining time until the reserved date/time.
       | pressing the Instance ID moves the user to the target operation confirmation page.
     - Hidden
   * - 9
     - Picture
     - Allows users to display pictures.
     - Hidden

Edit/Operate Dashboard
=====================

Edit DashBoard
---------------

| Press the ":guilabel:`Edit DashBoard`" button to move to the edit page.

.. figure:: /images/ja/dashboard/dashboard_edit.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :alt: DashBoard edit button

   DashBoard edit button

| The following actions are available when editing.

- | Add Widget
  | See ":ref:`add_widget`".
- | Edit, Delete Widget
  | See ":ref:`edit_widget`".
- | Confirm edit
  | Press the :guilabel:`Confirm edit` button to save the edited widget contents.
- | Reset
  | Press the :guilabel:`Reset` button to reset the edited widget contents. This will return the widget to the default state.
- | Delete edit
  | Press the :guilabel:`Delete edit` button to delete the edited contents. This will return the widget to before the contents were edited.

.. _add_widget:

Add Widget
^^^^^^^^^^

#. | Select :guilabel:` Add Widget` to display the widget selection.
   | Select the desired widget and press :guilabel:`Apply` to add the widget.

   .. figure:: /images/ja/dashboard/dashboard_add_widget.gif
      :width: 6.67391in
      :height: 3.20028in
      :align: left
      :alt: Adding Widget

      Adding Widget

.. tip:: | Blank
         | Hovering the cursor over or under an existing widget displays a  :guilabel:`＋Blank` button.
         | Pressing the :guilabel:`＋Blank` button adds 1 Blank.
         | If there is not widget within the line, selecting the blank deletes 1 blank.

         .. figure:: /images/ja/dashboard/dashboard_blank.gif
            :width: 6.67391in
            :height: 3.20028in
            :align: left
            :alt: Add, Delete Blank

            Add, Delete Blank

.. tip:: | Reset menu
         | The user can move panels by dragging and droping them from the "Menu group" widget to the "Menu set"

         .. figure:: /images/ja/dashboard/dashboard_edit_menuset.gif
            :width: 6.67391in
            :height: 3.20028in
            :align: left
            :alt: Add Menu set panel

            Add Menu set panel

.. _edit_widget:

Edit, delete Widget
^^^^^^^^^^^^^^^^

| It is possible to edit and delete widgets by pressing the buttson on top of the widgets.

- | ：Displays the Edit widget page.See the following for more information regarding editing the different widgets.
- | ：Deletes the Widget.

.. figure:: /images/ja/dashboard/dashboard_widget_edit_del.gif
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Edit, delete Widget

   Edit, delete Widget

| The shared and individual widget settings are as following.

.. tabs::
   .. tab:: Shared settings

      | The shared widget basic settings are as following.

      .. figure:: /images/ja/dashboard/dashboard_widget_setting_common.png
         :width: 3.67391in
         :height: 3.20028in
         :align: left
         :alt: Shared widget settings

         Shared widget settings

      .. list-table:: Widget基本設定
         :header-rows: 1
         :align: left

         * - No
           - Item name
           - Description
           - Input item
         * - 1
           - Name
           - Changes the name of the widget.
           - Manual
         * - 2
           - Horizontal combined number
           - Changes the combined number horizontally.
           - | Manual
             | Select with slider
         * - 3
           - Vertical combined number
           - Changes the combined number vertically
           - | Manual
             | Select with slider
         * - 4
           - Widget display
           - Changes whether to hide or display the frame/background.
           - | Select
             | ・Display
             | ・Hide
         * - 5
           - Title bar
           - Changes whether to hide or display the frame/background.
           - | Select
             | ・Display
             | ・Hide
         * - 6
           - Frame/Background
           - Changes whether to hide or display the frame/background.
           - | Select
             | ・Display
             | ・Hide

   .. tab:: Menu group

      | The individual settings for the Menu group widget are as following.

      .. figure:: /images/ja/dashboard/dashboard_widget_setting_menugroup.png
         :width: 3.67391in
         :height: 3.20028in
         :align: left
         :alt: Widget individual settings(Menu group)

         Widget individual settings(Menu group)

      .. list-table:: Widget individual settings(Menu group)
         :header-rows: 1
         :align: left

         * - No
           - Item name
           - Description
           - Input item
         * - 1
           - Item number per line
           - Cahnges how many items per line.
           - | Manual
             | Select with slider
         * - 2
           - Display format
           - Cahnges the display format
           - | Select
             | ・Icon
             | ・List
         * - 3
           - Menu group name
           - Changes whether to display or hide the menu group name.
           - | Select
             | ・Display
             | ・Hide
         * - 4
           Page transition
           Change page transition method
           - | Select
             | ・Same tab
           New tab
             | ・New window

   .. tab:: Movement registration number

      | The individual settings for the Movement registration number widget are as following.

      .. figure:: /images/ja/dashboard/dashboard_widget_setting_movement.png
         :width: 3.67391in
         :height: 3.20028in
         :align: left
         :alt: Widget individual settings(Movement registration number)

         Widget individual settings(Movement registration number)

      .. list-table:: Widget individual settings(Movement registration number)
         :header-rows: 1
         :align: left

         * - No
           - Item name
           - Description
           - Input item
         * - 1
           Page transition
           Change page transition method
           - | Select
             | ・Same tab
           New tab
             | ・New window

   .. tab:: Conductor operation status

      | The individual settings for the Conductor operation status widget are as following.

      .. figure:: /images/ja/dashboard/dashboard_widget_setting_conductor_status.png
         :width: 3.67391in
         :height: 3.20028in
         :align: left
         :alt: Widget individual settings(Conductor operation status)

         Widget individual settings(Conductor operation status)

      .. list-table:: Widget individual settings(Conductor operation status)
         :header-rows: 1
         :align: left

         * - No
           - Item name
           - Description
           - Input item
         * - 1
           Page transition
           Change page transition method
           - | Select
             | ・Same tab
           New tab
             | ・New window

   .. tab:: Conductor operation results

      | The individual settings for the Conductor operation results widget are as following.

      .. figure:: /images/ja/dashboard/dashboard_widget_setting_conductor_result.png
         :width: 3.67391in
         :height: 3.20028in
         :align: left
         :alt: Widget individual settings(Conductor operation results)

         Widget individual settings(Conductor operation results)

      .. list-table:: Widget individual settings(Conductor operation results)
         :header-rows: 1
         :align: left

         * - No
           - Item name
           - Description
           - Input item
         * - 1
           Page transition
           Change page transition method
           - | Select
             | ・Same tab
           New tab
             | ・New window

   .. tab:: Conductor operation history

      | The individual settings for the Conductor operation history widget are as following.

      .. figure:: /images/ja/dashboard/dashboard_widget_setting_conductor_history.png
         :width: 3.67391in
         :height: 3.20028in
         :align: left
         :alt: Widget individual settings(Conductor operation history)

         Widget individual settings(Conductor operation history)

      .. list-table:: Widget individual settings(Conductor operation history)
         :header-rows: 1
         :align: left

         * - No
           - Item name
           - Description
           - Input item
         * - 1
           - Period
           - Change period.
           - | Manual
             | Select with slider
         * - 2
           Page transition
           Change page transition method
           - | Select
             | ・Same tab
           New tab
             | ・New window

   .. tab:: Menu set 

      | The individual settings for the Menu set widget are as following.

      .. figure:: /images/ja/dashboard/dashboard_widget_setting_menugroup.png
         :width: 3.67391in
         :height: 3.20028in
         :align: left
         :alt: Widget individual settings(Menu set)

         Widget individual settings(Menu set)

      .. list-table:: Widget individual settings(Menu set)
         :header-rows: 1
         :align: left

         * - No
           - Item name
           - Description
           - Input item
         * - 1
           - Items per line
           - Changes the amount of items per line.
           - | Manual
             | Select with slider
         * - 2
           - Display format
           - Changes the display format
           - | Select
             | ・Icon
             | ・List
         * - 3
           -Menu group name
           - Changes whether to display or hide the menu group name.
           - | Select
             | ・Display
             | ・Hide
         * - 4
           Page transition
           Change page transition method
           - | Select
             | ・Same tab
           New tab
             | ・New window

   .. tab:: Link list

      | The individual settings for the Link list widget are as following.

      .. figure:: /images/ja/dashboard/dashboard_widget_setting_link_list.png
         :width: 3.67391in
         :height: 3.20028in
         :align: left
         :alt: Widget individual settings(Link list)

         Widget individual settings(Link list)

      .. list-table:: Widget individual settings(Link list)
         :header-rows: 1
         :align: left

         * - No
           - Item name
           - Description
           - Input item
         * - 1
           - Items per line
           - Changes the amount of items per line
           - | Manual
             | Select with slider
         * - 2
           Page transition
           Change page transition method
           - | Select
             | ・Same tab
           New tab
             | ・New window
         * - 3
           - Item
           - | Configures the Item.
             | Users can add input fields with :guilabel:`Add items`.
             | It is possible to change the display order and delete items.
           - | Manual
             | ・Name
             | ・Link URL

   .. tab:: Conductor reserved operation confirmation

      | The individual settings for the Conductor reserved operation confirmation widget are as following.

      .. figure:: /images/ja/dashboard/dashboard_widget_setting_conductor_reserve.png
         :width: 3.67391in
         :height: 3.20028in
         :align: left
         :alt: Widget individual settings(Conductor reserved operation confirmation)

         Widget individual settings(Conductor reserved operation confirmation)

      .. list-table:: Widget individual settings(Conductor reserved operation confirmation)
         :header-rows: 1
         :align: left

         * - No
           - Item name
           - Description
           - Input item
         * - 1
           - Period
           - Change period.
           - | Manual
             | Select with slider
         * - 2
           Page transition
           Change page transition method
           - | Select
             | ・Same tab
             | ・New tab
             | ・New window

   .. tab:: Picture

      | The individual settings for the Picture widget are as following.

      .. figure:: /images/ja/dashboard/dashboard_widget_setting_image.png
         :width: 3.67391in
         :height: 3.20028in
         :align: left
         :alt: Widget individual settings(Picture)

         Widget individual settings(Picture)

      .. list-table:: Widget individual settings(Picture)
         :header-rows: 1
         :align: left

         * - No
           - Item name
           - Description
           - Input item
         * - 1
           - Picture URL
           - Configures 1 picture URL.
           - | Manual
         * - 2
           - Link URL
           - Configures link URL.
           - | Manual
         * - 3
           - Page transition
           Change page transition method
           - | Select
             | ・Same tab
             | ・New tab
             | ・New window
