=============
高可用性 (HA)
=============

| 本説明では Exastro システムにおける、高可用性について記載しております。
| 高可用性の構築にあたり、Kubernetesなどのコンテナオーケストレーションが必要不可欠となっております。

目的
====
| 各作業の自動化を進める中で、Exastroシステムを使用するにあたり、システムの可用性が高い（安定した稼働）を求める構成が必要と考えられます。
| 安定した稼働を実現するには、Kubernetesのコンテナオーケストレーションが必要不可欠となっており
| コンテナオーケストレーションによる、ExastroシステムのHA構成の構築は、非常にハードルが高いため、
| 本書では、その構築を容易に行えるよう、構成概要や構築サンプルを公開しております。


構成図
======


対象
====
| 本説明における、高可用性の範囲は、ロードバランサー・リバースプロキシ、Exastroアプリケーション、ストレージ(永続データ)となります。
| ※Kubernetesなどのコンテナオーケストレーションの高可用性については、記載しません。


Exastroアプリケーション
=======================

| Exastroシステムのアプリケーションは、基本的に冗長構成を行うことで、システムの可用性を高くすることができます。
| ※Exastro IT Automation Ver.2.4.0において、backend処理の一部については、高可用性対応待ちとなっております。

| アプリケーションの高可用性設定につきましては、レプリカ数やPodのAffinity設定で冗長構成ができます。

ロードバランサー・リバースプロキシ
==================================

前提条件
--------

| 以下の例はRHEL8で実施する場合の手順です。
.. list-table:: ホスト一覧
   :widths: 20, 80
   :header-rows: 1
   :align: left

   * - ホスト名
     - IP
   * - ha-conf-haproxy-vip
     - 192.168.0.1
   * - ha-conf-haproxy-01
     - 192.168.0.2
   * - ha-conf-haproxy-02
     - 192.168.0.3
   * - ha-conf-k8s-01
     - 192.168.0.4
   * - ha-conf-k8s-02
     - 192.168.0.5
   * - ha-conf-k8s-03
     - 192.168.0.6

hostsの定義
-----------

| 以下の内容を **ha-conf-haproxy-01** および **ha-conf-haproxy-02** のhostsに追記します。
.. code-block:: bash
 :caption: conf:/etc/hosts

 192.168.0.2  ha-conf-haproxy-01
 192.168.0.3  ha-conf-haproxy-02
 192.168.0.1  ha-conf-haproxy-vip
 192.168.0.4  ha-conf-k8s-01
 192.168.0.5  ha-conf-k8s-02
 192.168.0.6  ha-conf-k8s-03

シェル変数設定
--------------

| 作業の中で各IPアドレスを各所で使用するのでシェル変数に設定します。
- ha-conf-haproxy-01 および ha-conf-haproxy-02共通
.. code-block:: bash

 VM1_IP_ADDR="192.168.0.2"         # haproxy1号機のIPアドレス
 VM2_IP_ADDR="192.168.0.3"        # haproxy2号機のIPアドレス
 VIRTUAL_IP_ADDR="192.168.0.1"    # haproxyのVIP
 K8S_NODE1_IP_ADDR="192.168.0.4"  # kubernetes node1のIPアドレス
 K8S_NODE2_IP_ADDR="192.168.0.5"  # kubernetes node2のIPアドレス
 K8S_NODE3_IP_ADDR="192.168.0.6"  # kubernetes node3のIPアドレス

- ha-conf-haproxy-01 
.. code-block:: bash

 VM_SELF_IP_ADDR="192.168.0.2"     # 自身のIPアドレス

- ha-conf-haproxy-02
.. code-block:: bash
 
 VM_SELF_IP_ADDR="192.168.0.3"    # 自身のIPアドレス


haproxyの導入・設定
-------------------

| 以下の内容を **ha-conf-haproxy-01** および **ha-conf-haproxy-02** で実施します。
| ※haproxyでSSL終端させるのでmakeコマンドにオプション追加（ **USE_OPENSSL=1** ）

- haproxyインストール
.. code-block:: bash

 sudo su -
 dnf -y install gcc systemd-devel
 curl -k https://www.haproxy.org/download/2.8/src/haproxy-2.8.3.tar.gz > haproxy-2.8.3.tar.gz
 tar zxf haproxy-2.8.3.tar.gz
 cd haproxy-2.8.3
 make clean
 make -j 8 TARGET=linux-glibc USE_THREAD=1 USE_SYSTEMD=1 USE_OPENSSL=1
 sed -i -e 's/^PREFIX = \/usr\/local/PREFIX = \/usr\/local\/haproxy/g' Makefile
 make install
 echo 'export PATH=/usr/local/haproxy/sbin:$PATH' >> /etc/profile
 . /etc/profile

- haproxyインストール確認
.. code-block:: bash

 which haproxy

.. code-block:: bash
 :caption: 結果

 /usr/local/haproxy/sbin/haproxy

- haproxy.cfg の設定（haproxy起動確認用）
.. code-block:: bash

 mkdir /etc/haproxy

.. code-block:: bash

 cat <<__EOF__ > /etc/haproxy/haproxy.cfg
 global
     log         127.0.0.1 local2

     chroot      /var/lib/haproxy
     pidfile     /var/run/haproxy.pid
     maxconn     4000
     user        haproxy
     group       haproxy
     daemon

     stats socket /var/lib/haproxy/stats

 defaults
     mode                    http
     log                     global
     option                  httplog
     option                  dontlognull
     option http-server-close
     option forwardfor       except 127.0.0.0/8
     option                  redispatch
     retries                 3
     timeout http-request    10s
     timeout queue           10s
     timeout connect         10s
     timeout client          10s
     timeout server          10s
     timeout http-keep-alive 10s
     timeout check           10s
     maxconn                 3000

 frontend main
     bind *:5000
     default_backend back

 backend back
     balance    roundrobin
     server     web1  << self_IPAddress >>:80  check inter 5s rise 15 fall 1

 listen hastats
     bind *:8080
     mode http
     stats enable
     stats show-legends
     stats uri /stats
 __EOF__

.. code-block:: bash

 sed -i -e s/"<< self_IPAddress >>"/"${VM_SELF_IP_ADDR}"/g /etc/haproxy/haproxy.cfg

- haproxy起動設定
| アカウント・ディレクトリ作成
.. code-block:: bash

 groupadd haproxy
 useradd -g haproxy haproxy
 id haproxy
 mkdir /var/lib/haproxy

| haproxy.serviceの作成
.. code-block:: bash

 cat <<__EOF__ > /etc/systemd/system/haproxy.service
 [Unit]
 Description=HAProxy Systemctl
 After=network.target

 [Service]
 Environment="CONFIG=/etc/haproxy/haproxy.cfg"
 Environment="PIDFILE=/var/run/haproxy.pid"
 ExecStartPre=/usr/local/haproxy/sbin/haproxy -f \$CONFIG -c
 ExecStart=/usr/local/haproxy/sbin/haproxy -Ws  -f \$CONFIG -p \$PIDFILE
 ExecReload=/usr/local/haproxy/sbin/haproxy -f \$CONFIG -c -q
 ExecReload=/bin/kill -USR2 \$MAINPID
 KillMode=mixed
 Restart=always
 SuccessExitStatus=143
 Type=notify

 [Install]
 WantedBy=multi-user.target
 __EOF__

| service設定ファイル再読み込み
.. code-block:: bash

 systemctl daemon-reload

| haproxy起動・自動起動設定
.. code-block:: bash

 systemctl start haproxy
 systemctl enable haproxy

- haproxy起動確認
| プロセスの確認

.. code-block:: bash

 ps -ef | grep '[h]aproxy'

.. code-block:: bash 
 :caption: 結果

 root       43658       1  0 15:00 ?        00:00:00 /usr/local/haproxy/sbin/haproxy -Ws -f /etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid
 haproxy    43660   43658  0 15:00 ?        00:00:00 /usr/local/haproxy/sbin/haproxy -Ws -f /etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid

| httpdのインストール・起動
.. code-block:: bash

 dnf -y install httpd
 systemctl start httpd

| http接続確認
.. code-block:: bash

 export NO_PROXY=${NO_PROXY},${VM_SELF_IP_ADDR}
 export no_proxy=${no_proxy},${VM_SELF_IP_ADDR}

 # htmlの応答があること
 curl ${VM_SELF_IP_ADDR}:5000

 # htmlの応答があること
 curl ${VM_SELF_IP_ADDR}:80

 # エラーとなること
 curl ${VM_SELF_IP_ADDR}:100

keepalived の導入
-----------------

| 以下の内容を **ha-conf-haproxy-01** および **ha-conf-haproxy-02** で実施します。
- Network Interface名の取得

.. code-block:: bash

 route

.. code-block:: bash
 :caption: 結果

 Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
 default         _gateway        0.0.0.0         UG    100    0        0 eth0

| 結果からIfaceの値を後で使用するのでシェル変数に格納します。

.. code-block:: bash

 KEEPALIVED_NIC_NAME="eth0"

- keepalived のインストール

.. code-block:: bash

 dnf -y install keepalived


- keepalived.conf雛形ファイル作成 (ha-conf-haproxy-01)
    **※ha-conf-haproxy-01で実施**

.. code-block:: bash

 cat <<__EOF__ > ~/keepalived.conf
 vrrp_instance VI_1 {
     state MASTER
     interface << Iface名 >>
     virtual_router_id 188
     priority 100
     advert_int 2
     authentication {
         auth_type PASS
         auth_pass password
     }
     virtual_ipaddress {
         << virtual_IPAddress_1 >>/24 << Iface名 >>
     }
     unicast_src_ip << v2ha_lb1_IPAddress >>  \$ MASTER_IP_VALUE
     unicast_peer {
         << v2ha_lb2_IPAddress >>  \$ BACKUP_IP_VALUE
     }
 }
 __EOF__


- keepalived.conf雛形ファイル作成 (ha-conf-haproxy-02)
    **※ha-conf-haproxy-02で実施**

.. code-block:: bash
 
 cat <<__EOF__ > ~/keepalived.conf
 vrrp_instance VI_1 {
     state BACKUP
     interface << Iface名 >>
     virtual_router_id 188
     priority 99
     advert_int 2
     authentication {
         auth_type PASS
         auth_pass password
     }
     virtual_ipaddress {
         << virtual_IPAddress_1 >>/24 << Iface名 >>
     }
     unicast_src_ip << v2ha_lb2_IPAddress >>  \$ BACKUP_IP_VALUE
     unicast_peer {
         << v2ha_lb1_IPAddress >>  \$ MASTER_IP_VALUE
     }
 }
 __EOF__


- keepalived.confの修正

.. code-block:: bash

 sed -i -e s/"<< Iface名 >>"/"${KEEPALIVED_NIC_NAME}"/g ~/keepalived.conf
 sed -i -e s/"<< virtual_IPAddress_1 >>"/"${VIRTUAL_IP_ADDR}"/g ~/keepalived.conf
 sed -i -e s/"<< v2ha_lb1_IPAddress >>"/"${VM1_IP_ADDR}"/g ~/keepalived.conf
 sed -i -e s/"<< v2ha_lb2_IPAddress >>"/"${VM2_IP_ADDR}"/g ~/keepalived.conf
 
- keepalived.confの設置・起動
  
.. code-block:: bash

  cp -p /etc/keepalived/keepalived.conf /etc/keepalived/keepalived.conf.buk
  cp ~/keepalived.conf /etc/keepalived/keepalived.conf
  systemctl enable keepalived
  systemctl start keepalived

- keepalivedの起動確認

.. code-block:: bash

 ps -ef | grep '[k]eepalived'

.. code-block:: bash
 :caption: 結果
 
  root       45997       1  0 10:10 ?        00:00:00 /usr/sbin/keepalived -D
  root       45998   45997  0 10:10 ?        00:00:00 /usr/sbin/keepalived -D
 
.. code-block:: bash

 ip a | grep ${KEEPALIVED_NIC_NAME}

| ※1号機にVIPが付与されていること

.. code-block:: bash
 :caption: 結果

 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
     inet 192.168.0.2/24 scope global dynamic noprefixroute eth0
     inet 192.168.0.1/24 scope global secondary eth0

.. code-block:: bash
 :caption: 結果

 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
       inet 192.168.0.3/24 scope global dynamic noprefixroute eth0

アクセス確認(keepalived+haproxy)
--------------------------------

.. code-block:: bash

 export NO_PROXY=${NO_PROXY},${VIRTUAL_IP_ADDR}
 export no_proxy=${no_proxy},${VIRTUAL_IP_ADDR}

 # htmlの応答があること
 curl ${VIRTUAL_IP_ADDR}:5000

 # htmlの応答があること
 curl ${VIRTUAL_IP_ADDR}:80

 # エラーとなること
 curl ${VIRTUAL_IP_ADDR}:100

haproxy SSL化
-------------

| 本手順では自己証明書でSSL化する例となります。
| （正規の認証局が発行した証明書を利用する場合は、正規の証明書を設定してください）

- 自己証明書の作成

| 以下の内容を **ha-conf-haproxy-01** で実施する

.. code-block:: bash

 cd /etc/pki/tls/certs
 openssl genrsa 2048 > ha-conf-haproxy-server.key

.. code-block:: bash

 openssl req -new -key ha-conf-haproxy-server.key > ha-conf-haproxy-server.csr

| 必要な項目があれば入力、今回は入力項目は全てなし（enter）で行う。
.. code-block:: bash

 You are about to be asked to enter information that will be incorporated
 into your certificate request.
 What you are about to enter is what is called a Distinguished Name or a DN.
 There are quite a few fields but you can leave some blank
 For some fields there will be a default value,
 If you enter '.', the field will be left blank.
 -----
 Country Name (2 letter code) [XX]:
 State or Province Name (full name) []:
 Locality Name (eg, city) [Default City]:
 Organization Name (eg, company) [Default Company Ltd]:
 Organizational Unit Name (eg, section) []:
 Common Name (eg, your name or your server's hostname) []:
 Email Address []:

 Please enter the following 'extra' attributes
 to be sent with your certificate request
 A challenge password []:
 An optional company name []:


.. code-block:: bash

 openssl x509 -days 3650 -req -signkey ha-conf-haproxy-server.key < ha-conf-haproxy-server.csr > ha-conf-haproxy-server.crt

.. code-block:: bash

 cat ha-conf-haproxy-server.crt ha-conf-haproxy-server.key > ha-conf-haproxy-server.pem

.. code-block:: bash

 chmod 600 ha-conf-haproxy-server.key ha-conf-haproxy-server.pem
    
- 2号機に証明書を配置
| 1号機に設置した **ha-conf-haproxy-server.pem** を２号機の/etc/pki/tls/certs配下に同様に配置

- haproxy.cfg変更
以下の内容を **ha-conf-haproxy-01** および **ha-conf-haproxy-02** で実施する
haproxy.cfgを以下の内容で修正します

.. code-block:: bash

 vi /etc/haproxy/haproxy.cfg

.. code-block:: bash
 :caption: /etc/haproxy/haproxy.cfg（変更前）

 frontend main
     bind *:5000
     default_backend back

.. code-block:: bash
 :caption: /etc/haproxy/haproxy.cfg（変更後）

 frontend main
     bind    *:443 ssl crt /etc/pki/tls/certs/ha-conf-haproxy-server.pem
     mode    http
     option forwardfor
     http-request add-header X-Forwarded-Proto https
     default_backend  back


.. code-block:: bash

 systemctl restart haproxy 


haproxy（exastro接続）
---------------------

.. code-block:: bash

 cat <<__EOF__ > /etc/haproxy/haproxy.cfg
 global
     log         127.0.0.1 local2

     chroot      /var/lib/haproxy
     pidfile     /var/run/haproxy.pid
     maxconn     4000
     user        haproxy
     group       haproxy
     daemon

     stats socket /var/lib/haproxy/stats

     tune.maxrewrite         32000
     tune.http.maxhdr        32000
     tune.pattern.cache-size 0

 defaults
     mode                    http
     log                     global
     option                  httplog
     option                  dontlognull
     # option http-server-close
     option http-keep-alive
     option forwardfor       except 127.0.0.0/8
     option                  redispatch
     retries                 3
     timeout http-request    600s
     timeout queue           600s
     timeout connect         30s
     timeout client          600s
     timeout server          600s
     timeout http-keep-alive 30s
     timeout check           30s
     maxconn                 3000

 frontend main
     bind    *:443 ssl crt /etc/pki/tls/certs/ha-conf-haproxy-server.pem
     mode    http
     option forwardfor
     http-request add-header X-Forwarded-Proto https
     acl is_exastro_user  hdr_dom(host) -i << v2ha_exastro_user_vhostname >>
     acl is_exastro_admin hdr_dom(host) -i << v2ha_exastro_admin_vhostname >>
     use_backend user_backend  if is_exastro_user
     use_backend admin_backend if is_exastro_admin

 backend user_backend
     balance    roundrobin
     server     node1  << v2ha_k8s_node1_IPAddress >>:30080  check  inter 2s rise 2 fall 1
     server     node2  << v2ha_k8s_node2_IPAddress >>:30080  check  inter 2s rise 2 fall 1
     server     node3  << v2ha_k8s_node3_IPAddress >>:30080  check  inter 2s rise 2 fall 1
 backend admin_backend
     balance    roundrobin
     server     node-admin1  << v2ha_k8s_node1_IPAddress >>:30081  check  inter 2s rise 2 fall 1
     server     node-admin2  << v2ha_k8s_node2_IPAddress >>:30081  check  inter 2s rise 2 fall 1
     server     node-admin3  << v2ha_k8s_node3_IPAddress >>:30081  check  inter 2s rise 2 fall 1

 listen hastats
     bind *:8080
     mode http
     stats enable
     stats show-legends
     stats uri /stats
 __EOF__


| アクセスする際のvirtual host名をシェル変数に格納します

.. code-block:: bash

 EXASTRO_USER_VHOSTNAME="exastro.ha-conf.local"
 EXASTRO_ADMIN_VHOSTNAME="exastro-admin.ha-conf.local"

.. code-block:: bash

 sed -i -e s/"<< v2ha_exastro_user_vhostname >>"/"${EXASTRO_USER_VHOSTNAME}"/g /etc/haproxy/haproxy.cfg
 sed -i -e s/"<< v2ha_exastro_admin_vhostname >>"/"${EXASTRO_ADMIN_VHOSTNAME}"/g /etc/haproxy/haproxy.cfg
 sed -i -e s/"<< v2ha_k8s_node1_IPAddress >>"/"${K8S_NODE1_IP_ADDR}"/g /etc/haproxy/haproxy.cfg
 sed -i -e s/"<< v2ha_k8s_node2_IPAddress >>"/"${K8S_NODE2_IP_ADDR}"/g /etc/haproxy/haproxy.cfg
 sed -i -e s/"<< v2ha_k8s_node3_IPAddress >>"/"${K8S_NODE3_IP_ADDR}"/g /etc/haproxy/haproxy.cfg
 sed -i -e s/"<< self_IPAddress >>"/"${VM_SELF_IP_ADDR}"/g /etc/haproxy/haproxy.cfg

exastro EXTERNAL_URL設定変更
----------------------------

kubernetesノード（kubectlで接続可能な環境）に入り、以下を実施します。
※helm install時に既に設定している場合は不要

.. code-block:: bash

 kubectl edit cm params-platform-auth -n exastro

以下に変更

.. code-block:: diff
 :caption: exastro.yaml
 :linenos:
 :lineno-start: 353

  platform-auth:
    extraEnv:
      # Please set the URL to access
 -    EXTERNAL_URL: "http:change-this.com"
 -    EXTERNAL_URL_MNG: "http:change-this.com"
 +    EXTERNAL_URL: "https://exastro.ha-conf.epoch-labo.local"
 +    EXTERNAL_URL_MNG: "https://exastro-admin.ha-conf.epoch-labo.local"

.. code-block:: bash

 helm upgrade exastro exastro/exastro \
  --namespace exastro \
  --values exastro.yaml


ストレージ
==========

