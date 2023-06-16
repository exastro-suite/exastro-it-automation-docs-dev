
概要
~~~~
| :menuselection:`テンプレート管理` メニューから登録された変数です。
| ITAWebUI上のテンプレート管理メニューでテンプレート素材を登録をする際、
| テンプレート埋込変数名の接頭文字をTPF_とし、TPF_を含め255Byte以内とする。

playbookにおける表記
~~~~~~~~~~~~~~~~~~~~
書式
****
| 変数を使用する際、playbook内の変数を以下とする。
| ※ユーザ定義範囲の記載ルールはAnsibleルールに準ずる

.. code-block:: yaml

   {{ TPF_xxx }}
   #xxx: 半角英数字とアンダースコア（ _ ）

正しい記述例
************
.. code-block:: yaml         
                             
   - name: ファイル内容確認
     template: src={{ TPF_SAMPLE }} dest=/tmp/SAMPLE.txt

誤った記述例
************

- | "{{"または"}}" と変数名の間に「半角スペース」がない

.. code-block:: yaml
   

   template: src={{TPF_SAMPLE }} dest=/tmp/SAMPLE.txt
   template: src={{ TPF_SAMPLE}} dest=/tmp/SAMPLE.txt

- | "{{"または"}}" と変数名の間の「半角スペース」が2個以上ある

.. code-block:: yaml

   template: src={{   TPF_SAMPLE }} dest=/tmp/SAMPLE.txt

- | 接頭文字(TPF\_)が小文字になっている

.. code-block:: yaml

   template: src={{ tpf_SAMPLE }} dest=/tmp/SAMPLE.txt

- | 接頭文字(TPF\_)の「_」がない

.. code-block:: yaml
   
   template: src={{ TPFSAMPLE }} dest=/tmp/SAMPLE.txt

- | 変数名が129文字以上ある

| ルールに準拠しない記述をした場合、:menuselection:`テンプレート管理` 機能に下記の影響を及ぼします。

- | 登録したテンプレート素材への置換が行われません。

-  | エラーの例(実行ログ)
   | :command:`"msg": "'TPFSAMPLE' is undefined"`

