==============
共通操作
==============

はじめに
========

| 本書は、ITAのメニューの共通部分の操作方法について記載したものです。

概要
====

ITAが提供するメニューの共通部分の画面説明、および操作方法について解説します。

画面説明
========

| ITAのメニューの共通画面について説明します。

画面構成
--------

| ITAシステムが提供する各メニュー画面は基本的に同じ要素で構成されています。
| その構成要素は次の通りです。

.. figure:: /images/ja/diagram/画面構成_v2-3.png
   :alt: 画面構成
   :align: center
   :width: 800px

   画面構成


.. list-table:: 画面構成一覧
   :header-rows: 1
   :align: left

   * - No.
     - 画面名
     - 説明
   * - 1
     - メニュー名
     - | 現在表示しているメニュー名が表示されます。
       | :guilabel:`︙` をクリックすると、メニューの説明が表示されます。
   * - 2
     - メニュー
     - | 操作/表示可能なメニューグループがリストとして表示されます。
       | また、現在のメニューグループで、操作/表示可能なメニューがリストとして表示されます。
   * - 3
     - サブメニュー
     - | 各メニューに対応する登録、設定などを行う部分です。
       | ※詳細は後述します。
   * - 4
     - ワークスペース情報
     - | 現在のワークスペースおよび、アクセス権限のあるワークスペースの一覧が表示されます。
       | クリックすると、以下の操作が可能です。
       | 　・ワークスペースの切替
       | 　・ワークスペース一覧画面へ遷移
   * - 5
     - ログイン情報
     - | 現在ログインしているアカウント名が表示されます。
       | クリックすると、以下の操作が可能です。
       | 　・所属しているロールの確認
       | 　・画面設定
       | 　・インストールされているITAとドライバのバージョン確認
       | 　・ログアウト



各メニュー共通操作
==================

| 各メニュー共通操作部の操作方法を説明します。
| 各メニュー個別の情報は各機能のマニュアルを参照して下さい。

一覧タブ
--------

| 登録されている項目の確認や登録/更新/廃止/復活を行うことが出来ます。

- | **登録**
  | 各メニューに対して、新規に項目を登録します。
  | 登録内容は各メニューによって異なりますので、各利用手順マニュアルを参照して下さい。
  | エクセル形式、JSON形式のファイルを使用する一括登録については「\ :ref:`management_console_download_all_and_edit_file_uploads`\ 」をご確認下さい。

  .. figure:: /images/ja/management_console/menu_group_list/menu_register.gif
     :alt: メインメニュー
     :width: 800px
     :align: center

  #. 「一覧」タブ内上部の \ :guilabel:`登録`\  をクリックして登録/編集画面に遷移します。
  #. 必要な情報を入力し、「一覧」タブ内上部の \ :guilabel:`編集確認`\  をクリックすると編集確認画面が表示されます。
  #. \ :guilabel:`編集反映`\  をクリックして更新します。

  .. note:: | **登録時のボタンについて**

              - | \ :guilabel:`追加`\
                | 新規登録用のレコードが追加されます。
                | 複数件を同時に登録したい場合に使用します。
              - | \ :guilabel:`複製`\
                | チェックを付けたレコードが複製されます。
                | 手順については「\ :ref:`複製<duplicate>`\ 」をご確認下さい。
              - | \ :guilabel:`削除`\
                | チェックを付けたレコードが削除されます。

  .. note:: | **プルダウンによる入力項目について**
            | 登録/更新時の入力項目で、プルダウンによる選択が可能な項目は、以下の仕様となっています。

            .. figure:: /images/ja/management_console/menu_group_list/プルダウンによる入力項目.gif
               :alt:  プルダウンによる入力項目
               :align: center
               :width: 6in

            #. | 検索窓が表示されます。
               | 検索したい語句を入力することにより、選択項目を絞り込むことが出来ます。
               | 部分一致検索で、大文字と小文字、全角と半角は補正検索されます。
            #. | 選択項目が表示されます。

  .. tip:: | **ファイルアップロード項目について**
            | 登録/更新時の入力項目で、ファイルアップロードが可能項目は、以下の仕様となっています。

            .. figure:: /images/ja/management_console/common_operation/fileupload_operation_edit.gif
               :alt:  ファイルアップロードの入力項目
               :align: center
               :width: 6in

            #. | :guilabel:`+` ：ファイルを選択して、ファイルアップロードが可能です。
            #. | :guilabel:`` ：テキストファイルの作成、編集が可能です。
               | 編集状態では、以下の操作が可能です。
               | ・:guilabel:`更新` ：編集をファイルに反映されます。(レコードへ保存されていません。)
               | ・:guilabel:`ダウンロード` ：編集したものをダウンロード可能です。
            #. | :guilabel:`` ：ファイルの削除が可能です。
               | :guilabel:`` 押下後、 :menuselection:`編集確認 --> 編集反映` 後にレコード上も削除が反映されます。
            #. | 「管理コンソール - :ref:`system_setting`」より識別ID「FORBIDDEN_UPLOAD」の設定値にて、ファイルアップロード禁止拡張子を設定できます。

               .. warning::
                  アップロード禁止拡張子の許可を増やすと、セキュリティホールになる可能性があります。


- | **表示フィルタ**
  | 各メニューで登録されている項目を表示するための検索条件を指定します。
  | 検索条件、検索項目はメニューごとに異なります。ここでは共通機能について説明します。
  | 「一覧」タブ内右上の \ :guilabel:`フィルタ|開く/閉じる`\  をクリックすることで表示／非表示の切替が可能です。

  .. figure:: /images/ja/management_console/menu_group_list/表示フィルタ画面.gif
     :alt: 表示フィルタ画面
     :align: center
     :width: 800px

  #. | 廃止カラム
     | 初期状態では、「廃止含まず」がセットされています。
     | 他に「全レコード」、「廃止のみ」が任意操作で選択可能であり、希望表示方法を指定します。
     | **必ずいずれかの選択が必須**\ です。
  #. | 検索条件
     | 検索する条件を指定します。
     | ・複数項目に条件を指定する場合、AND条件で検索となります。
     | ・文字指定が出来る項目については「あいまい検索」、「プルダウン検索」でフィルタすることが出来ます。
     | ・同一項目に対して、「あいまい検索」と「プルダウン検索」でフィルタした場合、OR条件での検索となります。
     | ・ファイルアップロードの検索は、ファイル名が対象となります。
     | ・整数、少数、年月日、年月日時が入力出来る項目については、検索値で、「以上」、「以下」、「範囲指定」でフィルタすることが出来ます。
  #. | オートフィルタ
     | オートフィルタをチェックしておくと、フィルタ条件を選択するごとに条件に合った一覧を自動で表示します。
     | 画面表示時のチェック有無は、管理コンソール「メニュー管理」の「オートフィルタチェック」で設定可能です。
  #. | カラム説明 (Description)
     | カーソルを合わせると該当する列の説明文がポップアップ表示されます。
  #. | フィルタ
     | 検索条件を手入力およびプルダウンメニューから選択し、Enterキーまたは\ :guilabel:`フィルタ`\ をクリックすると登録情報が表示されます。
  #. | Excelダウンロード
     | 検索条件に一致した項目の一覧をエクセル形式でダウンロード出来ます。
  #. | JSONダウンロード / JSONダウンロード（ファイルなし）
     | 検索条件に一致した項目の一覧をJSON形式でダウンロード出来ます。
     | ファイルアップロード項目が含まれる場合、ファイルデータはbase64形式でダウンロードされます。
     | ※:guilabel:`JSONダウンロード（ファイルなし）` を選択した場合、ファイルデータを含まずにダウンロードされます。

  .. note::
            | 表示フィルタからダウンロードしたExcel形式ファイルとJSON形式ファイルは「\ :ref:`management_console_download_all_and_edit_file_uploads`\ 」で使用することが出来ます。

  .. tip:: | **ファイルアップロード項目について**
            | 一覧時で、ファイルアップロードが可能項目は、以下の仕様となっています。

            .. figure:: /images/ja/management_console/common_operation/fileupload_operation_filter.gif
               :alt:  ファイルアップロードの入力項目(一覧)
               :align: center
               :width: 6in

            #. | ファイル名 ：ファイル名のリンクを選択して、ファイルのダウンロードが可能です。
            #. | :guilabel:`` ：テキストファイルのプレビューが可能です。
               | プレビュー状態では、以下の操作が可能です。
               | ・:guilabel:`ダウンロード` ：ファイルのダウンロード可能です。

- | **編集**
  | 登録されている項目の更新を行います。
  | 編集内容は各メニューによって異なりますので、各利用手順マニュアルを参照して下さい。

  .. figure:: /images/ja/management_console/menu_group_list/menu_update.gif
     :alt: 編集の操作
     :align: center
     :width: 800px

  #. | 対象項目の \ :guilabel:`…`\  > \ :guilabel:`編集`\  を順にクリックして登録/編集画面に遷移します。
     | もしくは、対象項目にチェックを入れ、「一覧」タブ内上部の \ :guilabel:`編集`\  をクリックします。
     | チェックを入れずに「一覧」タブ内上部の \ :guilabel:`編集`\  をクリックすると表示されているすべての項目が編集対象となります。
  #. | 更新する情報を入力し、「一覧」タブ内上部の \ :guilabel:`編集確認`\  をクリックすると編集確認画面が表示されます。
  #. | \ :guilabel:`編集反映`\  をクリックして更新します。

  .. note:: | **編集時のボタンについて**

              - | \ :guilabel:`追加`\
                | 新規登録用のレコードが追加されます。
                | 複数件を同時に登録したい場合に使用します。
              - | \ :guilabel:`複製`\
                | チェックを付けたレコードが複製されます。
                | 手順については「\ :ref:`複製<duplicate>`\ 」をご確認下さい。
              - | \ :guilabel:`削除`\
                | チェックを付けたレコードが削除されます。
              - | \ :guilabel:`廃止`\
                | チェックを付けたレコードの廃止フラグがTrueになります。
                | 更新後に廃止となります。

.. _Duplicate:

- | **複製**
  | 登録されている項目の情報を転用して登録することが可能です

  #. | 対象項目の \ :guilabel:`…`\  > \ :guilabel:`複製`\  を順にクリックして登録/編集画面に遷移します。
     | もしくは、対象項目にチェックを入れ、「一覧」タブ内上部の \ :guilabel:`編集`\  をクリックします。
     | 登録/編集画面に遷移したら \ :guilabel:`複製`\  をクリックします。
  #. | 対象項目の値を反映した状態の新規登録用レコードが表示されます。

  .. figure:: /images/ja/management_console/menu_group_list/menu_copy.gif
     :alt: 編集の操作
     :align: center
     :width: 800px

  .. warning:: - | 対象項目がパスワード項目の場合、複製処理は行われません。


- | **テーブル設定**
  | テーブル設定の変更を行う事ができます。
  | 変更された設定は、サーバーに保持されるので、別の端末、ブラウザ、環境からアクセスした場合でもテーブル設定は、そのまま適用されます。

  - | 共通設定：全メニューのサブメニューの共通部分に対して適用されます。
  - | 個別設定：設定したメニューでのみ適用されます。各項目で共通設定が選択されている場合、共通設定で選択されているものが適用されます。

.. figure:: /images/ja/management_console/common_operation/table_setting_individual.png
   :alt: テーブル設定_個別設定
   :width: 300px
   :align: center

   テーブル設定_個別設定

.. figure:: /images/ja/management_console/common_operation/table_setting_common.png
   :alt: テーブル設定_共通設定
   :width: 300px
   :align: center

   テーブル設定_共通設定

.. list-table:: テーブル設定：個別設定
   :header-rows: 1
   :align: left

   * - | 項目
     - | 説明
     - | 設定値
     - | 備考
   * - | 項目表示方向
     - | 項目の表示方向を設定します。
     - | 以下から選択してください。
       | ・共通設定
       | ・縦
       | ・横
     - |
   * - | フィルタ表示位置
     - | フィルタの表示位置を設定します。
       | 項目表示方向が横の場合は外側固定になります。
     - | 以下から選択してください。
       | ・共通設定
       | ・内側
       | ・外側
     - |
   * - | 項目メニュー表示
     - | 項目メニューの表示方法を設定します。
     - | 以下から選択してください。
       | ・共通設定
       | ・省略
       | ・表示
     - |
   * - | 項目表示・非表示
     - | 項目ごとに表示・非表示を設定します。
     - | 対象項目を選択してください。
     - |


.. list-table:: テーブル設定：共通設定
   :header-rows: 1
   :align: left

   * - | 項目
     - | 説明
     - | 設定値
     - | 備考
   * - | 項目表示方向
     - | 項目の表示方向を設定します。
     - | 以下から選択してください。
       | ・縦
       | ・横
     - |
   * - | フィルタ表示位置
     - | フィルタの表示位置を設定します。
       | 項目表示方向が横の場合は外側固定になります。
     - | 以下から選択してください。
       | ・内側
       | ・外側
     - |
   * - | 項目メニュー表示
     - | 項目メニューの表示方法を設定します。
     - | 以下から選択してください。
       | ・省略
       | ・表示
     - |

.. note:: | **各項目の設定による表示について**
          | 項目表示方向:表示方向が切り替わります。

          .. figure:: /images/ja/management_console/common_operation/filter_vertical.png
              :alt: メニューグループ(項目表示方向：縦)
              :width: 300px
              :align: center

              メニューグループ(項目表示方向：縦)

          .. figure:: /images/ja/management_console/common_operation/filter_horizontal.png
              :alt: メニューグループ(項目表示方向：横)
              :width: 300px
              :align: center

              メニューグループ(項目表示方向：横)

          | フィルタ表示位置:表示位置が切り替わります。

          .. figure:: /images/ja/management_console/common_operation/filter_vertical.png
              :alt: メニューグループ(フィルタ表示位置：内側)
              :width: 300px
              :align: center

              メニューグループ(フィルタ表示位置：内側)

          .. figure:: /images/ja/management_console/common_operation/filter_vertical_outside.png
              :alt: メニューグループ(フィルタ表示位置：外側)
              :width: 300px
              :align: center

              メニューグループ(フィルタ表示位置：外側)

          | 項目メニュー表示：省略選択時は、各レコードの :guilabel:`` を選択することで、項目メニューが表示されます。

          .. figure:: /images/ja/management_console/common_operation/filter_vertical_omit.png
              :alt: メニューグループ(項目メニュー表示：省略)
              :width: 300px
              :align: center

              メニューグループ(項目メニュー表示：省略)

          .. figure:: /images/ja/management_console/common_operation/filter_vertical_show.png
              :alt: メニューグループ(項目メニュー表示：表示)
              :width: 300px
              :align: center

              メニューグループ(項目メニュー表示：表示)

変更履歴タブ
------------
| 各メニューで、登録した項目の変更履歴を表示することが出来ます。

- | **変更履歴の確認**

  #. | 各メニューの主キーを指定することで、対応する項目の変更履歴を表示することが出来ます。
     | もしくは、「一覧」タブの対象項目の \ :guilabel:`…`\  > \ :guilabel:`履歴`\  を順にクリックすると変更履歴を表示することが出来ます。
  #. | 変更実施日時が新しい順に一覧表示され、前回との変更箇所がオレンジ色太文字で表示されます。

  .. figure:: /images/ja/management_console/menu_group_list/変更履歴操作.gif
     :alt: 変更履歴の操作
     :width: 800px
     :align: center

- | **プルダウン選択を含んだ場合の変更履歴について**
  | 「プルダウン選択」の参照元を変更した場合、参照側の値も自動的に変更されます。
  | 「変更履歴」は、値を編集（登録/更新/廃止/復活）した時点の値が表示されます。
  | 以下、例を用いて説明します。

  | 例：パラメータシート「ぱらむ001」の項目「ぱらむB」が「マスタ001」の項目「マスタ」を参照している場合

  #. | 事前準備として、パラメータシート作成メニューグループ>パラメータシート定義・作成メニューで以下のデータシートとパラメータシートを作成します。

     - | データシート「マスタ001」

       .. figure:: /images/ja/menu_creation/menu_definition_and_create/データシート「マスタ001」.png
          :alt: 「パラメータシート定義・作成」メニューで作成したデータシート
          :align: center
          :width: 6in

          「パラメータシート定義・作成」メニューで作成したデータシート

     - | パラメータシート「ぱらむ001」

       .. figure:: /images/ja/management_console/menu_group_list/パラメータシート「ぱらむ001」.png
          :alt: 「パラメータシート定義・作成」メニューで作成したパラメータシート
          :align: center
          :width: 6in

          「パラメータシート定義・作成」メニューで作成したパラメータシート

  #. | 入力用メニューグループ>マスタ001メニューからパラメータ「マスタ」に値「mas1-1」を登録します。
  #. | 入力用メニューグループ>ぱらむ001メニューから1件登録します。
  #. | 入力用メニューグループ>マスタ001メニューからパラメータ「マスタ」の値を編集し「mas1-2」で更新を行います。
  #. | 入力用メニューグループ>マスタ001メニューからパラメータ「マスタ」の値を編集し「mas1-3」で更新を行います。
  #. | 入力用メニューグループ>ぱらむ001メニューから先ほど登録した対象の「ぱらむA」を編集し、更新を行います。

     .. figure:: /images/ja/management_console/menu_group_list/プルダウン選択を含んだ変更履歴の操作.gif
        :alt: プルダウン選択を含んだ変更履歴の操作
        :align: center
        :width: 800px

  #. | 入力用メニューグループ>マスタ001メニューからパラメータ「マスタ」の値を編集し「mas1-4」で更新を行います。
  #. | 入力用メニューグループ>マスタ001メニューからパラメータ「マスタ」の値を編集し「mas1-5」で更新を行います。
  #. | 入力用メニューグループ>ぱらむ001メニューから先ほど登録した対象の「ぱらむA」を編集し、更新を行います。

  #. | 以下のような結果になります。

  .. figure:: /images/ja/management_console/menu_group_list/マスタ001変更履歴.png
     :alt:  データシート「マスタ001」の変更履歴
     :align: center
     :width: 5in

     データシート「マスタ001」の変更履歴

  .. figure:: /images/ja/management_console/menu_group_list/ぱらむ001変更履歴.png
     :alt:  パラメータシート「ぱらむ001」の変更履歴
     :align: center
     :width: 5in

     パラメータシート「ぱらむ001」の変更履歴

.. _management_console_download_all_and_edit_file_uploads:

全件ダウンロード・ファイル一括登録
----------------------------------
| 各メニュー画面に登録されている情報を一括してエクセル形式またはJSON形式でダウンロードすることが出来ます。
| また、同じ形式のファイルで、一括して情報を登録することが出来ます。

.. tabs::

   .. tab:: Excel

      .. figure:: /images/ja//management_console/menu_group_list/file_all_register.gif
         :alt: ファイル一括登録の操作(Excel)
         :align: center
         :width: 800px

      #. | 目的に合ったファイルをダウンロードします。

         - | 登録されている情報の更新/廃止/復活を行う場合は \ :guilabel:`全件ダウンロード(Excel)`\ をクリックし、ファイルをダウンロードして下さい。
         - | 新規に登録を行う場合は \ :guilabel:`新規登録用ダウンロード(Excel)`\  をクリックしてファイルをダウンロードして下さい。
      #. | ダウンロードしたファイルを編集し、保存して下さい。
         | 編集内容は各メニューによって異なりますので、各利用手順マニュアルを参照して下さい。
      #. | 作成したファイル形式に合った \ :guilabel:`ファイル一括登録`\  をクリックし、対象のファイルを選択して \ :guilabel:`一括登録開始`\  をクリックして下さい。

      .. warning:: |  \ :guilabel:`変更履歴全件ダウンロード(Excel)`\  からダウンロードできるファイルは一括登録に使用することが出来ません。
         | 「実行処理種別」が未選択および正しい処理種別を選択していない場合、登録が実行されません。

   .. tab:: JSON

      .. figure:: /images/ja//management_console/menu_group_list/json_register.gif
         :alt: ファイル一括登録の操作(JSON)
         :align: center
         :width: 800px

      #. | 目的に合ったファイルをダウンロードします。

         - | 登録されている情報の更新/廃止/復活を行う場合は \ :guilabel:`全件ダウンロード(JSON)`\ をクリックし、ファイルをダウンロードして下さい。
         - | 新規に登録を行う場合も \ :guilabel:`全件ダウンロード(JSON)`\  をクリックしてファイルをダウンロードして下さい。
      #. | ダウンロードしたファイルを編集し、保存して下さい。
         | 編集内容は各メニューによって異なりますので、各利用手順マニュアルを参照して下さい。
      #. | 作成したファイル形式に合った \ :guilabel:`ファイル一括登録`\  をクリックし、対象のファイルを選択して \ :guilabel:`一括登録開始`\  をクリックして下さい。
