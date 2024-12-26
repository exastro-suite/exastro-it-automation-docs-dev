========
User
========

Introduction
========

| This document explains the User function in the Exastro system.


Register user
==============
| Users can register users used by the Exastro system.
| Users are divided by which role they belong to.
| For more information regarding roles, see :doc:`../organization_management/role`.

Create user
--------------

| Follow the steps below to create a user.

#. | Log in to the Exastro system as the Organization administrator.

#. | From the menu, click :menuselection:`User management`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left

#. | This will display the :menuselection:`User list` page. Click :guilabel:`Create`.

   .. figure:: /images/ja/manuals/platform/user/ユーザー一覧画面.png
      :width: 600px
      :align: left

   .. note:: | :menuselection:`User management` is only displayed in the menu when the user is logged in is linked to a role that has User management permissions
      | The roles that has User management permission are as following.
      | _orgnization-manager,_orgnization-user-manager,_orgnization-user-role-manager

#. | This will display the :menuselection:`New user` page. Input the user's information and click the :guilabel:`Register` button.

   .. figure:: /images/ja/manuals/platform/user/新規ユーザー作成画面.png
      :width: 600px
      :align: left

   .. list-table:: New user registration
      :widths: 40 200
      :header-rows: 1
      :align: left
   
      * - Item name
        - Description
      * - User ID
        - | An unique ID is automatically given by the system.
      * - Username
        - | Input a username for the user. This will be used as the login ID of the user.
      * - Password
        - | Input a password for the user. This will be used as the password needed in order to log in.
          | If set to ON, the user will be moved to the Change password page after the next login.
          | We recommend leaving it ON.
      * - email
        - | Input the user's E-mail.
      * - Name
        - | Input the user's name.
      * - Last name
        - | Input the user's last name.
      * - Active
        - | Select whether the status of the user should be Actived or Deactivated.
      * - Group
        - | Input the group of the user.
      * - Description
        - | Input a description for the user.

Edit user
---------------

| Follow the steps below to edit users.

#. | Log in to the Exastro system as the Organization administrator.

#. | From the menu, click :menuselection:`User management`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left

#. | Doing this will display the :menuselection:`User list` page. Click the :guilabel:`Edit` button.

   .. figure:: /images/ja/manuals/platform/user/ユーザー一覧画面_edit.png
      :width: 600px
      :align: left

#. | This will display the :menuselection:`User edit` page. Edit the desired User information and click the :guilabel:`Register` button.

   .. figure:: /images/ja/manuals/platform/user/ユーザー編集画面.png
      :width: 600px
      :align: left

   .. list-table:: User edit
      :widths: 40 200
      :header-rows: 1
      :align: left
   
      * - Item name
        - Description
      * - User ID
        - | The User ID can not be changed
      * - Username
        - | The Username can not be changed.
      * - Password
        - | Input a password for the user. This will be used as the password needed in order to log in.
          | If set to ON, the user will be moved to the Change password page after the next login.
          | We recommend leaving it ON.
      * - email
        - | Input the user's E-mail.
      * - Name
        - | Input the user's name.
      * - Last name
        - | Input the user's last name.
      * - Active
        - | Select whether the status of the user should be Actived or Deactivated.
      * - Group
        - | Input the group of the user.
      * - Description
        - | Input a description for the user.

Delete user
--------------

| Follow the steps below in order to delete users.

#. | Log in to the Exastro system as the Organization administrator.

#. | From the menu, click :menuselection:`User management`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left

#. | Doing this will display the :menuselection:`User list` page. Click the :guilabel:`Delete` button.

   .. figure:: /images/ja/manuals/platform/user/ユーザー一覧画面_delete.png
      :width: 600px
      :align: left

#. | Doing so will display a message asking for confirmation. Input :kbd:`Organization ID/User ID` and click :guilabel:`Yes, delete`.

   .. figure:: /images/ja/manuals/platform/user/ユーザー削除実行確認画面.png
      :width: 600px
      :align: left

   .. tip::
      | It is not possible to restore roles once deleted.
      | It is not possible to delete the Organization administrator.
