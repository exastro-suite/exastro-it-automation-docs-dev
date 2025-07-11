==========================
Workspace 
==========================

Introduction
========

| This document explains Workspaces in the Exastro system.


Workspace
==================

| Workspaces are work environments for centrally managing design information for automating tasks and system structure information.
| They come with the function to centrally manage IaC information used to manage, construct and preserve systems, setting files and system values (past, present and future setting values).

.. figure:: /images/ja/diagram/overview_of_the_workspace.png
    :alt: Workspace overview figure

Create workspace
====================

| A workspace must be created to use the Exastro IT Automation functions.
| Workspaces are created for each automation targeted system environment, Normal, Production, Staging and Development.

Steps to create workspaces
------------------------

| Follow the steps below to create a workspace.

#. | Log in to the Organization created in :doc:`../platform_management/organization` as the Organization administrator.

#. | From the menu, click :menuselection:`Workspace management`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left

#. | This will display the :menuselection:`Workspace list` page. Click :guilabel:`Create`.

   .. figure:: /images/ja/manuals/platform/workspace/ワークスペース一覧.png
      :width: 600px
      :align: left

   .. warning::
      | The :guilabel:`Create` button is only displayed when the user is logged in as the Organization administrator.

#. | This will display the :menuselection:`new workspace` page. Input the Workspace's information and click the :guilabel:`Register` button.

   .. figure:: /images/ja/manuals/platform/workspace/新規ワークスペース作成画面.png
      :width: 600px
      :align: left

   .. list-table:: New workspace registration
      :widths: 40 200
      :header-rows: 1
      :align: left
   
      * - Item name
        - Description
      * - Workspace ID
        - | An unique ID is automatically given by the system.
          | This ID will be used to link systems.
      * - Workspace name
        - | Input a name for the Workspace.
      * - Environment list
        - | Input a list of environments the workspace will be created to (Staging, Development, Production, etc).
          | This environment can be given to assigned to operations.
      * - Description
        - | Input a description for the Workspace.

   .. note::
      | Even if the workspace creator (Organization administrator) doesn't have any roles configured to them, they will automatically have granted access to the workspace.
      | For more information regarding first-time logins, see :doc:`../it_automation_base/general`.

Edit workspace
--------------------

| Follow the steps below to edit workspaces.

#. | Log in to the Exastro system as the Organization administrator.

#. | From the menu, click :menuselection:`Workspace management`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left


#. | This will display the :menuselection:`Workspace list` page. Click the :guilabel:`Edit` button.

   .. figure:: /images/ja/manuals/platform/workspace/ワークスペース一覧画面_edit.png
      :width: 600px
      :align: left

   .. warning::
      | The :guilabel:`Edit` will not be displayed when the Workspace administrator is logged in.

#. | This will display the :menuselection:`Workspace edit` page. Edit the desired Workspace information and click the :guilabel:`Register` button.

   .. figure:: /images/ja/manuals/platform/workspace/ワークスペース編集画面.png
      :width: 600px
      :align: left

   .. list-table:: Workspace edit
      :widths: 40 200
      :header-rows: 1
      :align: left
   
      * - Item name
        - Description
      * - Workspace ID
        - | The ID can not be edited.
      * - Workspace name
        - | Input a name for the Workspace.
      * - Environment list
        - | Input a list of environments the workspace will be created to (Staging, Development, Production, etc).
          | This environment can be given to assigned to operations.
      * - Description
        - | Input a description for the Workspace.


Delete workspace
--------------------

| Follow the steps below in order to delete workspaces.

#. | Log in to the Exastro system as the Organization administrator.

#. | From the menu, click :menuselection:`Workspace management`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left

#. | This displays the :menuselection:`Workspace list` page. Click the :guilabel:`Delete` button.

   .. figure:: /images/ja/manuals/platform/workspace/ワークスペース一覧画面_delete.png
      :width: 600px
      :align: left

   .. warning::
      | The :guilabel:`Edit` will not be displayed when the Workspace administrator is logged in.

#. | Doing so will display a message asking for confirmation. Input :kbd:`Organization ID/Workspace ID` and click :guilabel:`Yes, delete`.

   .. figure:: /images/ja/manuals/platform/workspace/ワークスペース削除実行確認画面.png
      :width: 600px
      :align: left

   .. tip::
      | It is not possible to restore Workspaces once deleted.

