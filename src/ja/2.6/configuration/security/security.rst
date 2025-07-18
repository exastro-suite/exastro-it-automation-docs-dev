============
セキュリティ
============

はじめに
--------

| Exastroシステムのみでは対策できないセキュリティ脅威については、別途対策が必要となります。
| 本説明は、システム管理者が行うべきセキュリティ対策の方針について記載します。


セキュリティ対策方針
--------------------

| 以下のセキュリティ対策を必要に応じて導入してください。

.. table:: セキュリティ脅威に対するユーザーの対策一覧
   :widths: 10 10 10 25
   :align: left

   +---------------------+----------------------------------------+----------------------------------------+------------------------------------------------------------------------------------+
   | カテゴリー          | セキュリティ脅威                       | 対策区分                               | 対策方針                                                                           |
   +=====================+========================================+========================================+====================================================================================+
   | 不正アクセス        | ブルートフォース攻撃、辞書攻撃、\      | 不正監視・追跡認証方式                 | オーガナイゼーション毎の                                                           |
   |                     | レインボー攻撃、パスワードリスト攻撃 \ |                                        | :doc:`パスワードポリシー<../../manuals/organization_management/password_policy>` \ |
   |                     | など                                   |                                        | の適用。\                                                                          |
   |                     |                                        |                                        |                                                                                    |
   |                     |                                        |                                        | Keycloakでのアカウント設定による対策。\                                            |
   |                     |                                        |                                        |                                                                                    |
   |                     |                                        |                                        | :ref:`security_audit_log_get` による不正アクセスの特定。                           |
   +---------------------+----------------------------------------+----------------------------------------+------------------------------------------------------------------------------------+
   | なりすまし          | ソーシャルエンジニアリング、\          | 個人情報利用                           | オーガナイゼーション毎の \                                                         |
   |                     | リプレイ攻撃 など                      |                                        | :doc:`二要素認証設定<../../manuals/platform_management/general>` \                 |
   |                     +----------------------------------------+----------------------------------------+ の適用。                                                                           |
   |                     | IPスプーフィング、MACアドレススプー\   | デバイスのなりすまし                   |                                                                                    |
   |                     | フィング など                          |                                        |                                                                                    |
   |                     +----------------------------------------+----------------------------------------+------------------------------------------------------------------------------------+
   |                     | セッションハイジャック など            | Web対策、ネットワーク対策              | Web Application Firewall(WAF)を別途導入する。                                      |
   +---------------------+----------------------------------------+----------------------------------------+------------------------------------------------------------------------------------+
   | 盗聴                | ディレクトリトラバーサル など          | Web対策                                | Web Application Firewall(WAF)を別途導入する。                                      |
   |                     |                                        |                                        |                                                                                    |
   +---------------------+----------------------------------------+----------------------------------------+------------------------------------------------------------------------------------+
   | サービス妨害        | DDoS攻撃、リフレクター攻撃、\          | ネットワーク対策                       | IDS/IPSを別途導入する。                                                            |
   |                     | HTTP Flood攻撃、Volumetric攻撃 など    |                                        |                                                                                    |
   +---------------------+----------------------------------------+----------------------------------------+------------------------------------------------------------------------------------+
   | 脆弱性を狙った攻撃  | SQLインジェクション、クロスサイト\     | Web対策                                | Web Application Firewall(WAF)を別途導入する。                                      |
   |                     | スクリプティング (XSS)、クロスサイト\  |                                        |                                                                                    |
   |                     | リクエストフォージェリ (CSRF) など     |                                        |                                                                                    |
   |                     +----------------------------------------+----------------------------------------+------------------------------------------------------------------------------------+
   |                     | バッファオーバーフロー、リモート\      | システム対策                           | Web Application Firewall(WAF)を別途導入する。                                      |
   |                     | コード実行、ゼロデイ攻撃 など          |                                        |                                                                                    |
   |                     |                                        |                                        |                                                                                    |
   |                     +----------------------------------------+----------------------------------------+------------------------------------------------------------------------------------+
   |                     | ARPスプーフィング、DNSスプーフィング\  | ネットワーク対策                       | Web Application Firewall(WAF)を別途導入する。                                      |
   |                     | ドメイン名ハイジャック攻撃 など        |                                        |                                                                                    |
   |                     |                                        |                                        |                                                                                    |
   |                     +----------------------------------------+----------------------------------------+------------------------------------------------------------------------------------+
   |                     | ルートキット攻撃 など                  | ウィルス対策                           | ウィルス対策ソフトを別途導入する。                                                 |
   +---------------------+----------------------------------------+----------------------------------------+------------------------------------------------------------------------------------+

.. warning::
   | Exastro Platform 認証機能のオプションパラメータより :menuselection:`サービス用公開エンドポイント(EXTERNAL_URL)` と :menuselection:`システム管理用公開エンドポイント(EXTERNAL_URL_MNG)` を分けて設定することによる不正アクセスの対策を推奨しています。
   | 詳細は :doc:`../../../installation/index` を参照してください。
