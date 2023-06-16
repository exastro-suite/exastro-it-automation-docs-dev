
| 本章ではAnsible、Ansible Automation ControllerおよびAnsible driverについて説明します。

Ansible Coreについて
--------------------

| Ansible Coreとは、多数の構築管理対象に対して、アプリーケーション/システムのデプロイ作業を容易にするPF構築自動化ツールです。
| Ansible Coreは、PlaybookというYAML形式のテキストファイルに定型処理をタスクとして記述し、それをAnsible Coreに実行させることにより、さまざまな処理を実現できます。
| タスクはモジュールと呼ばれる処理プログラムと紐付いており、さまざまな機器に対する制御を行うことができます。
| Ansible Coreの詳細情報については、Ansible Coreのマニュアルを参照してください。

Ansible Automation Controllerについて
-------------------------------------

| Ansible Automation Controllerとは、PF構築自動化ツールであるAnsibleにアクセスコントロール、ジョブスケジューリング、タスクの可視化などの機能を拡張した管理プラットフォームです。
| “プロジェクト”、”インベントリ”、”認証情報”の組合せで”ジョブテンプレート”を作成しAnsibleを実行できます。
| 複数の“ジョブテンプレート”を組み合せて”ワークフロージョブテンプレート”を作成することによって、より多彩な作業フローを表現することができます。
| Ansible Automation Controllerの詳細情報については、Ansible Automation Controllerのマニュアルを参照してください。
| ITAで対応可能なAnsible Automation Controllerのバージョンは、 :doc:`../../configuration/ansible/ansible_automation_platform` を参照してください。
| 最新のバージョンに対応した記法は使えないことがありますので、ご注意ください。


Ansible driverについて
----------------------

| Ansible driverは、ITAシステムのオプションとして機能し、ITAシステムで登録した構築対象のサーバ・ストレージ・ネットワーク各機器に対し、Ansible Core、Ansible Automation Controllerのどちらを経由するかを選択し、実際の運用設定を自動的に行います。

.. image:: /images/ja/diagram/overview.png
   :width: 6.68819in
   :height: 3.35972in
   :alt: Exastro概要


