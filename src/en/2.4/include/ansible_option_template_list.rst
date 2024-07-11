:orphan:

.. tip:: | **Variable definition warnings**
   | Variable definition warnings are as following.

   .. table:: Variable definition warnings
      :widths: 10 30
      :align: left

      +---------------+------------------------------------------------------+
      | Type          | Warning                                              |
      +===============+======================================================+
      | Normal vari\  | Can shorten specific values.                         |
      | able          |                                                      |
      |               | e.g.)                                                |
      |               |                                                      |
      |               | .. code-block:: yaml                                 |
      |               |                                                      |
      |               |    VAR_sample_1: none                                |
      |               |    VAR_sample_2:                                     |
      |               |                                                      |
      +---------------+------------------------------------------------------+
      | Multiple spec\| Can shorten specific values.                         |
      | ific value va\|                                                      |
      | riables       | e.g.)                                                |
      |               |                                                      |
      |               | .. code-block:: yaml                                 |
      |               |                                                      |
      |               |    VAR_sample_1:                                     |
      |               |      - none                                          |
      |               |    VAR_sample_2: []                                  |
      |               |                                                      |
      +---------------+------------------------------------------------------+
      | Multistage    | Multistate variable structures can be defined.       |
      |               |                                                      |
      |               | e.g.)                                                |
      |               |                                                      |
      |               | .. code-block:: yaml                                 |
      |               |                                                      |
      |               |    VAR_sample_1:                                     |
      |               |      - item1: none                                   |
      |               |        item2:                                        |
      |               |    VAR_sample_2:                                     |
      |               |      - array:                                        |
      |               |          - item1: none                               |
      |               |            item2:                                    |
      |               |                                                      |
      |               | If there are multiple variables with the same name d\|
      |               | efined, the variable structure must match. If the v\ |
      |               | ariable structure does not match, the registratio\   |
      |               | n will end in an error.                              |
      +---------------+------------------------------------------------------+
      | Global variab\| Can shorten specific values.                         |
      | les           |                                                      |
      |               | e.g.)                                                |
      |               |                                                      |
      |               | .. code-block:: yaml                                 |
      |               |                                                      |
      |               |    GBL_sample_1: none                                |
      |               |    GBL_sample_2:                                     |
      |               |                                                      |
      +---------------+------------------------------------------------------+
      | ITA origina\  | does not need definition.                            |
      | l variables   |                                                      |
      +---------------+------------------------------------------------------+
             


.. note:: | **Template embedded variables used in Ansible-Legacy・Ansible-LegacyRole**

   |  This section contains examples of File embedded file names when describing File materials registered in :menuselection:`File management` to Playbooks.
   
   | ※If the file name has a space in it, make sure to enclose it in quotation marks. Not doing so will end in an error.

   | e.g.) Using the file embedded variables to copy the hosts file registered in :menuselection:`File management` to the target server's /etc/

   #. | Ragister hosts from :menuselection:`Template management`.

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

