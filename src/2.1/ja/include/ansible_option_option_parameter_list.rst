
| インターフェース情報とMovement一覧のオプションパラメータについて説明します。
| ITAでは、以下の順番でansible-playbookのオプションパラメータを設定するので、単一の値しか許容していないパラメータを複数定義した場合、Movement一覧=>オプションパラメータのパラメータが有効になります。

- | Ansible共通=>インターフェース情報=>オプションパラメータ
- | Movement一覧=>オプションパラメータ

| ▼実行エンジンがAnsible Coreの場合
| 　　実行エンジンがAnsible Coreの場合、ansible-playbookコマンドのオプションパラメータを入力します。
| 　　ansible-playbookコマンドのオプションパラメータの仕様については、以下のコマンドを実行して表示されたヘルプを参照してください。

.. code-block:: none

   ansible-playbook -h

|
| ▼実行エンジンがAnsible Core以外の場合
| 　　以下の表は実行エンジンがAnsible Core以外の場合に、指定可能なオプションパラメータです。
|

.. list-table:: 実行エンジンがAnsible Core以外の場合に指定可能なオプションパラメータ一覧
   :widths: 20 30 50 20
   :header-rows: 1
   :align: left

   * - オプションパラメータ   
     - 指定方法
     - Ansible Automation Controllerの設定箇所
     - 備考
   * - | -v
       | --verbose 
     - | -v
       | -vv
       | -vvv
       | -vvvv
       | -vvvvv
       | --verbose 
     - テンプレート 画面の[詳細]に指定した vの数を設定
     - | ・vの合計値を適用 
       | ・--verboseは、-vと同様
       | 例：--verbose -vvv の場合、-vvvvと同様
       | ・vを6以上指定した場合 、vは5の指定となる
   * - | -f
       | --forks
     - | -f FORKS
       | --forks=FORKS
     - テンプレートの[フォーク]に指定したFORKSが設定される
     - | ・FORKSには数値を指定
       | ・複数定義した場合、最後に定義したパラメータが有効
       | 例：-f 1-forks=10の場合、--forks=10が有効となる
       | ・数値以外が指定された場合、エラーとなる
   * - | -l
       | --limit
     - | -l SUBSET
       | --limit=SUBSET
     - テンプレートの[制限]に指定したSUBMITが設定される
     - | ・SUBSET:機器一覧にあるホスト名
       | ・複数定義した場合、最後に定義したパラメータが有効
   * - | -e
       | --extra-vars
     - | -e EXTRA_VARS
       | --extra-vars=EXTRA_VARS
     - テンプレートの[追加変数]に変数名:具体値の形式で設定される
     - | ・EXTRA_VARS:変数名、具体値をjson形式またはyaml形式
       | 例：json形式の場合 -extra-vars={"VAR_1":"directory","VAR_2":"0755"}
       | yaml形式の場合 -extra-vars=VAR_1:directory\nVAR_2:0755
       | ・複数定義した場合、最後に定義したパラメータが有効
   * - | -t
       | --tags
     - | -t TAGS
       | --tags=TAGS
     - テンプレートの[ジョブタグ]に設定したTAGSが設定される
     - | ・TAGS:タグ名
       | ・複数個のパラメータを許容
   * - | -b
       | --become
     - | -b
       | --become
     - テンプレートのオプション[権限昇格の有効化]がチェックされる
     - ・少なくとも1つ指定すればパラメータが有効
   * - | -D
       | --diff
     - | -D
       | --diff
     - テンプレートの[変更]の表示が有効化される
     - ・少なくとも1つ指定すればパラメータが有効
   * - --skip-tags
     - --skip-tags=SKIP_TAGS
     - テンプレートの[スキップタグ]に設定したSKIP_TAGSが設定される
     - | ・SKIP_TAGS:スキップタグ名
       | ・複数個のパラメータを許容
   * - --st art-at-task
     - --start-at-task=START_AT_TASK
     - ※Ansible Automation ControllerのWebUI には--start-at-taskの表示はない。
     - ・複数定義した場合、最後に定義したパラメータが有効
   * - | -ufc
       | --use _fact_cache
     - | -ufc
       | --use_fact_cache
     - テンプレートのオプション[ファクトキャッシュの有効化]がチェックされる
     - ・少なくとも1つ指定すればパラメータが有効
   * - | -as
       | --allow_simultaneous
     - | -as
       | --allow_simultaneous
     - テンプレートのオプション[同時実行ジョブの有効化]がチェックされる
     - ・少なくとも1つ指定すればパラメータが有効
   * - | -jsc
       | --jobslice_count
     - | -jscジョブスライス数
       | --job_slice_count=ジョブスライス数
     - テンプレートの[ジョブスライス数]に指定したジョブスライス数が設定される
     - | ・ジョブスライス数には数値を指定
       | ・複数定義した場合、最後に定義したパラメータが有効



| ※Ansible Automation Controllerのオプションパラメータの仕様については、Ansible Automation Controllerユーザーガイドのジョブテンプレートの説明を参照してください。

