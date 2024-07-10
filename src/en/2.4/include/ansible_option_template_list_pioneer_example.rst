
.. note:: | **Ansible-Pioneer template embedded variables**

   |  This section contains examples of File embedded file names when describing File materials registered in :menuselection:`Ansible common --> File management` to Playbooks.

   | ※If the file name has a space in it, make sure to enclose it in quotation marks. Not doing so will end in an error.

   | e.g.) Using the file embedded variables to copy the hosts file registered in :menuselection:`Ansible common --> File management` to the target server's /etc/

   #. | Register hosts file from :menuselection:`Ansible common --> File management`.

        .. list-table:: File management registration contents
           :widths: 30 40
           :header-rows: 1
           :align: left

           * - File embedded variable names
             - File collection
           * - CPF_hosts
             - hosts


     #. | The following is an example of writing an interactive file.
        | ※Make sure to describe the file name for the destination as well. If there is no file name, The Files with ITA Management numbers applied to their names will be processed before the registered file material's file name. 
        | 　For example: For /etc/, the file name will be /etc/"String with 36 characters"_hosts.

        | **Writing Interactive files**

        .. code-block:: yaml

          conf:
            # Adjust timeout value according to the file size
            timeout: 60
          exec_list:
            # Authenticate login password for the target device.
            - expect: 'password:'
              exec: '{{ __loginpassword__ }}'
            # Transfer target to file deployed on the AAC side through scp command.
            - expect: '{{ __loginuser__ }}@{{ __dnshostname__ }}'
              exec: 'scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null {{ VAR_scp_user }}@{{ VAR_aac_host }}:{{ CPF_hosts }} /etc/hosts'
            # Password login authentication for scp command (AAC side)
            - expect: 'password:'
              exec: '{{ VAR_scp_user_password }}'
            # end of interactive file
            - expect: '{{ __loginuser__ }}@{{ __dnshostname__ }}'
              exec: exit

        .. list-table:: Variable specific values
           :widths: 30 40
           :header-rows: 1
           :align: left

           * - Variable
             - Specific value
           * - VAR_scp_user
             - awx
           * - VAR_scp_user_password
             - awx user password
           * - VAR_aac_host
             - Ansible Automation Controller
