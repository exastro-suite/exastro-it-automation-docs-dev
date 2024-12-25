======================
Mail server settings
======================


Introduction
========

| This document explains the Mail server settings in the Exastro Suite.

.. _email_sending_server_settings:

Mail server settings
========================

| In order to recieve event notifications from IT Automation and OASE, the user must configure a mail server for sending mails. 

Registering Mail server
------------------------

| Follow the steps below to register a Mail server.

#. | Log in to the Exastro system as the Organization administrator.

#. | From the menu, click :menuselection:`Mail sending server settings`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left

#. | Doing so will display the :menuselection:`Mail sending server settings` page. Input the Mail sending server information and click :guilabel:`Register`.
   | This will display a :guilabel:`Forgot password` button on the login page.

   .. figure:: /images/ja/manuals/platform/mailserver_settings/メール送信サーバ設定.png
      :width: 600px
      :align: left

   .. list-table:: Registering Mail sending server settings
      :widths: 40 200
      :header-rows: 1
      :align: left
   
      * - Item name
        - Description
      * - SMTP server host
        - | Specify the SMTP server host.
      * - Decryption method
        - | Specify the decryption method.
      * - SMTP server port
        - | Specify the port for the SMTP server.
      * - With authentication
        - | Tick if SMTP server is using User authentication.
      * - Authentication user
        - | Input the SMTP server's authentication user ID.
      * - Authentication password
        - | Input the SMTP server's authentication password.
      * - Source mail address(From)
        - | Input the Source mail address.
      * - Source display name
        - | Input the name that will be displayed for the source.
      * - Reply mail address(Reply-to)
        - | Input a mail address for where the mail will be sent.
      * - Reply display name
        - | Input the name that will be displayed for the replier.
      * - Sender mail address(Envelope-From)
        - | Input a mail address for the sender.
     
Deleting the Mail sending server
------------------------

| Follow the stebs below to delete Mail sending server settings.

#. | Log in to the System as the Organization administrator.

#. | From the menu, click :menuselection:`Mail sending server settings`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left

#. | The :menuselection:`Mail sending server settings` menu will be displayed. Click :guilabel:`Delete settings`.

   .. figure:: /images/ja/manuals/platform/mailserver_settings/メール送信サーバ設定_delete.png
      :width: 600px
      :align: left

#. | Doing so will display a message asking for confirmation. Input :kbd:`Delete` and click :guilabel:`Yes, delete`.
   | This will remove the :guilabel:`Forgot password` button from the login page.

   .. figure:: /images/ja/manuals/platform/mailserver_settings/メール送信サーバ設定削除実行確認画面.png
      :width: 600px
      :align: left

   .. tip::
      | It is not possible to restore Mail sending server settings once deleted.
