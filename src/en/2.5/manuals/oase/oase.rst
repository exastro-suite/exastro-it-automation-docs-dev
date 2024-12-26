====
OASE
====

Introduction
=========

| This document aims to explain the OASE function and how to use it.

OASE menu structure
=================

| This section explains the OASE menu structure.

Menu list
-----------------

#. | **OASE menu**
   | The menus found in the OASE menu are as following.

   .. table::  OASE menu list
      :widths: 1 1 1 1 5
      :align: left

      +-------+--------------+--------------+--------------+-----------------------------------------+
      | **N\  | **Parent m\  | **Menu group\| **Menu**     | **Description**                         |
      | o**   | enu group**  | **           |              |                                         |
      |       |              |              |              |                                         |
      +=======+==============+==============+==============+=========================================+
      | 1     | OASE         | Event        | Event flow   | Allows users to maintain (view/register\|
      |       |              |              |              | /edit/discard) settings related to OASE.|
      +-------+              +              +--------------+-----------------------------------------+
      | 2     |              |              | Event history| Allows users to view events fetched b\  |
      |       |              |              |              | y the Agent.                            |
      +-------+              +--------------+--------------+-----------------------------------------+
      | 3     |              | Label        | Create label | Allows users to maintain (view/register\|
      |       |              |              |              |  /edit/discard) labels.                 |
      +-------+              +              +--------------+-----------------------------------------+
      | 4     |              |              | Labeling     | Allows users to link (view/register/edi\|
      |       |              |              |              | t/discard) Inventory collection targets\|
      |       |              |              |              | , labeling conditions and the correspon\|
      |       |              |              |              | ding labels in order to aplpy labels.   |
      +-------+              +--------------+--------------+-----------------------------------------+
      | 5     |              | Rule         | Filter       | Allows users to maintain (view/register\|
      |       |              |              |              | /edit/discard) filters.                 |
      +-------+              +              +--------------+-----------------------------------------+
      | 6     |              |              | Action       | Allows users to maintain (view/register\|
      |       |              |              |              | /edit/discard) operations and conductor\|
      |       |              |              |              | s that will be executed when the OASE r\|
      |       |              |              |              | ules are matched.                       |
      +-------+              +              +--------------+-----------------------------------------+
      | 7     |              |              | Rule         | Allows users to maintain (view/register\|
      |       |              |              |              | /edit/discard) rules.                   |
      +-------+              +              +--------------+-----------------------------------------+
      | 8     |              |              | Evaluation r\| Allows users to view Action histories.  |
      |       |              |              | esults       | Press the "Details" button moves the us\|
      |       |              |              |              | er to the Conductor execution confirmat\|
      |       |              |              |              | ion menu.                               |
      +-------+--------------+--------------+--------------+-----------------------------------------+


OASE procedure
=============

| This section explains how to use the different OASE menus.

OASE workflow
-----------------------

| A standard workflow using the different OASE menus can be seen below.
| See the following sections for more detailed information regarding each of the steps.

.. figure:: /images/ja/oase/oase/oase_rule_process_v2-3.png
   :width: 700px
   :alt: OASE workflow

-  **Workflow details and references**

   #. | **Register filter**
      | From the Filter menu in the "Rule" menu group, register filters that configures label conditions used by rules. 
      | For more information, see :ref:`filter`.

   #. | **Register Action**
      | From the Action menu in the "Rule" menu group, register an action that will be executed when a rule is matched.
      | For more information, see :ref:`action`.

   #. | **Register rules**
      | From the Rule menu in the "Rule" menu group, register an action that configures rule evaluation conditions and what actions are executed.
      | For more information, see :ref:`rule`.


OASE menu operation
============================

| This section explains how to operate the OASE function's menu.

OASE Menus
-------------------

| This chapter explains how to operate the menus displayed when OASE is installed.

.. _event_flow:

Event flow
--------------

| In the :menuselection:`OASE --> Event flow` menu, users can maintain (view/register/edit/discard) configurations related to OASE.

| It can be used similarly to the following menus: :menuselection:`OASE --> Event history`, :menuselection:`OASE --> Filter`, :menuselection:`OASE --> Action` and :menuselection:`OASE --> Rule`.

.. figure:: /images/ja/oase/oase/event_flow_menu.png
   :width: 800px
   :alt: Submenu (Event flow)

   Submenu (Event flow)

.. figure:: /images/ja/oase/oase/event_flow_screen_v2-4.png
   :width: 800px
   :alt: Using Event flow

   Using Event flow

.. note::
   | If the :menuselection:`Filter` ・:menuselection:`Action` ・:menuselection:`Rule` menu's :menuselection:`Active` value is "False", the names will be slightly greyed out.

RAW Event data
^^^^^^^^^^^^^^^^^^^^^^^^^
| Users can check the source data of the collected events.

.. figure:: /images/ja/oase/oase/event_flow_event_raw_data.png
   :width: 800px
   :alt: RAW Event data (Event flow)

   RAW Event data (Event flow)

Selecting Display pattern
^^^^^^^^^^^^^^^^^^^^^^^^^

| Users can display which events to display by pressing the :guilabel:`Select display pattern` button (multiple items can be selected).

.. figure:: /images/ja/oase/oase/event_flow_display_pattern_v2-4.png
   :width: 200px
   :alt: Select Display pattern (Event flow)

   Select Display pattern (Event flow)

.. list-table:: Event flow page Select Display pattern.
   :widths: 50 100
   :header-rows: 1
   :align: left

   * - Item
     - Description
   * - New event
     - | Status when the event is collected but not detected by the evaluation function.
       | When the evaluation time ends, it will change to Known (evaluated), Unknown or Expired.
   * - Known event
     - Events that has been detected by the evaluation function.
   * - Unknown event
     - | Events that could not be singled out by the filter function (was not detected by the evaluation function).
       | If the event is unkown, the user should consider what to do with it as an evaluation target.
   * - Expired event
     - | Event removed from evaluation targets caused by one of the following reasons.
       | ・The event period has exceeded more than double the TTL period and is therefore deemed as being too old.
       | ・The event could not be matched between the end of the TIL period and before the evaluation period.
   * - Conclusion event
     - Event that will occur when a rule is matched.
   * - Execution Action
     - Displays the information of the action that will be executed when a rule is matched.
   * - Rule
     - Displays Rule ID and Rule name.

Time range specification
^^^^^^^^^^^^^^^^^^^^^^

| Users can press the :guilabel:`Specify range` button to specify the time period of displayed items.

.. figure:: /images/ja/oase/oase/event_flow_time.png
   :width: 800px
   :alt: Specifying range (Event flow)

   Specifying range (Event flow)

| Press the :guilabel:`X hour(s)` to specify the time period.
| The default value is 1 hour. The minimum value is 5 minutes and the maximum value is 5 years.

.. figure:: /images/ja/oase/oase/event_flow_time_select.png
   :width: 100px
   :alt: Specifying time (Event flow)

   Specifying time (Event flow)

Operating the Event flow menu
^^^^^^^^^^^^^

| Users can maintain (view/register/edit/discard) :menuselection:`Filter`, :menuselection:`Action` and:menuselection:`Rule` both in the Event flow menu and in their respective menus.
.. figure:: /images/ja/oase/oase/event_flow_drag_drop_v2-4.gif
   :width: 800px
   :alt: Drag and drop (Event flow)

   Drag and drop (Event flow)

Filter
**********

.. figure:: /images/ja/oase/oase/event_flow_filter_v2-4.png
   :width: 800px
   :alt: Filter input (Event flow)

   Filter input (Event flow)

| For more information regarding the :menuselection:`Filter` input items, see :ref:`filter`.

Action
**********

.. figure:: /images/ja/oase/oase/event_flow_action_v2-4.png
   :width: 800px
   :alt: Action input (Event flow)

   Action input (Event flow)

| For more information regarding the :menuselection:`Action` input items, see :ref:`action`.

Rule
*******

.. figure:: /images/ja/oase/oase/event_flow_rule_v2-4.png
   :width: 800px
   :alt: Rule input (Event flow)

   Rule input (Event flow)

| For more information regarding the :menuselection:`Rule` input items, see :ref:`rule`.

.. _event_history:

Event history
------------

1. | In the :menuselection:`OASE --> Event history` menu, users can view a list of events fetched by the Agent.

.. figure:: /images/ja/oase/oase/event_history_menu.png
   :width: 800px
   :alt: Submenu (Event history) 

   Submenu (Event history) 

2. | The items found in the Event history menu are as following.

.. list-table:: Event history Item list
   :widths: 50 100
   :header-rows: 1
   :align: left

   * - Item
     - Description
   * - Object ID
     - Automatically given by the system and cannot be edited.
   * - Event collection settings ID
     - [Source data] Agent
   * - Event collection time
     - The time/date of when the Agent fetched the Event.
   * - Event valid time
     - The time period in which the event is valid.
   * - Event status
     - | The following statuses exists.
       | ・Reviewing
       | ・Unknown
       | ・Evaluated
       | ・Expired
   * - Event type
     - | The following statuses exists.
       | ・Event
       | ・Conclusion event
   * - Label
     - Information regarding the attached label.
   * - Evaluation rule name
     - | [Source data]
       | Rule →Rule label name
   * - Used event
     - Event use for evaluation.

.. _label_creation:

Create label
-----------

1. | In the :menuselection:`OASE --> Create label` menu, users can maintain (view/register/edit/discard) labels.

.. figure:: /images/ja/oase/oase/label_creation_menu.png
   :width: 800px
   :alt: Submenu (Create label)

   Submenu (Create label)

2. | The input items found in the Create label menu are as following.

.. list-table:: Create label Input item list
   :widths: 50 100 30 30 30
   :header-rows: 1
   :align: left

   * - Item
     - Description
     - Input required
     - Input method
     - Restrictions 
   * - Label key
     - | The Label key can contain half width alphanumeric chatacters and the following symbols: (_-).
       | The key can not start with a symbol.
     - 〇
     - Manual
     - Maximum length 255 bytes
   * - Colour code
     - | Decides the colour of the label when displayed in the Event flow menu.
       | Not configuring anything will give the label a colour by default.
     - ー
     - Manual
     - Maximum length 40 bytes
   * - Remarks
     - Free description field. Can also be used for discarded and restored records.
     - ー
     - Manual
     - Maximum length 4000 bytes

.. _labeling:

Labeling
-----------

1. | In the :menuselection:`OASE --> Labeling` menu, users can link(view/register/edit/discard) Event collection targets, Labeling conditions and the corresponding labels.

.. figure:: /images/ja/oase/oase/labeling_menu.png
   :width: 800px
   :alt: Submenu (Labeling)

   Submenu (Labeling)

2. | The input items found in the Labeling menu are as following.

   .. table:: Labeling Input item list
      :widths: 1 1 7 1 1 2
      :align: left

      +-----------------------------------+---------------------------------------------------------+--------------+--------------+-----------------+
      | **Item**                          | **Description**                                         | **Input req\ | **Input m\   | **Restrictions**|
      |                                   |                                                         | uired**      | ethod**      |                 |
      +===================================+=========================================================+==============+==============+=================+
      | Labeling settings name            | Input a name for the Labeling settings                  | 〇           | Automatic    | Maximum lengt\  |
      |                                   |                                                         |              |              | h 255 bytes     |
      +-----------------------------------+---------------------------------------------------------+--------------+--------------+-----------------+
      | Event collection settings name    | Displays the Event collection settings name register\   | 〇           | List selecti\| ー              |
      |                                   | ed by the Agent.                                        |              | on           |                 |
      +-----------------+-----------------+---------------------------------------------------------+--------------+--------------+-----------------+
      |                 | Key            | Specify the Event property key for the Search condition\ | ー           | Manual       | Maximum length \|
      |                 |                 | s in JSON query language (JMESPath)                     |              |              | 255 bytes ※1   |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | The Key can contain half width alphanumeric character\  |              |              |                 |
      |                 |                 | s and the following symbols(!#%&()*+,-.;<=>?@[]^_{|}~). |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | The following keys can also be used.                    |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | ・_exastro_event_collection_settings_id                 |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | ・_exastro_fetched_time                                 |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | ・_exastro_end_time                                     |              |              |                 |
      |                 +-----------------+---------------------------------------------------------+--------------+--------------+-----------------+
      |                 | Value data type | Select the value's data type.                           | ー           | List select\ | ※1, ※2        |
      |                 |                 |                                                         |              | ion          |                 |
      |                 |                 | ・Boolean value, Object, Array and Null check:          |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | Specify one if the comparison method is set to [==,≠]. |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | ・Other：                                               |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | Specify if the comparison method is set to [RegExp, R\  |              |              |                 |
      |                 |                 | egExp(DOTALL), RegExp(MULTILINE)].                      |              |              |                 |
      |                 +-----------------+---------------------------------------------------------+--------------+--------------+-----------------+
      |                 | Comparison me\  | Select a comparison method.                             | ー           | List select\ | ※1             |
      |                 | thod            |                                                         |              | ion          |                 |
      |                 |                 | ・<, <=, >, >=：                                        |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | Can be selected if the value data type is set to [Str\  |              |              |                 |
      |                 |                 | ing, Integer, Float,]/                                  |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | ・RegExp, RegExp(DOTALL), RegExp(MULTILINE)※3：        |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | Can only be selected if the value data type is set \    |              |              |                 |
      |                 |                 | to [Other].                                             |              |              |                 |
      |                 +-----------------+---------------------------------------------------------+--------------+--------------+-----------------+
      |                 | Comparison value| Input the value that will be compared.                  | ー           | Manual       | Maximum length\ |
      |                 |                 |                                                         |              |              |  4000 bytes ※1 |
      |                 |                 | ・If the value type is set to [Boolean]:                |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | Input true or false (Can contain capitalized letters).  |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | ・If the value type is set to [Object ]:                |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | Enclose with {}                                         |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | ・If the value type is set to [Array]:                  |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | Enclose with []                                         |              |              |                 |
      +-----------------+-----------------+---------------------------------------------------------+--------------+--------------+-----------------+
      | Label           | Key             | The label keys registered in the Create label menu ar\  | 〇           | List select\ | ※1             |
      |                 |                 | e displayed                                             |              | ion          |                 |
      |                 +-----------------+---------------------------------------------------------+--------------+--------------+-----------------+
      |                 | Value           | Input the value that will be labeled.                   | ー           | Manual       | Maximum length\ |
      |                 |                 |                                                         |              |              |  255 bytes ※1  |
      |                 |                 | In order to use regular expressions, input the foll\    |              |              |                 |
      |                 |                 | owing.                                                  |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | ①Labeling values after searching for values using reg\ |              |              |                 |
      |                 |                 | ular expressions (depending on "Comparison value").     |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | Input a value.                                          |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | ②Using regular expression to search (depending on "Co\ |              |              |                 |
      |                 |                 | mparison value") and using the matched results as la\   |              |              |                 |
      |                 |                 | bel values                                              |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | Leave the value blank.                                  |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | Replacing regular expressions for Match results fro\    |              |              |                 |
      |                 |                 | m ③ and ②                                             |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | Expects the user wants to use the search results' capt\ |              |              |                 |
      |                 |                 | ure group value.                                        |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | ex.                                                     |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | ・Capture group item no.1's label value                 |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | 　→ \\1                                                |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | ・Capture group item no.1 and free value (.com) label \ |              |              |                 |
      |                 |                 | value                                                   |              |              |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | 　→ \\1.com                                            |              |              |                 |
      +-----------------+-----------------+---------------------------------------------------------+--------------+--------------+-----------------+
      | Remarks                           | Free description field                                  | ー           | Manual       | Maximum length \|
      |                 |                 |                                                         |              |              | 4000 bytes      |
      +-----------------------------------+---------------------------------------------------------+--------------+--------------+-----------------+

| ※1 See the following for the required items for the different Labeling usecases.

.. table:: Usecases in the Labeling menu
 :widths: 9 1 2 3 1 1 2
 :align: left

 +-------------------------------------------------+-----------------------------------------------------------------------+----------------------------+
 | **Usecase**                                     | **Search condition**                                                  | **Label**                  |
 |                                                 +----------------+------------------+------------------+----------------+-------------+--------------+
 |                                                 | **Key**        | **Value dat\     | **Comparison m\  | **Comparin\    | **Key**     | **Value**    | 
 |                                                 |                | a type**         | ethod**          | g value**      |             |              |
 +=================================================+================+==================+==================+================+=============+==============+
 | Apply label when a search condition is matched. | 〇             | 〇               | 〇               | 〇             | 〇          | 〇           |
 +-------------------------------------------------+----------------+------------------+------------------+----------------+-------------+--------------+
 | Use the matched value as a label value when a s\| 〇             | 〇               | 〇               | 〇             | 〇          | ー           |
 | earch condition is matched.                     |                |                  |                  |                |             |              |
 +-------------------------------------------------+----------------+------------------+------------------+----------------+-------------+--------------+
 | Apply label when search condition's key \       | 〇             | ー               | ー               | ー             | 〇          | 〇,ー        |
 | is matched.                                     |                |                  |                  |                |             |              |
 +-------------------------------------------------+----------------+------------------+------------------+----------------+-------------+--------------+
 | Apply label when search condition's value is \  |  〇            | ー               | == (Matching) ,  | ー             | 〇          | == → 〇,ー  |
 | a false value  (null、[]、{}、0、\  False).     |                |                  |                  |                |             |              |
 |                                                 |                |                  | ≠ (Not matchi\  |                |             | ≠ → 〇 only|
 |                                                 |                |                  | ng)  only        |                |             |              |
 +-------------------------------------------------+----------------+------------------+------------------+----------------+-------------+--------------+
 | Use Regular expression for search condition.    | 〇             | "Other" only     | RegExp,          | 〇             | 〇          | 〇,ー        |
 |                                                 |                |                  |                  |                |             |              |
 |                                                 |                |                  | RegExp\          |                |             |              |
 |                                                 |                |                  | (DOTALL),        |                |             |              |
 |                                                 |                |                  |                  |                |             |              |
 |                                                 |                |                  | RegExp\          |                |             |              |
 |                                                 |                |                  | (MULTILINE)\     |                |             |              |
 |                                                 |                |                  | only             |                |             |              |
 +-------------------------------------------------+----------------+------------------+------------------+----------------+-------------+--------------+
 | Apply label to all events.                      | ー             | ー               | ー               | ー             | 〇          | 〇           |
 +-------------------------------------------------+----------------+------------------+------------------+----------------+-------------+--------------+
 
| For a more detailed setting sample, see :ref:`labeling_sample`.

| ※2 The different value data types are as following.

.. list-table:: Labeling menu Value data types
   :widths: 1 2 3
   :header-rows: 1
   :align: left

   * - Value data type
     - Comparison method
     - Comparing value
   * - String
     - | RegExp、RegExp(DOTALL)、
       | Everything but RegExp(MULTILINE)
     - | ー
       | E.g.　sample
   * - Integer
     - | RegExp、RegExp(DOTALL)、
       | Everything but RegExp(MULTILINE)
     - | ー
       | E.g.　10
   * - Float
     - | RegExp、RegExp(DOTALL)、
       | Everything but RegExp(MULTILINE)
     - | ー
       | E.g.　1.1
   * - Boolean
     - == (Match) , ≠Mismatch) only
     - true, false only (Can contain capitalized letters)
   * - Object 
     - == (Match) , ≠Mismatch) only
     - | Enclose with {}.
       | E.g.　{Key: Value}
   * - Array
     - == (Match) , ≠Mismatch) only
     - | Enclose with [].
       | E.g.　[aa, bb, cc]
   * - Null
     - == (Match) , ≠Mismatch) only
     - | Null string、[]、{}、0、False only
       | E.g.　""
   * - Other
     - | RegExp、RegExp(DOTALL)、
       | RegExp(MULTILINE) only
     - ー

| ※3 See below for information regarding regular expressions in the Labeling menu.

.. table:: Types of regular expressions in the Labeling menu
 :widths: 1 3
 :align: left

 +-----------------------+------------------------------------------------------------------+
 | **Comparison method**          | **Description**                                         |
 +=======================+==================================================================+
 | RegExp                | Regular expression without any options.                          |
 +-----------------------+------------------------------------------------------------------+
 | RegExp(DOTALL)        |  Can match all lines with newlines containing "."                |
 |                       |                                                                  |
 |                       | If this options is not used, all characters that does not incl\  |
 |                       | ude newlines will be used.                                       |
 +-----------------------+------------------------------------------------------------------+
 | RegExp(MULTILINE)     | Can match everything that starts and ends with  "^" or "$".      |
 +-----------------------+------------------------------------------------------------------+

| For more detailed examples, see :ref:`labeling_regexp_sample`.




.. _filter:

Filter
----------

1. | In the :menuselection:`OASE --> Filter` menu, users can maintain (view/register/edit/discard) filters.

.. figure:: /images/ja/oase/oase/filter_create_menu_v2-4.png
   :width: 800px
   :alt: Submenu (Filter)

   Submenu (Filter)

2. | The input items foud in the Filter page are as following.

.. list-table::
   :widths: 50 100 30 30 30
   :header-rows: 1
   :align: left

   * - Item
     - Description
     - Input required
     - Input method
     - Restrictions 
   * - Active
     - | Select whether to activate or deactivate the filter.
       | True：Actived
       | False：Deactivated
     - 〇
     - List selection
     - ー
   * - Filter name
     - Input a name for the filter.
     - 〇
     - Manual
     - Maximum length 255 bytes
   * - Filter conditions
     - Opens a window where userse can configure filter conditions.
     - 〇
     - ー
     - ー
   * - Search method
     - | Select a method for searching for labels.
       | Unique：Can only filter unique events. If multiple events are hit, all events will be processed as unknown events.
       | Queuing：Can filter unique events, but uses the oldest event if multiple are hit. Note that they might match the rules multiple times.
     - 〇
     - Manual
     - ー
   * - Remarks
     - Free description field. Can also be used for discarded and restored records.
     - ー
     - Manual
     - Maximum length 4000 bytes


Click the :guilabel:`Filter conditions` field to open up a window where the user can configure filter conditions.

.. figure:: /images/ja/oase/oase/filter_condition_v2-4.png
   :width: 600px
   :alt: Filter condition settings

   Filter condition settings

3. | The items found in the Filter condition window are as following.

.. list-table::
   :widths: 50 100 30 30 30
   :header-rows: 1
   :align: left

   * - Item
     - Description
     - Input required
     - Input method
     - Restrictions 
   * - Label key
     - | Select a label key registered in the Create label menu or one of the following keys.
       | ・_exastro_event_collection_settings_id
       | ・_exastro_fetched_time
       | ・_exastro_end_time
       | ・_exastro_type
       | ・_exastro_host
     - 〇
     - List selection
     - ー
   * - Condition
     - Select one of the following: == (Match) ,≠ (Mismatch)
     - 〇
     - List selection
     - ー
   * - Condition value
     - Input a value that will be configured to the label key.
     - 〇
     - Manual
     - Maximum length 4000 bytes


.. _action:

Action
----------

1. | In the :menuselection:`OASE --> Action` menu, the user can maintain (view/register/edit/discard) Actions.

.. figure:: /images/ja/oase/oase/action_create_menu_v2-4.png
   :width: 800px
   :alt: Submenu (Action)

   Submenu (Action)

2. | The input items found in the Action menu are as following.

.. list-table::
   :widths: 50 60 30 30 30
   :header-rows: 1
   :align: left

   * - Item
     - Description
     - Input required
     - Input method
     - Restrictions 
   * - Action name
     - Input a name for the Action.
     - 〇
     - Manual
     - Maximum length 255 bytes
   * - Conductor name
     - [Source data] Conductor list
     - 〇
     - List selection
     - ー
   * - Operation name
     - [Source data] Operation list
     - 〇
     - List selection
     - ー
   * - Event link (Host) 
     - Select whether to specify the original event label "_exastro_host" as a target host for the Action or not.
     - 〇
     - List selection
     - Default value：False
   * - Specify (Host) 
     - | Select the Action target host.
       | [Source data] device list
     - ー
     - List selection
     - ー
   * - Parameter sheet
     - | Select the Parameter sheet that the Action will use.
       | [Source data]Menu list
     - ー
     - List selection
     - ー
   * - Remarks
     - Free description field. Can also be used for discarded and restored records.
     - ー
     - Manual
     - Maximum length 4000 bytes


.. tip::
   | If no operation is specified, configure "Host" and "Parameter sheet".

.. _rule:

Rule
------

1. | In the :menuselection:`OASE --> Rule` menu, users can maintain (view/register/edit/discard) Rules.

.. figure:: /images/ja/oase/oase/rule_create_menu.png
   :width: 800px
   :alt: Submenu (Rule)

   Submenu (Rule)

2. | The input items found in the Rule menu are as following.

.. list-table::
   :widths: 50 100 30 30 40
   :header-rows: 1
   :align: left

   * - Item
     - Description
     - Input required
     - Input method
     - Restrictions 
   * - Active
     - | Select whether to activate the Filter or not.
       | True：Activated
       | False：Deactivated
     - 〇
     - List selection
     - ー
   * - Rule name
     - Input a name for the Rule.
     - 〇
     - Manual
     - Maximum length 255 bytes
   * - Rule label name
     - | Input a name that will be configured to the "_exastro_rule_name" used to permanently evaluate what rule the created the Conclusion event.
     - 〇
     - Manual
     - | Maximum length 255 bytes
       | ※This can not be changed later.
   * - Priority
     - | Input a valid integer for the Priority.
       | The smaller number will be prioritized.
     - 〇
     - Manual
     - Maximum length 255 bytes
   * - Filter A
     - [Source data]Filter 
     - 〇
     - List selection
     - ー
   * - Filter operator
     - | Select a filter operator.
       | A and B： Matching with both A and B
       | A or B：Matching with either A or B
       | A -> B：Matching when B happens after A.
     - 〇
     - List selection
     - ー
   * - Filter B
     - [Source data]Filter
     - ー
     - List selection
     - ー
   * - Pre-operation notification
     - 
     - ー
     - Select file
     - | Maximum size2Mb
       | ※1
   * - Not yet supported
     - ※Planned to be released in later versions.
     - ー
     - ー
     - ー
   * - Pre-operation notification destination
     - Select a destination for where the notifications will be sent.
     - ー
     - List selection
     - ー
   * - Action ID
     - [Source data]Action
     - ー
     - List selection
     - ー
   * - Post-operation notification
     - 
     - ー
     - Select file
     - | Maximum size2Mb
       | ※1
   * - Not yet supported
     - ※Planned to be released in later versions.
     - ー
     - ー
     - ー
   * - Post-operation notification destination
     - Select a destination for where the notifications will be sent.
     - ー
     - List selection
     - ー
   * - Action (Inheriting original event label) 
     - Select whether the original event label used by the rule should be used as an Action parameter or not.
     - ー
     - List selection
     - Default value：True
   * - Conclusion event (Inheriting original event label) 
     - Select whether the original event label used by the rule should inherit the Conclusion event or not.
     - ー
     - List selection
     - Default value：False
   * - Conclusion label settings
     - Opens the Window that allows users to configure Labels for Conclusion events.
     - 〇
     - List selection
     - ー
   * - TTL
     - | TTL (Time To Live) is how long an event is handled as a rule evaluation target (in seconds).
     - 〇
     - Manual
     - | Minimum value 10 (Seconds)
       | Maximum value 2147483647 (Seconds)
       | Default value：3600 (Seconds)
   * - Remarks
     - Free description field. Can also be used for discarded and restored records.
     - ー
     - Manual
     - Maximum length 4000 bytes

.. note::
 | ※1 Templates does not support variables at the moment.
 |     This function is planned to be released in a later version.
 | Example：{{ labels._exastro_fetched_time }}


Click the :guilabel:`Conclusion label settings` field to open up a window where the user can configure Conclusion label settings.

.. figure:: /images/ja/oase/oase/conclusion_label_settings_v2-4.png
   :width: 600px
   :alt: Conclusion label settings

   Conclusion label settings


3. | The Conclusion label's input items are as following.

.. list-table::
   :widths: 50 100 30 30 30
   :header-rows: 1
   :align: left

   * - Item
     - Description
     - Input required
     - Input method
     - Restrictions 
   * - Conclusion label key
     - | Select a label key registered in the Create label menu or the following key.
       | ・_exastro_host
     - 〇
     - List selection
     - ー
   * - Conclusion label value
     - Input a value that will be configured to the Conclusion label key.
     - 〇
     - Manual
     - Maximum length 4000 bytes


.. _evaluation_results:

Evaluation results
--------

1. | In the :menuselection:`OASE --> Evaluation results` menu, users can view Evaluation results.

.. figure:: /images/ja/oase/oase/evaluation_results_menu.png
   :width: 800px
   :alt: Submenu (Evaluation results)

   Submenu (Evaluation results)

2. | The items found in the Evaluation results menu are as following.
   | The user can press the :guilabel:`Details` button to move to the :menuselection:`Conductor --> Operation status confirmation` menu where they can see detailed information regarding the execution status.

.. list-table::
   :widths: 50 100
   :header-rows: 1
   :align: left

   * - Item
     - Description
   * - Action history ID
     - The Label key can contain half width alphanumeric chatacters and the following symbols: (_-).
   * - Rule ID
     - [Source data] Rule 
   * - Rule name
     - [Source data] Rule
   * - Status
     - | The following statuses exists.
       | ・Evaluated.
       | ・Executing
       | ・Waiting for approval
       | ・Approved
       | ・Denied
       | ・Completed
       | ・Completed (Error) 
       | ・Waiting for confirmation
       | ・Confirmed
       | ・Confirmation denied
   * - Action ID
     - [Source data]Action
   * - Action name
     - [Source data]Action
   * - Conductor instance ID
     - [Source data]Conductor operation list
   * - Conductor name
     - [Source data]Conductor operation list
   * - Operation ID
     - [Source data]Operation list
   * - Operation name
     - [Source data]Operation list
   * - Event link
     - [Source data]Rule 
   * - Specify Host ID
     - [Source data]Device list
   * - Specify Host name
     - [Source data]Device list
   * - Parameter sheet name
     - [Source data]Menu management
   * - Parameter sheet (rest) 
     - [Source data]Management
   * - Use event ID
     - List of Event IDs leading to the Action execution.
   * - Action (Inheriting original event label) 
     - [Source data]Rule 
   * - Event (Inheriting original event label) 
     - [Source data]Rule 
   * - Action parameter
     - Dispalys Parameters linked to the Action
   * - Conclusion event label
     - Displays labels used by the Conclusion event.
   * - Registration date/time
     - YYYY/MM/DD HH:MM:SS
   * - Remarks
     - Free description field. Can also be used for discarded and restored records.


Appendix
=====

.. _labeling_sample:

Labeling setting example
---------------------

| The following sections contains Labeling setting examples

.. figure:: /images/ja/oase/oase/labeling_sample.png
   :width: 800px
   :alt: Labeling input example (Labeling)

   Labeling input example (Labeling)

.. _labeling_regexp_sample:

Labeling example (regular expression) 
--------------------------------

| Labeling examples using regular expressions can be seen below.

.. table:: Regular expression examples with and without options.
 :widths: 2 2 3 1 1 2
 :align: left

 +---------------------+---------------------------------------------------------------------+-----------------------------+------------------------------------+
 |                     | **Search condition**                                                | **Label**                   |                                    |
 +---------------------+-----------------------+---------------------------------------------+--------------+--------------+------------------------------------+
 | **Mail body**       | **Comparison method** | **Comparison value**                        |  **Key**     | **Value**    | **Applied label (key: value) **    | 
 +=====================+=======================+=============================================+==============+==============+====================================+
 | Target              | RegExp                | Server:(.*).com                             | Server       | ー           | Server: web01                      |
 |                     |                       |                                             |              |              |                                    |
 | Server:web01.com    |                       |                                             |              |              |                                    |
 +---------------------+-----------------------+---------------------------------------------+--------------+--------------+------------------------------------+
 | ・・・ (Body)       | RegExp(DOTALL)        | Server:(\\w+).com\\r\\n(.*) has occured.    | Server       | \\2: \\1     | Server: Fault: web01               |
 |                     |                       |                                             |              |              |                                    |
 | Target              |                       |                                             |              |              |                                    |
 |                     |                       |                                             |              |              |                                    |
 | Server:web01.com    |                       |                                             |              |              |                                    |
 |                     |                       |                                             |              |              |                                    |
 | ・・・ (Body)       |                       |                                             |              |              |                                    |
 +---------------------+-----------------------+---------------------------------------------+--------------+--------------+------------------------------------+
 | Server:web01.com    | RegExp(MULTILINE)     | ^Server:(.*).com\\r$                        | Server       | \\1          | Server: web01                      |
 |                     |                       |                                             |              |              |                                    |
 | A fault has occured.|                       |                                             |              |              |                                    |
 +---------------------+-----------------------+---------------------------------------------+--------------+--------------+------------------------------------+


.. figure:: /images/ja/oase/oase/labeling_regexp.png
   :width: 800px
   :alt: Settings when using Regular expressions

   Settings when using Regular expressions


Event data format sent by Agent
---------------------------------------------------

| The format of the Event data sent my the Agent are as following.

.. code-block:: none
   :name: Data sample sent from Mail server
   :caption: Data sample sent from Mail server
   :lineno-start: 1

   {
           "event": [{
               "message_id": "<20231004071711.06338770D0A0@ita-oase-mailserver.localdomain>",
               "envelope_from": "root@ita-oase-mailserver.localdomain",
               "envelope_to": "user1@localhost",
               "header_from": "<root@ita-oase-mailserver.localdomain>",
               "header_to": "user1@localhost",
               "mailaddr_from": "root <root@ita-oase-mailserver.localdomain>",
               "mailaddr_to": "user1@localhost",
               "date": "2023-10-04 16:17:10",
               "lastchange": 1696403830.0,
               "subject": "test mail",
               "body": "sample\r\n"
               "_exastro_event_collection_settings_id": "d0c9a70c-a1c0-4c7b-9e96-82e602ebc55e",
               "_exastro_fetched_time": 1696406510,
               "_exastro_end_time": 1696406810,
               "_exastro_type": "event"
               "_exastro_event_collection_settings_name": "agent01"
           }]
   }

.. _loop_care_notes:

Confirmation items when Event history and Evaluation results displays large amounts of records.
--------------------------------------------------------------------

| If a Conclusion event configured by a rule is configured to match the filter reaching the previous rule.
| It will re-match with the rule and continuously generate new Conclusion event, which will create a loop.
| This will cause the Event history and Evaluation results will have massive amounts of records registered to them.
| If needed, make sure to configure the settings to prevent that.
