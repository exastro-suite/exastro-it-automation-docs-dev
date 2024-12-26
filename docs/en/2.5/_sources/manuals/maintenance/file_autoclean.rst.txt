================
File auto-clean function
================

Introduction
========

| This document aims to explain the ITA file auto-clean function.

File auto-clean function overview
======================

| This function checks the last date files in the workspace storage file was updated and deletes files and directories that exceeds the storage period.
| Only directories within the users' workspace can be deleted by the function.
| The auto-clean function is executed once per day at 00:01.

File deletion management menu structure
========================================

| This section explains the menus found in the File auto-clean menu.

Menu/Page list
-----------------

#. | :menuselection:`File auto-clean function` menu
   | The menus found in the :menuselection:`File auto-clean function` menu group are as following.

.. list-table:: File deletion management menu list
   :header-rows: 1
   :align: left

   * - No
     - Menu group
     - Menu/Page
     - Description
   * - 1
     - Management console
     - File deletion management
     - | Manages information that deletes data exceeding the storage period.


.. figure:: /images/ja/file_autoclean/file_delete_list_filter.png
   :alt: File auto-clean function page
   :width: 5.22863in
   :height: 0.99251in

   File auto-clean function page

.. list-table:: Default value list
   :header-rows: 1
   :align: left

   * - Item number
     - Deletion days
     - Deletion target directory
     - Deletion target file
     - Deletion sub directory
     - Remarks
   * - 1
     - 1
     - /tmp/
     - \*
     - False
     - Temporary directory for Workspace
   * - 2
     - 1
     - /tmp/driver/ansible/
     - \*
     - True
     - Temporary directory for Ansible
   * - 3
     - 1
     - /driver/ansible/git_repositories/
     - \*
     - True
     - Temporary directory for Ansible(Git)
   * - 4
     - 1
     - /tmp/driver/cicd/
     - \*
     - True
     - Temporary directory for CI/CD for IaC
   * - 5
     - 1
     - /tmp/driver/conductor/
     - \*
     - True
     - Temporary directory for Conductor
   * - 6
     - 1
     - /tmp/driver/terraform_cli/
     - \*
     - True
     - Temporary directory for Terraform-CLI
   * - 7
     - 1
     - /tmp/driver/terraform_cloud_ep/
     - \*
     - True
     - Temporary directory for Terraform-Cloud/EP
   * - 8
     - 1
     - /tmp/bulk_excel/import/import/
     - \*
     - True
     - Temporary directory for Export/Import
   * - 9
     - 1
     - /tmp/bulk_excel/import/upload/
     - \*
     - True
     - Temporary directory for Export/Import


.. figure:: /images/ja/file_autoclean/file_delete_list_edit.png
   :alt: File deletion registration page
   :width: 5.22863in
   :height: 0.99251in

   File deletion registration page


.. list-table:: File deletion registration item list
   :header-rows: 1
   :align: left

   * - | Item
     - | Description
     - | Input required
     - | Input format
     - | Restrictions
   * - Deletion days
     - | Deletes the target file if the file's time stamp exceeds the specified deletion days value.
       | Can only input numeric values
     - ○
     - Manual
     -
   * - Deletion target directory
     - | Specifies target where the deletion target file is stored.
       | If the path is under :file:`/storage/<<organization>>/<<workspace>>/`,
       | specify the path from :file:`/storage/<<organization>>/<<workspace>>`.
     - ○
     - Manual
     - Maximum length 1024 bytes
   * - Deletion target file
     - | Specifies name of the target file/
       | Can specify wild cards.
     - ○
     - Manual
     -
   * - Deletion sub directory
     - | Configure whether to delete the directory under the specified deletion target directory as well or not.
       | If set to "True", the name and the last updated date of the directory will be checked and deleted if they are deletion targets.
     - ○
     - List selection
     -
