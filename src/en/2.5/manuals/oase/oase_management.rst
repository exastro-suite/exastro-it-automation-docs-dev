========
OASE management
========

Introduction
========
| This document aims to explain the OASE management function and how to use it.

Menu structure
============

| This section explains the OASE management menu structure.

Menu list
-----------------

| The OASE management menu list are as following.

.. table:: OASE management menu list
   :widths: 1 2 2 5 
   :align: left

   +--------+----------------------+--------------------------+----------------------------------------+
   | **No** | **Menu group**       | **Menu**                 | **Description**                        |
   +========+======================+==========================+========================================+
   | 1      | OASE management      | Agent                    | Manages event collection target infor\ |
   |        |                      |                          | mation.                                |
   +--------+                      +--------------------------+----------------------------------------+
   | 2      |                      | Notification templ\      | Manages information used by t\         |
   |        |                      | ate (common)             | he OASE notification function.         |
   +--------+----------------------+--------------------------+----------------------------------------+


.. _agent_about:

Agent overview
================

| This section explains the Exastro OASE Agent.

Agent
--------------------

| The Agent is independent from Exastro IT Automation (hereinafter written as ITA) and functions as a middleman between OASE and external services.
| The Agent collects Event collection settings for external services from ITA and uses them to gather events from the external services. After that, the Agent will send the events to ITA.

.. figure:: /images/ja/oase/oase_management/agent_overview_v2-4.png
   :width: 800px
   :alt: OASE Agent overview


How to use the Agent
====================

| This section explains how to use the Exastro OASE Agent.

Workflow
----------

| A standard OASE workflow can be seen below (including using the Agent).
| See the following sections for more detailed information regarding each of the steps.

.. figure:: /images/ja/oase/oase_management/oase_process_v2-3.png
   :width: 700px
   :alt: OASE workflow

-  **Workflow details and references**

   #. | **Configure Event collection settings**
      | In the OASE management's Agent menu, register settings related to the Event collection target services.

   #. | **Configure labels**
      | In the OASE Label creation/Labeling menu, configure settings for labeling events OASE.
      | For more information, see :ref:`label_creation` and :ref:`labeling`.

   #. | **Install and start the Agent**
      | Start the Agent and collect Events.
      | For more information, see :ref:`Installation guide (Docker Compose) <oase_agent_docker compose install>`.
      | For more information, see :ref:`Installation guide (Kubernetes) <oase_agent_kubernetes_install>`.


Notification template (common) overview
=============================

| The following figure illustrates the OASE notification function.

.. figure:: /images/ja/oase/oase_management/notification_template_overview.png
   :width: 800px
   :alt: Notification template (common) overview

   Notification template (common) overview

How to use Notification template (common)
=================================

| A standard workflow containing operations needed to use the OASE Notification function can be seen below.
| See the following sections for more detailed information regarding each of the steps.

.. figure:: /images/ja/oase/oase_management/notification_template_process.png
   :width: 700px
   :alt: Notification template (common) workflow

   Notification template (common) workflow

-  **Workflow details and references**

   #. | **Maintaining (View/Edit)Notification template (common)**
      | From the OASE Management's Notification template (common) menu, users can maintain (view/edit) templates used by the OASE Notification function.
      | For more information, see :ref:`notification_template_common`.
      
   #. | **Registering Notification settings**
      | Log in to the Exastro system as the Organization administrator and register notification settings from the :menuselection:`Notification management` menu.
      | For more information, see :ref:`notification_management`.

   #. | **Configure Mail server(only for cases where the notification destination is set to a mail address).**
      | Log in to the Exastro system as the Organization administrator and register mail server settings from the  :menuselection:`Mail server settings` menu.
      | For more information, see :ref:`email_sending_server_settings`.

.. note::
   | The Notification template (common) can be used without changing it.


Function menu operation
====================

| This section explains how to operate the OASE Management function menus.

Menus
----------------

| This chapter explains how to operate the menus displayed when OASE management is installed.

.. _agent:

Agent
-------------

1. | In :menuselection:`OASE management --> Agent`, users can maintain (view/register/edit/discard) TIL, connection methods, authentication methods, event collection targets, etc.

.. figure:: /images/ja/oase/oase_management/agent_menu.png
   :width: 800px
   :alt: Submenu (Agent) 

   Submenu (Agent) 

1. | The Agent※1 page's input items are as following.

   .. table:: Agent page Input item list
      :widths: 10 15 60 10 10 20
      :align: left

      +------------------------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      | **Item**                           | **Description**                                        | **Input requ\| **Input me\  | **Restrictions**|
      |                                    |                                                        | ired**       | thod**       |                 |
      +====================================+========================================================+==============+==============+=================+
      | Event collection settings name     | Input a name for the event collection settings.        | 〇           | Automatic    | Maximum 255 \   |
      |                                    |                                                        |              |              | bytes           |
      +------------------------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      | Connection method                  | Select the connection method for the Event collecti\   | 〇           | List sele\   | ※2             |
      |                                    |                                                        |              | ction        |                 |
      |                                    |                                                        |              |              |                 |
      |                                    | ・Bearer authentication                                |              |              |                 |
      |                                    |                                                        |              |              |                 |
      |                                    | ・Password authentication                              |              |              |                 |
      |                                    |                                                        |              |              |                 |
      |                                    | ・Free authentication                                  |              |              |                 |
      |                                    |                                                        |              |              |                 |
      |                                    | ・IMAP password authentication                         |              |              |                 |
      |                                    |                                                        |              |              |                 |
      |                                    | ・Agent not required                                   |              |              |                 |
      +------------------------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      | Request method                     | Select the request method for the Event collection ta\ | ー           | List sele    | ※2             |
      |                                    | rget.                                                  |              | ction        |                 |
      |                                    |                                                        |              |              |                 |
      |                                    | ・If the connection method is set to Bearer, Pass\     |              |              |                 |
      |                                    | word or Free authentication:                           |              |              |                 |
      |                                    |                                                        |              |              |                 |
      |                                    | 　- GET                                                |              |              |                 |
      |                                    |                                                        |              |              |                 |
      |                                    | 　- POST                                               |              |              |                 |
      |                                    |                                                        |              |              |                 |
      |                                    | ・If the connection method is set to IMAP password au\ |              |              |                 |
      |                                    | thentication:                                          |              |              |                 |
      |                                    |                                                        |              |              |                 |
      |                                    | 　- IMAP: Plaintext                                    |              |              |                 |
      +------------------------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      | Connection destination             | Input the Event collection targets' connection des\    | 〇           | Manual       | Maximum 1024 \  |
      |                                    | tination.                                              |              |              | bytes           |
      |                                    |                                                        |              |              |                 |
      |                                    | ・For mail servers, input the host name.               |              |              |                 |
      |                                    |                                                        |              |              |                 |
      |                                    | ・For APIs, input the URL.                             |              |              |                 |
      +------------------------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      | Port                               | Input the port number for the Event collection target. | ー           | Manual       | 0～65535        |
      |                                    |                                                        |              |              |                 |
      +-----------------+------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      | Authentication \| Request header   | Input information for the request header.              | ー           | Manual       | Maximum 4000 \  |
      | information     |                  |                                                        |              |              | bytes           |
      |                 +------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      |                 | Proxy            | Input Proxy URI for the Event collection target.       | ー           | Manual       | Maximum 255 \   |
      |                                    |                                                        |              |              | bytes           |
      |                 +------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      |                 | Authenticatio\   | Input an authentication token for the Bearer authe\    | ー           | Manual       | Maximum 1024 \  |
      |                 | n token          | ntication.                                             |              |              | bytes           |
      |                 +------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      |                 | username         | Input the username for the Event collection target u\  | ー           | Manual       | Maximum 255 \   |
      |                 |                  | ser.                                                   |              |              | bytes           |
      |                 +------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      |                 | Password         | Input the passworf for the Event collection target u\  | ー           | Manual       | Maximum 4000 \  |
      |                 |                  | ser.                                                   |              |              | bytes           |
      |                 +------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      |                 | Mail box name    | Input the name of the Event collection target mail box.| ー           | Manual       | Maximum 255 \   |
      |                 |                  |                                                        |              |              | bytes           |
      |                 |                  | The INBOX is refered by default.                       |              |              |                 |
      +-----------------+------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      | Parameter                          | Input in JSON format                                   | ー           | Manual       | Maximum 255 \   |
      |                                    |                                                        |              |              | bytes           |
      |                                    |                                                        |              |              |                 |
      |                                    | ・If the Request method is set to GET, this item wil.\ |              |              |                 |
      |                                    | l be used as a Query parameter (Values after the "?" \ |              |              |                 |
      |                                    | added to the connection destination)                   |              |              |                 |
      |                                    |                                                        |              |              |                 |
      |                                    | ・If the Request method is set to POST, this item wil\ |              |              |                 |
      |                                    | l be used as a payload for the Request.                |              |              |                 |
      +------------------------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      | Response key                       | Specify the Parent key for the Property recieved as O \| ー           | Manual       | Maximum 255 \   |
      |                                    | ASE events from the response payload.                  |              |              | bytes ※3       |
      |                                    |                                                        |              |              |                 |
      |                                    | Specify the The response payload hierarchy in JSON q\  |              |              |                 |
      |                                    |  uery language (JMESPath).                             |              |              |                 |
      |                                    |                                                        |              |              |                 |
      +------------------------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      | Response list flag                 | Select if the values acquired from the response ke\    | ー           | List selection   | ※3         |
      |                                    | y are in an array or not.                              |              |              |                 |
      |                                    | ・If set to True\                                      |              |              |                 |
      |                                    | The values acquired from the Response key will be di\  |              |              |                 |
      |                                    | vided into arrays and are processed as events.         |              |              |                 |
      |                                    |                                                        |              |              |                 |
      +------------------------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      | Event ID key                       | Input if the user has an ID key that distinguishes t\  | ー           | Manual       | Maximum 255 \   |
      |                                    | he recieved events.                                    |              |              | bytes ※3       |
      |                                    |                                                        |              |              |                 |
      |                                    | ・Specify the The response payload hierarchy in JSO\   |              |              |                 |
      |                                    |  N query language (JMESPath).                          |              |              |                 |
      |                                    |                                                        |              |              |                 |
      |                                    | ・Specify herarchy after response key and res\         |              |              |                 |
      |                                    | ponse list flag specification.                         |              |              |                 |
      +------------------------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      | TTL                                | TTL (Time To Live) is how long an event is handled a\  | 〇           | Manual       | Minimum value 1\|
      |                                    | s a rule evaluation target (in seconds). \             |              |              | 0 (seconds)     |
      |                                    |                                                        |              |              |                 |
      |                                    |                                                        |              |              | Maximum valu\   |
      |                                    |                                                        |              |              | e 214748364\    |
      |                                    |                                                        |              |              | 7 (seconds)     |
      |                                    |                                                        |              |              |                 |
      |                                    |                                                        |              |              | Default value\  |
      |                                    |                                                        |              |              | ：3600 (sec\    |
      |                                    |                                                        |              |              | onds)           |
      +-----------------+------------------+--------------------------------------------------------+--------------+--------------+-----------------+
      | Remarks                            | Free description field.                                | ー           | Manual       | Maximum 4000 \  |
      |                                    |                                                        |              |              | bytes           |
      +------------------------------------+--------------------------------------------------------+--------------+--------------+-----------------+

| ※1 Configurations for Event collection targets

| ※2 The required combinations for Connection methods, Authentication information and Request methods are as following.

.. list-table::
   :widths: 1 1 1
   :header-rows: 1
   :align: left

   * - Connection method
     - Request method
     - Authenticatio information
   * - IMAP password authentication
     - ・IMAP: Plaintext
     - | ・Username
       | ・Password
   * - Bearer authentication
     - | ・GET
       | ・POST
     - ・Authentication token
   * - Password authentication
     - | ・GET
       | ・POST
     - | ・Username
       | ・Password
   * - Free authentication
     - | ・GET
       | ・POST
     - ・Input to Parameter

| ※3 For more information regarding Response keys, Response list flags and Event ID keys, see :ref:`Response key and Event ID keyキー<oase_agent_respons_key_enevnt_id_key>`.

.. warning::
   | If the collection destination is a mail, there might be cases where the collection events might be saved without characters that could not be decoded depending on the charachter code type.
   | For more information, see :ref:`about_decode`.

.. _notification_template_common:

Notification template (common) 
------------------------

1. | In the :menuselection:`OASE management --> Notification template (common)` menu, the user can maintain (view/update) template used by the OASE notification function.

.. figure:: /images/ja/oase/oase_management/notification_template_menu.png
   :width: 800px
   :alt: Submenu (Notification template (common) ) 

   Submenu (Notification template (common) ) 

1. | The items found in the Notification template (common) page are as following.

.. list-table::
   :widths: 10 60 10 10 20
   :header-rows: 1
   :align: left

   * - Item
     - Description
     - Input required
     - Input method
     - Restrictions
   * - Template
     - | Allows the user to edit the Notification template. The types are the following 4.
       | ・New.j2
       | ・Known (Evaluated) .j2
       | ・Known (Expired) .j2
       | ・Unknown.j2
     - 〇
     - Manual
     - Maximum size 2MB
   * - Remarks
     - Free description field.
     - ー
     - Manual
     - Maximum length 4000 bytes

| The template's default values are as following.

.. code-block:: none
   :name: New.j2
   :caption: New.j2
   :lineno-start: 1

    [TITLE]
    A new event has occured.

    [BODY]
    Details
    　Event ID　　　：{{ _id }}
    　Event collection settings：{{ labels._exastro_event_collection_settings_id }}
    　Event fetch time：{{ labels._exastro_fetched_time }}
    　Event valid time：{{ labels._exastro_end_time }}
    　Event type　　：{{ labels._exastro_type }}

    　Re-evaluate
    　　Evaluation rule name　　：{{ labels._exastro_rule_name }}
    　　Use event　　：{{ exastro_events }}

    　Label：
    　  {% for key, value in labels.items() %}
    　　・{{ key }}：{{ value }}
    　　{% endfor %}


.. code-block:: none
   :name: Known (Evaluated) .j2
   :caption: Known (Evaluated) .j2
   :lineno-start: 1

   [TITLE]
   A known (evaluated) event has occured.

   [BODY]
   Details
   　Event ID　　　：{{ _id }}
   　Event collection settings：{{ labels._exastro_event_collection_settings_id }}
   　Event fetch time：{{ labels._exastro_fetched_time }}
   　Event valid time：{{ labels._exastro_end_time }}
   　Event type　　：{{ labels._exastro_type }}

   　Re-evaluation
   　　Evaluation rule name　　：{{ labels._exastro_rule_name }}
   　　Use event　　：{{ exastro_events }}

   　Label：
   　  {% for key, value in labels.items() %}
   　　・{{ key }}：{{ value }}
   　　{% endfor %}

.. code-block:: none
   :name: Known (Expired) .j2
   :caption: Known (Expired) .j2
   :lineno-start: 1

   [TITLE]
   A known (Expired) event has occured.

   [BODY]
   Details
   　Event ID　　　：{{ _id }}
   　Event collection settings：{{ labels._exastro_event_collection_settings_id }}
   　Event fetch time：{{ labels._exastro_fetched_time }}
   　Event valid time：{{ labels._exastro_end_time }}
   　Event type　　：{{ labels._exastro_type }}

   　Re-evaluation
   　　Evaluation rule name　　：{{ labels._exastro_rule_name }}
   　　Use event　　：{{ exastro_events }}

   　Label：
   　  {% for key, value in labels.items() %}
   　　・{{ key }}：{{ value }}
   　　{% endfor %}

.. code-block:: none
   :name: Unknown.j2
   :caption: Unknown.j2
   :lineno-start: 1

   [TITLE]
   An unknown event has occured.

   [BODY]
   Details
   　Event ID　　　：{{ _id }}
   　Event collection settings：{{ labels._exastro_event_collection_settings_id }}
   　Event fetch time：{{ labels._exastro_fetched_time }}
   　Event valid time：{{ labels._exastro_end_time }}
   　Event type　　：{{ labels._exastro_type }}

   　Re-evaluation
   　　Evaluation rule name　　：{{ labels._exastro_rule_name }}
   　　Use event　　：{{ exastro_events }}

   　Label：
   　  {% for key, value in labels.items() %}
   　　・{{ key }}：{{ value }}
   　　{% endfor %}


Appendix
====

.. _oase_agent_flow:

OASE Agent operation flow and ".env" setting Values
------------------------------------

| This section explains the following.
| - OASE Agent's operation flow
| - Parts of the .env file's setting values when OASE Agent is installed.

.. figure:: /images/ja/oase/oase_management/agent_detailed_flow_v2-4.png
   :width: 1000px
   :alt: OASE Agent flow diagram

   OASE Agent flow diagram

.. list-table:: 
 :widths: 5, 7
 :header-rows: 1

 * - Parameter
   - Description
 * - AGENT_NAME
   - Used as the database file name and the name of the OASE Agent.
 * - EXASTRO_URL
   - Used as the request destination when API requests are sent to ITA.
 * - EXASTRO_ORGANIZATION_ID
   - Used to distinguish Organizations when API requests are sent to ITA.
 * - EXASTRO_WORKSPACE_ID
   - Used to distinguish Workspaces when API requests are sent to ITA.

     The specified workspace must be linked to the organization specified to EXASTRO_ORGANIZATION_ID.
 * - EXASTRO_USERNAME
   - Used as the Basic authentication username when API requests are sent to ITA.
 * - EXASTRO_PASSWORD
   - Used as the Basic authentication password when API requests are sent to ITA.
 * - EVENT_COLLECTION_SETTINGS_NAMES
   - The values set to this parameter fetches event collection settings from ITA and generates a setting file.
 * - ITERATION
   - The number of how many the processes depicted with green arrows in the figure above will loop.
 * - EXECUTE_INTERVAL
   - The interval time for the processes depicted with green arrows in the figure above.


Instant event collection settings display
----------------------------------
| This section explains how to instantly display the event collection settings when they are changed.

1. | Start the OASE Agent bash shell.
   
   .. code-block:: shell
   
      docker exec -it <OASE Agent container name> bash

2. | Delete the setting file "event_collection_settings.json" within /tmp.

   .. code-block:: shell
   
      rm /tmp/event_collection_settings.json

.. tip::
   | If the OASE Agent has no event_collection_settings.json setting file, fetch the Event collection settings from ITA and create a setting file.
   | The user can instantly have the settings take affect by deleting the settings file.
   | ※If the users are not willing to delete the settings file, the user will have to wait until the proccess loops the amount of times specified by "ITERATION" from the :ref:`previous chapter <oase_agent_flow>`.

.. _about_decode:

Agent decoding process
----------------------------------
| When Collection destination is set to Mail, information regarding the Agent's decoding proccess for the Collected events  can be seen below.

Confirmed supported character codes
^^^^^^^^^^^^^^^^^^^^^^

.. table:: Confirmed supported character codes
 :widths: 1 1 2 3
 :align: left

 +--------------------------+---------------------------------------------------------------------------+
 | **Transmission method**  | **Mail Header**                                                           |
 +-----------+--------------+-------------------------------+-------------------------------------------+
 | **Frorm\  | **Language** | **Content-Transfer-Encoding** | **Content-Type**                          |
 | at**      |              |                               |                                           |
 +===========+==============+===============================+===========================================+
 | plaintext | English      | 7bit                          | text/plain; charset=US-ASCII              |
 +-----------+--------------+-------------------------------+-------------------------------------------+
 | plaintext | Japanese     | 8bit                          | text/plain; charset=UTF-8                 |
 +-----------+--------------+-------------------------------+-------------------------------------------+
 | plaintext | English      | 8bit                          | text/plain; charset="ANSI_X3.4-1968"      |
 +-----------+--------------+-------------------------------+-------------------------------------------+
 | html      | English      | ・plaintext: 7bit             | multipart/alternative                     |
 |           |              |                               |                                           |
 |           |              | ・html: quoted-printable      | ・plaintext: text/plain; charset=US-ASCII |
 |           |              |                               |                                           |
 |           |              |                               | ・html: text/html; charset=UTF-8          |
 +-----------+--------------+-------------------------------+-------------------------------------------+
 | html      | Japanese     | ・plaintext: 8bit             | multipart/alternative                     |
 |           |              |                               |                                           |
 |           |              | ・html: quoted-printable      | ・plaintext: text/plain; charset=UTF-8    |
 |           |              |                               |                                           |
 |           |              |                               | ・html: text/html; charset=UTF-8          |
 +-----------+--------------+-------------------------------+-------------------------------------------+

| The following is an example decpicts saved collection events with undecodable characters excluded.

Sending mail
  | Format：plaintext
  | Content-Transfer-Encoding：8bit
  | Content-Type：text/plain; charset="ANSI_X3.4-1968"
  | Subject：Failure
  | Contents：Failure：Server01\\r\\n

When seen on ITA
  | Subject：Failure
  | Contents：Server01\\r\\n

.. figure:: /images/ja/oase/oase_management/decode_failed.png
 :width: 800px
 :alt: Collecting events without undecodable characters example/results (Event flow) 

 Collecting events without undecodable characters example/results (Event flow) 
 
 .. _oase_agent_respons_key_enevnt_id_key:

Response key and Event ID key
------------------------------
| This section explains the following.

| ・ :dfn:`Response key` 
| ・ :dfn:`JMESPath`
| ・ :dfn:`Response list flag` 
| ・ :dfn:`Event ID key`


Response key
^^^^^^^^^^^^^^
| :dfn:`Response keys` are keys that filters events from the response payload.

.. note::
   | ・Monitoring softwares have functions to fetch alerts and metrics (statuses) from the monitored machine through HTTP API,
   | ・The Agent uses the HTTP API to fetch the alerts and metrics.
   | ・However, the response payloads returned by the monitoring softwares can only be used by the Agent if they are in JSON format.

|  Items that can be specified as :dfn:`Response key` are:

| 　・Response payloads that stores items handled as Events in child elements.
| 　・Child elements stored in array if there are multiple items that are handled as Events.

| :dfn:`Response key` is specified in :dfn:`JMESPath format`.
| For more information regarding :dfn:`JMESPath format`, see the next section.

JMESPath
^^^^^^^^
| :dfn:`JMESPath` is a query language for JSON targets.
| Values corresponding to the specified :dfn:`JMESPath` are filtered from the JSON.
| The path is specified in a format where the JSON key is combined with periods (".").
| If the JSON key values are in an array, put "[]" at the end of the JSON key.
| 　Example) The :program:`Parent` value is an array and the array's child element key, :program:`children`, is filtered.

.. code-block::

   parent[].children

| 　Specify the line above.

| The following example uses the Sample response from the following URL to explain specifying JMESPaths.
| Azure RESET-API `Get Metric for data <https://learn.microsoft.com/ja-jp/rest/api/monitor/metrics/list?view=rest-monitor-2023-10-01&tabs=HTTP>`.

.. code-block:: json
   :linenos: 
   :lineno-start: 1

   {
     "cost": 598,
     "timespan": "2021-04-20T09:00:00Z/2021-04-20T14:00:00Z",
     "interval": "PT1H",
     "value": [
       {
         "id": "/subscriptions/1f3･･･c38/･･･/metrics/BlobCount",
         "type": "Microsoft.Insights/metrics",
         "name": {
           "value": "BlobCount",
           "localizedValue": "Blob Count"
         },
         "displayDescription": "The number of blob objects stored in the storage account.",
         "unit": "Count",
         "timeseries": [
           {
             "metadatavalues": [
               {
                 "name": {
                   "value": "tier",
                   "localizedValue": "tier"
                 },
                 "value": "Hot"
               }
             ]
           },
           {
             "metadatavalues": [
               {
                 "name": {
                   "value": "tier",
                   "localizedValue": "tier"
                 },
                 "value": "Standard"
               }
             ]
           },
           {
             "metadatavalues": [
               {
                 "name": {
                   "value": "tier",
                   "localizedValue": "tier"
                 },
                 "value": "Cool"
               }
             ]
           }
         ],
         "errorCode": "Success"
       }
     ],
     "namespace": "microsoft.storage/storageaccounts/blobservices",
     "resourceregion": "westus2"
   }

.. note::
  | For more information regarding :dfn:`JMESPath`, see the JMESPath  Tutorial https://JMESPath.org/tutorial.html.
  | We also recommend that the user tries out JMESPath Try it Out! https://JMESPath.org/ where they can try out the JSON above.

1. | JMESPath fetching array values
 
| For the JSON above, specifying the following for the :dfn:`JMESPath` fetching the :program:`value`(array) from the 5th line

.. code-block::

   value

|  will fetch the following results.
|  (The line :program:`"//" : "･･･Sample Response line 14 ～line 49 shortened･･･"` is an comment and have no effect on the results.) 

.. code-block:: json

   [
     {
       "id": "/subscriptions/1f3･･･c38/･･･/metrics/BlobCount",
       "type": "Microsoft.Insights/metrics",
       "name": {
         "value": "BlobCount",
         "localizedValue": "Blob Count"
       },
       "displayDescription": "The number of blob objects stored in the storage account.",
       "//" : "･･･Sample Response line 14 ～line 49 shortened･･･",
       "errorCode": "Success"
     }
   ]

2. | JMESPath fetching objects
 
| For the JSON above, specifying the following for the :dfn:`JMESPath` fetching the :program:`value` (array)'s :program:`name` value

.. code-block::

   value[].name

| will fetch the following results.

.. code-block:: json

  [
    {
      "value": "BlobCount",
      "localizedValue": "Blob Count"
    }
  ]

3. | JMESPath fetching multiple values from deep hierarchies

| Specifying the following for the :dfn:`JMESPath` fetching the :program:`value` (array)'s :program:`timeseries` (array)'s  :program:`metadatavalues` (array)'s' :program:`name`

.. code-block:: 

   value[].timeseries[].metadatavalues[].name

| will fetch the following results.
|  (The line :program:`"//" : " lines xx metadatavalues.name"`  is an comment and have no effect on the results.) 

.. code-block:: json

   [
     "//" : "Line 19 metadatavalues.name"
     {
       "value": "tier",
       "localizedValue": "tier"
     },
     "//" : "Line 30 metadatavalues.name"
     {
       "value": "tier",
       "localizedValue": "tier"
     },
     "//" : "Line 41 metadatavalues.name"
     {
       "value": "tier",
       "localizedValue": "tier"
     }
   ]

Response list flag
^^^^^^^^^^^^^^^^^^^^^^
| :dfn:`Response list flag` specifies whether the events filtered by the :dfn:`Response key` are stored in arrays or not.
| ・:program:`True`  ： For when the events filtered by the :dfn:`Response key` are stored in arrays
| 　　　　　　For cases like No 1. where JMESPath is used to fetch array values or for cases like No 3. where it is used to fetch multiple values from deep hierarchies.
| ・:program:`False` ： For when the events filtered by the :dfn:`Response key` are not stored in arrays (but in values and/or objects with child components
| 　　　　　　For cases like No 2. where the JMESPath is used to fetch objects.


Event ID key
^^^^^^^^^^^^^^
|  :dfn:`Inventory ID key` specifies keys used to fetch values that distinguishes events filtered by the :dfn:`Response key`.
|  The :dfn:`Event ID key` specifies a key existing in the results filtered by :dfn:`Response key`.

| :dfn:`Event ID key` is also specified in :dfn:`JMESPath format`.
| If the :dfn:`Response key` and :dfn:`Response list flag` has the following specified for the Azure RESET-API's JSON above.

.. list-table:: 
 :widths: 1, 1
 :header-rows: 1

 * - Item name
   - Setting value
 * - Response key
   - :program:`value`
 * - Response list flag
   - :program:`True`

| The values filtered by :dfn:`Response key` are as following

.. code-block:: json
   :linenos: 
   :lineno-start: 1

   [
     {
       "id": "/subscriptions/1f3･･･c38/･･･/metrics/BlobCount",
       "type": "Microsoft.Insights/metrics",
       "name": {
         "value": "BlobCount",
         "localizedValue": "Blob Count"
       },
       "displayDescription": "The number of blob objects stored in the storage account.",
       "unit": "Count",
       "timeseries": [
         {
           "metadatavalues": [
             {
               "name": {
                 "value": "tier",
                 "localizedValue": "tier"
               },
               "value": "Hot"
             }
           ]
         },
         "//": "･･･ (metadatavalues are repeated and shortened) ･･･"
       ],
       "errorCode": "Success"
     }
   ]

| From these results, the Event type values will have :program:`id` values applied, 
| meaning that the :menuselection:`OASE management --> Agent` setting values should be as following.

.. list-table:: 
 :widths: 10, 20
 :header-rows: 1

 * - Item name
   - Setting value
 * - Response key
   - :program:`value`
 * - Response list flag
   - :program:`True`
 * - Event ID key
   - :program:`id`

.. warning::
   | If :dfn:`Response key` has a key specified to it that does not exist in one of the filtered values, the value will fetch blank values and will not function properly.
   | If a key that does not exist in the filtered values is specified to the :dfn:`Response key` above, the system will not function properly.

   .. list-table:: Invalid Event ID key settings
      :widths: 10, 20
      :header-rows: 1

      * - Item name
        - Setting value
      * - Response key
        - :program:`value`
      * - Response lsit flag
        - :program:`True`
      * - Event ID key
        - :program:`value[].id`

.. _oase_agent_settings:

Agent examples for the different monitoring softwares
--------------------------------
| This section contains setting examples in :menuselection:`OASE management --> Agent` for using :dfn:`Zabbix` and :dfn:`Grafana`.

| This section will first display examples using cURL commands to fetch alerts from the softwares.
| Then, it will explain the order of configuring cURL parameters to :menuselection:`OASE management --> Agent`.
 
.. warning::
   | The HTTP API might differ depending on the monitoring software version.
   | Make sure to check how the HTTP API works for the version the user is using before configuring the settings in :menuselection:`OASE management --> Agent`.


Zabbix
^^^^^^
| This section contains an example for configuring :menuselection:`OASE management --> Agent` to fetch events from :dfn:`Zabbix`.

| The :dfn:`Zabbix` used in the following section is running the following version.
| ・zabbix 6.4.12 

1. | Fetch events from :dfn:`Zabbix` with cURL command

| The following example is an cURL command to fetch Faults(problems) from :dfn:`Zabbix`.

.. code-block:: shell
   
   curl --request POST \
   --url http://<Zabbix IP Address or Domain>/zabbix/api_jsonrpc.php \
   --header 'content-type: application/json-rpc' \
   --data "{\"jsonrpc\": \"2.0\",\"method\": \"problem.get\",\"id\": 1,\"params\": {},\"auth\": \"<Zabbix API token>"}"

|  (More information regarding commands and <Zabbix API token> within parameters are written later in this section.) 

| The cURL command above returns a response similar to the one below.

.. _oase_agent_zabbix_responss:

.. code-block:: json
   :linenos: 
   :lineno-start: 1

   {
      "jsonrpc": "2.0",
      "result": [
          {
              "eventid": "89",
              "source": "0",
              "object": "0",
              "objectid": "16046",
              "clock": "1709636653",
              "ns": "906955445",
              "r_eventid": "0",
              "r_clock": "0",
              "r_ns": "0",
              "correlationid": "0",
              "userid": "0",
              "name": "High CPU utilization (over 90% for 5m)",
              "acknowledged": "0",
              "severity": "2",
              "opdata": "Current utilization: 100 %",
              "suppressed": "0",
              "urls": []
          }
      ],
      "id": 1
   }

.. note::
  | For more information regarding :dfn:`Zabbix` faults (problems), see the following.
  |  https://www.zabbix.com/documentation/current/jp/manual/api/reference/problem/get

2. | Agent settings example for fetching events from :dfn:`Zabbix`.
  
| The following settings configures the :menuselection:`OASE management --> Agent` values to fetch values similar to the cURL command listed above.

.. list-table:: Zabbix setting value example
   :widths: 5 15
   :header-rows: 1
   :align: left

   * - Item name
     - Setting value
   * - Event collection name
     - <Name for fetching Zabbix faults>
   * - Connection method
     - Free authentication
   * - Requestion method
     - POST
   * - Connection destination
     - | http://<Zabbix IP Address or Domain>/zabbix/api_jsonrpc.php
   * - Request header
     - .. code-block:: json
      
         { "content-type" : "application/json-rpc" }

   * - Parameter
     - .. code-block:: json

         {
           "jsonrpc":"2.0",
           "method":"problem.get",
           "id":1,
           "params":{},
           "auth":"<Zabbix API token>"
         }

   * - Response key
     - result
   * - REsponse list flag
     - True
   * - Event ID key
     - eventid

.. note::
  | The <Zabbix API token> configured to :menuselection:`Parameter` is Zabbix user authentication information. The following command can be used to fetch user information.
  | Note that running the command below might cause already created <Zabbix API token> not being usable by existing users.
  | We recommend creating a new user and creating a new <Zabbix API token> with said user.

  | Create a new user

  1. | Sign in to :dfn:`Zabbix` as an admin through the browser.
     | 　The default admin login inforamtion are as following:
     | 　　・Username： Admin
     | 　　・Password： zabbix 
  2. | Select  a user Side menu  > User 
  3. | Click :guilabel:`Create user` at the top right part of the user page.
  4. | Input username and password
  5. | Click the :guilabel:`Permission` tab
  6. | Go to the user role and click :guilabel:`Select` select.
     | Select a "User role" or a role that has more API access.
  7. | Input other required items
  8. | Click :guilabel:`Add`.

  | Follow the following steps to create a user.

  | The following example is a command for creating an <API token>.
  | The :dfn:`Zabbix` login information for the example below are as following.
  | 　・Username: The user's <Username> from the previous operation.
  | 　・Password: The user's <Password> from the previous operation.
  
  .. code-block:: shell
      
     curl --request POST \
     --url ttp://<Zabbix IP Address or Domain>/zabbix/api_jsonrpc.php \
     --header "Content-Type: application/json-rpc" \
     --data "{\"auth\":null,\"method\":\"user.login\",\"id\":1,\"params\":{\"user\":\"<Username>\",\"password\":\"<Password>\"},\"jsonrpc\":\"2.0\"}" \
  
  | The cURL command above returns a response similar to the one below.
  
  .. code-block:: json
     :linenos:
     :lineno-start: 1
  
     {
         "jsonrpc": "2.0",
          "result": "<Zabbix API token>",
          "id": 1
     }
  
  | Paste the <Zabbix API token> to the  :menuselection:`OASE management --> Agent`'s :menuselection:`Parameter`'s <Zabbix API token>.
  | ※ <Zabbix API token> can be created from browsers.
  | After logging in through the browser, access Side menu > User settings > API token and create the token by pressing :guilabel:`Create API token`.

Grafan
^^^^^^
| This section contains an example for configuring :menuselection:`OASE management --> Agent` to fetch events from :dfn:`Grafan`.

| The :dfn:`Grafan` used in the following section is running the following version.
| ・Grafan 10.3
| ・Use Prometheus 2.49 for data source

1. | Fetch events from :dfn:`Grafan` with cURL command.

| The following example is an cURL command to fetch alerts from :dfn:`Grafan`.

.. code-block:: shell
   
   curl --request GET \
   --url 'http://<GrafanaのIP addres か Domain>:3000/api/prometheus/grafana/api/v1/alerts' \
   --header 'authorization: Bearer <Authentication token>' \
   --header 'Content-Type: application/json' 

|  (More information regarding commands and <Authentication token> within parameters are written later in this section.) 

| The cURL command above returns a response similar to the one below.

.. code-block:: json
   :linenos:
   :lineno-start: 1

   {
       "data": {
           "alerts": [
               {
                   "activeAt": "2018-07-04T20:27:12.60602144+02:00",
                   "annotations": {},
                   "labels": {
                       "alertname": "my-alert"
                   },
                   "state": "firing",
                   "value": "1e+00"
               }
           ]
       },
       "status": "success"
   }

.. note::
  | For more information regarding Grafana alerts, see the following URL.
  |  https://prometheus.io/docs/prometheus/latest/querying/api/#alerts

2. | Agent settings example for fetching events from :dfn:`Grafana`.

| The following settings configures the :menuselection:`OASE management --> Agent` values to fetch values similar to the cURL command listed above.

.. list-table:: Grafana setting example
   :widths: 5 15
   :header-rows: 1
   :align: left

   * - Item name
     - Setting value
   * - Event collection name
     - <Name for fetching Grafana alerts>
   * - Connection method
     - Bearer authentication
   * - Request method
     - GET
   * - Connection destination
     - | http://<Grafana IP addres or Domain>:3000/api/prometheus/grafana/api/v1/rules
   * - Request header
     - .. code-block:: json
      
         { "Content-Type": "application/json" }

   * - Authentication token
     - <Authentication token>
   * - Response key
     - data.alerts
   * - Response list flag
     - True
   * - Event ID key
     - activeAt

.. note::
  | <Authentication token> is Grafana authentication information.
  | It can be fetched by following the steps below.

  1. | Log in to :dfn:`Grafan` through the browser.
     | 　The default values are as following:
     | 　・username: admin
     | 　・Password: admin  (Might have been changed if someone already has logged in) 

  2. | Select Home > Administration > Service accounts

  3. | Click :guilabel:`service account` and create a service account.  

  4. | Input a name for the service name (uncapitalized alphanumeric characters only).

  5. | Click :guilabel:`Add service account token` and create an Authentication token.

  6. | For expiration,
     | 　Select either "No expiration" (no period　※recommended) or
     | 　"Set expiration" (with period).

  7. | Click :guilabel:`Generate token`.

  8. | Click :guilabel:`Copy to clipboard and close` 
     | and paste the Authentication token to the clipboard.

  9. | Paste the Authentication token from the clipboard to :menuselection:`OASE management --> Agent`'s :menuselection:`Authentication token`.

