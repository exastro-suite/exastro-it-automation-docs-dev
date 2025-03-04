==============
Collect/Compare function
==============

| In this scenario, the user will learn how to use Exastro IT Automation's most basic features by managing users.

.. glossary:: Collect function
   
   収集機能とは、ITAで実施した、
   作業実行結果(規定のフォーマットで出力されたソースファイル)を元に、
   パラメータシートへ値を自動で登録する機能。

.. glossary:: Compare function
   比較機能とは、ITAのパラメータシート作成機能で作成したパラメータシートを比較し、差分を出力する機能です。

Collect pre-execution system information
========================

Create parameter sheet
----------------------

| First, let's use the Collect function to collect information about the system in the current state.
| The Collect function updates and registers target values to a parameter sheet based on registered setting values.

| The Ansible Playbook used is written below. Make sure to create the parameter sheet so it can use the parameters below.

.. code-block:: bash
   :caption: system_collection.yml

   - name: set variable
     set_fact:
       test: "{{ VAR_hostname }}"

   - name: make yaml file
     blockinfile:
       create: yes
       mode: 644
       insertbefore: EOF
       marker: ""
       dest: "/tmp/system.yml"
       content: |
         ansible_architecture              : {{ ansible_architecture }}
         ansible_bios_version              : {{ ansible_bios_version }}
         ansible_default_ipv4__address     : {{ ansible_default_ipv4.address }}
         ansible_default_ipv4__interface   : {{ ansible_default_ipv4.interface }}
         ansible_default_ipv4__network     : {{ ansible_default_ipv4.network }}
         ansible_distribution              : {{ ansible_distribution }}
         ansible_distribution_file_path    : {{ ansible_distribution_file_path }}
         ansible_distribution_file_variety : {{ ansible_distribution_file_variety }}
         ansible_distribution_major_version: {{ ansible_distribution_major_version }}
         ansible_distribution_release      : {{ ansible_distribution_release }}
         ansible_distribution_version      : {{ ansible_distribution_version }}
         ansible_machine                   : {{ ansible_machine }}
         ansible_memtotal_mb               : {{ ansible_memtotal_mb }}
         ansible_nodename                  : {{ ansible_nodename }}
         ansible_os_family                 : {{ ansible_os_family }}
         ansible_pkg_mgr                   : {{ ansible_pkg_mgr }}
         ansible_processor_cores           : {{ ansible_processor_cores }}

   - name: Copy the make yaml file to local
     fetch:
       src: "/tmp/system.yml"
       dest: "{{ __parameter_dir__ }}/{{ inventory_hostname }}/"
       flat: yes


| From the :menuselection:`Create Parameter sheet --> Define/Create Parameter sheet` menu, create a Parameter sheet for collecting system information called "System information".

.. figure:: /images/learn/quickstart/collection/パラメータシート作成1.gif
   :width: 1200px
   :alt: Parameter sheet creation

.. list-table:: Parameter sheet creation item setting values 1
   :widths: 10 10 10 10 10 10 10
   :header-rows: 1

   * - Setting item
     - Item 1 setting item
     - Item 2 setting item
     - Item 3 setting item
     - Item 4 setting item
     - Item 5 setting item
     - Item 6 setting item
   * - Group
     - 
     - 
     - :kbd:`ansible_default_ipv4`
     - :kbd:`ansible_default_ipv4`
     - :kbd:`ansible_default_ipv4`
     - 
   * - Item name
     - :kbd:`ansible_architecture`
     - :kbd:`ansible_bios_version`
     - :kbd:`address`
     - :kbd:`interface`
     - :kbd:`network`
     - :kbd:`ansible_distribution`
   * - Item name(Rest API) 
     - :kbd:`ansible_architecture`
     - :kbd:`ansible_bios_version`
     - :kbd:`address`
     - :kbd:`interface`
     - :kbd:`network`
     - :kbd:`ansible_distribution`
   * - Input method
     - :kbd:`String (Single line)`
     - :kbd:`String (Single line)`
     - :kbd:`String (Single line)`
     - :kbd:`String (Single line)`
     - :kbd:`String (Single line)`
     - :kbd:`String (Single line)`
   * - Select item
     - :kbd:`64`
     - :kbd:`64`
     - :kbd:`64`
     - :kbd:`64`
     - :kbd:`64`
     - :kbd:`64`
   * - Regular expression
     - 
     - 
     - 
     - 
     - 
     - 
   * - Default value
     - 
     - 
     - 
     - 
     - 
     - 
   * - Required
     - 
     - 
     - 
     - 
     - 
     - 
   * - Unique restriction
     - 
     - 
     - 
     - 
     - 
     - 
   * - Description
     - 
     - 
     - 
     - 
     - 
     - 
   * - Remarks
     - 
     - 
     - 
     - 
     - 
     - 

.. figure:: /images/learn/quickstart/collection/パラメータシート作成2.gif
   :width: 1200px
   :alt: Parameter sheet creation

.. list-table:: Parameter sheet creation item setting values 2
   :widths: 10 10 10 10 10 10 10
   :header-rows: 1

   * - Setting item
     - Item 7 setting item
     - Item 8 setting item
     - Item 9 setting item
     - Item 10 setting item
     - Item 11 setting item
     - Item 12 setting item
   * - Group
     - 
     - 
     - 
     - 
     - 
     - 
   * - Item name
     - :kbd:`ansible_distribution_file_path`
     - :kbd:`ansible_distribution_file_variety`
     - :kbd:`ansible_distribution_major_version`
     - :kbd:`ansible_distribution_release`
     - :kbd:`ansible_distribution_version`
     - :kbd:`ansible_machine`
   * - Item name (Rest API) 
     - :kbd:`ansible_distribution_file_path`
     - :kbd:`ansible_distribution_file_variety`
     - :kbd:`ansible_distribution_major_version`
     - :kbd:`ansible_distribution_release`
     - :kbd:`ansible_distribution_version`
     - :kbd:`ansible_machine`
   * - Input method
     - :kbd:`String (Single line)`
     - :kbd:`String (Single line)`
     - :kbd:`String (Single line)`
     - :kbd:`String (Single line)`
     - :kbd:`String (Single line)`
     - :kbd:`String (Single line)`
   * - Select item
     - :kbd:`64`
     - :kbd:`64`
     - :kbd:`64`
     - :kbd:`64`
     - :kbd:`64`
     - :kbd:`64`
   * - Regular expression
     - 
     - 
     - 
     - 
     - 
     - Default value
     - 
     - 
     - 
     - 
     - 
     - 
   * - Required
     - 
     - 
     - 
     - 
     - 
     - 
   * - Unique restriction
     - 
     - 
     - 
     - 
     - 
     - 
   * - Description
     - 
     - 
     - 
     - 
     - 
     - 
   * - Remarks
     - 
     - 
     - 
     - 
     - 
     - 

.. figure:: /images/learn/quickstart/collection/パラメータシート作成3.gif
   :width: 1200px
   :alt: Parameter sheet creation

.. list-table:: Parameter sheet creation item setting values 3
   :widths: 10 10 10 10 10 10
   :header-rows: 1

   * - Setting item
     - Item 13 setting item
     - Item 14 setting item
     - Item 15 setting item
     - Item 16 setting item
     - Item 17 setting item
   * - Group
     - 
     - 
     - 
     - 
     - 
   * - Item name
     - :kbd:`ansible_memtotal_mb`
     - :kbd:`ansible_nodename`
     - :kbd:`ansible_os_family`
     - :kbd:`ansible_pkg_mgr`
     - :kbd:`ansible_processor_cores`
   * - Item name (Rest API) 
     - :kbd:`ansible_memtotal_mb`
     - :kbd:`ansible_nodename`
     - :kbd:`ansible_os_family`
     - :kbd:`ansible_pkg_mgr`
     - :kbd:`ansible_processor_cores`
   * - Input method
     - :kbd:`String (Single line)`
     - :kbd:`String (Single line)`
     - :kbd:`String (Single line)`
     - :kbd:`String (Single line)`
     - :kbd:`String (Single line)`
   * - Select item
     - :kbd:`64`
     - :kbd:`64`
     - :kbd:`64`
     - :kbd:`64`
     - :kbd:`64`
   * - Regular expression
     - 
     - 
     - 
     - 
     - 
   * - Default value
     - 
     - 
     - 
     - 
     - 
   * - Required
     - 
     - 
     - 
     - 
     - 
   * - Unique restriction
     - 
     - 
     - 
     - 
     - 
   * - Description
     - 
     - 
     - 
     - 
     - 
   * - Remarks
     - 
     - 
     - 
     - 
     - 

.. list-table:: Parameter sheet creation information setting values
   :widths: 5 10
   :header-rows: 1

   * - Item name
     - Setting value
   * - Item number
     - (Automatic)
   * - Parameter sheet name
     - :kbd:`System information`
   * - Parameter sheet name(REST)
     - :kbd:`system_information`
   * - Creation target
     - :kbd:`Parameter sheet(With host/operation)`
   * - Display order
     - :kbd:`1`
   * - Use bundles
     - Uncheck the "Use" box(Deactivate)
   * - Last updated date/time
     - (Automatic)
   * - Last updated by
     - (Automatic)

| Next, from the :menuselection:`Create Parameter sheet --> Parameter sheet definition/creation` menu, create a parameter sheet called "Host name link".
| This parameter sheet will be required in order to run Ansible.

.. figure:: /images/learn/quickstart/collection/パラメータシート作成.png
   :width: 1200px
   :alt: Parameter sheet creation

.. list-table:: Parameter sheet creation(For linking Host name) item setting values
   :widths: 10 10
   :header-rows: 1

   * - Setting item
     - Item 1 setting value
   * - Item name
     - :kbd:`hostname`
   * - Item name(Rest API) 
     - :kbd:`hostname`
   * - Input method
     - :kbd:`Pulldown selection`
   * - Setting item
     - :kbd:`Ansible item:Device list:Host name`
   * - Reference
     - 
   * - Default value
     - 
   * - Required
     - 
   * - Unique restriction
     - 
   * - Description
     - 
   * - Remarks
     - 

.. list-table:: Parameter sheet (For linking Host name) creation information setting values
   :widths: 5 10
   :header-rows: 1

   * - Item name
     - Setting value
   * - Item number
     - (Automatic)
   * - Parameter sheet name
     - :kbd:`Host name link`
   * - Parameter sheet name(REST)
     - :kbd:`host_name_link`
   * - Creation target
     - :kbd:`Parameter sheet(With host/operation)`
   * - Display order
     - :kbd:`2`
   * - Use bundles
     - Uncheck the "Use" box(Deactivate)
   * - Last updated date/time
     - (Automatic)
   * - Last updated by
     - (Automatic)

Register operation procedure
--------------

| In order to register the operation procedure, the user must define a Movement(job), which is an unit of operation in Exastro IT Automation.
| We will then link an Ansible Playbook to the defined Movement, and then link the variables within the Ansible Playbook with the parameter sheet items registered in :ref:`quickstart_server_information_parmeter`.

| From the :menuselection:`Ansible-Legacy --> Movement list` menu, register a Movement for collecting system information.

.. glossary:: Movement
   The smallest operation unit in Exastro IT Automation.
   1 Movement is the same as 1 ansible-playbook command.

.. figure:: /images/learn/quickstart/collection/Movement登録.png
   :width: 1200px
   :alt: Register Movement

.. list-table:: Movement information setting values
   :widths: 10 10 10
   :header-rows: 2

   * - Movement name
     - Ansible use information
     - 
   * - 
     - Hist specification format
     - Header section
   * - :kbd:`Collect system information`
     - :kbd:`IP`
     - :kbd:`※See header section`

.. code-block:: bash
   :caption: Header section

   - hosts: all
     remote_user: "{{ __loginuser__ }}"
     gather_facts: yes
     become: yes

Register Ansible Playbook
---------------------

| In this step, we will register an Ansible Playbook. Ansible Playbooks corresponds to the commands written in operation manual.
| This scenario uses system_collection.yml.

.. code-block:: bash
   :caption: system_collection.yml

   - name: set variable
     set_fact:
       test: "{{ VAR_hostname }}"

   - name: make yaml file
     blockinfile:
       create: yes
       mode: 644
       insertbefore: EOF
       marker: ""
       dest: "/tmp/system.yml"
       content: |
         ansible_architecture              : {{ ansible_architecture }}
         ansible_bios_version              : {{ ansible_bios_version }}
         ansible_default_ipv4__address     : {{ ansible_default_ipv4.address }}
         ansible_default_ipv4__interface   : {{ ansible_default_ipv4.interface }}
         ansible_default_ipv4__network     : {{ ansible_default_ipv4.network }}
         ansible_distribution              : {{ ansible_distribution }}
         ansible_distribution_file_path    : {{ ansible_distribution_file_path }}
         ansible_distribution_file_variety : {{ ansible_distribution_file_variety }}
         ansible_distribution_major_version: {{ ansible_distribution_major_version }}
         ansible_distribution_release      : {{ ansible_distribution_release }}
         ansible_distribution_version      : {{ ansible_distribution_version }}
         ansible_machine                   : {{ ansible_machine }}
         ansible_memtotal_mb               : {{ ansible_memtotal_mb }}
         ansible_nodename                  : {{ ansible_nodename }}
         ansible_os_family                 : {{ ansible_os_family }}
         ansible_pkg_mgr                   : {{ ansible_pkg_mgr }}
         ansible_processor_cores           : {{ ansible_processor_cores }}

   - name: Copy the make yaml file to local
     fetch:
       src: "/tmp/system.yml"
       dest: "{{ __parameter_dir__ }}/{{ inventory_hostname }}/"
       flat: yes

| From the :menuselection:`Ansible-Legacy --> Playbook file collection` menu, register the Playbook written above.

.. figure:: /images/learn/quickstart/collection/Playbook素材集.png
   :width: 1200px
   :alt: Playbook registration

.. list-table:: Ansible Playbook information registration
  :widths: 10 15
  :header-rows: 1

  * - Playbook file name
    - Playbook file
  * - :kbd:`system_collection`
    - :file:`system_collection.yml`

Link Movement and Ansible Playbook
-------------------------------------

| From the :menuselection:`Ansible-Legacy --> Movement-Playbook link` menu,link the previously registered Movement and Ansible Playbook.
| In this scenario, we are using system_collection.yml.

.. figure:: /images/learn/quickstart/collection/Movement-Playbook紐付.png
   :width: 1200px
   :alt: Movement-Playbook link

.. list-table:: Movement-Playbook link information registration
  :widths: 10 10 10
  :header-rows: 1

  * - Movement name
    - Playbook file
    - Include order
  * - :kbd:`System information collection`
    - :kbd:`system_collection`
    - :kbd:`1`

Link Parameter sheet items and Ansible Playbook
--------------------------------------------------------

| Substitute the system_collection.yml's :kbd:`VAR_hostname` variable with the host name of the target machine which will have it's information collected.

| From the :menuselection:`Ansible-Legacy --> Substitute value auto registration settings` menu, link the parameter sheet items with the Ansible Playbook variables.

.. figure:: /images/learn/quickstart/collection/代入値自動登録設定.png
   :width: 1200px
   :alt: Substitute value auto registration settings

.. list-table:: Group substitute value auto registration setting Setting values
  :widths: 40 10 10 20 20 10
  :header-rows: 2

  * - Parameter sheet(From)
    -
    - Registration format
    - Movement name
    - IaC variable(To)
    -
  * - Menu group:Menu:Item
    - Substitute order
    -
    -
    - Movement name:Variable name
    - Substitute order
  * - :kbd:`Substitute value auto registration:Host name link:Parameter/hostname`
    - :kbd:`No input`
    - :kbd:`Value type`
    - :kbd:`System information collection`
    - :kbd:`System information collection:VAR_hostname`
    - :kbd:`No input`

Collection item value management
--------------

| The Collect function 
In the Collection item value management menu, 
収集項目値管理 にて、作業実行結果(ソースファイル)と
パラメータシートの項目の紐づけ設定がされていないと、収集機能は動作しません。

| :menuselection:`Ansible common --> 収集項目値管理` から、ソースファイルとパラメータシートの項目の紐付情報の登録をします。

.. figure:: /images/learn/quickstart/collection/収集項目値管理.gif
   :width: 1200px
   :alt: Collection item value management

.. list-table:: Collection item value management Setting values
  :widths: 10 10 10 20
  :header-rows: 2

  * - Collect item(From)
    -
    - 
    - Parameter sheet(To)
  * - Parse format
    - PREFIX(File name)
    - Variable name
    - Menu group:Item
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_architecture`
    - :kbd:`Input:System information:Parameter/ansible_architecture`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_bios_version`
    - :kbd:`Input:System information:Parameter/ansible_bios_version`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_default_ipv4__address`
    - :kbd:`Input:System information:Parameter/ansible_default_ipv4/address`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_default_ipv4__interface`
    - :kbd:`Input:System information:Parameter/ansible_default_ipv4/interface`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_default_ipv4__network`
    - :kbd:`Input:System information:Parameter/ansible_default_ipv4/network`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_distribution`
    - :kbd:`Input:System information:Parameter/ansible_distribution`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_distribution_file_path`
    - :kbd:`Input:System information:Parameter/ansible_distribution_file_path`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_distribution_file_variety`
    - :kbd:`Input:System information:Parameter/ansible_distribution_file_variety`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_distribution_major_version`
    - :kbd:`Input:System information:Parameter/ansible_distribution_major_version`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_distribution_release`
    - :kbd:`Input:System information:Parameter/ansible_distribution_release`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_distribution_version`
    - :kbd:`Input:System information:Parameter/ansible_distribution_version`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_machine`
    - :kbd:`Input:System information:Parameter/ansible_machine`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_memtotal_mb`
    - :kbd:`Input:System information:Parameter/ansible_memtotal_mb`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_nodename`
    - :kbd:`Input:System information:Parameter/ansible_nodename`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_os_family`
    - :kbd:`Input:System information:Parameter/ansible_os_family`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_pkg_mgr`
    - :kbd:`Input:System information:Parameter/ansible_pkg_mgr`
  * - :kbd:`YAML`
    - :kbd:`system`
    - :kbd:`ansible_processor_cores`
    - :kbd:`Input:System information:Parameter/ansible_processor_cores`

| 登録する件数が多いので、ファイル一括登録(Excel)から登録するのを推奨します。

作業対象の登録
--------------

| 作業を行う対象機器を登録します。

機器登録
--------

| 作業対象となるサーバを機器一覧に登録します。

| :menuselection:`Ansible共通 --> 機器一覧` から、作業対象であるサーバーの接続情報を登録します。

.. figure:: /images/learn/quickstart/collection/機器一覧登録設定.gif
   :width: 1200px
   :alt: 機器一覧登録

.. list-table:: 機器一覧の設定値
   :widths: 10 10 15 10 10 10
   :header-rows: 3

   * - HW device type
     - Host name
     - IP address
     - ログインパスワード
     - ssh鍵認証情報
     - Ansible利用情報
   * - 
     - 
     - 
     - ユーザ
     - ssh秘密鍵ファイル
     - Legacy/Role利用情報
   * - 
     - 
     - 
     - 
     - 
     - 認証方式
   * - :kbd:`SV`
     - :kbd:`server01`
     - :kbd:`192.168.0.1 ※適切なIPアドレスを設定`
     - :kbd:`接続ユーザ名`
     - :kbd:`(秘密鍵ファイル)`
     - :kbd:`鍵認証(パスフレーズなし)`

.. tip::
   | 今回のシナリオでは鍵認証で実行しますが、パスワード認証での実行も可能です。
   | 認証方式は、作業対象サーバーへのログインの方法に応じて適宜変更してください。

システム情報収集作業の実施
--------------------------

| まずは、いつ、どこの機器に対して、何を、どうするかといった情報を簡単に整理しておきましょう。

.. list-table:: 作業の方針
   :widths: 10 10
   :header-rows: 0

   * - 作業実施日時
     - 2024/04/01 12:00:00
   * - 作業対象
     - server01(RHEL8)
   * - 作業内容
     - 作業前データ収集


作業概要登録
------------

| オペレーション登録では、作業を実施する際の作業概要を定義します。
| 先に決めた作業の方針を元にオペレーション情報を記入しましょう。

.. glossary:: オペレーション
   実施する作業のことで、オペレーションに対して作業対象とパラメータが紐づきます。

| :menuselection:`基本コンソール --> オペレーション一覧` から、作業実施日時や作業名を登録します。

.. figure:: /images/learn/quickstart/collection/作業前オペレーション登録.png
   :width: 1200px
   :alt: オペレーション登録

.. list-table:: オペレーション登録内容
   :widths: 10 10
   :header-rows: 1

   * - Operation name
     - 実施予定日時
   * - :kbd:`作業前データ収集`
     - :kbd:`2024/04/01 12:00:00`

.. tip::
   | 作業実施日時は、本シナリオでは適当な日時で問題ありませんが、作業日が定まっている場合は、正確な作業実施の予定日時を設定することを推奨します。
   | 定期作業などの繰り返し行われる作業のように、作業日が定まっていない場合は現在の日時を登録しても問題ありません。

Parameter settings
--------------

| 作成したパラメータシートに作業対象ホストとオペレーションを登録します。

| :menuselection:`Input --> Host name link` から、作業対象ホストとオペレーションとパラメータを登録します。

.. figure:: /images/learn/quickstart/collection/作業前パラメータ入力.png
   :width: 1200px
   :alt: 作業前のパラメータ登録

.. list-table:: 作業前システム情報の設定値
  :widths: 5 15 5
  :header-rows: 2

  * - Host name
    - オペレーション
    - パラメータ
  * - 
    - オペレーション名
    - hostname
  * - :kbd:`server01`
    - :kbd:`2024/04/01 12:00:00_作業前データ収集`
    - :kbd:`server01`

作業実行
--------

1. 作業実行

   | :menuselection:`Ansible-Legacy --> 作業実行` から、:kbd:`System information collection` Movement を選択し、:guilabel:` 作業実行` を押下します。
   | 次に、:menuselection:`作業実行設定` で、オペレーションに :kbd:`作業前データ収集` を選択し、:guilabel:`作業実行` を押下します。

   | :menuselection:`作業状態確認` 画面が開き、実行が完了した後に、ステータスが「完了」になったことを確認します。

.. figure:: /images/learn/quickstart/collection/変更前収集作業実行.png
   :width: 1200px
   :alt: 作業実行

2. 事後確認

   | :menuselection:`Input --> システム情報` から、パラメータの入力情報を確認しましょう。
   | パラメータシート作成・定義で作成した、システム情報のパラメータが問題なく入力されているか確認しましょう。
   | また、この後の比較作業で実施日時を入力する必要があるので、:menuselection:`基本コンソール --> オペレーション一覧` から、実施した日付を確認しておきましょう。

ホスト名変更
============

| それでは次に、今収集したシステム情報の1部を変更してみましょう。
| 今回は簡単なホスト名(ansible_nodename)の変更をしてみましょう。ホスト名の変更については :doc:`クイックスタート <../quickstart/index>` を参照して任意のホスト名に変更しましょう。今回のシナリオではシステムのホスト名を admin_user に変更してこれ以降の作業を実施していきます。

作業後システム情報の収集
========================

| それではホスト名を変更した後(作業後)のシステム情報を収集していきましょう。
| 作業前とホスト名に変更が出ていますので、新しくオペレーションを作成し、新しいオペレーションと紐付いたパラメータを作成しましょう。

作業概要登録
------------

| :menuselection:`基本コンソール --> オペレーション一覧` から、作業実施日時や作業名を登録します。

.. figure:: /images/learn/quickstart/collection/作業後オペレーション登録.png
   :width: 1200px
   :alt: オペレーション登録

.. list-table:: オペレーション登録内容
   :widths: 15 10
   :header-rows: 1

   * - オペレーション名
     - 実施予定日時
   * - :kbd:`作業後データ収集`
     - :kbd:`2024/05/01 12:00:00`

パラメータ設定
--------------

| :menuselection:`Input --> Host name link` から、作業対象ホストとオペレーションとパラメータを登録します。

.. figure:: /images/learn/quickstart/collection/作業後パラメータ入力.png
   :width: 1200px
   :alt: 作業後のパラメータ登録

.. list-table:: 作業後システム情報の設定値
  :widths: 5 15 5
  :header-rows: 2

  * - Host name
    - オペレーション
    - パラメータ
  * - 
    - オペレーション名
    - hostname
  * - :kbd:`admin_user`
    - :kbd:`2024/05/01 12:00:00_作業後データ収集`
    - :kbd:`admin_user`

作業実行
--------

1. 作業実行

   | :menuselection:`Ansible-Legacy --> 作業実行` から、:kbd:`System information collection` Movement を選択し、:guilabel:` 作業実行` を押下します。
   | 次に、:menuselection:`作業実行設定` で、オペレーションに :kbd:`作業後データ収集` を選択し、:guilabel:`作業実行` を押下します。

   | :menuselection:`作業状態確認` 画面が開き、実行が完了した後に、ステータスが「完了」になったことを確認します。

.. figure:: /images/learn/quickstart/collection/変更後収集作業実行.png
   :width: 1200px
   :alt: 作業実行

2. 事後確認

   | :menuselection:`Input --> システム情報` から、パラメータの入力情報を確認しましょう。
   | パラメータシート作成・定義で作成した、システム情報のパラメータが問題なく入力されているか確認しましょう。
   | 問題なくシステム情報が収集出来ていれば、ホスト名変更前と変更後の2つのパラメータが入力されています。
   | また、この後の比較作業で実施日時を入力する必要があるので、:menuselection:`基本コンソール --> オペレーション一覧` から、実施した日付を確認しておきましょう。

システム情報の比較
==================

| それでは次に比較機能を使って、ホスト名変更前と変更後の収集データを比較して、結果にどのような差異が出ているのかを見てみましょう。

比較設定
--------

| パラメータの比較をする為に、まずは比較設定をしていきましょう。
| :menuselection:`比較 --> 比較設定` から、比較対象のパラメータを選択しましょう。

.. figure:: /images/learn/quickstart/collection/比較設定.png
   :width: 1200px
   :alt: 比較設定

.. list-table:: 比較設定
  :widths: 5 10 10 5 5 
  :header-rows: 1

  * - 比較名称
    - 対象パラメータシート1
    - 対象パラメータシート2
    - 詳細設定フラグ
    - 備考
  * - :kbd:`システム情報の差異`
    - :kbd:`System information`
    - :kbd:`System information`
    - :kbd:`False`
    - 

| 詳細設定フラグを設定すると、比較詳細設定を設定出来るようになります。
| 特定のパラメータのみ確認したい場合は詳細設定フラグをTrueにすると、特定のパラメータのみ比較出来るようになります。

比較実行
--------

| それでは比較機能を実行していきましょう。
| :menuselection:`比較 --> 比較実行` から、比較対象のパラメータを選択しましょう。

   | :menuselection:`比較実行 --> 比較設定選択` から、:kbd:`システム情報の差異` 比較設定 を選択し、次に :guilabel:` 対象ホスト` を選択し対象のホストを選択します。
   | 次に、比較対象のパラメータシートを実施した日時をそれぞれ入力、選択します。実施した日時は :menuselection:`Input --> システム情報` から最終実行日時を確認してみてください。 
   | 最後に、:menuselection:`比較実行` を押下します。

   | そうすると画面右側に比較結果が表示されますので、そちらから先ほど変更したホスト名(ansible_nodename)の欄を確認してみましょう。すると、変更前に収集したパラメータと変更後に収集したパラメータの差異が出ているのが確認できると思います。

.. figure:: /images/learn/quickstart/collection/比較実行.png
   :width: 1200px
   :alt: 比較設定1

.. figure:: /images/learn/quickstart/collection/比較実行2.png
   :width: 1200px
   :alt: 比較設定2

.. list-table:: 比較実行
  :widths: 10 10 10 10
  :header-rows: 1

  * - 比較設定選択
    - ホスト選択
    - 基準日時1
    - 基準日時2
  * - :kbd:`システム情報の差異`
    - :kbd:`admin_user`
    - :kbd:`※例→2024/08/23 15:24:09`
    - :kbd:`※例→2024/08/23 15:31:39`

.. tip::
   | 基準日時は実際の最終更新日時を入力してください。

まとめ
======

| 本シナリオでは、システム情報を変更する前と後のデータを収集し、それらの収集してきたデータを比較するというシナリオで収集比較機能を学習しました。
| 収集機能を使うと、対象サーバのシステム情報を収集することができ、比較機能を使うと、パラメータシートで作成した項目の設定値の比較を行うことが出来ます。
| 比較機能を上手く使うと、パラメータシートの項目の設定値を簡単に管理することが出来ます。
| より詳細な情報を知りたい場合は、:doc:`../../../manuals/index` を参照してください。