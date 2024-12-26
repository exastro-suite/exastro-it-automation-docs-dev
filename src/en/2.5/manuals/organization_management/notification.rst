========
Notification management
========

Introduction
========

| This document explains the Exastro system's Notification management function.

.. _notification_management:

Registering Notification destination settings
================

| The Notification management allows users to configure settings required in order to recieve Event notifications from ITA Automation and OASE.

Registering Notification destination settings procedure.
--------------------

| Follow the steps below in order to register Notification destination settings.

#. | Log in to the Exastro system as the Organization administrator.

#. | From the menu, click :menuselection:`Notification management`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left

   .. note:: | OASE function
      | For more information regarding the OASE function, see :doc:`../oase/oase_common`.

#. | Doing so will display the :menuselection:`Notification destiantion workspace list` page. Select the desired workspace or click :guilabel:`Notification destination settings`.

   .. image:: /images/ja/manuals/platform/notification/通知先ワークスペース一覧画面.png
      :width: 600px
      :align: left
      
   .. note:: | Only workspaces the user has access to will be displayed.


#. | This will display the :menuselection:`Notification destination settings list` page. Click :guilabel:`Create`.

   .. image:: /images/ja/manuals/platform/notification/通知先設定一覧画面.png
      :width: 600px
      :align: left
      
#. | This will display the :menuselection:`New notification destination settings` page. Input the notification destination's information and click :guilabel:`Register`.

   .. figure:: /images/ja/manuals/platform/notification/新規通知先設定画面.png
      :width: 600px
      :align: left

   .. list-table:: Registering New notification destination settings
      :widths: 40 200
      :header-rows: 1
      :align: left
   
      * - Item name
        - Description
      * - Notification destination ID
        - | Specify an unique ID that will be given to the Notification destination.
          | The ID specified here will be used to link the systems.
          | An ID will be automatically applied by default.
      * - Notification destination name
        - | Specify a name for the Notification destination.
      * - Notification method
        - | Specify a method for how the notification will be sent.
      * - Notification destination
        - | The settings changes depending on the specified Notification method.
          | Input either an E-mail or an URL.


Confirming Notification destination settings details
--------------------

| Follow the steps below in order to see more detailed Notification destination settings.

#. | Log in to the Exastro system as the Organization administrator.

#. | From the menu, click :menuselection:`Notification management`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left

#. | Doing so will display the :menuselection:`Notification destination workspace list` page. Select the workspace where the user wants to confirm the Notification destination settings details or click :guilabel:`Notification destination settings`.

   .. image:: /images/ja/manuals/platform/notification/通知先ワークスペース一覧画面.png
      :width: 600px
      :align: left
      
   .. tip:: | Only workspaces the user has access to will be displayed.

#. | This will display the :menuselection:`Notification destination settings list` page. Select the desired notification settings.

   .. image:: /images/ja/manuals/platform/notification/通知先設定一覧.png
      :width: 600px
      :align: left

#. | This will display the :menuselection:`Notification destaintion settings details` page.
   | In this menu, users can confirm the settings, edit, delete and test the notifications.

   .. image:: /images/ja/manuals/platform/notification/通知先設定詳細画面.png
      :width: 600px
      :align: left

   .. tip:: 
      | Notification tests
      | The user can test notifications by pressing the :guilabel:`Test notification` button.
      | After pressing the :guilabel:`Test notification` button, a confirmation window will be displayed. After having confirmed the message, a message will be sent to the specified Notification destination.
      | The title and body of the sent message will be "notification test".


Edit Notification destiantion settings 
--------------

| Follow the steps below in order to edit Notification destination settings.

#. | Log in to the Exastro system as the Organization administrator.
#. | From the menu, click :menuselection:`Notification management`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left

#. | Doing so will display the :menuselection:`Notification destiantion workspace list` page. Select the desired workspace or click :guilabel:`Notification destination settings`.
   .. image:: /images/ja/manuals/platform/notification/通知先ワークスペース一覧画面.png
      :width: 600px
      :align: left

   .. note:: | Only workspaces the user has access to will be displayed.

#. | This will display the :menuselection:`Notification destination settings list` page. Click :guilabel:`Edit`.

   .. image:: /images/ja/manuals/platform/notification/通知先設定一覧画面_edit.png
      :width: 600px
      :align: left

#. | This will display the :menuselection:`Edit Notification destination settings` page. Edit the desired contents and click :guilabel:`Register`.

   .. image:: /images/ja/manuals/platform/notification/通知先設定編集画面.png
      :width: 600px
      :align: left

   .. list-table:: Edit Notification destination settings 
      :widths: 40 200
      :header-rows: 1
      :align: left
   
      * - Item name
        - Description
      * - Notification destination ID
        - | The Notification destination ID cannot be changed.
      * - Notification destination name
        - | Specify a name for the Notification destination.
      * - Notification method
        - | Specify Notification method.
      * - Notification destination
        - | The settings changes depending on the specified Notification method.
          | Input either an E-mail or an URL.

Delete Notification destination settings
--------------

#. | Log in to the Exastro system as the Organization administrator.
#. | From the menu, click :menuselection:`Notification management`.

   .. image:: /images/ja/manuals/platform/platform_menu.png
      :width: 200px
      :align: left

#. | Doing so will display the :menuselection:`Notification destiantion workspace list` page. Select the desired workspace or click :guilabel:`Notification destination settings`.

   .. image:: /images/ja/manuals/platform/notification/通知先ワークスペース一覧画面.png
      :width: 600px
      :align: left

   .. note:: | Only workspaces the user has access to will be displayed.

#. | This will display the :menuselection:`Notification destination settings list` page. Click :guilabel:`Delete`.

   .. image:: /images/ja/manuals/platform/notification/通知先設定一覧画面_delete.png
      :width: 600px
      :align: left

#. | This will cause a confirmation message to be displayed. Input the :kbd:`Workspace ID/Notification destination ID` and click  :guilabel:`Yes, delete`.

   .. image:: /images/ja/manuals/platform/notification/通知先設定削除実行確認画面.png
      :width: 600px
      :align: left

   .. tip::
      | It is not possible to restore Notification destination settings once deleted.
