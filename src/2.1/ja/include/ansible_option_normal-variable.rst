
概要
~~~~

| 変数名に対して具体値を1つ定義できる変数です。

playbookにおける表記
~~~~~~~~~~~~~~~~~~~~

書式
****

| 変数を使用する際、playbook内の変数を以下とする。
| ※ユーザ定義範囲の記載ルールはAnsibleルールに準ずる

.. code-block:: yaml

   {{ VAR_xxx }}
   #xxx: 半角英数字とアンダースコア（ _ ）

正しい記述例
************
.. code-block:: yaml

   VAR_users: root

.. code-block:: yaml

   - name: ファイル内容確認
     command: cat /tmp/{{ VAR_SAMPLE }}


.. _wrong_description_example:

誤った記述例
************

-  | "{{"または"}}" と変数名の間に「半角スペース」がない

.. code-block:: yaml
     
   command: cat /tmp/{{VAR_SAMPLE }}
   command: cat /tmp/{{ VAR_SAMPLE}}



-  | "{{"または"}}" と変数名の間の「半角スペース」が2個以上ある



.. code-block:: yaml
     
   command: cat /tmp/{{  VAR_SAMPLE }}
   command: cat /tmp/{{ VAR_SAMPLE  }}
..
   -  | 接頭文字(VAR\_)が小文字になっている
    
   .. code-block:: yaml
   
      command: cat /tmp/{{ var_SAMPLE }}


   -  | 接頭文字(VAR\_)の「_」がない

   .. code-block:: yaml
   
      command: cat /tmp/{{ VARSAMPLE }}


-  | 変数名が129文字以上ある

| ルールに準拠しない記述をした場合、:menuselection:`代入値自動登録` 機能に下記の影響を及ぼします。

-  | 登録の場合
   | Movementを選択しても変数名に候補として表示しません。
   | 作業実行時に変数未定義のエラーとなります。

-  | 更新の場合 (代入値管理登録後にITA追加ルール外の記載のplaybookに更新した場合)
   | 変数名に「ID変換失敗(n)」(※nは登録時の管理番号)と表示します。
   | 作業実行時に変数未定義のエラーとなります。

-  | エラーの例(実行ログ)
   | :command:`"msg": "The task includes an option with an undefined variable. The error was: 'VAR_PAUSE_time' is undefined`


