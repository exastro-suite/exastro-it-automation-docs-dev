============================
OASE Agent on Docker Compose
============================

はじめに
========

| OASEを利用するための絶対条件である Exastro OASE Agent を、評価や一時的な利用など、簡単に利用を開始したい場合の構成方法となります。
| 高い可用性やサービスレベルのシステム構築を実現したい場合は、 :doc:`Kubernetes 版 OASE Agent<kubernetes>` の利用を推奨します。


システム要件
============

| 動作確認が取れているコンテナ環境の最小要求リソースとバージョンは下記のとおりです。


サーバー要件
------------

.. list-table:: ハードウェア要件(最小構成)
 :widths: 1, 1
 :header-rows: 1

 * - リソース種別
   - 要求リソース
 * - CPU
   - 2 Cores (3.0 GHz, x86_64)
 * - Memory
   - 4GB
 * - Storage (Container image size)
   - 10GB

.. warning::
    | Exastro IT Automation と同じ サーバーに構築する場合、OASE Agentに対応する最小要件を追加で用意する必要があります。


オペレーティングシステム
------------------------

| 以下は、動作確認済のバージョンとなります。

.. list-table:: オペレーティングシステム
 :widths: 20, 20
 :header-rows: 1

 * - 種別
   - バージョン
 * - Red Hat Enterprise Linux
   - バージョン	8
 * - AlmaLinux
   - バージョン	8
 * - Ubuntu
   - バージョン	22.04

コンテナプラットフォーム
------------------------

| 以下は、動作確認済のバージョンとなります。

.. list-table:: コンテナプラットフォーム
 :widths: 20, 10
 :header-rows: 1

 * - ソフトウェア
   - バージョン
 * - Podman Engine ※Podman 利用時
   - バージョン	4.4
 * - Docker Compose ※Podman 利用時
   - バージョン	2.20
 * - Docker Engine ※Docker 利用時
   - バージョン	24


通信要件
--------

| OASE Agentから収集対象サーバ および Exastro IT Automation にアクセスできる必要があります。

