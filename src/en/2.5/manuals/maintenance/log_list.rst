========
Log list
========

| This document aims to explain the Exastro IT Automation's container log examples and formats.

Standard log
============

| The format of a standard log is as following.

.. code-block::
   :caption: Format

   [%(asctime)s] [%(levelname)s] [%(userid)s] <フFree log>

.. code-block::
   :caption: Example

    [2023-02-06 14:18:05,212][INFO] [USER_ID:20401] AppLog instance(stdAppLogger) is created

.. list-table:: 
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * - | Format character string
     - | Format meaning
     - | Log example
     - | Remarks
   * - | [%(asctime)s]
     - | Date/time
     - | [2023-01-05 18:05:22,875]
     - |
   * - | [%(levelname)s]
     - | Log level
     - | [INFO]
     - | 
   * - | [%(userid)s]
     - | User ID
     - | [USER_ID:efb59f05-6f31-47d6-b28e-0f9ee236534e]
     - |
   * - | <Free log>
     - | No set format
     - | AppLog instance(stdAppLogger) is created
     - | Format differs depending on the log.

platform-migration・platform-api
================================

.. code-block:: 
   :caption: Format
    
    %(asctime)s %(levelname)s (%(userid)s) %(pathname)s(%(lineno)d) %(message)s
    
.. code-block:: 
   :caption: Example

   2023/01/11 11:27:05.976995 INFO (None) /app/platform_init.py(88) platform initialize setting start


.. list-table:: 
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * - | Format character string
     - | Format meaning
     - | Log example
     - | Remarks
   * -  %\(asctime\)s
     -  Log output date/time
     -  2023/01/11 11:27:05.976995
     -    
   * -  %\(levelname\)s
     -  Log level
     -  INFO
     -  One of the following is output: DEBUG, INFO, WARNING, ERROR, or CRITICAL.
   * -  \(%\(userid\)s\)
     -  Access user ("None" when nothing is specified) 
     -   (None) 
     -    
   * -  %\(pathname\)s
     -  Log output source
     -  /app/platform_init.py
     -    
   * -  \(%\(lineno\)d\)
     -  Log output source lines
     -  \(88\)
     -   
   * -  %\(message\)s
     -  Message
     -  platform initialize setting start
     -  

platform-web・ita-web-server
============================

| The default Apache log format is as following.
| The setting contents are as following.

.. code-block::
   :caption: Format

    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined \
    LogFormat "%h %l %u %t \"%r\" %>s %b" common \ 
    <IfModule logio_module> \
      # You need to enable mod_logio.c to use %I and %O \
      LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio \
    </IfModule>


| The common format is structured as following.
| If Common format is specified for log saving, the table information will be written in 1 line.

.. code-block::
   :caption: Example

   192.168.128.2 - - [12/Jan/2023:15:38:10 +0900] "GET /favicon.ico/platform/ HTTP/1.1" 200 9817
   "http://localhost:8000/org3/platform/roles" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36
   (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"


.. list-table:: Saving logs in common format.
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * - | Format character string
     - | Format meaning
     - | Log example
     - | Remarks
   * - | %h
     - | Access source host name
     - | 192.168.128.2
     - |
   * - | %l
     - | Client Identifier
     - | -
     - |
   * - | &u
     - | authentication user name
     - | - 
     - |
   * - | %t
     - | Time when request was received
     - | [12/Jan/2023:15:38:10 +0900]
     - |
   * - | \%r\
     - | First line of request
     - | "GET /favicon.ico/platform/ HTTP/1.1"
     - |
   * - | %>s
     - | Status of last response
     - | 200
     - |
   * - | %b
     - | Number of sent bytes
     - | 9817
     - |

| The combined format adds the following items to the common format.

.. list-table:: Saving logs in combined format
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * - | Format character string
     - | Format meaning
     - | Log example
     - | Remarks
   * - | \%{Referer}i\
     - | Referer
     - | "http://localhost:8000/org3/platform/roles"
     - | The Referer refers to the source.
   * - | \%{User-Agent}i\
     - | User Agent
     - | "Mozilla/5.0 \(Windows NT 10.0; Win64; x64\) AppleWebKit/537.36 \(KHTML, like Gecko\) Chrome/108.0.0.0 Safari/537.36"
     - | User Agent refers to OS and browser information

| The combinedio format adds the following items to the combined format.

.. list-table:: Saving logs in combinedio format
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * - | Format character string
     - | Format meaning
     - | Log example
     - | Remarks
   * - | &I
     - | Number of recieved bytes
     - | - 
     - |
   * - | %O
     - | Number of sent bytes
     - | - 
     - |

platform-auth
=============

| The platform-auth logs are output as a mix of the platform-api and Apache log formats and are more or less the same as the platform-web logs.

.. code-block::
   :caption: Example

   [-] - 192.168.128.2 - - [08/Feb/2023:10:22:20 +0900] "GET /auth/resources/b3h1e/common/keycloak/node_modules/patternfly/dist/fonts/OpenSans-Light-webfont.woff2 HTTP/1.1" 200 63180 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36"

Keycloak
========

.. code-block:: 
   :caption: Format

   %d{yyyy-MM-dd HH:mm:ss,SSS} %-5p [%c] (%t) %s%e%n


.. code-block:: 
   :caption: Example

   2023-01-12 09:21:49,040 INFO  [org.keycloak.events] (default task-13) type=INTROSPECT_TOKEN, realmId=org3, clientId=system-org3-auth, userId=null, ipAddress=172.18.0.14, client_auth_method=client-secret


.. list-table:: 
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * - | Format character string
     - | Format meaning
     - | Log example
     - | Remarks
   * - | %d{yyyy-MM-dd HH:mm:ss,SSS}
     - | Log output date/time 
     - | 2023-01-12 09:21:49,040
     - |
   * - | %-5p
     - | Log level
     - | INFO
     - | Outputs one of the following: DEBUG, INFO, WARN, ERROR.
   * - | \[%c\]
     - | Log category name
     - | \[org.keycloak.events\]
     - | 
   * - | \(%t\)
     - | Thread name
     - | \(default task-13\)
     - | 
   * - | %s
     - | Simple message
     - | - 
     - | 
   * - | %e
     - | Exepction
     - | -
     - | 
   * - | %n
     - | Newline
     - | -
     - | 

| See the following URL for more information regarding Keycloak logs.
| https://www.keycloak.org/server/logging

platform-db
===========

| The DB uses the log format of the used database.
| The settings depends on the DB, but an error log will be output when mariadb is activated.
| See the following URL for more information.
| https://mariadb.com/kb/en/error-log/

ita-api-organization
====================

.. code-block:: 
  :caption: Format 
   
   [%(asctime)s] [%(levelname)s]  <Free log>

.. code-block::
  :caption: Example   
   
   [2023-01-19 12:18:25,940][INFO] AppLog instance(stdAppLogger) is created

.. list-table:: 
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * - | Format character string
     - | Format meaning
     - | Log example
     - | Remarks
   * - | %(asctime)s
     - | Date/time
     - | [2023-01-19 12:18:25,940]
     - |
   * - | %(levelname)s
     - | Log level
     - | INFO
     - | Outputs on of the following: ERROR, INFO, or DEBUG.
   * - | <Free log>
     - | No set format
     - | AppLog instance(stdAppLogger) is created
     - | Format differs depending on the log.

ita-api-admin
=============

.. code-block:: 
  :caption: Format

  [%(asctime)s] [%(levelname)s] [%(userid)s] <Free log>

.. code-block:: 
  :caption: Example
  
  [2023-01-05 18:05:22,875][INFO] [USER_ID:efb59f05-6f31-47d6-b28e-0f9ee236534e] [ts=2023-01-05T09:05:22.756Z][api-start]url: POST:http://ita-api-admin:8070/api/organizations/org1/ita/

.. list-table:: 
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * - | Format character string
     - | Format meaning
     - | Log example
     - | Remarks
   * - | [%(asctime)s]
     - | Date/time
     - | [2023-01-05 18:05:22,875]
     - |
   * - | [%(levelname)s]
     - | Log level
     - | [INFO]
     - | 
   * - | [%(userid)s]
     - | User ID
     - | [USER_ID:efb59f05-6f31-47d6-b28e-0f9ee236534e]
     - |
   * - | <Free log>
     - | No set format
     - | [ts=2023-01-05T09:05:22.756Z][api-start]url: POST:http://ita-api-admin:8070/api/organizations/org1/ita/
     - | Format differs depending on the log.
