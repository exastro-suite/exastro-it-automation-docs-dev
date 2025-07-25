.. _ansible_execution_agent:

================================
Ansible Execution Agent - Online
================================

.. _ansible_execution_agent_purpose:

目的
====

| 本書では、Exastro IT Automation （以下、ITAとも記載する）においてAnsibleをPULL型で実行する際に必要となる、
| Ansible Execution Agentを導入する手順について説明します。


.. tip:: 
    | Ansible Execution Agentを使用した作業実行、及び設定方法については、マニュアルの以下を参照してください。
    
    - :ref:`ansible_execution_environment_definition_template_list` 
    - :ref:`ansible_execution_environment_list` 
    - :ref:`ansible_agent_list` 
    - :ref:`ansible_common_environment_definition_make`

.. _ansible_execution_agent_precondition:

前提条件
========

| システム要件については :doc:`構成・構築ガイド<../../../configuration/ansible/ansible_execution_agent>` を参照してください。
| 有償版のAnsible-builder、Ansible-runnerを利用する場合の、サブスクリプションの登録、リポジトリ有効化については :doc:`構成・構築ガイド<../../../configuration/ansible/ansible_execution_agent>` を参照してください。

推奨事項
========

専用ユーザーの払い出し
----------------------

| Ansible Execution Agent の利用には、:doc:`サービスアカウントユーザー管理機能<../../../manuals/organization_management/service_account_users>` で作成したサービスアカウントユーザーを使用することを推奨します。

.. _ansible_execution_agent_parameter_list:

パラメータ一覧
==============

| インストーラで生成される、env内のパラメータについて

.. list-table:: env内のパラメータ
   :header-rows: 1
   :align: left

   * - パラメータ名
     - 内容
     - デフォルト値
     - 変更可否
     - 追加されたバージョン
     - 備考
   * - IS_NON_CONTAINER_LOG
     - ログをファイル出力する設定項目
     - 1
     - 不可
     - 2.5.1
     - 
   * - LOG_LEVEL
     - ログを出力レベルの設定値[INFO/DEBUG]
     - INFO
     - 可
     - 2.5.1
     - 
   * - LOGGING_MAX_SIZE
     - ログローテーションのファイルサイズ
     - 10485760
     - 可
     - 2.5.1
     - 初期状態は、コメントアウト
   * - LOGGING_MAX_FILE
     - ログローテーションのバックアップ数
     - 30
     - 可
     - 2.5.1
     - 初期状態は、コメントアウト
   * - LANGUAGE
     - 言語設定
     - en
     - 可
     - 2.5.1
     - 
   * - TZ
     - タイムゾーン
     - Asia/Tokyo
     - 可
     - 2.5.1
     - 
   * - PYTHON_CMD
     - 実行する仮想環境のpythonの実行コマンド
     - <インストールした環境のPATH>/poetry run python3
     - 不可
     - 2.5.1
     - 
   * - PYTHONPATH
     - 実行する仮想環境のpythonの実行コマンド
     - <対話事項で入力したインストール先>/ita_ag_ansible_execution/
     - 可
     - 2.5.1
     - 
   * - APP_PATH
     - インストール先のPATH
     - <対話事項で入力したインストール先>
     - 可
     - 2.5.1
     - 
   * - STORAGEPATH
     - データの保存先のPATH
     - <対話事項で入力した保存先>/<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>/storage
     - 可
     - 2.5.1
     - 
   * - LOGPATH
     - ログの保存先のPATH
     - <対話事項で入力した保存先>/<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>/log
     - 可
     - 2.5.1
     - 
   * - EXASTRO_ORGANIZATION_ID
     - 接続先のORGANIZATION_ID
     - <対話事項で入力したORGANIZATION_ID>
     - 可
     - 2.5.1
     - 
   * - EXASTRO_WORKSPACE_ID
     - 接続先のWORKSPACE_ID
     - <対話事項で入力したWORKSPACE_ID>
     - 可
     - 2.5.1
     - 
   * - EXASTRO_URL
     - 接続先のITAのURL
     - <対話事項で入力したURL>
     - 可
     - 2.5.1
     - 
   * - EXASTRO_REFRESH_TOKEN
     - 接続先のITAのEXASTRO_REFRESH_TOKEN
     - <対話事項で入力したEXASTRO_REFRESH_TOKEN>
     - 可
     - 2.5.1
     - 
   * - EXECUTION_ENVIRONMENT_NAMES
     - | 実行する環実行環境指定できます。
       | 空の場合、全実行環境を作業対象とします。
       | 複数指定する場合は、「,」区切りで指定してください。
     - 空
     - 可
     - 2.5.1
     - 
   * - AGENT_NAME
     - サービスに登録する、エージェントの識別子です。
     - ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
     - 不可
     - 2.5.1
     - 
   * - USER_ID
     - エージェントの識別子です。
     - <サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
     - 不可
     - 2.5.1
     - 
   * - ITERATION
     - 設定を初期化するまでの、処理の繰り返し数
     - 10
     - 可
     - 2.5.1
     - 
   * - EXECUTE_INTERVAL
     - メインプロセス終了後のインターバル
     - 5
     - 可
     - 2.5.1
     - 


.. tip:: 
  | EXECUTION_ENVIRONMENT_NAMES: エージェントで作業対象とする実行環境を分けたい場合等に指定してください。
  | 複数指定する際には、「,」区切りで指定してください。


  .. code-block:: bash
 
         EXECUTION_ENVIRONMENT_NAMES=<実行環境名1>,<実行環境名2>
         
  | 実行環境名については、 :ref:`ansible_execution_environment_list` を参照してください。

.. _ansible_execution_agent_install:

インストール
============

準備
----

| 以下より、最新のsetup.shを取得し、実行権限を付与してください。

.. code-block:: bash
   
    $ wget https://raw.githubusercontent.com/exastro-suite/exastro-it-automation/refs/heads/main/ita_root/ita_ag_ansible_execution/setup.sh

    $ chmod 755 ./setup.sh


対話での問い合わせ事項
----------------------

- エージェントのバージョン情報
- サービス名
- ソースコードのインストール先
- データの保存先
- 使用するAnsible-builder、Ansible-runnerについて
- 接続先のITAの接続情報（URL、ORGANIZATION_ID、WORKSPACE_ID、REFRESH_TOKEN）
    
    
Ansible Execution Agentのインストール
-------------------------------------

| setup.shを実行し、後述する対話事項に沿って進めてください。

.. code-block:: bash

    $ ./setup.sh install


1. | エージェントのインストールモードを聞かれるので、指定してください。
   | 1: 必要なモジュールのインストール、サービスのソースコードのインストール、サービスの登録・起動を行います。
   | 2: 追加でサービスの登録・起動を行います。
   | 3: envファイルを指定して、サービスの登録・起動を行います。
   | ※ 2.3については、1が実行されている前提になります。

.. code-block:: bash

    Please select which process to execute.
        1: Create ENV, Install, Register service
        2: Create ENV, Register service
        3: Register service
        q: Quit installer
    select value: (1, 2, 3, q)  :

.. tip:: | 以下、「default: xxxxxx」がある項目については、Enterを押下すると、defaultの値が適用されます。

2.  以下、Enterを押下すると、必要な設定値を対話形式で、入力が開始されます。

.. tabs::

   .. tab:: 1.インストールから、エージェントサービス起動
    
      | ① 以下、Enterを押下すると、必要な設定値を対話形式での入力が開始されます。

      .. code-block:: bash
       
         'No value + Enter' is input while default value exists, the default value will be used.
         ->  Enter

      | ② インストールするエージェントのバージョンを指定できます。デフォルトでは、最新のソースコードが使用されます。

      .. code-block:: bash

         Input the version of the Agent. Tag specification: X.Y.Z, Branch specification: X.Y [default: No Input+Enter(Latest release version)]:
         Input Value [default: main ]:

      | ③ インストールするエージェントサービスの名称を設定する場合は、nを押して以降の対話で、指定してください。

      .. code-block:: bash

         The Agent service name is in the following format: ita-ag-ansible-execution-20241112115209622. Select n to specify individual names. (y/n):
         Input Value [default: y ]:

      | ④ ③で「n」を入力した場合のみこちら表示されます。

      .. code-block:: bash

         Input the Agent service name . The string ita-ag-ansible-execution- is added to the start of the name.:
         Input Value :

      | ⑤ ソースコードのインストール先を指定する場合は入力してください。

      .. code-block:: bash

         Specify full path for the install location.:
         Input Value [default: /home/<ログインユーザー>/exastro ]:

      | ⑥ データの保存先を指定する場合は入力してください。

      .. code-block:: bash

         Specify full path for the data storage location.:
         Input Value [default: /home/<ログインユーザー>/exastro ]:

      | ⑦ 使用するAnsible-builder、Ansible-runnerを指定してください。
      |   有償版を利用する場合は、リポジトリ有効化したうえで、2を指定してください。

      .. code-block:: bash

         Select which Ansible-builder and/or Ansible-runner to use(1, 2) [1=Ansible 2=Red Hat Ansible Automation Platform] :
         Input Value [default: 1 ]:

      | ⑧ 接続先のITAのURLを指定してください。　e.g. http://exastro.example.com:30080

      .. code-block:: bash

         Input the ITA connection URL.:
         Input Value :

      | ⑨ 接続先のITAのORGANIZATIONを指定してください。

      .. code-block:: bash

         Input ORGANIZATION_ID.:
         Input Value :

      | ⑩ 接続先のITAのWORKSPACEを指定してください。

      .. code-block:: bash

         Input WORKSPACE_ID.:
         Input Value :

      | ⑪ 接続先のITAのリフレッシュトークンを指定してください。（トークンの取得方法は、 :ref:`exastro_refresh_token`  を参照。）
      |   
      |   後で設定する場合は、Enter押して次に進んでください。
      |   .envのEXASTRO_REFRESH_TOKENを書き換えてください。

      .. code-block:: bash

         Input a REFRESH_TOKEN for a user that can log in to ITA. If the token cannot be input here, change the EXASTRO_REFRESH_TOKEN in the generated .env file.:
         Input Value [default:  ]:

      | ⑫ サービスの起動を行う場合は、を選択してください。起動しない場合は、後ほど手動で起動してください。

      .. code-block:: bash

         Do you want to start the Agent service? (y/n)y

      | ⑬ インストールしたサービスの情報が表示されます。

      .. code-block:: bash

         Install Ansible Execution Agent Infomation:
             Agent Service id:   <サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
             Agent Service Name: ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
             Storage Path:       /home/<ログインユーザー>/exastro/<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>/storage
             Env Path:           /home/<ログインユーザー>/exastro/<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>/.env

   .. tab:: 2.エージェントサービスの追加、起動
    
      | ① 以下、Enterを押下すると、必要な設定値を対話形式での入力が開始されます。

      .. code-block:: bash
       
         'No value + Enter' is input while default value exists, the default value will be used.
         ->  Enter

      | ② インストールするエージェントサービスの名称を設定する場合は、nを押して以降の対話で、指定してください。

      .. code-block:: bash

         The Agent service name is in the following format: ita-ag-ansible-execution-20241112115209622. Select n to specify individual names. (y/n):
         Input Value [default: y ]:

      | ③ ②で「n」を入力した場合のみこちら表示されます。

      .. code-block:: bash

         Input the Agent service name . The string ita-ag-ansible-execution- is added to the start of the name.:
         Input Value :

      | ④ ソースコードのインストール先を指定する場合は入力してください。

      .. code-block:: bash

         Specify full path for the install location.:
         Input Value [default: /home/<ログインユーザー>/exastro ]:

      | ⑤ データの保存先を指定する場合は入力してください。

      .. code-block:: bash

         Specify full path for the data storage location.:
         Input Value [default: /home/<ログインユーザー>/exastro ]:


      | ⑥ 接続先のITAのURLを指定してください。　e.g. http://exastro.example.com:30080

      .. code-block:: bash

         Input the ITA connection URL.:
         Input Value :

      | ⑦ 接続先のITAのORGANIZATIONを指定してください。

      .. code-block:: bash

         Input ORGANIZATION_ID.:
         Input Value :

      | ⑧ 接続先のITAのWORKSPACEを指定してください。

      .. code-block:: bash

         Input WORKSPACE_ID.:
         Input Value :

      | ⑨ 接続先のITAのリフレッシュトークンを指定してください。（トークンの取得方法は、 :ref:`exastro_refresh_token`  を参照。）
      |   
      |   後で設定する場合は、Enter押して次に進んでください。
      |   .envのEXASTRO_REFRESH_TOKENを書き換えてください。

      .. code-block:: bash

         Input a REFRESH_TOKEN for a user that can log in to ITA. If the token cannot be input here, change the EXASTRO_REFRESH_TOKEN in the generated .env file.:
         Input Value [default:  ]:

      | ⑩ サービスの起動を行う場合は、を選択してください。起動しない場合は、後ほど手動で起動してください。

      .. code-block:: bash

         Do you want to start the Agent service? (y/n)y

      | ⑪ インストールしたサービスの情報が表示されます。

      .. code-block:: bash

         Install Ansible Execution Agent Infomation:
             Agent Service id:   <サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
             Agent Service Name: ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
             Storage Path:       /home/<ログインユーザー>/exastro/<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>/storage
             Env Path:           /home/<ログインユーザー>/exastro/<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>/.env


   .. tab:: 3.サービス起動
    

      | ① 以下、Enterを押下すると、必要な設定値を対話形式での入力が開始されます。

      .. code-block:: bash
       
         'No value + Enter' is input while default value exists, the default value will be used.
         ->  Enter

      | ② 使用する.envのパスを指定してください。envの情報をもとに、サービスの登録・起動を行います。

      .. code-block:: bash
       
         Input the full path for the .env file.:
         Input Value :

      | ③ サービスの起動を行う場合は、を選択してください。起動しない場合は、後ほど手動で起動してください。

      .. code-block:: bash
       
        Do you want to start the Agent service? (y/n)y

      | ④ インストールしたサービスの情報が表示されます。

      .. code-block:: bash

         Install Ansible Execution Agent Infomation:
             Agent Service id:   <サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
             Agent Service Name: ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
             Storage Path:       /home/<ログインユーザー>/exastro/<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>/storage
             Env Path:           /home/<ログインユーザー>/exastro/<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>/.env
   
         
.. _ansible_execution_agent_uninstall:

アンインストール
================

| setup.shを実行し、後述する対話事項に沿って進めてください。

.. code-block:: bash

    $ ./setup.sh uninstall

.. tip:: | 以下、アンインストールでは、サービスの削除、データの削除は実施可能ですが、アプリケーションのソースコードは、削除されません。
         | 削除する場合は、手動での対応が必要となります。

1. | エージェントのアンインストールモードを聞かれるので、指定してください。
   | 1: サービスの削除、データの削除を行います。
   | 2: サービスの削除、を行います。データは削除されません。
   | 3: データの削除
   | ※ 3については、2が実行されている前提になります。

.. code-block:: bash

    Please select which process to execute.
        1: Delete service, Delete Data
        2: Delete service
        3: Delete Data
        q: Quit uninstaller
    select value: (1, 2, 3, q)  :


1.  以下、Enterを押下すると、必要な設定値を対話形式で、入力が開始されます。

.. tabs::

   .. tab:: 1.エージェントサービス削除、データ削除

      | ①アンインストールするエージェントのサービス名（ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>）を指定してください。

      .. code-block:: bash
       
        Input a SERVICE_NAME.(e.g. ita-ag-ansible-execution-xxxxxxxxxxxxx):

      | ②①で指定した、サービス名のデータの保存先を指定してください。

      .. code-block:: bash
       
        Input a STORAGE_PATH.(e.g. /home/cloud-user/exastro/<SERVICE_ID>):

   .. tab:: 2.エージェントサービス削除

      | ①アンインストールするエージェントのサービス名（ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>）を指定してください。

      .. code-block:: bash
       
        Input a SERVICE_NAME.(e.g. ita-ag-ansible-execution-xxxxxxxxxxxxx):
        
   .. tab:: 3.データ削除

      | ① サービスのデータの保存先を指定してください。
       
      .. code-block:: bash
       
        Input a STORAGE_PATH.(e.g. /home/cloud-user/exastro/<SERVICE_ID>):


.. _ansible_execution_agent_service_cmd:

サービスの手動での操作、確認方法
================================

| 以下のコマンドにて、サービスの状態を確認できます。

.. tabs::

   .. tab:: AlmaLinux8
    
     .. code-block:: bash
        
        # 設定ファイルの変更を反映
        $ sudo systemctl daemon-reload
        # サービスの状況確認
        $ sudo systemctl status  ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
        # サービスの開始
        $ sudo systemctl start ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
        # サービスの停止
        $ sudo systemctl stop  ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
        # サービスの再起動
        $ sudo systemctl restart  ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>

   .. tab:: RHEL9
    
     .. code-block:: bash

        # 設定ファイルの変更を反映
        $ systemctl --user daemon-reload
        # サービスの状況確認
        $ systemctl --user status  ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
        # サービスの開始
        $ systemctl --user start ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
        # サービスの停止
        $ systemctl --user stop  ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
        # サービスの再起動
        $ systemctl --user restart  ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>
      

.. _ansible_execution_agent_service_log:

サービスのログ確認方法
======================
  
- | アプリケーションログ

.. code-block:: bash

   /home/<ログインユーザー>/exastro/<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>/log/
        ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>.log
        ita-ag-ansible-execution-<サービスの一意な識別子:yyyyMMddHHmmssfff or 対話で指定した文字列>.log.xx
  
  ※ログローテーションされたファイルは、末尾に数値が付与されます。ログのローテートのサイズ、保存期間は、を参照してください。
  
- | システムログ、各コンポーネントのログ
 
.. code-block:: bash

   /var/log/message
  
  ※podman、Ansible-builder、Ansible-runner他の関連コンポーネントについては、各コンポーネントのログ出力先について参照してください。
