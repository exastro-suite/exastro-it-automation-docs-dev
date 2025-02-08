===================
User management (Answers)
===================


Questions (Repost)
===========

| Create and manage the following users in Exastro IT Automation.
| Make sure to not only manage users, but to also configure host names and manage packages.

.. list-table:: User information
  :widths: 10 10 10 10
  :header-rows: 1

  * - User name
    - User ID
    - Login password
    - Group name
  * - wwwuser01
    - 10001
    - password01
    - www
  * - wwwuser02
    - 10002
    - password02
    - www
  * - appuser01
    - 20001
    - password01
    - app
  * - appuser02
    - 20002
    - password02
    - app


Design parameters
==============

| In this guide, we have managed users. But the users also needs to belong to a group.
| First, we will make it so users can be managed on a parameter sheet.

.. _groups_legacy_parameter_sheet:

Create Group parameter sheets
------------------------------

| First, we will create a parameter sheet for groups.
| The Ansible Playbook used is written below. Make sure to create the parameter sheet so it can use the parameter below.

.. code-block:: bash
   :caption: group.yml

   ---
   - name: create/update group
     group:
       name: "{{ item.0 }}"
       gid: "{{ item.1 }}"
     with_together:
       - "{{ group_name }}"
       - "{{ group_id }}"
       - "{{ group_action }}"
     when: item.2 == 'present'

   - name: create/update group
     group:
       name: "{{ item.0 }}"
       gid: "{{ item.1 }}"
     with_together:
       - "{{ group_name }}"
       - "{{ group_id }}"
       - "{{ group_action }}"
     when: item.2 == 'absent'

.. list-table:: Group settings parameters
   :widths: 10 15
   :header-rows: 1

   * - Item 
     - Description
   * - group_name
     - Group name
   * - group_id
     -	Group ID
   * - action
     - | Construction settings
       | present: Create/Update
       | absent: Delete

| From :menuselection:`Create Parameter sheet --> Define/Create Parameter sheet`, register a parameter sheet.

.. tip:: 
   | By checking both :kbd:`Required` and :kbd:`Unique restriction`, the parameter sheet can reference items from external parameter sheets.

.. tip:: 
   | By checking "use" in the :menuselection:`Use bundle` in the Parameter creation information, we can configure multiple parameters to a single item.

.. figure:: /images/learn/quickstart/Legacy_answer1/グループパラメータシート作成.png
   :width: 1200px
   :alt: Group parameter sheet

.. list-table:: Group parameter sheet setting value
   :widths: 10 10 10 10
   :header-rows: 1
   :class: filter-table

   * - Setting item
     - Item 1 setting item
     - Item 2 setting item
     - Item 3 setting item
   * - Item name
     - :kbd:`Group name`
     - :kbd:`Group ID`
     - :kbd:`State`
   * - Item name(Rest API) 
     - :kbd:`group_name`
     - :kbd:`group_id`
     - :kbd:`state`
   * - Input method
     - :kbd:`String(Single line)`
     - :kbd:`Integer`
     - :kbd:`Pulldown selection`
   * - Minimum value
     - (No item)
     - 1000
     - (No item)
   * - Maximum value
     - (No item)
     - 
     - (No item)
   * - Maximum byte size
     - :kbd:`32`
     - (No item)
     - (No item)
   * - Regular expression
     - 
     - (No item)
     - (No item)
   * - Select item
     - (No item)
     - (No item)
     - :kbd:`Input:State:present-absent`
   * - Reference item
     - (No item)
     - (No item)
     - 
   * - Default value
     - 
     - 
     - 
   * - Required
     - ✓
     - ✓
     - ✓
   * - Unique restriction
     - ✓
     - ✓
     - 
   * - Description
     - 
     - 
     - 
   * - Remarks
     - 
     - 
     - 

.. list-table:: Parameter creation information setting value
   :widths: 5 10
   :header-rows: 1
   :class: filter-table

   * - Item name
     - Setting value
   * - Item number
     - (Automatic)
   * - Parameter sheet name
     - :kbd:`Group`
   * - Parameter sheet name(REST)
     - :kbd:`groups`
   * - Creation target
     - :kbd:`Parameter sheet(With host/operation)`
   * - Display order
     - :kbd:`4`
   * - Use bundles
     - Check the "Use" box(Activate)
   * - Last updated date/time
     - (Automatic)
   * - Last updated by
     - (Automatic)


Create parameter sheet for users
------------------------------

| Next, we will create a parameter sheets for the users.
| The Ansible Playbook used is written below. Make sure to create the parameter sheet so it can use the parameter below.

.. code-block:: bash
   :caption: user.yml

   ---
   - name: create user
     user:
       name: "{{ item.0 }}"
       uid: "{{ item.1 }}"
       group: "{{ item.2 }}"
       comment: "{{ item.3 }}"
       home: "{{ item.4 }}"
       shell: "{{ item.5 }}"
       password: "{{ item.6 | password_hash('sha512') }}"
     with_together:
       - "{{ user_name }}"
       - "{{ user_id }}"
       - "{{ group }}"
       - "{{ comment }}"
       - "{{ home_dir }}"
       - "{{ login_shell }}"
       - "{{ password }}"
       - "{{ user_action }}"
       - "{{ password_apply }}"
     when: item.7 == 'present' and password_apply

   - name: create user
     user:
       name: "{{ item.0 }}"
       uid: "{{ item.1 }}"
       group: "{{ item.2 }}"
       comment: "{{ item.3 }}"
       home: "{{ item.4 }}"
       shell: "{{ item.5 }}"
     with_together:
       - "{{ user_name }}"
       - "{{ user_id }}"
       - "{{ group }}"
       - "{{ comment }}"
       - "{{ home_dir }}"
       - "{{ login_shell }}"
       - "{{ user_action }}"
       - "{{ password_apply }}"
     when: item.6 == 'present' and not password_apply

   - name: delete user
     user:
       state: absent
       name: "{{ item.0 }}"
       remove: 'yes'
     with_together:
       - "{{ user_name }}"
       - "{{ user_action }}"
     when: item.1 == 'absent'

.. list-table:: User settings parameters
   :widths: 10 15
   :header-rows: 1

   * - Item 
     - Description
   * - user_name
     -	User name
   * - user_id
     -	User ID
   * - group_id
     -	Group ID
   * - comment
     -	Comment
   * - home_dir
     - Home directory
   * - login_shell
     - Login shell
   * - password
     -	Password
   * - action
     - | Construction settings
       | present: Create/Update
       | absent: Delete
   * - password_apply
     - | Password settings when constructing
       | true: Will configure a password
       | false: Will not configure a password

| From :menuselection:`Create Parameter sheet --> Define/Create Parameter sheet`, register a parameter sheet.

.. tip:: 
   | By configuring :kbd:`Pulldown selection` for the :menuselection:`Input method`, we can reference the datasheet registered in :ref:`groups_legacy_parameter_sheet`.

.. figure:: /images/learn/quickstart/Legacy_answer1/ユーザーパラメータシート作成_1.png
   :width: 1200px
   :alt: User parameter creation 1

.. list-table:: パラメータ項目の設定値(1/2)
   :widths: 10 10 10 10 10 10
   :header-rows: 1
   :class: filter-table

   * - Setting item
     - Item 1 setting value
     - Item 2 setting value
     - Item 3 setting value
     - Item 4 setting value
     - Item 5 setting value
   * - Item name
     - :kbd:`User name`
     - :kbd:`User ID`
     - :kbd:`Password`
     - :kbd:`Password settings`
     - :kbd:`Group`
   * - Item name(Rest API) 
     - :kbd:`user_name`
     - :kbd:`user_id`
     - :kbd:`password`
     - :kbd:`password_apply`
     - :kbd:`group`
   * - Input method
     - :kbd:`String(Single line)`
     - :kbd:`Integer`
     - :kbd:`Password`
     - :kbd:`Pulldown selection`
     - :kbd:`Pulldown selection`
   * - Maximum byte size
     - :kbd:`32`
     - (No item)
     - :kbd:`32`
     - (No item)
     - (No item)
   * - Regular expression
     - 
     - (No item)
     - (No item)
     - (No item)
     - (No item)
   * - Minimum value
     - (No item)
     - :kbd:`1000`
     - (No item)
     - (No item)
     - (No item)
   * - Maximum value
     - (No item)
     - 
     - (No item)
     - (No item)
     - (No item)
   * - Select item
     - (No item)
     - (No item)
     - (No item)
     - :kbd:`Create Parameter sheet:Selection 2:True-False`
     - :kbd:`Input:Group:Group name`
   * - Reference item
     - (No item)
     - (No item)
     - (No item)
     - 
     - 
   * - Default value
     - 
     - 
     - (No item)
     - :kbd:`False`
     - 
   * - Required
     - ✓
     - ✓
     - ✓
     - ✓
     - ✓
   * - Unique restriction
     - ✓
     - ✓
     - 
     - 
     - 
   * - Description
     - 
     - 
     - 
     - 
     - 
   * - Remarks
     - 
     - 
     - 
     - 
     - 

.. figure:: /images/learn/quickstart/Legacy_answer1/ユーザーパラメータシート作成_2.png
   :width: 1200px
   :alt: User parameter sheet creation 2 

.. list-table:: Parameter item setting value(2/2)
   :widths: 10 10 10 10 10
   :header-rows: 1
   :class: filter-table

   * - Setting item
     - Item 6 setting value
     - Item 7 setting value
     - Item 8 setting value
     - Item 9 setting value
   * - Item name
     - :kbd:`Home directory`
     - :kbd:`Login shell`
     - :kbd:`Comment`
     - :kbd:`State`
   * - Item name(Rest API) 
     - :kbd:`home_dir`
     - :kbd:`login_shell`
     - :kbd:`comment`
     - :kbd:`state`
   * - Input method
     - :kbd:`String(Single line)`
     - :kbd:`String(Single line)`
     - :kbd:`String(Single line)`
     - :kbd:`Pulldown selection`
   * - Maximum byte size
     - :kbd:`128`
     - :kbd:`32`
     - :kbd:`128`
     - (No item)
   * - Regular expression
     - 
     - 
     - 
     - (No item)
   * - Minimum value
     - (No item)
     - (No item)
     - (No item)
     - (No item)
   * - Maximum value
     - (No item)
     - (No item)
     - (No item)
     - (No item)
   * - Select item
     - (No item)
     - (No item)
     - (No item)
     - :kbd:`Input:State:present-absent`
   * - Reference item
     - (No item)
     - (No item)
     - (No item)
     - 
   * - Default value
     - 
     - :kbd:`/bin/bash`
     - 
     - 
   * - Required
     - ✓
     - ✓
     - ✓
     - ✓
   * - Unique restriction
     - 
     - 
     - 
     - 
   * - Description
     - 
     - 
     - 
     - 
   * - Remarks
     - 
     - 
     - 
     - 

.. list-table:: Parameter sheet creation information and setting values
   :widths: 5 10
   :header-rows: 1
   :class: filter-table

   * - Item name
     - Setting value
   * - Item number
     - (Automatic)
   * - Parameter sheet name
     - :kbd:`User`
   * - Parameter sheet name(REST)
     - :kbd:`users`
   * - Creation target
     - :kbd:`Parameter sheet(With host/operation)`
   * - Display order
     - :kbd:`3`
   * - Use bundles
     - Check the "Use" box(Activate)
   * - Last updated date/time
     - (Automatic)
   * - Last updated by
     - (Automatic)


Register operation target
==============

| Register the target device where the operations will be executed to.

Register device
--------

| We will use the web01 server registered in the :doc:`previous scenario <Legacy_scenario1>`, meaning no additional steps are required.


Register operation steps
==============

| We will now configure a Movement so it executes the Ansible Playbook so the Group(s) are created/deleted and then the users are created/deleted.
| Up until now, we have only linked 1 Ansible Playbook per movement, but in this one, we will manage both groups and users with 1 Movement.

.. note:: 
   | We can achieve the same result by creating 1 Movement for bboth managing groups and managing users.

Register Movement
-------------

| From :menuselection:`Ansible-Legacy --> Movement list`, register a Movement for managing users.

.. figure:: /images/learn/quickstart/Legacy_answer1/ユーザーMovement登録設定.png
   :width: 1200px
   :alt: Register Movement
   
.. list-table:: Movement information setting value
   :widths: 10 10 10
   :header-rows: 2

   * - Movement name
     - Ansible use information
     - 
   * - 
     - Host specification method
     - Header section
   * - :kbd:`User management`
     - :kbd:`IP`
     - :kbd:`※reference Header section`

.. code-block:: bash
   :caption: Header section

   - hosts: all
     remote_user: "{{ __loginuser__ }}"
     gather_facts: no
     become: yes

Register Ansible Playbook
---------------------

| In this scenario, we will use the Playbook below.  Copy it and create group.yml and user.yml as yml format.

.. code-block:: bash
   :caption: group.yml

   ---
   - name: create/update group
     group:
       name: "{{ item.0 }}"
       gid: "{{ item.1 }}"
     with_together:
       - "{{ group_name }}"
       - "{{ group_id }}"
       - "{{ group_action }}"
     when: item.2 == 'present'

   - name: create/update group
     group:
       name: "{{ item.0 }}"
       gid: "{{ item.1 }}"
     with_together:
       - "{{ group_name }}"
       - "{{ group_id }}"
       - "{{ group_action }}"
     when: item.2 == 'absent'

.. code-block:: bash
   :caption: user.yml

   ---
   - name: create user
     user:
       name: "{{ item.0 }}"
       uid: "{{ item.1 }}"
       group: "{{ item.2 }}"
       comment: "{{ item.3 }}"
       home: "{{ item.4 }}"
       shell: "{{ item.5 }}"
       password: "{{ item.6 | password_hash('sha512') }}"
     with_together:
       - "{{ user_name }}"
       - "{{ user_id }}"
       - "{{ group }}"
       - "{{ comment }}"
       - "{{ home_dir }}"
       - "{{ login_shell }}"
       - "{{ password }}"
       - "{{ user_action }}"
       - "{{ password_apply }}"
     when: item.7 == 'present' and password_apply

   - name: create user
     user:
       name: "{{ item.0 }}"
       uid: "{{ item.1 }}"
       group: "{{ item.2 }}"
       comment: "{{ item.3 }}"
       home: "{{ item.4 }}"
       shell: "{{ item.5 }}"
     with_together:
       - "{{ user_name }}"
       - "{{ user_id }}"
       - "{{ group }}"
       - "{{ comment }}"
       - "{{ home_dir }}"
       - "{{ login_shell }}"
       - "{{ user_action }}"
       - "{{ password_apply }}"
     when: item.6 == 'present' and not password_apply

   - name: delete user
     user:
       state: absent
       name: "{{ item.0 }}"
       remove: 'yes'
     with_together:
       - "{{ user_name }}"
       - "{{ user_action }}"
     when: item.1 == 'absent'


| From :menuselection:`Ansible-Legacy --> Playbook file collection`, register the Playbook above.

.. figure:: /images/learn/quickstart/Legacy_answer1/Ansible-Playbook登録.png
   :width: 1200px
   :alt: Register Ansible-Playbook

.. list-table:: Register Ansible Playbook information
  :widths: 10 20
  :header-rows: 1

  * - Playbook file name
    - Playbook file 
  * - :kbd:`group`
    - :file:`group.yml`
  * - :kbd:`user`
    - :file:`user.yml`

Link Movement and Ansible Playbook
-------------------------------------

| From :menuselection:`Ansible-Legacy --> Movement-Playbook link`, link the Movement with the Ansible Playbooks.
| In this scenario, we will use group.yml and user.yml.
| When creating users, we must first specify the group they belong to, meaning that we will have to include the following display orders.

.. figure:: /images/learn/quickstart/Legacy_answer1/MovementとPlaybook紐付け.png
   :width: 1200px
   :alt: Link Movement and Ansible Playbook

.. list-table:: Register Movement-Playbook link information
  :widths: 10 10 10
  :header-rows: 1

  * - Movement name
    - Playbook file
    - Include order
  * - :kbd:`User management`
    - :kbd:`group.yml`
    - :kbd:`1`
  * - :kbd:`User management`
    - :kbd:`user.yml`
    - :kbd:`2`

Substitute value auto registration settings
------------------

| :menuselection:`Ansible-Legacy --> 代入値自動登録設定` から、パラメータシートの項目と Ansible Playbook の変数の紐付けを行います。
| 大量のデータを一度に登録するような場合には、全件ダウンロード・ファイル一括登録を使って、ファイルからデータを投入する方法が適切です。
| :menuselection:`Ansible-Legacy --> 代入値自動登録設定 --> 全件ダウンロード・ファイル一括登録` から、新規登録用ファイルをダウンロードします。ダウンロードしたファイルを編集し、ファイル一括登録にてファイルを登録すると代入値自動登録設定が簡単に行うことが出来ます。

.. figure:: /images/learn/quickstart/Legacy_answer1/グループの代入値自動登録設定_一括登録.png
   :width: 1200px
   :alt: グループの代入値自動登録設定

.. list-table:: グループの代入値自動登録設定の設定値
  :widths: 40 10 10 20 20 10
  :header-rows: 2

  * - Parameter sheet(From)
    -
    - Registration method
    - Movement name
    - IaC変数(To)
    -
  * - Menu group:Menu:Item
    - Substitute order
    -
    -
    - Movement name:Variable name
    - Substitute order
  * - :kbd:`Substitute value auto registration:Group:Group name`
    - :kbd:`1`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:group_name`
    - :kbd:`1`
  * - :kbd:`Substitute value auto registration:Group:Group ID`
    - :kbd:`1`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:group_id`
    - :kbd:`1`
  * - :kbd:`Substitute value auto registration:Group:State`
    - :kbd:`1`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:group_action`
    - :kbd:`1`
  * - :kbd:`Substitute value auto registration:Group:Group name`
    - :kbd:`2`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:group_name`
    - :kbd:`2`
  * - :kbd:`Substitute value auto registration:Group:Group ID`
    - :kbd:`2`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:group_id`
    - :kbd:`2`
  * - :kbd:`Substitute value auto registration:Group:State`
    - :kbd:`2`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:group_action`
    - :kbd:`2`
  * - :kbd:`...`
    - :kbd:`...`
    - :kbd:`...`
    - :kbd:`...`
    - :kbd:`...`
    - :kbd:`...`
  * - :kbd:`Substitute value auto registration:Group:Group name`
    - :kbd:`5`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:group_name`
    - :kbd:`5`
  * - :kbd:`Substitute value auto registration:Group:Group ID`
    - :kbd:`5`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:group_id`
    - :kbd:`5`
  * - :kbd:`Substitute value auto registration:Group:State`
    - :kbd:`5`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:group_action`
    - :kbd:`5`

.. figure:: /images/learn/quickstart/Legacy_answer1/ユーザーの代入値自動登録設定_一括登録1.png
   :width: 1200px
   :alt: User's Substitute value auto registration settings

.. figure:: /images/learn/quickstart/Legacy_answer1/ユーザーの代入値自動登録設定_一括登録2.png
   :width: 1200px
   :alt: User's Substitute value auto registration settings

.. figure:: /images/learn/quickstart/Legacy_answer1/ユーザーの代入値自動登録設定_一括登録3.png
   :width: 1200px
   :alt: User's Substitute value auto registration settings

.. figure:: /images/learn/quickstart/Legacy_answer1/ユーザーの代入値自動登録設定_一括登録4.png
   :width: 1200px
   :alt: User's Substitute value auto registration settings

.. figure:: /images/learn/quickstart/Legacy_answer1/ユーザーの代入値自動登録設定_一括登録5.png
   :width: 1200px
   :alt: User's Substitute value auto registration settings

.. list-table:: User's Substitute value auto registration settings
  :widths: 40 10 10 20 20 10
  :header-rows: 2

  * - Parameter sheet(From)
    -
    - Registration method
    - Movement name
    - IaC variables(To)
    -
  * - Menu group:Menu:Item
    - Substitute order
    -
    -
    - Movement name:Variable name
    - Substitute order
  * - :kbd:`Substitute value auto registration:ユーザー:User name`
    - :kbd:`1`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_name`
    - :kbd:`1`
  * - :kbd:`Substitute value auto registration:ユーザー:User ID`
    - :kbd:`1`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_id`
    - :kbd:`1`
  * - :kbd:`Substitute value auto registration:ユーザー:パスワード`
    - :kbd:`1`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:password`
    - :kbd:`1`
  * - :kbd:`Substitute value auto registration:ユーザー:Password settings`
    - :kbd:`1`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:password_apply`
    - :kbd:`1`
  * - :kbd:`Substitute value auto registration:ユーザー:グループ`
    - :kbd:`1`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:group`
    - :kbd:`1`
  * - :kbd:`Substitute value auto registration:ユーザー:Home directory`
    - :kbd:`1`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:home_dir`
    - :kbd:`1`
  * - :kbd:`Substitute value auto registration:ユーザー:Login shell`
    - :kbd:`1`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:login_shell`
    - :kbd:`1`
  * - :kbd:`Substitute value auto registration:ユーザー:Comment`
    - :kbd:`1`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:comment`
    - :kbd:`1`
  * - :kbd:`Substitute value auto registration:ユーザー:State`
    - :kbd:`1`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_action`
    - :kbd:`1`
  * - :kbd:`Substitute value auto registration:ユーザー:User name`
    - :kbd:`2`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_name`
    - :kbd:`2`
  * - :kbd:`Substitute value auto registration:ユーザー:User ID`
    - :kbd:`2`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_id`
    - :kbd:`2`
  * - :kbd:`Substitute value auto registration:ユーザー:パスワード`
    - :kbd:`2`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:password`
    - :kbd:`2`
  * - :kbd:`Substitute value auto registration:ユーザー:Password settings`
    - :kbd:`2`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:password_apply`
    - :kbd:`2`
  * - :kbd:`Substitute value auto registration:ユーザー:グループ`
    - :kbd:`2`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:group`
    - :kbd:`2`
  * - :kbd:`Substitute value auto registration:ユーザー:Home directory`
    - :kbd:`2`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:home_dir`
    - :kbd:`2`
  * - :kbd:`Substitute value auto registration:ユーザー:Login shell`
    - :kbd:`2`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:login_shell`
    - :kbd:`2`
  * - :kbd:`Substitute value auto registration:ユーザー:Comment`
    - :kbd:`2`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:comment`
    - :kbd:`2`
  * - :kbd:`Substitute value auto registration:ユーザー:State`
    - :kbd:`2`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_action`
    - :kbd:`2`
  * - :kbd:`Substitute value auto registration:ユーザー:User name`
    - :kbd:`3`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_name`
    - :kbd:`3`
  * - :kbd:`Substitute value auto registration:ユーザー:User ID`
    - :kbd:`3`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_id`
    - :kbd:`3`
  * - :kbd:`Substitute value auto registration:ユーザー:パスワード`
    - :kbd:`3`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:password`
    - :kbd:`3`
  * - :kbd:`Substitute value auto registration:ユーザー:Password settings`
    - :kbd:`3`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:password_apply`
    - :kbd:`3`
  * - :kbd:`Substitute value auto registration:ユーザー:グループ`
    - :kbd:`3`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:group`
    - :kbd:`3`
  * - :kbd:`Substitute value auto registration:ユーザー:Home directory`
    - :kbd:`3`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:home_dir`
    - :kbd:`3`
  * - :kbd:`Substitute value auto registration:ユーザー:Login shell`
    - :kbd:`3`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:login_shell`
    - :kbd:`3`
  * - :kbd:`Substitute value auto registration:ユーザー:Comment`
    - :kbd:`3`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:comment`
    - :kbd:`3`
  * - :kbd:`Substitute value auto registration:ユーザー:State`
    - :kbd:`3`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_action`
    - :kbd:`3`
  * - :kbd:`Substitute value auto registration:ユーザー:User name`
    - :kbd:`4`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_name`
    - :kbd:`4`
  * - :kbd:`Substitute value auto registration:ユーザー:User ID`
    - :kbd:`4`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_id`
    - :kbd:`4`
  * - :kbd:`Substitute value auto registration:ユーザー:パスワード`
    - :kbd:`4`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:password`
    - :kbd:`4`
  * - :kbd:`Substitute value auto registration:ユーザー:Password settings`
    - :kbd:`4`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:password_apply`
    - :kbd:`4`
  * - :kbd:`Substitute value auto registration:ユーザー:グループ`
    - :kbd:`4`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:group`
    - :kbd:`4`
  * - :kbd:`Substitute value auto registration:ユーザー:Home directory`
    - :kbd:`4`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:home_dir`
    - :kbd:`4`
  * - :kbd:`Substitute value auto registration:ユーザー:Login shell`
    - :kbd:`4`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:login_shell`
    - :kbd:`4`
  * - :kbd:`Substitute value auto registration:ユーザー:Comment`
    - :kbd:`4`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:comment`
    - :kbd:`4`
  * - :kbd:`Substitute value auto registration:ユーザー:State`
    - :kbd:`4`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_action`
    - :kbd:`4`
  * - :kbd:`...`
    - :kbd:`...`
    - :kbd:`...`
    - :kbd:`...`
    - :kbd:`...`
    - :kbd:`...`
  * - :kbd:`Substitute value auto registration:ユーザー:User name`
    - :kbd:`10`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_name`
    - :kbd:`10`
  * - :kbd:`Substitute value auto registration:ユーザー:User ID`
    - :kbd:`10`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_id`
    - :kbd:`10`
  * - :kbd:`Substitute value auto registration:ユーザー:パスワード`
    - :kbd:`10`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:password`
    - :kbd:`10`
  * - :kbd:`Substitute value auto registration:ユーザー:Password settings`
    - :kbd:`10`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:password_apply`
    - :kbd:`10`
  * - :kbd:`Substitute value auto registration:ユーザー:グループ`
    - :kbd:`10`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:group`
    - :kbd:`10`
  * - :kbd:`Substitute value auto registration:ユーザー:Home directory`
    - :kbd:`10`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:home_dir`
    - :kbd:`10`
  * - :kbd:`Substitute value auto registration:ユーザー:Login shell`
    - :kbd:`10`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:login_shell`
    - :kbd:`10`
  * - :kbd:`Substitute value auto registration:ユーザー:Comment`
    - :kbd:`10`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:comment`
    - :kbd:`10`
  * - :kbd:`Substitute value auto registration:ユーザー:State`
    - :kbd:`10`
    - :kbd:`Value type`
    - :kbd:`User management`
    - :kbd:`User management:user_action`
    - :kbd:`10`

機器登録
--------

| 作業対象となるサーバーは :doc:`前のシナリオ <Legacy_scenario1>` で登録した web01 を利用するため、作業は不要です。


ユーザー追加作業の実施
======================

| Movement を実行してユーザーとグループを追加します。

作業概要の作成
--------------

| まずは作業計画を立てましょう。

.. list-table:: 作業の方針
   :widths: 5 10
   :header-rows: 0

   * - 作業実施日時
     - 2024/04/04 12:00:00
   * - 作業対象
     - web01(RHEL8)
   * - 作業内容
     - Webサーバーへユーザー追加作業

作業概要登録
------------

| :menuselection:`基本コンソール --> オペレーション一覧` から、作業実施日時や作業名を登録します。

.. figure:: /images/learn/quickstart/Legacy_answer1/オペレーション登録.png
   :width: 1200px
   :alt: Conductor作業実行

.. list-table:: オペレーション登録内容
   :widths: 15 10
   :header-rows: 1

   * - オペレーション名
     - 実施予定日時
   * - :kbd:`Webサーバーへユーザー追加作業`
     - :kbd:`2024/04/04 12:00:00`


パラメータ設定
--------------

| :menuselection:`Input --> グループ` から、グループに対するパラメータを登録します。

.. figure:: /images/learn/quickstart/Legacy_answer1/グループのパラメータ登録.png
   :width: 1200px
   :alt: グループのパラメータ登録

.. list-table:: グループパラメータの設定値
  :widths: 5 20 5 5 5 5
  :header-rows: 2

  * - ホスト名
    - オペレーション
    - Substitute order
    - パラメータ
    - 
    - 
  * - 
    - オペレーション名
    - 
    - Group name
    - Group ID
    - 状態
  * - web01
    - :kbd:`2023/04/04 12:00:00_Webサーバーへユーザー追加作業`
    - :kbd:`1`
    - :kbd:`www`
    - :kbd:`10001`
    - :kbd:`present`
  * - web01
    - :kbd:`2023/04/04 12:00:00_Webサーバーへユーザー追加作業`
    - :kbd:`2`
    - :kbd:`app`
    - :kbd:`10002`
    - :kbd:`present`

| :menuselection:`Input --> User` から、ユーザーに対するパラメータを登録します。

.. figure:: /images/learn/quickstart/Legacy_answer1/ユーザーのパラメータ登録_1.png
   :width: 1200px
   :alt: ユーザのパラメータ登録

.. figure:: /images/learn/quickstart/Legacy_answer1/ユーザーのパラメータ登録_2.png
   :width: 1200px
   :alt: ユーザのパラメータ登録

.. list-table:: ユーザーパラメータの設定値
  :widths: 5 20 5 5 5 5 5 5 10 5 10 5
  :header-rows: 2

  * - ホスト名
    - オペレーション
    - Substitute order
    - パラメータ
    - 
    - 
    - 
    - 
    - 
    - 
    - 
    - 
  * - 
    - オペレーション名
    - 
    - User name
    - User ID
    - パスワード
    - パスワード設定
    - グループ
    - Home directory
    - ログインシェル
    - コメント
    - 状態
  * - web01
    - :kbd:`2024/04/04 12:00:00_Webサーバーへユーザー追加作業`
    - :kbd:`1`
    - :kbd:`wwwuser01`
    - :kbd:`10001`
    - :kbd:`password01`
    - :kbd:`True`
    - :kbd:`www`
    - :kbd:`/home/wwwuser01`
    - :kbd:`/bin/bash`
    - :kbd:`Web server maintainer`
    - :kbd:`present`
  * - web01
    - :kbd:`2024/04/04 12:00:00_Webサーバーへユーザー追加作業`
    - :kbd:`2`
    - :kbd:`wwwuser02`
    - :kbd:`10002`
    - :kbd:`password02`
    - :kbd:`True`
    - :kbd:`www`
    - :kbd:`/home/wwwuser02`
    - :kbd:`/bin/bash`
    - :kbd:`Web server maintainer`
    - :kbd:`present`
  * - web01
    - :kbd:`2024/04/04 12:00:00_Webサーバーへユーザー追加作業`
    - :kbd:`3`
    - :kbd:`appuser01`
    - :kbd:`20001`
    - :kbd:`password01`
    - :kbd:`True`
    - :kbd:`app`
    - :kbd:`/home/appuser01`
    - :kbd:`/bin/bash`
    - :kbd:`Application server maintainer`
    - :kbd:`present`
  * - web01
    - :kbd:`2024/04/04 12:00:00_Webサーバーへユーザー追加作業`
    - :kbd:`4`
    - :kbd:`appuser02`
    - :kbd:`20002`
    - :kbd:`password02`
    - :kbd:`True`
    - :kbd:`app`
    - :kbd:`/home/appuser02`
    - :kbd:`/bin/bash`
    - :kbd:`Application server maintainer`
    - :kbd:`present`

作業実行
--------

1. 事前確認

   | 現在のサーバーの状態を確認しましょう。

   | グループ一覧を確認します。

   .. code-block:: bash
      :caption: コマンド

      # グループ一覧の取得
      cat /etc/group|grep -E "www|app"

   .. code-block:: bash
      :caption: 実行結果

      # 何も表示されない

   | ユーザー一覧を確認します。

   .. code-block:: bash
      :caption: コマンド

      # ユーザー一覧の取得
      cat /etc/passwd|grep -E "www|app"

   .. code-block:: bash
      :caption: 実行結果

      # 何も表示されない

2. 作業実行

   | :menuselection:`Ansible-Legacy --> 作業実行` から、:kbd:`User management` Movement を選択し、:guilabel:` 作業実行` を押下します。
   | 次に、:menuselection:`作業実行設定` で、オペレーションに :kbd:`Webサーバーへユーザー追加作業` を選択し、:guilabel:`作業実行` を押下します。

   | :menuselection:`作業状態確認` 画面が開き、実行が完了した後に、ステータスが「完了」になったことを確認します。

.. figure:: /images/learn/quickstart/Legacy_answer1/作業実行.png
   :width: 1200px
   :alt: 作業実行

1. 事後確認

   | 再度サーバーに下記のグループとユーザーが設定されていることを確認しましょう。

   | グループ一覧を確認します。

   .. code-block:: bash
      :caption: コマンド

      # グループ一覧の取得
      cat /etc/group|grep -E "app|www"

   .. code-block:: bash
      :caption: 実行結果

      www:x:10001:
      app:x:10002:

   | ユーザー一覧を確認します。

   .. code-block:: bash
      :caption: コマンド

      # ユーザー一覧の取得
      cat /etc/passwd|grep -E "app|www"

   .. code-block:: bash
      :caption: 実行結果

      wwwuser01:x:10001:10001:Web server mainterner:/home/wwwuser01:/bin/bash
      wwwuser02:x:10002:10001:Web server mainterner:/home/wwwuser02:/bin/bash
      appuser01:x:20001:10002:Application server mainterner:/home/appuser01:/bin/bash
      appuser02:x:20002:10002:Application server mainterner:/home/appuser02:/bin/bash


(参考) 既存のジョブフローへの追加
=================================

| 本演習では、ジョブフローを利用せずに Movement から直接ユーザー設定作業を実施しましたが、当然ジョブフローの利用も可能です。
| ジョブフローシナリオまでに行ったサーバー構築の一連の作業の中に本演習で作成した Movement を組み込むことで、ホスト名登録、パッケージ導入、ユーザー登録といった一連の作業フローを組み立てることができます。
| この場合の作業の流れは、

1. ジョブフローの作成
2. オペレーション登録
3. ホスト名のパラメータ登録 (パラメータ変更なし)
4. パッケージのパラメータ登録 (パラメータ変更なし)
5. グループのパラメータ登録
6. ユーザーのパラメータ登録
7. ジョブフロー実行

| となります。
| しかし、Exastro IT Automation では、オペレーションと機器の組み合わせごとにパラメータを登録する必要があるため、今回のように、グループとユーザーのみの設定にも関わらず、それ以外のホスト名やパッケージといったパラメータを設定をしなげればなりません。

| このような場合に個別オペレーションを使うことで、Movement ごとにオペレーションを設定することができます。
| ただし、個別オペレーションを使った場合、実行時のオペレーションとは異なるオペレーションによりパラメータが管理されるため、運用上パラメータの見通しが悪くなることもあります。

ジョブフローの編集と実行 (失敗例)
---------------------------------

| :menuselection:`Conductor --> Conductor一覧` から、:kbd:`サーバー構築` の :guilabel:`詳細` を押下し、ジョブフローを編集します。

| 1. 画面上部の :guilabel:` 編集` を押下し、更新モードに移行します。
| 2. 右下のペインに、作成した :kbd:`User management` Movement があるので、これを画面中央にドラッグアンドドロップします。
| 3. 各 Mode 間を下記の様に再接続します。
 
.. list-table:: オブジェクト間の接続
   :widths: 10 10
   :header-rows: 1

   * - OUT
     - IN
   * - :kbd:`Start`
     - :kbd:`ホスト名設定`
   * - :kbd:`ホスト名設定`
     - :kbd:`パッケージ管理`
   * - :kbd:`パッケージ管理`
     - :kbd:`User management`
   * - :kbd:`User management`
     - :kbd:`End`


| 4. 画面上部にある、 :guilabel:` 更新` を押下します。
| 5. :menuselection:`Conductor --> Conductor編集/作業実行` から、:guilabel:` 選択` を押下します。
| 6. :kbd:`サーバー構築` Conductor を選択し、:guilabel:`選択決定` を押下します。
| 7. オペレーションに :kbd:`Webサーバーへユーザー追加作業` を選択し、:guilabel:`作業実行` を押下します。

.. figure:: /images/learn/quickstart/Legacy_answer1/コンダクター実行失敗例.gif
   :width: 1200px
   :alt: 実行失敗

| :menuselection:`Conductor作業確認` 画面が開き、ホスト名設定の Movement が ERROR となり想定外エラーになるはずです。
| これは、:kbd:`Webサーバーへユーザー追加作業` に紐づくホスト名のパラメータがないことにより起こる動作です。

ジョブフローの編集と実行 (成功例)
---------------------------------

| :menuselection:`Conductor --> Conductor一覧` から、:kbd:`サーバー構築` の :guilabel:`詳細` を押下し、再度ジョブフローを編集します。

| 1. 画面上部の :guilabel:` 編集` を押下し、更新モードに移行します。
| 2. 右下のペインに、作成した :kbd:`User management` Movement があるので、これを画面中央にドラッグアンドドロップします。
| 3. 各 Mode に対して下記の様に個別オペレーションを設定します。
 
.. list-table:: 個別オペレーション設定
   :widths: 10 10
   :header-rows: 1

   * - Movement
     - オペレーション名
   * - :kbd:`ホスト名設定`
     - :kbd:`RHEL8のホスト名変更作業`
   * - :kbd:`パッケージ管理`
     - :kbd:`RHEL8のパッケージ管理`
   * - :kbd:`User management`
     - :kbd:`Webサーバーへユーザー追加作業`

| 4. 画面上部にある、 :guilabel:` 更新` を押下します。
| 5. :menuselection:`Conductor --> Conductor編集/作業実行` から、:guilabel:` 選択` を押下します。
| 6. :kbd:`サーバー構築` Conductor を選択し、:guilabel:`選択決定` を押下します。
| 7. オペレーションに :kbd:`Webサーバーへユーザー追加作業` を選択し、:guilabel:`作業実行` を押下します。

.. figure:: /images/learn/quickstart/Legacy_answer1/コンダクター実行成功例.gif
   :width: 1200px
   :alt: 実行成功

| :menuselection:`Conductor作業確認` 画面が開き、実行が完了した後に、全ての Movement のステータスが「Done」になったことを確認します。

まとめ
======

| 本シナリオでは、これまでのシナリオの確認のために、演習課題を実施しました。
| また Conductor のパラメータ連携の1つの手段として、個別オペレーションについて紹介をしました。
| より詳細な情報を知りたい場合は、:doc:`../../../manuals/index` を参照してください。