=======================
Ansible Execution Agent
=======================


はじめに
========

| 本書は、Ansible Execution Agentを構築するにあたっての要件などについて説明します。
| Ansible Execution Agentとは、Exastro IT Automation （以下、ITAとも記載する）で実行する、「Ansible-Legacy」、「Ansible-Pioneer」、「Ansible-LegacyRole」の作業実行を、PULL型で行うためのエージェント機能を提供します。


特徴
====

| Ansible Execution Agentの特徴として以下のものがあります。

- ITA本体との通信は、http/httpsの、クローズド環境からアウトバウンドのみ（PULL型）
- Ansible BuilderとAnsible Runnerを使った動的なAnsible作業実行環境の生成 ​（任意の環境・モジュールを利用可能）
- 冗長可能な仕組み（排他制御）
- エージェントのバージョン確認

.. _ansible_execution_agent_system_requirements:

システム要件
============

| 後述する以下の各種要件を満たしていること

- :ref:`ansible_execution_agent_hardware_requirements`
- :ref:`ansible_execution_agent_os_requirements`
- :ref:`ansible_execution_agent_oftware_requirements`
- :ref:`ansible_execution_agent_communication_requirements`
- :ref:`ansible_execution_agent_other_requirements`

.. _ansible_execution_agent_hardware_requirements:

ハードウェア要件
----------------

- 動作確認済み構成

.. list-table:: 動作確認済み最小構成
   :header-rows: 1
   :align: left

   * - リソース種別
     - 要求リソース
   * - CPU
     - 2 Cores (3.0 GHz, x86_64)
   * - Memory
     - 6GB
   * - Storage
     - 40GB

.. list-table:: 動作確認済み推奨構成
   :header-rows: 1
   :align: left

   * - リソース種別
     - 要求リソース
   * - CPU
     - 4 Cores (3.0 GHz, x86_64)
   * - Memory
     - 8GB
   * - Storage
     - 80GB

.. warning::
  | ※ディスク容量は、エージェントサービスの件数や、作業実行結果の削除設定、ビルドするimageサイズに依存するため、
  | 必要に応じて、サイジング、及びメンテナンス（Docker Image や Build Cache等について）を実行してください。

.. _ansible_execution_agent_communication_requirements:

通信要件
--------

| エージェントサーバから、外部NWへの通信が可能である必要があります。

- 接続先のITA
- 各種インストール、及びモジュール、BaseImage取得先等（インターネットへの接続を含む）
- 作業対象サーバ


.. figure:: /images/ja/configuration/ansible/ansible_execution_agent_communication_requirements.drawio.png
   :alt: Ansible Execution Agent 通信要件
   :align: center

.. _ansible_execution_agent_os_requirements:

OS要件
------

| 動作確認済みのOSは以下です。

.. list-table:: 動作確認済みOS
   :header-rows: 1
   :align: left

   * - OS種別
     - バージョン
   * - RHEL9
     - Red Hat Enterprise Linux release 9.4 (Plow)
   * - Almalinux8
     - AlmaLinux release 8.9 (Midnight Oncilla)

| なお、動作確認済みのOSにおいても以下の設定が必要となります。

- | SELinuxがPermissiveに変更されていること。

.. code-block:: bash

    $ sudo vi /etc/selinux/config
    SELINUX=Permissive

.. code-block:: bash

    $ getenforce
    Permissive

.. _ansible_execution_agent_oftware_requirements:

ソフトウェア要件
----------------

- Python3.9以上がインストールされており、python3コマンドとpip3コマンドにエイリアスが紐づいていること
- インストールを実行するユーザで、以下のコマンドが実行できること

.. code-block:: bash

    $ sudo

.. code-block::

    $ python3 -V
    Python 3.9.18

    $ pip3 -V
    pip 21.2.3 from /usr/lib/python3.9/site-packages/pip (python 3.9)

.. _ansible_execution_agent_other_requirements:

その他の要件
------------

.. _ansible_execution_agent_rhel_support_requirements:

RHEL(サポート付きライセンス利用の場合)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| 有償版のAnsible-builder、Ansible-runnerを利用する場合、サブスクリプションの登録、リポジトリ有効化は、インストーラ実行前に実施しておいてください。

- Red Hat コンテナーレジストリーの認証

  .. code-block:: bash

      podman login registry.redhat.io

- 利用するリポジトリ

  .. code-block:: bash

      rhel-9-for-x86_64-baseos-rpms
      rhel-9-for-x86_64-appstream-rpms
      ansible-automation-platform-2.5-for-rhel-9-x86_64-rpms

- 有効化されているリポジトリの確認、リポジトリの有効化

  .. code-block:: bash

      sudo subscription-manager repos --list-enabled
      sudo subscription-manager repos --enable=rhel-9-for-x86_64-baseos-rpms
      sudo subscription-manager repos --enable=rhel-9-for-x86_64-appstream-rpms
      sudo subscription-manager repos --enable=ansible-automation-platform-2.5-for-rhel-9-x86_64-rpms


.. _ansible_execution_agent_base_images:

Ansible builderで使用する動作確認済みのベースイメージ
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
- 動作確認済みビルドのベースイメージ

.. list-table:: 動作確認済みビルドのベースイメージ
   :header-rows: 1
   :align: left

   * - ベースイメージ種別
     - イメージ取得先
     - 備考
   * - ubi9
     - registry.access.redhat.com/ubi9/ubi-init:latest
     -
   * - rhel9
     - registry.redhat.io/ansible-automation-platform-24/ee-supported-rhel9:latest
     - サポート付きライセンス利用の場合

