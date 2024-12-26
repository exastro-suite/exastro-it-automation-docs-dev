
.. _host_group:

==================
Host group function
==================

Introduction
========

| This document aims to explain the Exastro IT Automation Host group function.

Host group overview and merits
==========================

Host group overview
--------------------

| A host group is a group that contains hosts organized in logical units (function/roles).
| The following picture is a conceptual diagram of a host group.

.. figure:: /images/ja/host_group/overview_base.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Host group overview figure

   Host group overview figure

| The figure above is structured with the following elements.

| ■Host group
| Illustrated as single-line square items. Contains all, dc1, dc3, zabbix1 and zabbix3.


| ■Target host
| Hosts indicating physical devices.
| Illustrated as items with rounded squares. Contains host11, host12, host31 and host32.

| Host groups can be connected with parent-child relationships. The upper host groups are called parent host groups and the lower host groups are called child host groups.
| The bottom of the illustration are the devices the host groups are linked to.
| In the example ebove, zabbix1 is a child host group of dc1 and zabbix is the parent host group of zabbix1.


| In a hierarchy, host groups counts as 1 level and parent-child host groups counts as 2 levels. A hierarchy can contain up to 15 levels including the source host group and device host group.
| The figure above contains 3 levels from "all" to "zabbix1".


Host group merits
--------------------

Host group parameter inheritance
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| Paremeters set in parent host groups are inherited by child host groups.
| In the figure below, the parameters set for "dc1" (e.g. user passwords) are inherited to "zabbix1". 
| Note that parameters will not be inherited if they dont contain specific values.

.. figure:: /images/ja/host_group/overview_inheritance_1.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Host group overview figure (Host group parameter inheritance 1)

   Host group overview figure (Host group parameter inheritance 1)

| By utilizing this function to localize the settings, users can simplify changing and assigning configurations.

| The parameter settings are automatically inherited, even if a new child is added after the settings are configured.
| In the figure below, zabbix12 is linked to zabbix1 when a new zabbix server is added.
| As a result, the zabbix1 configurations are inherited by zabbix12, just like zabbix11.

.. figure:: /images/ja/host_group/overview_inheritance_2.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Host group overview figure (Host group parameter inheritance 2)

   Host group overview figure (Host group parameter inheritance 2)

| Child host groups can be linked to multiple parent host groups. This section explains parameter inheritence when there are multiple parent host groups.
| In the figure below, zabbix11 and zabbix12 belongs to both zabbix1 and virtualserver.

.. figure:: /images/ja/host_group/overview_inheritance_3.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Host group overview figure (Host group parameter inheritance 3)

   Host group overview figure (Host group parameter inheritance 3)


| If there are overlapping parameters between the host groups, the parameters from the lower host group will be used.
| In the figure above, when both dcx and zabbix1 have configured the same parameter, zabbix11 and zabbix12 will not inherit parameters from dcx, but from the lower host group, zabbix1.

| If both of the parent host groups are on the same level in the hierarchy, the host group with the highest priority level will be used.
| In the figure above, if the same parameters are configured by both virtualserver and zabbix1 and the priority level of virtualserver is "1" while the priority level for  zabbix1 is "2", the parameters from zabbix1 will be used, as the priority level is higher.
| For more information regarding configuring priority levels, see ":ref:`hostgroup_register`".


Host group function main features
============================

| The main functions of the host group function can be divided into 2 main categories, managing host groups configurations and dividing parameter sheet host group unit records into host units.
|
| ■The following operations allows users to divide targets from all parameter sheets.
| ・Register/Update/Discard/Restore in the host group related menus.
|   - :menuselection:`Host group list`
|   - :menuselection:`Host group parent-child link`
|   - :menuselection:`Host link management`
|
| ■The following operations allows users to divide targets from only corresponding parameter sheets.
| ・Register/Update/Discard/Restore in parameter sheet (with host group).
| ・Register, Edit or Initialize in parameter sheets where "use host groups" was selected in the :menuselection:`Define/create parameter sheets` menu.

Host group function menu group
====================================

| The :menuselection:`Host group function`'s menu group and the belonging menus are as follows.


.. list-table:: Host group function
   :header-rows: 1
   :align: left


   * - | No
     - | Menu group
     - | Menu/Page
     - | Description
   * - | 1
     - | Host group management
     - | Host group list
     - | Registers host groups.
   * - | 2
     - | Host group management
     - | Host group parent-child link
     - | Links host groups in parent-child relationships.
   * - | 3
     - | Host group management
     - | Host link management
     - | Links host groups, operations and target hosts.
   * - | 4
     - | Host group management
     - | Host group division target
     - | Manages division process statuses and division target parameter sheet information.

"Host group management" menu group
--------------------------------------------------------

| The following menus registers host groups and defines what operation and what host should be used: 
|:menuselection:`Host group list`, :menuselection:`Host group parent-child link` and :menuselection:`Host link management`.
| For more information on how to operate them, see ":ref:`hostunit_setting`".

.. _hostunit_setting:

Dividing records from host groups to host units
============================================================

| The following table shows the workflow for registering host groups and setting information for each host using Web content.
| More information regarding each of the steps are found in the correspondings sections.

.. _hostgroup_workflows:

.. list-table:: Operation contents and target menus
   :widths: 5 10 5 10 10 10
   :header-rows: 1
   :align: left
   :name: Operation contents and target menus

   * - No
     - Contents
     - User operation
     - Used menu group
     - Used menu
     - Remarks
   * - 1
     - :ref:`para_create`
     - Yes
     - Create parameter sheets
     - | Define/create parameter sheets
     - ー
   * - 2
     - :ref:`hostgroup_register`
     - Yes
     - Host group management
     - Host group list
     - ー
   * - 3
     - :ref:`hostgroup_definition`
     - Yes
     - Host group management
     - Host group parent-child link
     - ー
   * - 4
     - :ref:`host_tie`
     - Yes
     - Host group management
     - Host link list
     - ー
   * - 5
     - :ref:`para_register`
     - Yes
     - ※2
     - Menu created in "":ref:`para_create`"
     - ー
   * - 6
     - :ref:`hosted`
     - | No
       | ※1
     - ※2
     - Menu created in "":ref:`para_create`"
     - Cannot register/update manually.
   * - 7
     - :ref:`setvalue_tie`
     - Yes
     - ※2
     - Substitute value auto registration settings
     - | For more information regarding Substitute value auto registration settings, see the following.
       | ":doc:`../create_param/menu_creation`"
       | ":doc:`../ansible-driver/index`"
   * - 8
     - :ref:`host_reflection`
     - | No
       | ※1
     - ※3
     - Target host
     - | For more information regarding Target hosts, see the following.
       | ":doc:`../ansible-driver/index`"
   * - 9
     - :ref:`value_reflect`
     - | No
       | ※1
     - ※3
     - Susbtitute value management
     - | For more information regarding Susbtitute value management, see the following.
       | ":doc:`../ansible-driver/index`"

.. note:: | ※1 No user operation is required because it is executed by internal processing. Processing results can be checked on the menu screen.
          | ※2 Menu group specified in :menuselection:`Define/create parameter sheets`. 
          | ※3 Menu group that can use :menuselection:`Substitute value auto registration settings`. For more informatio nregarding each of the steps, see the record images here: :ref:`hostgroup_workflows_image`


.. _hostgroup_workflows_image:

Operation contents and records
----------------------------

| This section contains record images for the different menus corresponding to the steps from :ref:`hostgroup_workflows`.
| For information, see ":ref:`hostgroup_workflows_details`".

#. | :ref:`para_create`

   .. list-table::
      :header-rows: 1
      :align: left

      * - | Target host
          | or
          | Host group
        - Operation
        - Item 1
        - Item 2
      * - _
        -
        -
        -
      * - _
        -
        -
        -


#. | :ref:`hostgroup_register`

   .. list-table::
      :header-rows: 1
      :align: left

      * - Host group
      * - HG_1
      * - HG_2
      * - hg_1a
      * - hg_1b
      * - hg_2a
      * - hg_2b


#. | :ref:`hostgroup_definition`

   .. list-table::
      :header-rows: 1
      :align: left

      * - Parent host group
        - Child host group
      * - HG_1
        - hg_1a
      * - HG_1
        - hg_1b
      * - HG_2
        - hg_2a
      * - HG_2
        - hg_2b


#. | :ref:`host_tie`

   .. list-table::
      :header-rows: 1
      :align: left

      * - Host group
        - Operation
        - Target host
      * - hg_1a
        - OP1
        - host_1a
      * - hg_1b
        - OP1
        - host_1b
      * - hg_2a
        - OP1
        - host_2a
      * - hg_2b
        - OP1
        - host_2b


#. | :ref:`para_register`

   .. list-table::
      :header-rows: 1
      :align: left

      * - | Target host
          | or
          | Host group
        - Operation
        - Item 1
        - Item 2
      * - HG_1
        - 2023/01/01 00:00_OP1
        - 111
        - AAA
      * - HG_2
        - 2023/01/01 00:00_OP1
        - ー
        - BBB


#. | :ref:`hosted`

   .. list-table::
      :header-rows: 1
      :align: left

      * - Target host
        - Operation
        - Scheduled execution date/time
        - Item 1
        - Item 2
      * - host_1a
        - OP1
        - 2023/01/01 00:00:00
        - 111
        - AAA
      * - host_1b
        - OP1
        - 2023/01/01 00:00:00
        - 111
        - AAA
      * - host_2a
        - OP1
        - 2023/01/01 00:00:00
        - ー
        - BBB
      * - host_2b
        - OP1
        - 2023/01/01 00:00:00
        - ー
        - BBB


#. | :ref:`setvalue_tie`

   .. list-table::
      :header-rows: 1
      :align: left

      * - Menu group: Menu name: Item name
        - Movement
        - Variable name
      * - Substitute value auto registration:HG parameter management:Item 1
        - Movement1
        - VAR_Variable_1
      * - Substitute value auto registration:HG parameter management:Item 2
        - Movement2
        - VAR_Variable_2


#. | :ref:`host_reflection`

   .. list-table::
      :header-rows: 1
      :align: left

      * - Operation
        - Movement
        - Target host
      * - OP1
        - Movement1
        - host_1a
      * - OP1
        - Movement1
        - host_1b
      * - OP1
        - Movement2
        - host_1a
      * - OP1
        - Movement2
        - host_1b
      * - OP1
        - Movement2
        - host_2a
      * - OP1
        - Movement2
        - host_2b


#. | :ref:`value_reflect`

   .. list-table::
      :header-rows: 1
      :align: left

      * - Operation
        - Movement
        - Target host
        - Variable name
        - Specific value
      * - 2023/01/01 00:00_OP1
        - Movement1
        - host_1a
        - VAR_Variable 1
        - 111
      * - 2023/01/01 00:00_OP1
        - Movement1
        - host_1b
        - VAR_Variable 1
        - 111
      * - 2023/01/01 00:00_OP1
        - Movement2
        - host_1a
        - VAR_Variable 2
        - AAA
      * - 2023/01/01 00:00_OP1
        - Movement2
        - host_1b
        - VAR_Variable 2
        - AAA
      * - 2023/01/01 00:00_OP1
        - Movement2
        - host_2a
        - VAR_Variable 2
        - BBB
      * - 2023/01/01 00:00_OP1
        - Movement2
        - host_2b
        - VAR_Variable 2
        - BBB


.. _hostgroup_workflows_details:

Operation content details
----------------------

| This section explains more detailed information regarding the operation contents from :ref:`hostgroup_workflows`.
| For record images for the operation contents, see :ref:`hostgroup_workflows_image`.

.. _para_create:

Parameter sheet creation
^^^^^^^^^^^^^^^^^^^^

| Use the Parameter sheet creation function to create a parameter sheet menu.
| For more information regarding the parameter sheet creation function, see ":doc:`../create_param/menu_creation`".

.. _hostgroup_register:

Host group registration
^^^^^^^^^^^^^^^^^^^^

| Use the :menuselection:`Host group list` to register a host group.

.. figure:: /images/ja/host_group/hostgroup_management_register.png
   :alt: Host group registration
   :width: 6.4939in
   :height: 4.56706in

.. list-table:: Host group list registration
   :header-rows: 1
   :align: left

   * - | Item
     - | Description
     - | Input required
     - | Input method
     - | Restrictions
   * - | Host group name
     - | Input a name for the host group.
     - | ○
     - | Manual
     - | Maximum length 255 bytes
   * - | Priority
     - | Input a number for the priority level.
     - |
     - | Manual
     - | The input range is 0-2,147,483,647.

.. tip::
         | If no "Priority" value is input and there are multiple host groups on the same level in the hierarchy, the host group prioritized will be random.


.. _hostgroup_definition:


Host group parent^child relationship definition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| Use the :menuselection:`Host group parent-child link` menu to define host group's parent-child relationships.

.. figure:: /images/ja/host_group/hostgroup_parent_child_link_list_register.png
   :alt: Host group parent-child link registration
   :width: 6.33388in
   :height: 4.82042in

.. list-table:: Host group parent-child link registration
   :header-rows: 1
   :align: left

   * - | Item
     - | Description
     - | Input required
     - | Input method
     - | Restrictions
   * - | Parent host group
     - | Select the name of the host group that will be the parent.
     - | ○
     - | List selection
     - |
   * - | Child host group
     - | Select the name of the host group that will be the child.
     - | ○
     - | List selection
     - |

.. tip:: | If there is a loop in the parent-child relationship, an error will occur when new registrations/updates are processed.
         | In the example below, "HG1(parent)"-"HG2(child)" is linked and "HG2(parent)"-"HG3(child)" is linked. Linking then "HG3(parent)" with "HG1(child)" creates a loop.

.. figure:: /images/ja/host_group/hostgroup_parent_child_link_list_error_loop.png
   :alt: List/Update: error (parent-child loop)
   :width: 5.22863in
   :height: 0.99251in

   List/Update: error (parent-child loop)


.. _host_tie:

Host group, operation and target host link
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| Use the :menuselection:`Host link management` menu to register the target host that will link with the host group and operation.

.. figure:: /images/ja/host_group/host_link_list_register.png
   :alt: Host group management
   :width: 5.92051in
   :height: 4.22037in

.. list-table:: Host link management
   :header-rows: 1
   :align: left

   * - | Item
     - | Desccription
     - | Input required
     - | Input method
     - | Restrictions
   * - | Host group name
     - | Select host group.
     - | ○
     - | List selection
     - |
   * - | Operation
     - | Select operation.
     - |
     - | List selection
     - | ※1
   * - | Host name
     - | Select the target host.
     - | ○
     - | List selection
     - |

.. tip:: | ※1  Users register :menuselection:`Operation` as blank in the  :menuselection:`Host link management`. When the operation is registered as blank, all operations will be linked.


| By linking a target host with a host group and operation, the user can select target hosts within the host group like in the example below.

- | Example 1
  | Making the target host all hosts in a specified host group.

.. figure:: /images/ja/diagram/ホストグループ_作業対象ホスト1.png
   :alt: Target host
   :width: 4.72721in
   :height: 4.6604in

- | Example 2
  | Making only some hosts in a specified host group target host.

.. figure:: /images/ja/diagram/ホストグループ_作業対象ホスト2.png
   :alt: Target host
   :width: 4.72721in
   :height: 4.6604in

- | Example 3
  | Combining with the pattern in example 2.

.. figure:: /images/ja/diagram/ホストグループ_作業対象ホスト3.png
   :alt: Target host
   :width: 4.72721in
   :height: 4.6604in


- |  :menuselection:`Host link management` operation configuration example

.. figure:: /images/ja/host_group/hostgroup_parent_child_link_list_ex1.png
   :alt: Host group parent-child link (example 1)
   :width: 6.22721in
   :height: 4.6604in

.. figure:: /images/ja/host_group/host_link_list_ex1.png
   :alt: Host link management (example 1)
   :width: 6.29388in
   :height: 2.78024in

| In the example above, the linked host groups zabbix1 and zabbix2 where the operation is registered as blank which is valid for all operations.
| On the other hand, the host group zabbix3 for which the operation has been registered is valid only for the registered operation for“OP10” 

- | Host group link with operation "OP10"

.. figure:: /images/ja/host_group/overview_inheritance_ex1_op1.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Host group link with operation "OP10"

- | Host group link with operations other than operation "OP10"

.. figure:: /images/ja/host_group/overview_inheritance_ex1_op10.drawio.png
   :width: 6.67391in
   :height: 3.20028in
   :align: left
   :alt: Host group link with operations other than operation "OP10"


.. _para_register:

Registering to parameter sheets
^^^^^^^^^^^^^^^^^^^^^^^^

| In parameter sheets using host groups created in ":ref:`para_create`", register specific values for each operation to items that has either target host or target host group.
| The records can be viewed/updated/discarded/restored after registration.

.. figure:: /images/ja/host_group/parameter_sheet_as_hostgroup_register.png
   :alt: Parameter sheet (with host group)
   :width: 5.36046in
   :height: 4.67374in

.. list-table:: Parameter sheet (with host group)
   :header-rows: 1
   :align: left

   * - | Item
     - | Description
     - | Input required
     - | Input method
     - | Restrictions
   * - | Host name
     - | Select target host or host group
       | Items that starts with [H] are hosts. Items that starts with [HG] are host groups.
     - | ○
     - | List selection
     - |
   * - | Operation name
     - | Select operation.
     - | ○
     - | List selection
     - |
   * - | Standard date/time
     - | Displays the standard date/time.
     - | -
     - | -
     - | Displays the standard time/date for the selected operation.
   * - | Scheduled execution time
     - | Displays the scheduled execution date.
     - | -
     - | -
     - | Displays the scheduled execution date for the selected operation.
   * - | Last executed date/time
     - | Displays the last executed date/time
     - | -
     - | -
     - | Displays the date/time of the last time the selected operation was executed.
   * - | Parameter sheet target item
     - | Input a specific value for the item. This value will be displayed as the specific value for variables linked to the operation, movement and target host in :ref:`value_reflect`.
     - | ※
     - | ※
     - | ※Will be the settings for the item name and item defined in the Parameter sheet creation menu.

| The ":menuselection:`Host name`" and ":menuselection:`Operation`" combinations must be uniquely registered.
| The same host can registered when combined with different operations.


.. _hosted:

Hostifying
^^^^^^^^

| The information registered in " :ref:`para_register`" is compiled per operation by the internal "Host group dividing function" and inherited to all hosts up until the target host in the specified host group.
| The information inherited by each target host can be viewed in the parameter sheet menu created in ":ref:`para_create`".
| Substitute value auto registration menu group menus can only be viewed.

.. figure:: /images/ja/host_group/parameter_sheet_as_hg_subst_filter_0.png
   :alt: Hostifying (substitute value auto registration menu)
   :width: 6.45389in
   :height: 4.55373in


| A standard Hostifying process is as follows.

#. | The items registered to the parameter sheet menu is as follows.
   | (Information registered in ":ref:`para_register`") 

   .. list-table:: Information registered in ":ref:`para_register`".
      :widths: 10 10 5 5
      :header-rows: 1
      :align: left

      * - Target host or Host group
        - Operation
        - Item 1
        - Item 2
      * - HG_1
        - 2023/01/01_00:00_OP1
        - 111
        - AAA
      * - HG_2
        - 2023/01/01_00:00_OP1
        - ー
        - BBB
      * - host_1a
        - 2023/01/01_00:00_OP1
        - 222
        - ー

#. | The host group parent-child relationship are as following.
   | (Information registered in ":ref:`hostgroup_definition`".)

   .. list-table:: Host group parent-child relationship
      :widths: 10 10
      :header-rows: 1
      :align: left

      * - Parent host group
        - Child host group
      * - HG_1
        - hg_1a
      * - HG_1
        - hg_1b
      * - HG_2
        - hg_2a
      * - HG_2
        - hg_2b


#. | The :menuselection:`Host group`, :menuselection:`Operation` and :menuselection:`Target host` link information is as following.
   | (Information registered in "":ref:`host_tie`") 

   .. list-table:: Target host link information
      :widths: 10 10 10
      :header-rows: 1
      :align: left

      * - Host group
        - Operation
        - Target host
      * - hg_1a
        - 2023/01/01_00:00_OP1
        - host_1a
      * - hg_1b
        - 2023/01/01_00:00_OP1
        - host_1b
      * - hg_2a
        - 2023/01/01_00:00_OP1
        - host_2a
      * - hg_2b
        - 2023/01/01_00:00_OP1
        - host_2b


#. | Hostifying while information is registered to (1)-(3) will create the following record contents. We can see that information is configured for target hosts belonging to the host group.


.. figure:: /images/ja/host_group/parameter_sheet_as_hg_filter.png
   :alt: Hostify (Input menu)
   :width: 6.45389in
   :height: 4.55373in

.. figure:: /images/ja/host_group/parameter_sheet_as_hg_subst_filter.png
   :alt: Hostify (Substitute value auto registration menu)
   :width: 6.45389in
   :height: 4.55373in


.. note::
   | If an item is registered to both host group and target host, the target host item will be prioritized. As such, the "222" registered to "host_1a" will be applied.
   | While the target host item will be prioritized, if blank, it will inherit from upper levels. In this case, host1_a's Item_2 was blank, meaning that the parent host group's HG_1's "AAA" will be inherited.
   | host_2a and host_2b's Item_1 is blank, but that is because HG_" Item_1 is blank.

.. _setvalue_tie:

Setting values for items per operation and target host
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| Link menus and items that are link targets in the :menuselection:`Substitute value auto registration` menu with Movement variables. Users can Register/Update/Discard/Restore.
| The registered information is reflected in the ":menuselection:`Substitute value management`" menu and ":menuselection:`Target host`" menu.
| For more information, see ":ref:`para_create`".

.. _host_reflection:

Target host linked to operation reflection
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| The target host linked to the Operation is automatically reflected.
| The reflected results can be seen in the ":menuselection:`Target host`" menu.
| For more information, see ":ref:`para_create`".

.. _value_reflect:

Substitute value reflection
^^^^^^^^^^^^

| Specific values that are substituted to variables within Playbook templates and files used by the target movements are automatically reflected for each operation.
| This specific value is the one input in this section ":ref:`para_register`".
| The reflected results can be seen in the ":menuselection:`Substitute value management`" menu.
| For more information, see ":ref:`para_create`".
