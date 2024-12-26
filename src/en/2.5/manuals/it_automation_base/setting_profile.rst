
Account management
--------------

In the Account management page, users can edit their own account, change their password, configure two-factor authentication and issue tokens.

#. | Users can configure their account by selecting :menuselection:`Account management` from the menu displayed when selecting the login user icon.

   .. figure:: /images/ja/manuals/platform/login/setting_profile_v2-4.png
      :alt: Account management
      :width: 600px
      :align: left
      :class: with-border-thin

   .. note::
      |  The "Menu - Account management" page will not be displayed while the user is using Exastro IT Automation.

Edit account
^^^^^^^^^^^^^^

#. | Users can change their E-mail, first and last name, which group the belong to and the account description by in the "Edit account(Personal info) section.

   .. figure:: /images/ja/manuals/platform/login/setting_profile_account_v2-4.png
      :alt: Account_Management_Edit_account
      :width: 600px
      :align: left
      :class: with-border-thin

   .. note::
      |  ※It is not possible to change the user name

Change password
^^^^^^^^^^^^^^

#. | From [Account security] > [Signing in] > [Basic authentication], users can display the Change password page.

   .. figure:: /images/ja/manuals/platform/login/setting_profile_password_v2-4.png
      :alt: Account_Management_Change_Password
      :width: 600px
      :align: left
      :class: with-border-thin

#. | From[Update], users can change their own passowrd.

   .. figure:: /images/ja/manuals/platform/login/setting_profile_password_update.png
      :alt: Account_Management_Change_Password
      :width: 400px
      :align: left
      :class: with-border-thin


Configure Two-factor authentication
^^^^^^^^^^^^^^

#. | Users can configure access the Two-factor authentication page from [Account security] > [Signing in] > [Two-factor authentication].

   .. figure:: /images/ja/manuals/platform/login/two_factor_authentication.png
      :alt: Account_Management_two_factor_authentication_page
      :width: 600px
      :align: left
      :class: with-border-thin

#. | Users input their password and login from [Set up Authenticator application] to setup Two-factor authentication.

   .. figure:: /images/ja/manuals/platform/login/two_factor_authentication_login.png
      :alt:Account_Management_two_factor_authentication_password
      :width: 400px
      :align: left
      :class: with-border-thin

   .. figure:: /images/ja/manuals/platform/login/two_factor_authentication_setup.png
      :alt: Account_Management_two_factor_authentication_configuration
      :width: 400px
      :align: left
      :class: with-border-thin

Issue tokens
------------

This system uses access tokens to call APIs. In order to issue an access token, the user needs a refresh token.

.. tip::
   | For more information regarding API authentication, see :doc:`../../reference/index` - :doc:`../../reference/api/index` - :doc:`../../reference/api/operator/index` - :doc:`../../reference/api/operator/certification` 、 :doc:`../../reference/api/system_manager/index` - :doc:`../../reference/api/system_manager/certification`.

#. | By selecting :menuselection:`Issue token` from the menu displayed when selecting the login user icon, users can issue tokens required for API executions and display already issued tokens.

   .. figure:: /images/ja/manuals/platform/login/setting_profile_token_v2-4.png
      :alt: Issue token
      :width: 600px
      :align: left
      :class: with-border-thin

#. | When issuing a token for the first time, press the :guilabel:`Issue` button and input the required information to issue a token.

   | If the user is using two-factor authentication, the user must input their one-time password from their two-factor authentication app.

   .. figure:: /images/ja/manuals/platform/login/setting_profile_token_create_v2-4.png
      :alt: Token list
      :width: 600px
      :align: left
      :class: with-border-thin

   .. figure:: /images/ja/manuals/platform/login/setting_profile_token_issue.png
      :alt: Issue token
      :width: 600px
      :align: left

#. | Issued tokens cannot be re-displayed. Make sure to save the token from the issue result page.

   .. figure:: /images/ja/manuals/platform/login/setting_profile_token_issue_ok.png
      :alt: Issue token
      :width: 600px
      :align: left

#. | The tokens' expiration date can be seen in the Token list.

   .. figure:: /images/ja/manuals/platform/login/setting_profile_token_list_v2-4.png
      :alt: Token list expiration date
      :width: 600px
      :align: left
      :class: with-border-thin

#. | If an issued token is no longer needed, press the :guilabel:`Delete` button to delete the token.

   .. figure:: /images/ja/manuals/platform/login/setting_profile_token_list_delete_v2-4.png
      :alt: Token list(削除)
      :width: 600px
      :align: left
      :class: with-border-thin

   | The user will be asked if they really want to delete the token. If yes, input :kbd:`yes` and press the :guilabel:`Yes, Delete this token`.

   .. figure:: /images/ja/manuals/platform/login/setting_profile_token_delete.png
      :alt: Delete token
      :width: 600px
      :align: left

   .. warning::

      |  When deleted, all tokens will be deactivated.