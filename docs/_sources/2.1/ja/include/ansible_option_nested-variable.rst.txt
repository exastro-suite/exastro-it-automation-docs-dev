
概要
~~~~
| 階層化された変数です。

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
                             
   VAR_users:                
       - user-name: alice    
         authorized: password  


| メンバー変数名は、下記の7文字を除くascii文字(0x20～0x7e)が使用出来ます。      
| " . [ ] ' \\ :                    
| 尚、コーテーションで囲ないと変数名の先頭に使用出来ない文字がいくつかあります。\     
| 詳しくは、Ansibleドキュメント `Yaml syntax <https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html>`_ を参照してください。       

誤った記述例
************

| 通常変数の :ref:`wrong_description_example` を参照してください。

