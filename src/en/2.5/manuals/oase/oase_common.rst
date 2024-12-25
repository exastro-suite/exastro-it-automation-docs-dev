=========
OASE common
=========

Introduction
========
| This document aims to explain the OASE (Operation Autonomy Support Engine)  function

.. _oase_common:

Function overview
===========
| The OASE function analyzes event information collected from external sources and automatically performs an action to said event.


.. figure:: /images/ja/oase/oase_common/oase_overview_v2-4.png
   :width: 800px
   :alt: OASE function overview

| A standard wofkflow using the OASE function are as following.
| See the next section for terminology used.

#. | **Gather events**
   | Collect events from external services.
   | The Exastro OASE Agent collects the Events and sends them to the ITA system through API.
   | For more information regarding the Exastro OASE Agent, see :ref:`agent_about`.

#. | **Label**
   | Label events recieved by ITA.
   | This is done to unify the event information, as the user might collect different events from different applications.
   | For more information regarding labing, see :ref:`label_creation` and :ref:`labeling`.

#. | **Evaluate**
   | Use the label to filter events and match them to user configured rules to decide what to do with the events.
   | For more information regarding rule evaluation, see :ref:`filter` and :ref:`rule`.

#. | **Execute action/Notify**
   | When a rule is matched, users can set so an action is executed (Conductor and Operation).
   | Users can also configure so notifications are sent before/after actions are executed.
   | For more information regading actions, see :ref:`action`.
   

.. _oase_definition of terms:

Terminology
===========

| The terminology used in this document and their definitions are as following.

.. list-table:: Terminology
   :widths: 1 5
   :header-rows: 1
   :align: left

   * - Terminology
     - Contents
   * - Event
     - Events are information from Monitoring softwares that tells when something changed in the system.※
   * - TTL (Time To Live) 
     - | How long an event is handled as a rule evaluation target (in seconds). Is used for the 2 following goals.
       | ▼Select the evaluation closest to the user's intention
       | If an event has happened and there are multiple rules that matches the event conditions, Exastro OASE will apply the rule with the highest priority.
       | On the other hand, the system can also wait until the conditions are completely met. The final decision will be run between the period from the event has occured to the specified TIL period.
       | ▼To prevent undesired actions being run for old events.
       | Events whose period have exceeded more than twice the TIL period have a larger chance to be non-intended rules by the users, meaning that that they will immediately change their status to "Expired" and not be evaluated.
       | The smallest value is 10 seconds, and the largest value is 2137483647 seconds. The default value is 3600 seconds.
   * - Label
     - | Labels are event properties based on the Label creation/Labeling settings. Labels contains values that can OASE can use (key&value formats) to categorize them.
       | Users can label events in order to unify information collected from different applications.
   * - Filter
     - Filter is used to single out unique items from label conditions. Filtered items are the result of that. This is used to send events to the Rule evaluation function
   * - Rule
     - Rules are conditions used to execute actions and creating conclusion events. They are created by combining filters.
   * - Action
     - Actions are what the system does when a rule is matched.
   * - Evaluation
     - Evaluations is the process when the system uses the configured rules to decide what action to execute/ Conclusion event to create when matched.
   * - Conclusion event
     - The event that occurs when a rule is matched.

| ※See the following for event types.

.. list-table:: Event type
   :widths: 1 5
   :header-rows: 1
   :align: left

   * - Type
     - Contents
   * - New
     - | Status when the event is collected but not detected by the evaluation function.
       | When the evaluation time ends, it will change to Known (evaluated), Unknown or Expired.
   * -Known
     - Status when the event has been detected by the evaluation function.
   * - Known (evaluated) 
     - Status when a rule has been matched.
   * - Expired
     - | Will remove the event from evaluation targets caused by one of the following reasons.
       | ・The event period has exceeded more than double the TTL period and is therefore deemed as being too old.
       | ・The event could not be matched between the end of the TIL period and before the evaluation period.
   * - Unknown
     - | Status when the filter function could not single out the event (was not detected by the evaluation function).
       | If the event is unkown, the user should consider what to do with it as an evaluation target.




