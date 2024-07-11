=======================
User Management (Practice problems)
=======================

| In this scenario, user will have to manage users to the Web server created in the :doc:`previous scenarios <scenario3>`.
| The Ansible Role packages used are as following.

- `User settings <https://github.com/exastro-playbook-collection/OS-RHEL8/tree/master/RH_user/OS_build>`_
- `Group settings <https://github.com/exastro-playbook-collection/OS-RHEL8/tree/master/RH_group/OS_build>`_

Problem
====

| We advice that the user becomes able to use Exastro IT Automation to configure the following users.
| By doing so, users will not only know how to manage users, but also how to configure host names and manage packages as well.

.. list-table:: User information
  :widths: 10 10 10 10
  :header-rows: 1

  * - Username
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


answer
====

| :doc:`answer1`