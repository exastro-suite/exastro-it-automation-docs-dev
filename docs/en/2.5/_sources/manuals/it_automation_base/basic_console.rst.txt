==============
Basic console
==============

Introduction
========

| This document aims to explain the ITA basic console functions and how to use them.

ITA basic console overview
=======================

| This section explains the basic console's main features and how to operate them.
| The basic console provides the user with the following functions required in order to perform common ITA tasks.

ITA basic console menu and page structure
=====================================

| This section explains the ITA basic console menu and page structure.


ITA basic console menu list
------------------------------

| The menus ITA common/Basic console menus are as following.

.. table:: ITA page list
   :align: left

   +----------+---------------------------------+----------------------------+-------------------------------------------+
   | **No**   | **Menu group**                  | **Menu page**              | **Description**                           |
   |          |                                 |                            |                                           |
   |          |                                 |                            |                                           |
   |          |                                 |                            |                                           |
   |          |                                 |                            |                                           |
   |          |                                 |                            |                                           |
   |          |                                 |                            |                                           |
   +==========+=================================+============================+===========================================+
   | 1        | ITA basic console               | Operation list             | Allows users to maintain (view/register\  |
   |          |                                 |                            | /update/discard) input operations.        |
   +----------+                                 +----------------------------+-------------------------------------------+
   | 2        |                                 | Movement list              | Allows users to view registered Movements |
   +----------+---------------------------------+----------------------------+-------------------------------------------+


Function/operation
==================

ITA basic console
-----------------

.. _basic_console_operation:

Operation list
~~~~~~~~~~~~~~~~~~

#. In the [Operation list] page, users can manage operations that are executed to target hosts by orchestrators.

   | Example)Additional service operations" etc

#. Press the :guilabel:`Register` button to register operation information.

   .. figure:: /images/ja/basic_console/operation/operation.gif
      :width: 800px
      :alt: Register page (operation list)

      Register page (operation list)

#. The items found in the Registration page are as following.

   .. table:: Registration page item list (operation list)
      :align: left
         
      +-----------+--------------------------------+------------------+-------------------+----------------------------+
      | **Item**  | **Description**                | **Input require\ | **Input method**  | **Restrictions**           |
      |           |                                | d**              |                   |                            |
      |           |                                |                  |                   |                            |
      |           |                                |                  |                   |                            |
      |           |                                |                  |                   |                            |
      |           |                                |                  |                   |                            |
      |           |                                |                  |                   |                            |
      |           |                                |                  |                   |                            |
      |           |                                |                  |                   |                            |
      +===========+================================+==================+===================+============================+
      | Operation\| An unique ID is automatically \| \-               | Automatic         |                            |
      |  ID       | input for each operation.      |                  |                   |                            |
      +-----------+--------------------------------+------------------+-------------------+----------------------------+
      | Operation\| Input a name for the operation.| ○               | Manual            | Maximum length 256 bytes   |
      |  name     |                                |                  |                   |                            |
      +-----------+--------------------------------+------------------+-------------------+----------------------------+
      | Scheduled\| Input a date/time for the sche\| ○               | Manual            |                            |
      |  executio\| duled execution date/time.     |                  |                   |                            |
      | n date/\  |                                |                  |                   |                            |
      | time      | ※The operation will not be a\ |                  |                   |                            |
      |           | utomatically executed on thi\  |                  |                   |                            |
      |           | s date.                        |                  |                   |                            |
      |           |                                |                  |                   |                            |
      +-----------+--------------------------------+------------------+-------------------+----------------------------+
      |           | ※Operation histories linked t\|                  |                   |                            |
      |           | o operations with "Scheduled e\|                  |                   |                            |
      |           | xeuction date/time" set will b\|                  |                   |                            |
      |           | e automatically deleted when i\|                  |                   |                            |
      | Last exec\| t passess its' specified stora\| \-               | Display item      | This item will be blank if\|
      | uted date\| ge period.                     |                  |                   |  the opeartion has not bee\|
      | /time     | This item displays the last da\|                  |                   | n executed before.         |
      |           | te/time the operation was exec\|                  |                   |                            |
      |           | uted in one of the driver menu\|                  |                   |                            |
      |           | us' execution menu or the Cond\|                  |                   |                            |
      |           | uctor execution menu.          |                  |                   |                            |
      +-----------+--------------------------------+------------------+-------------------+----------------------------+
      | Environm\ | Registers the environment regi\| \-               | Automatic         |                            |
      | ent       | stered when the workspace wa\  |                  |                   |                            |
      |           | s created.                     |                  |                   |                            |
      |           | This item is used when linked \|                  |                   |                            |
      |           | to Exastro OASE and/\          |                  |                   |                            |
      |           | or Exastro EPOCH               |                  |                   |                            |
      +-----------+--------------------------------+------------------+-------------------+----------------------------+
      | Remarks   | Free description field         | \-               | Manual            |                            |
      +-----------+--------------------------------+------------------+-------------------+----------------------------+

Movement list
~~~~~~~~~~~~

| In the [Movement list] page, the user can check the links between Movements and orchestrators(view only).

.. note:: | For registering Movements, refer to the different Driver manuals and register from the desired orchestrator driver console menu.

.. figure:: /images/ja/basic_console/movement/movement.png
   :width: 800px
   :alt: Submenu (Movement list)

   Submenu (Movement list)