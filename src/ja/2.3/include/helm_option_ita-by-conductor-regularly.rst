
.. list-table:: ita-by-conductor-regularly における Values 一覧
   :widths: 25 25 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - パラメータ
     - 説明
     - 変更
     - デフォルト値・選択可能な設定値
   * - exastro-it-automation.ita-by-conductor-regularly.replicaCount
     - Pod のレプリカ数
     - 不可
     - 1
   * - exastro-it-automation.ita-by-conductor-regularly.extraEnv.EXECUTE_INTERVAL
     - 処理終了後から次回実行時までの待機時間
     - 不可
     - 10
   * - exastro-it-automation.ita-by-conductor-regularly.extraEnv.PLATFORM_API_HOST
     - Exastro 共通基盤で公開する内部の API エンドポイントで利用するホスト名
     - 不可
     - "platform-api"
   * - exastro-it-automation.ita-by-conductor-regularly.extraEnv.PLATFORM_API_PORT
     - Exastro 共通基盤で公開する内部の API エンドポイントで利用するポート番号(TCP)
     - 不可
     - "8000"
   * - exastro-it-automation.ita-by-conductor-regularly.image.repository
     - コンテナイメージのリポジトリ名
     - 不可
     - docker.io/exastro/exastro-it-automation-by-conductor-regularly
   * - exastro-it-automation.ita-by-conductor-regularly.image.tag
     - コンテナイメージのタグ
     - 不可
     - ""
   * - exastro-it-automation.ita-by-conductor-regularly.image.pullPolicy
     - イメージプルポリシー
     - 可
     - | :program:`IfNotPresent` (デフォルト): コンテナイメージが存在しない場合のみプル
       | :program:`Always`: 毎回必ずプル
       | :program:`None`: プルしない
