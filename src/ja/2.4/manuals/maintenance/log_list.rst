========
ログ一覧
========

|　本書では Exastro IT Automation の各サービスのログのフォーマットと出力例を以下に記載します。

ログ一覧
========

.. list-table:: 
   :widths: 20 20 30
   :header-rows: 1
   :align: left

   * - | サービス
     - | ログフォーマット
     - | 備考
   * - | ita-ag-oase
     - | IT Automationログ
     - | 
   * - | ita-api-admin
     - | IT Automationログ
     - | 
   * - | ita-api-oase-receiver
     - | IT Automationログ
     - | 
   * - | ita-api-organization
     - | IT Automationログ
     - | 
   * - | ita-by-ansible-agent
     - | IT Automationログ
     - | 
   * - | ita-by-ansible-execute
     - | IT Automationログ
     - | 
   * - | ita-by-ansible-legacy-role-vars-listup
     - | IT Automationログ
     - | 
   * - | ita-by-ansible-legacy-vars-listup
     - | IT Automationログ
     - | 
   * - | ita-by-collector
     - | IT Automationログ
     - | 
   * - | ita-by-conductor-regularly
     - | IT Automationログ
     - | 
   * - | ita-by-conductor-synchronize
     - | IT Automationログ
     - | 
   * - | ita-by-excel-export-import
     - | IT Automationログ
     - | 
   * - | ita-by-execinstance-dataautoclean
     - | IT Automationログ
     - | 
   * - | ita-by-file-autoclean
     - | IT Automationログ
     - | 
   * - | ita-by-hostgroup-split
     - | IT Automationログ
     - | 
   * - | ita-by-menu-create
     - | IT Automationログ
     - | 
   * - | ita-by-menu-export-import
     - | IT Automationログ
     - | 
   * - | ita-by-oase-conclusion
     - | IT Automationログ
     - | 
   * - | ita-by-terraform-cli-execute
     - | IT Automationログ
     - | 
   * - | ita-by-terraform-cli-vars-listup
     - | IT Automationログ
     - | 
   * - | ita-by-terraform-cloud-ep-execute
     - | IT Automationログ
     - | 
   * - | ita-by-terraform-cloud-ep-vars-listup
     - | IT Automationログ
     - | 
   * - | ita-migration 
     - | IT Automationログ
     - | 
   * - | ita-web-server
     - | WebServiceログ
     - | 
   * - | platform-api
     - | Platformログ
     - | 
   * - | platform-auth
     - | PlatformAuthログ
     - | 
   * - | platform-job
     - | PlatformJobログ
     - | 
   * - | platform-migration
     - | Platformログ
     - | 
   * - | platform-web
     - | WebServiceログ
     - | 
   * - | keycloak
     - | keycloakログ
     - | 
   * - | mariadb
     - | https://mariadb.com/kb/en/error-log/
     - | ログの詳細は左記URLをご参照ください。
   * - | mongodb
     - | https://www.mongodb.com/docs/manual/reference/log-messages/
     - | ログの詳細は左記URLをご参照ください。
   * - | gitlab
     - | https://docs.gitlab.com/ee/administration/logs/
     - | ログの詳細は左記URLをご参照ください。

ログフォーマット
================

IT Automationログ
^^^^^^^^^^^^^^^^^

.. code-block::
   :caption: 形式

   [%(asctime)s][%(levelname)s] %(message)s

.. code-block::
   :caption: 例

   [2023-02-06 14:18:05,212][INFO] AppLog instance(stdAppLogger) is created

.. list-table:: 
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * - | フォーマット文字列
     - | フォーマットの意味
     - | ログの例
     - | 備考
   * - | [%(asctime)s]
     - | 日時
     - | [2023-02-06 14:18:05,212]
     - |
   * - | [%(levelname)s]
     - | ログレベル
     - | [INFO]
     - | DEBUG, INFO, WARNING, ERROR のいずれかが出力されます。
   * - | %(message)s
     - | メッセージ
     - | AppLog instance(stdAppLogger) is created
     - | 

Platformログ
^^^^^^^^^^^^

.. code-block:: 
   :caption: 形式
    
    %(asctime)s %(levelname)s (%(userid)s) %(pathname)s(%(lineno)d) %(message)s
    
.. code-block:: 
   :caption: 例

   2023/01/11 11:27:05.976995 INFO (None) /app/platform_init.py(88) platform initialize setting start


.. list-table:: 
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * -  フォーマット文字列
     -  フォーマットの意味
     -  ログの例
     -  備考
   * -  %\(asctime\)s
     -  ログ出力日時
     -  2023/01/11 11:27:05.976995
     -    
   * -  %\(levelname\)s
     -  ログレベル
     -  INFO
     -  DEBUG, INFO, WARNING, ERROR のいずれかが出力されます。
   * -  \(%\(userid\)s\)
     -  アクセスユーザー（Noneは指定なし）
     -  （None）
     -    
   * -  %\(pathname\)s
     -  ログ出力元のソース
     -  /app/platform_init.py
     -    
   * -  \(%\(lineno\)d\)
     -  ログ出力元の行
     -  \(88\)
     -   
   * -  %\(message\)s
     -  メッセージ
     -  platform initialize setting start
     -  

WebServiceログ
^^^^^^^^^^^^^^

| デフォルトのApacheログ形式になっています。
| 設定内容は以下の通りです。

.. code-block::
   :caption: 形式

    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined \
    LogFormat "%h %l %u %t \"%r\" %>s %b" common \ 
    <IfModule logio_module> \
      # You need to enable mod_logio.c to use %I and %O \
      LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio \
    </IfModule>


| commonフォーマットは以下の構成になっています。
| ログの保存としてcommonを指定した場合は表の情報が一行で記録されていきます。

.. code-block::
   :caption: 例

   192.168.128.2 - - [12/Jan/2023:15:38:10 +0900] "GET /favicon.ico/platform/ HTTP/1.1" 200 9817
   "http://localhost:8000/org3/platform/roles" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36
   (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"


.. list-table:: commonでログ保存を指定した場合
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * - | フォーマット文字列
     - | フォーマットの意味
     - | ログの例
     - | 備考
   * - | %h
     - | アクセス元のホスト名
     - | 192.168.128.2
     - |
   * - | %l
     - | クライアントの識別子
     - | -
     - |
   * - | &u
     - | 認証ユーザ名
     - | - 
     - |
   * - | %t
     - | リクエストを受け付けた時刻
     - | [12/Jan/2023:15:38:10 +0900]
     - |
   * - | \%r\
     - | リクエストの最初の行
     - | "GET /favicon.ico/platform/ HTTP/1.1"
     - |
   * - | %>s
     - | 最後のレスポンスのステータス
     - | 200
     - |
   * - | %b
     - | 送信されたバイト数
     - | 9817
     - |

| combinedフォーマットは、commonフォーマットに以下の項目が追加されています。

.. list-table:: combinedフォーマットでログ保存を指定した場合
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * - | フォーマット文字列
     - | フォーマットの意味
     - | ログの例
     - | 備考
   * - | \%{Referer}i\
     - | リファラー
     - | "http://localhost:8000/org3/platform/roles"
     - | リファラーとは参照元ページのことです。
   * - | \%{User-Agent}i\
     - | User Agent
     - | "Mozilla/5.0 \(Windows NT 10.0; Win64; x64\) AppleWebKit/537.36 \(KHTML, like Gecko\) Chrome/108.0.0.0 Safari/537.36"
     - | User Agent とは使用しているOS・ブラウザなどの情報のことです。

| combinedioフォーマットは、combinedフォーマットに以下の項目が追加されています。

.. list-table:: combinedioフォーマットでログ保存を指定した場合
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * - | フォーマット文字列
     - | フォーマットの意味
     - | ログの例
     - | 備考
   * - | &I
     - | 受け取ったバイト数
     - | - 
     - |
   * - | %O
     - | 送信したバイト
     - | - 
     - |

PlatformAuthログ
^^^^^^^^^^^^^^^^

| PlatformAuthログは、上述のWebServiceログのApacheログとPlatformログのフォーマットが混合されたものが出力されますが、WebServiceログとほとんど同じです。

.. code-block::
   :caption: 例

   [-] - 192.168.128.2 - - [08/Feb/2023:10:22:20 +0900] "GET /auth/resources/b3h1e/common/keycloak/node_modules/patternfly/dist/fonts/OpenSans-Light-webfont.woff2 HTTP/1.1" 200 63180 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36"

PlatformJobログ
^^^^^^^^^^^^^^^

.. code-block:: 
  :caption: 形式

  [%(asctime)s] [%(process)06d:%(threadName)s] [%(levelname)-5s] %(message)s

.. code-block:: 
  :caption: 例
  
  [2023-01-05 18:05:22,875] [000000:MainThread] [INFO] Get keycloak service account token. realm_name=master

.. list-table:: 
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * - | フォーマット文字列
     - | フォーマットの意味
     - | ログの例
     - | 備考
   * - | [%(asctime)s]
     - | 日付
     - | [2023-01-05 18:05:22,875]
     - |
   * - | [%(process)06d:%(threadName)s]
     - | プロセスID:スレッド名
     - | [000000:MainThread]
     - | 
   * - | [%(levelname)s]
     - | ログレベル
     - | [INFO]
     - | DEBUG, INFO, WARNING, ERROR のいずれかが出力されます。
   * - | %\(message\)s
     - | メッセージ
     - | Get keycloak service account token. realm_name=master
     - |

Keycloakログ
^^^^^^^^^^^^

.. code-block:: 
   :caption: 形式

   %d{yyyy-MM-dd HH:mm:ss,SSS} %-5p [%c] (%t) %s%e%n


.. code-block:: 
   :caption: 例

   2023-01-12 09:21:49,040 INFO  [org.keycloak.events] (default task-13) type=INTROSPECT_TOKEN, realmId=org3, clientId=system-org3-auth, userId=null, ipAddress=172.18.0.14, client_auth_method=client-secret


.. list-table:: 
   :widths: 15 15 20 20
   :header-rows: 1
   :align: left

   * - | フォーマット文字列
     - | フォーマットの意味
     - | ログの例
     - | 備考
   * - | %d{yyyy-MM-dd HH:mm:ss,SSS}
     - | ログ出力日時 
     - | 2023-01-12 09:21:49,040
     - |
   * - | %-5p
     - | ログレベル
     - | INFO
     - | DEBUG, INFO, WARN, ERROR, FATAL のいずれかが出力されます。
   * - | \[%c\]
     - | ログ　カテゴリ名
     - | \[org.keycloak.events\]
     - | 
   * - | \(%t\)
     - | スレッド名
     - | \(default task-13\)
     - | 
   * - | %s
     - | 簡単なメッセージ
     - | - 
     - | 
   * - | %e
     - | 例外
     - | -
     - | 
   * - | %n
     - | 改行
     - | -
     - | 

| Keycloakのログの詳細は下記URLをご参照ください。
| https://www.keycloak.org/server/logging

