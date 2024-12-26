======
Role
======

Introduction
========

| This document explains the Exastro system's role function.


Roles
==========

| Roles are groups that gives the belonging users permission to operate (create, edit, delete) target Exastro system resources.
| The types of roles in Exastro are as following.

- | Organization role
  | The 3 types of roles that manages information related to Organizations are as following.

.. list-table:: Organization role
   :widths: 20 30
   :header-rows: 1
   :align: left
      
   * - **Role**
     - **Description**
   * - | Organization administrator
       | (_organization-manager)
     - Can add workspaces and manage users and roles.
   * - | User/Role administrator
       | (_organization-user-role-manager)
     - Can manage users and roles.
   * - | User administrator
       | (_organization-user-manager)
     - Can manage users.
  

- | Workspace role

.. list-table:: Workspace role
   :widths: 20 30
   :header-rows: 1
   :align: left
      
   * - **Role**
     - **Description**
   * - | Workspace administrator
       | (_{Workspace ID}-admin)
     - Can manage workspaces.
   * - Custom role
     - | Custom roles are user created and can have custom permissions for user specified Exastro IT Automation menus and workspaces.
       | (See ":doc:`../it_automation_base/management_console`" for more information regarding menus that can be used by Exastro IT Automation)


Create roles and link users
============================

| This section explains how to create new roles and link users to them.

#. | :ref:`role_workspace`
   | Can maintain Workspace access permissions per role. 
#. | :ref:`role_user`
   | Allows users to add roles to users to control their access to workspaces.

.. _role_workspace:

Add roles and link workspaces
--------------------------------

#. | Log in to the Exastro system as either the Organization administrator or as a user linked to the _${ws-id}-admin role.


#. | From the menu, click :menuselection:`Role management`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left
      
   .. note:: | ":menuselection:`Role management`" is only displayed in the menu when the user is logged in as the workspace administrator or as the organization administrator (user with permission to manage and give roles).

#. | Doing this will display the :menuselection:`Role list` page. Click the :guilabel:`Create` button.

   .. figure:: /images/ja/manuals/platform/role/platform_role_create.png
      :width: 600px
      :align: left

#. | This will display the :menuselection:`New role` page. Input the role's information and click the :guilabel:`Register` button.

   .. figure:: /images/ja/manuals/platform/role/platform_role_register.png
      :width: 600px
      :align: left

   .. list-table:: Register Parent role
      :widths: 40 200
      :header-rows: 1
      :align: left
   
      * - Item name
        - Description
      * - Role name
        - | Input a name for the role.
      * - Role type
        - | The role type is fixed to workspace.
      * - Description
        - | Input a description for the role.
      * - Workspace
        - | Specify the Workspace that will be used.

| A workspace list will be displayed in :menuselection:`Workspace` where the user can select which workspace to link to the corresponding role.
    
.. figure:: /images/ja/manuals/platform/role/platform_role_workspace_used.png
   :width: 600px
   :align: left

.. note:: | When logged in as a Workspace administrator, only the workspace that the user is admin for can be selected. 

.. _role_user:

User/role link
--------------------

#. | Log in to the Exastro system as either the Organization administrator or as a user linked to the _${Workspace ID}-admin role.
#. | From the menu, click :menuselection:`Role management`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left

   .. note:: | ":menuselection:`Role management`" is only displayed in the menu when the user is logged in as the workspace administrator or as the organization administrator (user with permission to manage and give roles).

#. | Doing this will display the :menuselection:`Role list` page. Click the :guilabel:`User` button.

   .. figure:: /images/ja/manuals/platform/role/platform_role_list.png
      :width: 600px
      :align: left

#. | This will display the :menuselection:`Add/Remove role` page. Select which user that will have their role changed and click the :guilabel:`Add` button.

   .. figure:: /images/ja/manuals/platform/role/platform_role_grant.png
      :width: 600px
      :align: left

Edit role
------------

| Follow the steps below to edit roles.

#. | Log in to the system as the Organization administrator.

#. | From the menu, click :menuselection:`Role management`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left

   .. note:: | ":menuselection:`Role management`" is only displayed in the menu when the user is logged in as the workspace administrator or as the organization administrator (user with permission to manage and give roles).

#. | Doing this will display the :menuselection:`Role list` page. Click the :guilabel:`Edit` button.

   .. figure:: /images/ja/manuals/platform/role/platform_role_list_edit.png
      :width: 600px
      :align: left

#. | This will display the :menuselection:`Role edit` page. Edit the desired role information and click the :guilabel:`Register` button.

   .. figure:: /images/ja/manuals/platform/role/platform_role_edit.png
      :width: 600px
      :align: left

   .. list-table:: Edit role
      :widths: 40 200
      :header-rows: 1
      :align: left
   
      * - Item name
        - Description
      * - Role name
        - | The role name can not be edited.
      * - Role type
        - | The role type is fixed to workspace.
      * - Description
        - | Input a description for the Role.
      * - Workspace
        - | Specify the Workspace that will be used.

Delete role
------------

| Follow the steps below to delete roles.

#. | Log in to the Exastro system as the Organization administrator.

#. | From the menu, click :menuselection:`Role management`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left

   .. note:: | ":menuselection:`Role management`" is only displayed in the menu when the user is logged in as the workspace administrator or as the organization administrator (user with permission to manage and give roles).

#. | Doing this will display the :menuselection:`Role list` page. Click the :guilabel:`Delete` button.

   .. figure:: /images/ja/manuals/platform/role/platform_role_list_delete.png
      :width: 600px
      :align: left

#. | Doing so will display a message asking for confirmation. Input :kbd:`Organization ID/Role ID` and click :guilabel:`Yes, delete`.

   .. figure:: /images/ja/manuals/platform/role/platform_role_delete.png
      :width: 600px
      :align: left

   .. tip::
      | It is not possible to restore roles once deleted.
