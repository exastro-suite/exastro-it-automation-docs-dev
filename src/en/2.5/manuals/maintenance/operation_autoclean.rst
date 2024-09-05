======================
Operation auto-clean management
======================

Introduction
========

| This document explains the ITA Operation auto-clean management function

Operation auto-clean function overview
============================

| This function uses user specified values to automatically clean operations registered to :menuselection:`Basic console --> Operation list`. The timing of when they are deleted are based the operation's Scheduled execution date and the user specified  "Logic deletion days" and "Physical deletion days" values.
| If the "Logic deletion days" are exceeded, the data will be discarded. if "Physical deletion days" are exceeded, the data will be deleted from the database.
| The auto-clean function deletes operations once per day at 00:02.

Operation auto-clean function menu structure
==========================================

| This section explains the Operation auto-clean management menus' structure

Menu list
-----------------

#. | :menuselection:`Operation auto-clean function`  menu
   | The :menuselection:`Operation auto-clean function` menu list are as following.

.. list-table:: Operation auto-clean management menu list
   :header-rows: 1
   :align: left

   * - No
     - Menu group
     - Menu
     - Description
   * - 1
     - Management console
     - Operation auto-clean management
     - Users can maintain (view/register/update/discard) information that deletes expired data.


.. figure:: /images/ja/operation_autoclean/operation_autoclean_list_filter.png
   :width: 5.22863in
   :height: 0.99251in
   :alt: Operation auto-clean function page

   Operation auto-clean function page 

.. list-table:: Default setting values list
   :header-rows: 1
   :align: left

   * - Item number
     - Logic deletion days
     - Physical deletion days
     - Menu group:Menu name
     - Data storage path
   * - 1
     - 3600
     - 7200
     - Ansible-Legacy:Target host
     - 
   * - 2
     - 3600
     - 7200
     - Ansible-Legacy:Substitute value management
     - 
   * - 3
     - 3600
     - 7200
     - Ansible-Legacy:Management
     - /driver/ansible/legacy
   * - 4
     - 3600
     - 7200
     - Ansible-Pioneer:Target host
     - 
   * - 5
     - 3600
     - 7200
     - Ansible-Pioneer:Susbtitute value management
     - 
   * - 6
     - 3600
     - 7200
     - Ansible-Pioneer:Management
     - /driver/ansible/pioneer
   * - 7
     - 3600
     - 7200
     - Ansible-LegacyRole:Target host
     - 
   * - 8
     - 3600
     - 7200
     - Ansible-LegacyRole:Substitute value management
     - 
   * - 9
     - 3600
     - 7200
     - Ansible-LegacyRole:Management
     - /driver/ansible/legacy_role
   * - 10
     - 3600
     - 7200
     - Conductor:Conductor instance list
     - /driver/conductor
   * - 11
     - 3600
     - 7200
     - Conductor:ConductorNode instance list
     - 
   * - 12
     - 3600
     - 7200
     - Terraform-Cloud/EP:Management
     - /driver/terraform_cloud_ep/execute

   * - 13
     - 3600
     - 7200
     - Terraform-Cloud/EP:Substitute value management
     - 
   * - 14
     - 3600
     - 7200
     - Terraform-CLI:Management
     - /driver/terraform_cli/execute
   * - 15
     - 3600
     - 7200
     - Terraform-CLI:Substitute value management
     - 
   * - 16
     - 3610
     - 7210
     - Basic console:Operation list
     - 
   * - 17
     - 3600
     - 7200
     - Rule:Evaluation results
     - 


.. figure:: /images/ja/operation_autoclean/operation_autoclean_list_edit.png
   :width: 5.22863in
   :height: 0.99251in
   :alt: Operation auto-clean function edit page

   Operation auto-clean function edit page


.. list-table:: Register page item list
   :widths: 10 50 10 10 30
   :header-rows: 1
   :align: left

   * - Item
     - Description
     - Input required
     - Input method
     - Restrictions
   * - Logic deletion days
     - Deletes (discards) the operations whose "Scheduled execution date" exceeds the specified "Logic deletion days".
     - 〇
     - Manual
     - Only numeric values
   * - Physical deletion days
     - Deletes (deletes from database) the operations whose "Scheduled execution date" exceeds the specified "Physical deletion days".
     - 〇
     - Manual
     - Only numeric values
   * - Menu group: Menu name
     - Displays the menus registered in "Menu group": "Menu name" within :menuselection:`Management console --> Menu management`. 
     - 〇
     - List selection
     - Menus that does not contain operations can be selected, but nothing will be deleted.
   * - Data storage path
     - | If there are files that are managed with the data storage path, input said path.
       | /storage/<<organization>>/<<workspace>>/One of the following paths.
       | exp)
       | Ansible Legacy
       | /driver/ansible/legacy
       | Ansible pioneer
       | /driver/ansible/pioneer
       | 
       | Targets that are actually deleted are in the following path: /storage/<<organization>>/<<workspace>>/<<Data storage path>>/<<Unique item(ID、No etc)>>
     - 
     - Manual
     - 
   * - Remarks
     - Free description field. Can be used even for discarded and restored records.
     - 
     - Manual
     - 
