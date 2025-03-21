=========
OASE共通
=========

はじめに
========
| 本書では、OASE（Operation Autonomy Support Engine）の概要について説明します。

.. _oase_common:

機能の概要
===========
| OASEとは、外部から取得したイベント情報を分析し、そのイベントへの対処の自動化を支援する機能です。


.. figure:: /images/ja/oase/oase_common/oase_overview_v2-3.png
   :width: 800px
   :alt: OASE機能概要

| OASEの機能フローは以下の通りです。
| 用語の解説は次項に記載してあります。

#. | **イベント収集**
   | 外部サービスからイベントを収集します。
   | イベントはExastro OASE Agentによって収集され、APIを通してITA本体に送信されます。
   | Exastro OASE Agentの詳細は :ref:`agent_about` を参照してください。

#. | **ラベル付与**
   | ITAで受信したイベントに対して、設定されたラベルを付けます。
   | 様々な異なるアプリケーションからのイベントの情報を、OASE内で均質化して扱うことが目的です。
   | ラベル付与に関する設定の詳細は :ref:`label_creation` および :ref:`labeling` を参照してください。

#. | **評価**
   | 付与されたラベルを用いて、イベントを抽出（フィルター）し、設定されたルールにマッチするかどうかの判定を行います。
   | ルール判定に関する設定の詳細は :ref:`filter` および :ref:`rule` を参照してください。

#. | **アクション実行・通知**
   | ルールにマッチした際に、設定したアクション（ConductorとOperationの設定）を実行することができます。
   | また、アクションが実行される前後の通知もルールメニューにて設定することができます。
   | アクション設定の詳細は :ref:`action` を参照してください。
   

.. _oase_definition of terms:

用語の定義
===========

| 本書では以下として記載します。

.. list-table:: 用語説明
   :widths: 1 5
   :header-rows: 1
   :align: left

   * - 用語名
     - 内容
   * - イベント
     - 設定された対象（監視ソフト）から取得してきた、システムの状態変化（の発生情報）のことです。※
   * - TTL（Time To Live）
     - | エージェントが取得したイベントが、ルールの評価対象として扱われる期間（秒）のことで、次の2つの目的で利用されます。
       | ▼最もユーザーの意図に近い判断を選択
       | あるイベントが発生し、そのイベントが複数のルールの条件として定義されている場合、Exastro OASEは優先度の高いルールが適用されるように動作しようとします。
       | 一方で、完全な条件が揃うまでOASEはイベントの発生を待ち、最終的な判断はイベントの発生日時からTTLで指定した期間を経過したタイミングまでに行われます。
       | ▼古すぎるイベントによる意図しないアクション実行の防止
       | 発生からTTLの2倍以上の期間が経過したイベントは、ユーザーが意図しないイベントである可能性があるため、即座に「時間切れ」ステータスになり、ルールの評価対象から除外します。
       | 最小値は1（秒）、最大値は2137483647（秒）です。
   * - ラベル
     - | ラベル作成・ラベル付与の設定を基に、OASE内部で利用しやすい形（key&value形式）で付与された、イベントのプロパティのことです。
       | ラベルによって、異なるアプリケーションからのイベントを均質化した情報として扱うことが可能です。
   * - フィルター
     - ラベルの条件から一意のイベントを抽出すること、もしくはその対象です。ルール判定機能へイベントを渡すために使用します。
   * - ルール
     - 任意のアクションを実行したり、結論イベントを生成したりするための条件で、フィルターを組み合わせることによって作成します。
   * - アクション
     - 定義されたルールにマッチした場合に実行される対象です。
   * - 評価
     - 任意に設定したルールに従って、マッチした場合はアクションや結論イベントの生成を行うなど、発生したイベントへ対処を行うことを指します。
   * - 結論イベント
     - ルールにマッチした際に、発生するイベントのことです。

| ※イベント種別については、以下の通りです。

.. list-table:: イベント種別
   :widths: 1 5
   :header-rows: 1
   :align: left

   * - 種類
     - 内容
   * - 新規
     - | 収集して未だ評価機能に検知されていない状態のことです。
       | 判定時間が過ぎると、既知（判定済み）、未知、時間切れのいずれかに変化します。
   * - 既知
     - 評価機能に検知された状態もしくは対象のことです。
   * - 既知（判定済み）
     - ルールにマッチした状態もしくは対象のことです。
   * - 時間切れ
     - | 下記のいずれかの理由により、ルールの評価対象から外した対象のことです。
       | ・TTLの2倍以上の期間が経過して、評価対象とするには古すぎる
       | ・TTLを経過した直後の評価タイミング（ルールにマッチさせる最終タイミング）までに、マッチさせることが出来なかった
   * - 未知
     - | フィルターに抽出されなかった（評価機能に検知されなかった）状態もしくは対象のことです。
       | 未知の事象であることから、今後の評価対象として検討する必要が考えられます。




