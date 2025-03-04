=======================
User Management (Practice questions)
=======================

| In this scenario, we will make users managable in the Web server created in the :doc:`previous scenario <scenario3>`
| The Ansible Role packages used are the following:

- `User settings <https://github.com/exastro-playbook-collection/OS-RHEL8/tree/master/RH_user/OS_build>`_
- `Group settings <https://github.com/exastro-playbook-collection/OS-RHEL8/tree/master/RH_group/OS_build>`_

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

| :doc:`answer1`