| :doc:`Ansible-Core <../../../configuration/ansible/ansible_core>` の作業実行のため、ホストの Docker もしくは Podman のソケットファイルを、ita-by-ansible-execute コンテナにマウントしています。
| Ansible-Core を利用しない場合は、 :file:`~/exastro-docker-compose/.env` の :file:`HOST_DOCKER_SOCKET_PATH=/dev/null` のコメントアウトを外します。

.. code-block:: bash
   :caption: .env の設定例（Docker の場合）

   # HOST_DOCKER_SOCKET_PATH=/var/run/docker.sock
   HOST_DOCKER_SOCKET_PATH=/dev/null

.. code-block:: bash
   :caption: .env の設定例（Podman の場合）

   # HOST_DOCKER_SOCKET_PATH=/run/user/1000/podman/podman.sock
   HOST_DOCKER_SOCKET_PATH=/dev/null

.. warning::
   | :file:`/dev/null` を設定すると、Ansible-Core の作業実行は動作しません。
   | Ansible Automation Controller および Ansible Execution Agent の作業実行は、ソケットファイルを使用しないため、この設定の影響を受けません。

| 作業が実行されていない状態にするため、設定を反映する前に :doc:`メンテナンスモード <../../../manuals/maintenance/maintenance_mode>` に移行してください。
