
概要
~~~~
| 変数名に対して具体値を複数定義できる変数です。

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
       - root        
       - mysql       

誤った記述例
************
| 通常変数の :ref:`wrong_description_example` を参照してください。


