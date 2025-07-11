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
     - | Events that could not be singled out by the filter function (was not detected by the evaluation function).※
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

     
| ※  If the settings in :menuselection:`OASE management --> Event collection` seen below are wrong, events will be handled as unknown events.
| ("_exastro_not_available" is labeled as a key.)
| Compare with the Event's RAW data and reconfigure the settings in :menuselection:`OASE Management --> Event collection`.
| For more information regarding response keys and event ID keys, see :ref:`here<oase_agent_respons_key_enevnt_id_key>`.

.. list-table:: How to see wrong settings(_exastro_not_available)
 :widths: 3 2 5
 :header-rows: 1
 :align: left

 * - Assigned label value
   - Set fixing point
   - Description
 * - RESPONSE_KEY not found
   - Response key
   - Adds a label if the specified key does not exist in any events. 
 * - | RESPONSE_LIST_FLAG is incorrect.(Not Dict Type)
     | RESPONSE_LIST_FLAG is incorrect.(Not List Type)
   - Response list flag
   - | Adds  a label if "False" is selected in the settings while the actual values are in a list.
     | Adds a label if "True" is selected in the settings while the actual values are not in a list.
 * - EVENT_ID_KEY not found
   - Event ID key
   - Adds a label if a non-existent key is specified to the data the corresponds to the Event's "Response key".



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
     - [Source data] OASE management/Event collection/Event collection settings ID
   * - Event collection time
     - The date/time of when the Agent fetched the Event.
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
       | OASE/Rule/Rule label name
   * - Used event
     - Event use for evaluation.

| For more information on how to search, see :ref:`event_history_search_method`.

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
      |                                   | ed in the Event collection.                             |              | on           |                 |
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
      |                 |                 | e displayed and can be selected.                        |              | ion          |                 |
      |                 |                 |                                                         |              |              |                 |
      |                 |                 | ・_exastro_host                                         |              |              |                 |
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
     - | [Source data]
       | Conductor/Conductor list/Conductor name
     - 〇
     - List selection
     - ー
   * - Operation name
     - | [Source data]
       | Basic console/Operation list/Operation name
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
       | [Source data]
       | Ansible common/Device list/Host name
     - ー
     - List selection
     - ー
   * - Parameter sheet
     - | Select the Parameter sheet that the Action will use.
       | [Source data]
       | Parameter sheet(Input)/Parameter sheet name(ja)
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
     - | [Source data]
       | OASE/Rule/Filter/Filter ID
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
     - | [Source data]
       | OASE/Rule/Filter/Filter ID
     - ー
     - List selection
     - ー
   * - Pre-notification
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
   * - Pre-notification destination
     - Select a destination for where the notifications will be sent.
     - ー
     - List selection
     - ー
   * - Action name
     - | [Source data]
       | OASE/Action/Action name
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

| ※1 For more information regarding templates that can be used for pre/post notifications, see :ref:`variables_available_templates`.


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
     - | [Source data]
       | OASE/Rule/Rule ID
   * - Rule name
     - | [Source data]
       | OASE/Rule/Rule name
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
     - | [Source data]
       | OASEAction Action ID
   * - Action name
     - | [Source data]
       | OASEAction Action name
   * - Conductor instance ID
     - | [Source data]
       | Conductor/Conductor history/Conductor instance ID
   * - Conductor name
     - | [Source data]
       | Conductor/Conductor history/Conductor name
   * - Operation ID
     - | [Source data]
       | Basic console/Operation list/Operation ID
   * - Operation name
     - | [Source data]
       | Basic console/Operation list/Operation name
   * - Event link
     - [Source data]Rule 
   * - Specify Host ID
     - | [Source data]
       | Ansible common/Device list/Management system item number
   * - Specify Host name
     - | [Source data]
       | Ansible common/Device list/Host name
   * - Parameter sheet name
     - | [Source data]
       | Parameter data sheet definition list/Parameter sheet name(ja)
   * - Parameter sheet (rest) 
     - | [Source data]
       | Parameter sheet definition list/Parameter sheet name(rest)
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


.. _event_history_search_method:

Event history search method
-------------------------

| Users can use the following methods to search.

.. table:: Event history page Search method list
 :widths: 3 2 2 2
 :align: left

 +-----------------------------------+--------------------------------------------------------------+
 | **Item**                          | **Search**                                                   |
 |                                   +----------------+----------------------+----------------------+
 |                                   | **Complete M\  | **Part match**       | **No match**         |
 |                                   | atch**         |                      |                      |
 +===================================+================+======================+======================+
 | Object ID                         | Search hit     | Validation error     | Validation error     |
 +-----------------------------------+----------------+----------------------+----------------------+
 | Event collection settings ID      | Search hit     | Search hit           | No display           |
 +-----------------------------------+----------------+----------------------+----------------------+
 | Event collect date/time           | Search hit     | ※1                  | No display           |
 +-----------------------------------+----------------+----------------------+----------------------+
 | Event validation date/time        | Search hit     | ※1                  | No display           |
 +-----------------------------------+----------------+----------------------+----------------------+
 | Event state                       | Search hit     | Search hit           | No display           |
 +-----------------------------------+----------------+----------------------+----------------------+
 | Event type                        | Search hit     | Search hit           | No display           |
 +-----------------------------------+----------------+----------------------+----------------------+
 | Label                             | Search hit     | Search hit           | No display           |
 +-----------------------------------+----------------+----------------------+----------------------+
 | Valuation rule name               | Search hit     | Search hit           | No display           |
 +-----------------------------------+----------------+----------------------+----------------------+
 | Use event ※2                     | Search hit     | Validation error     | Validation error     |
 +-----------------------------------+----------------+----------------------+----------------------+

| ※1 See below for more information regarding Part match for Event collect date/time and Event validation date/time.

Patch match that can be used when searching
  | YYYY/MM/DD
  | YYYY/MM/DD hh
  | YYYY/MM/DD hh:mm
  |

Patch match that can be used when searching (Validation error)
  | If the string is not finished or the last character is a colon.
  | YYYY/MM/D
  | YYYY/MM/DD h
  | YYYY/MM/DD hh:
  | YYYY/MM/DD hh:mm:
  | Example: 2024/09/01 12:2
  |


| ※2 See below for more information regarding search methods for use events.

Use all characters of the Record's "Use event" value.
  | Multiple items
  | ["ObjectId('xxxxxxxxxxxxxxxxxxxxxxxx')",... "ObjectId('yyyyyyyyyyyyyyyyyyyyyyyy')"]
  | 1 Item
  | ["ObjectId('xxxxxxxxxxxxxxxxxxxxxxxx')"]
  |

Use the contents of the Record's "Use event" value array.
  | Multiple items
  | "ObjectId('xxxxxxxxxxxxxxxxxxxxxxxx')",... "ObjectId('yyyyyyyyyyyyyyyyyyyyyyyy')"
  | 1 item
  | "ObjectId('xxxxxxxxxxxxxxxxxxxxxxxx')"
  |

Use the ObjectId character string of the Record's "Use event" value.
  | Multiple items
  | ObjectId('xxxxxxxxxxxxxxxxxxxxxxxx'),... ObjectId('yyyyyyyyyyyyyyyyyyyyyyyy')
  | 1 item
  | ObjectId('xxxxxxxxxxxxxxxxxxxxxxxx')
  | 

Use the value inside the ObjectID of the Record's "Use event" value.
  | Multiple items
  | xxxxxxxxxxxxxxxxxxxxxxxx,... yyyyyyyyyyyyyyyyyyyyyyyy
  | 1 item
  | xxxxxxxxxxxxxxxxxxxxxxxx'



.. _variables_available_templates:

Pre/Post-notification template
---------------------------------

| The Pre/Post-notification templates are as following.

.. code-block:: none
   :name: Pre-notification templates
   :caption: Pre-notification templates
   :lineno-start: 1

   [TITLE]
   Pre-notification

   [BODY]
   Event
   {%- for event in events -%}
   {%- set i = loop.index %}
       Event source data #{{ i }}
   {%- for  key, value in event._exastro_events.items() %}
         ・{{ key }}：{{ value }}
   {%- endfor -%}
   {%- endfor %}
       Conclusion event label    ： {{ action_log.conclusion_event_labels }}
       
   Rule information
       Matched rule ID           ： {{ rule.rule_id }}
       Matched rule name         ： {{ rule.rule_name }}
       Condition
         Filter A
           Filter ID             ： {{ rule.filter_a }}
           Filter name           ： {{ rule.filter_a_name }}
           Filter condition      ： {{ rul    e.filter_a_condition_json }}
         Filter operator         ： {{ rule.filter_operator }}
         Filter B
           Filter ID             ： {{ rule.filter_b }}
           Filter name           ： {{ rule.filter_b_name }}
           Filter condition      ： {{ rule.filter_b_condition_json }}
       Conclusion event
         Source event label inheritance
           Action               ： {{ rule.action_label_inheritance_flag }}
           Event                ： {{ rule.event_label_inheritance_flag }}
         Conclusion label settings： {{ rule.conclusion_label_settings }}
       TTL                      ： {{ rule.ttl }}
       Remarks                  ： {{ rule.note }}

   Action information
       Action ID                ： {{ action.action_id }}
       Action name              ： {{ action.action_name }}
       Operation ID             ： {{ action.operation_id }}
       Operation name           ： {{ action.operation_name }}
       Executing Conductor ID   ： {{ action.conductor_class_id }}
       Executing Conductor name ： {{ action.conductor_name }}
       Host
         Event link             ： {{ action.event_collaboration }}
         Specify                ： {{ action.host_id }}
       Using parameter sheet    ： {{ action.parameter_sheet_id }}
       Remarks                  ： {{ action.note }}



.. code-block:: none
   :name: Post-notification templates
   :caption: Post-notification templates
   :lineno-start: 1

   [TITLE]
   Post-notification

   [BODY]
   Event 
   {%- for event in events -%}
   {%- set i = loop.index %}
     Event  #{{ i }}
       Event ID           ： {{ event.labels._id }}
       Event collect settings ID     ： {{ event.labels._exastro_event_collection_settings_id }}
       Event collect settings name     ： {{ event.labels._exastro_event_collection_settings_name }}
       Event fetch time       ： {{ event.labels._exastro_fetched_time }}
       Event label
   {%- for key, value in event.labels.items() %}
         ・{{ key }}：{{ value }}
   {%- endfor %}
       Event source data
   {%- for  key, value in event._exastro_events.items() %}
         ・{{ key }}：{{ value }}
   {%- endfor -%}
   {%- endfor %}

   Matched results
     Status                     ： {{ action_log.status }}
     Register date/time         ： {{ action_log.time_register }}
     Executed Conductor ID      ： {{ action_log.conductor_instance_id }}
     Executed Conductor Name    ： {{ action_log.conductor_instance_name }}
     Conclusion Event label     ： {{ action_log.conclusion_event_labels }}

   Rule information
     Matched rule ID            ： {{ rule.rule_id }}
     Matched rule name          ： {{ rule.rule_name }}
     Condition
       Filter A
         Filter ID              ： {{ rule.filter_a }}
         Filter name            ： {{ rule.filter_a_name }}
         Filter condition       ： {{ rule.filter_a_condition_json }}
       Filter operator          ： {{ rule.filter_operator }}
       Filter B
         Filter ID              ： {{ rule.filter_b }}
         Filter name            ： {{ rule.filter_b_name }}
         Filter condition       ： {{ rule.filter_b_condition_json }}    
     Conclusion Event 
       Source event label inheritence
         Action                 ： {{ rule.action_label_inheritance_flag }}
         Event                  ： {{ rule.event_label_inheritance_flag }}
       Conclusion label settings： {{ rule.conclusion_label_settings }}
     TTL                        ： {{ rule.ttl }}
     Remarks                    ： {{ rule.note }}

   Action information
     Action ID                  ： {{ action.action_id }}
     Action name                ： {{ action.action_name }}
     Operation ID               ： {{ action.operation_id }}
     Operation name             ： {{ action.operation_name }}
     Executing Conductor ID     ： {{ action.conductor_class_id }}
     Executing Conductor name   ： {{ action.conductor_name }}
     Host
       Event link               ： {{ action.event_collaboration }}
       Specify                  ： {{ action.host_id }}
     Using parameter sheet      ： {{ action.parameter_sheet_id }}
     Remarks                    ： {{ action.note }}

   Conductor information
     Status                     ： {{ conductor.status }}
     Operation ID               ： {{ conductor.operation_id }}
     Operation name             ： {{ conductor.operation_name }}
     Register date/time         ： {{ conductor.time_register }}
     Reservation date/time      ： {{ conductor.time_book }}
     Start date/time            ： {{ conductor.time_start }}
     End date/time              ： {{ conductor.time_end }}
     Emergency stop flag        ： {{ conductor.abort_execute_flag }}
     Remarks                    ： {{ conductor.note }}



Result pattern when using variables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| Patterned variables found in results are as following.

- | action_log.status
  | Rule matched
  | Executing
  | Completed
  | Completed (abnormal)
  | Waiting for completion confirmation
  | Completion confirmed
  | Completion confirmation rejected
  | 

- | rule.action_label_inheritance_flag
  | Used as a parameter
  | Not use as a parameter
  | 

- | rule.event_label_inheritance_flag
  | Inheriting Conclusion Events
  | Not Inheriting Conclusion Events
  | 

- | conductor.status
  | Unexecuted
  | Unexecuted (scheduled)
  | Executing
  | Executing (delayed)
  | Paused
  | Completed
  | Abend
  | Ended with warning
  | Emergency stop
  | Cancelled reservation
  | Unexpected error
  | 

- | conductor.note
  | Issued
  | not issued