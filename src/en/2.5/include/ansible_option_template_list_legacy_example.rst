

.. note:: | **Template embedded variables used in Ansible-Legacy・Ansible-LegacyRole**

   |  This section contains examples of File embedded file names when describing File materials registered in :menuselection:`Ansible common --> File management` to Playbooks.
   
   | ※If the file name has a space in it, make sure to enclose it in quotation marks. Not doing so will end in an error.

   | e.g.) Using the file embedded variables to copy the hosts file registered in :menuselection:`Ansible common --> File management` to the target server's /etc/

   #. | Ragister hosts from :menuselection:`Ansible common --> Template management`.

      .. list-table:: Template management registration contents
         :widths: 30 40
         :header-rows: 1
         :align: left

         * - Template embedded variable name
           - Template file
         * - TPF_hosts
           - hosts


   #. | Write a Playbook similar to the one below.
        | ※Input file name for dest. If there is no file name, The Files with ITA Management numbers applied to their names will be processed before the registered file material's file name. 
        | 　For example, for dest=/etc/, the file name will be /etc/"String with 36 characters"_hosts.

      | **Playbook description**


      .. code-block:: yaml

         - template: src='{{ TPF_hosts }}' dest=/etc/hosts

