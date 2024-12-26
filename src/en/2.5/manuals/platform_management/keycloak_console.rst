===================================
Keycloak console
===================================

Introduction
========

| This document explains the Exastro Suite's System management's Keycloak console.

KeyCloak console
==========================

| They Keycloak console is used to change login method, password and password policy for Organization users and adding new administrators.
| The user can also use the console to see a log of added roles and user changes.

#. | Select Keycloak console

   | Selecting :menuselection:`Keycloak console` from the menu displays the Keycloak console page.

   .. figure:: /images/ja/manuals/platform/keycloak_console/keycloak_console_menu_v2-4.png
      :width: 200px
      :align: left
      :class: with-border-thin

#. |  Select realm (Organization)

   | The user will need to select which realm (Organization) they are configuring before they can move to the next step.

   .. figure:: /images/ja/manuals/platform/keycloak_console/keycloak_console_realm_list_v2-4.png
      :width: 600px
      :align: left
      :class: with-border-thin

   .. danger::

      | We recommend that the user does not change any settings.
      | The application might not function properly depending on what the user changed.

   .. note::

      | For more information about minotoring policies and logs, see the `Official Keycloak documentation <https://www.keycloak.org/documentation.html>`_.

Adding system administrator
----------------------

#. | Add system adnimistrator

   | When adding new system administrator, select the `master` realm. From the menu, select :menuselection:`User` and press the  :guilabel:`Add user` button. From there, the user can add new users by inputting the user information.


   .. figure:: /images/ja/manuals/platform/keycloak_console/keycloak_console_user_list_v2-4.png
      :width: 600px
      :align: left
      :class: with-border-thin

#. | Input System administrator's user information

   | Input information for the new user that will be added.

   .. figure:: /images/ja/manuals/platform/keycloak_console/keycloak_console_user_add_v2-4.png
      :width: 600px
      :align: left
      :class: with-border-thin

   .. list-table:: Item description
      :widths: 40 200
      :header-rows: 1
      :align: left

      * - Item name
        - Description
      * - | Required user/action
        - | Allows the user to configure wheat inforamtion to configure next the user logs in.
          | For more detailes setting values, see the `Official Keycloak documentation <https://www.keycloak.org/documentation.html>`_.
      * - | E-mail verified
        - | Select OFF
          | ※If there are not mail sending server configured, this will not work even if set to ON
      * - | Select a location
        - | Select which language the user will have displayed
      * - | Username
        - | Input a Username for the user.
      * - | E-mail
        - | Input an E-mail address for the user.
      * - | Name
        - | Input a name for the user.
      * - | Last name
        - | Input a last name for the user.
      * - | Join Groups
        - | This is not supported by Exastro at the moment. Do not specify anything.


#. | Register System admin's user

   | After inputting the required information, press the :guilabel:`Create` button to register the user.

   .. figure:: /images/ja/manuals/platform/keycloak_console/keycloak_console_user_add_ok_v2-4.png
      :width: 600px
      :align: left
      :class: with-border-thin

#. | Configure password for the new user

   | Note that it is not possible to configure a password for the user in the user registration page. The next section in this document describes how to configure passwords.
   | Select :menuselection:`credentials` under User details to configure a password.
   | Press the :menuselection:`Password settings` button and input the password. Press the :guilabel:`Save` button to save the password.

   .. figure:: /images/ja/manuals/platform/keycloak_console/keycloak_console_user_add_password_v2-4.png
      :width: 600px
      :align: left
      :class: with-border-thin

   .. figure:: /images/ja/manuals/platform/keycloak_console/keycloak_console_user_add_password_set.png
      :width: 400px
      :align: left
      :class: with-border-thin

   .. list-table:: Item description
      :widths: 40 200
      :header-rows: 1
      :align: left

      * - Item name
        - Description
      * - | Password
        - | Input the password that will be used when logging.
      * - | New password(Confirmation)
        - | Input the same password once more.
      * - | Temporary
        - | If set to ON, the next time the user logs in, they will be moved to the Password change page.
          | We recommend the user keeps this at ON.

#. | Configure role to the added user

   | Giving the user the required Role allows them to configure settings as if they were a System admin.
   | Select :menuselection:`Role Mappings` under User details to configure a Role.
   | Press the :menuselection:`Assign role` button and select a role. After that, press the :guilabel:`Assign` button to assign the role to the user.

   .. figure:: /images/ja/manuals/platform/keycloak_console/keycloak_console_user_add_role_v2-4.png
      :width: 600px
      :align: left
      :class: with-border-thin

   .. figure:: /images/ja/manuals/platform/keycloak_console/keycloak_console_user_add_role_set.png
      :width: 400px
      :align: left
      :class: with-border-thin


   | Finishing this will have added a user with the priveleges as a system admin.