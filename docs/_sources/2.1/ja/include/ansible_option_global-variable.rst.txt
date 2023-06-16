
概要
~~~~
| :menuselection:`グローバル変数` メニューから登録された変数です。
| ITAWebUI上のグローバル変数管理メニューでグローバル変数を登録する際、
| グローバル変数名の接頭文字をGBL_とし、GBL_を含め255Byte以内とする。

playbookにおける表記
~~~~~~~~~~~~~~~~~~~~
書式
****
| 変数を使用する際、playbook内の変数を以下とする。
| ※ユーザ定義範囲の記載ルールはAnsibleルールに準ずる

.. code-block:: yaml

   {{ GBL_xxx }}
   #xxx: 半角英数字とアンダースコア（ _ ）

正しい記述例
************

.. code-block:: yaml         
                             
   - name: ファイル内容確認
     command: cat /tmp/{{ GBL_SAMPLE }}


誤った記述例
************

- | 接頭文字(GBL\_)が小文字になっている

.. code-block:: yaml
   
   command: cat /tmp/{{ gbl_SAMPLE }}

- | 接頭文字(GBL\_)の「_」がない

.. code-block:: yaml

   command: cat /tmp/{{ GBLSAMPLE }}

- | 変数名が129文字以上ある

| ルールに準拠しない記述をした場合、:menuselection:`グローバル変数管理` 機能に下記の影響を及ぼします。

- | 作業実行時にグローバル変数の置換が行われないためエラーとなります。

-  | エラーの例(実行ログ)
   | :command:`"msg": "'gbl_wait_for_delay' is undefined"`

