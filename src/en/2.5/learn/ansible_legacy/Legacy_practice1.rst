=======================
User Management (Practice questions)
=======================

| In this scenario, we will make users managable in the Web server created in the :doc:`previous scenario <Legacy_scenario3>`
| The Ansible Playbooks used are the following:

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

Questions
====

| Create and manage the following users in Exastro IT Automation.
| Make sure to not only manage users, but to also configure host names and manage packages.

.. list-table:: User information
  :widths: 10 10 10 10
  :header-rows: 1

  * - User name
    - User ID
    - Group name
    - Login password
  * - wwwuser01
    - 10001
    - www
    - password01
  * - wwwuser01
    - 10002
    - www
    - password02
  * - appuser01
    - 20001
    - app
    - password01
  * - appuser01
    - 20002
    - app
    - password02


Answers
====

| :doc:`Legacy_answer1`