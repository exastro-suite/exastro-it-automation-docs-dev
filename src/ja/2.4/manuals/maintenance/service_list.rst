============
サービス一覧
============

| 本書では Exastro IT Automation の各サービスを以下に記載します。

サービス一覧
============

| 以下の一覧の「監視対象」列には監視すべきサービスを記載しています。
| 監視対象のサービスは「〇」、対象外のサービスは「×」を記載しています。

.. list-table:: 
   :widths: 15 10 15 30
   :header-rows: 1
   :align: left

   * - | サービス
     - | 監視対象
     - | 説明
     - | 備考
   * - | ita-ag-oase
     - | 〇
     - |
     - |
   * - | ita-api-admin
     - | 〇
     - |
     - |
   * - | ita-api-oase-receiver
     - | 〇
     - |
     - |
   * - | ita-api-organization
     - | 〇
     - |
     - |
   * - | ita-by-ansible-agent
     - | ×
     - |
     - | ita-by-ansible-executeで監視しているため監視対象としない。
   * - | ita-by-ansible-execute
     - | 〇
     - |
     - |
   * - | ita-by-ansible-legacy-role-vars-listup
     - | 〇
     - |
     - |
   * - | ita-by-ansible-legacy-vars-listup
     - | 〇
     - |
     - |
   * - | ita-by-collector
     - | 〇
     - |
     - |
   * - | ita-by-conductor-regularly
     - | 〇
     - |
     - |
   * - | ita-by-conductor-synchronize
     - | 〇
     - |
     - |
   * - | ita-by-excel-export-import
     - | 〇
     - |
     - |
   * - | ita-by-execinstance-dataautoclean
     - | 〇
     - |
     - |
   * - | ita-by-file-autoclean
     - | 〇
     - |
     - |
   * - | ita-by-hostgroup-split
     - | 〇
     - |
     - |
   * - | ita-by-menu-create
     - | 〇
     - |
     - |
   * - | ita-by-menu-export-import
     - | 〇
     - |
     - |
   * - | ita-by-oase-conclusion
     - | 〇
     - |
     - |
   * - | ita-by-terraform-cli-execute
     - | 〇
     - |
     - |
   * - | ita-by-terraform-cli-vars-listup
     - | 〇
     - |
     - |
   * - | ita-by-terraform-cloud-ep-execute
     - | 〇
     - |
     - |
   * - | ita-by-terraform-cloud-ep-vars-listup
     - | 〇
     - |
     - |
   * - | ita-migration 
     - | ×
     - |
     - | インストール/アップグレード時のみのため監視対象としない。
   * - | ita-web-server
     - | 〇
     - |
     - |
   * - | platform-api
     - | 〇
     - |
     - |
   * - | platform-auth
     - | 〇
     - |
     - |
   * - | platform-job
     - | 〇
     - |
     - |
   * - | platform-migration
     - | ×
     - |
     - | インストール/アップグレード時のみのため監視対象としない。
   * - | platform-web
     - | 〇
     - |
     - | 
   * - | keycloak
     - | 〇
     - |
     - |
   * - | mariadb
     - | 〇
     - |
     - |
   * - | mongodb
     - | 〇
     - |
     - |
   * - | gitlab
     - | 〇
     - |
     - |