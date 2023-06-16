
概要
~~~~
| :menuselection:`ファイル管理` メニューから登録された変数です。
| ITAWebUI上のファイル管理メニューでファイル埋込変数を登録する際、ファイル埋込変数名の接頭文字をCPF_とし、CPF_を含め255Byte以内とする。

playbookにおける表記
~~~~~~~~~~~~~~~~~~~~
書式
****
| 変数を使用する際、playbook内の変数を以下とする。
| ※ユーザ定義範囲の記載ルールはAnsibleルールに準ずる

.. code-block:: yaml

   {{ CPF_xxx }}
   #xxx: 半角英数字とアンダースコア（ _ ）


正しい記述例
************

.. code-block:: yaml         
                             
   - name: ファイル内容確認
     copy: src={{ CPF_SAMPLE }} dest=/tmp/SAMPLE.txt


誤った記述例
************

- | "{{"または"}}" と変数名の間に「半角スペース」がない

.. code-block:: yaml
   
   copy: src={{CPF_SAMPLE }} dest=/tmp/SAMPLE.txt
   copy: src={{ CPF_SAMPLE}} dest=/tmp/SAMPLE.txt


- | "{{"または"}}" と変数名の間の「半角スペース」が2個以上ある

.. code-block:: yaml


   copy: src={{   CPF_SAMPLE }} dest=/tmp/SAMPLE.txt

- | 接頭文字(CPF\_)が小文字になっている

.. code-block:: yaml


   copy: src={{ cpf_SAMPLE }} dest=/tmp/SAMPLE.txt

- | 接頭文字(CPF\_)の「_」がない

.. code-block:: yaml

   
   copy: src={{ CPFSAMPLE }} dest=/tmp/SAMPLE.txt

- | 変数名が129文字以上ある

| ルールに準拠しない記述をした場合、:menuselection:`ファイル管理` 機能に下記の影響を及ぼします。

- | 作業実行時にファイル埋込変数の置換が行われないためエラーとなります。

-  | エラーの例(実行ログ)
   | :command:`Template embedded variable is not registered in the template list. (Role:roles/echo PlayBook:roles/echo/tasks/main.yml line:3 Template embedded variable:TPF_aa)`

