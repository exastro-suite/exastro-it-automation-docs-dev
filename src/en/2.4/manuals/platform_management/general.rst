============
Login
============

Introduction
------------

| This document aims to explain how to log in to the System management page.

.. _system_manager_login:

Login
------------

#. | When logging in, make sure to have both the username and password prepared.

   .. figure:: /images/ja/manuals/platform/login/exastro-login_v2-4.png
      :alt: Login
      :width: 600px
      :align: left
      :class: with-border-thin

   .. list-table:: Item description
      :widths: 40 200
      :header-rows: 1
      :align: left

      * - Item name
        - Description
      * - | Username
        - | System manager username specified when installed
          | e.g. admin ※
      * - | Password
        - | System manager password specified when installed
          | e.g. password ※

   .. tip::
             |  Make sure to use the System manager's Username and Password specified when installing the system.
             |  For Username and Password when Docker version is installed, see :ref:`install_docker_compose`.
             |  For Username and Password when helm version is installed, see :ref:`install_helm`.

#. | After logged in, an Organization management page similar to the one below will be displayed.

   .. figure:: /images/ja/manuals/platform/login/login_platform_manager.png
      :alt: Organization management page (List)
      :width: 600px
      :align: left
      :class: with-border-thin

.. include:: ../it_automation_base/setting_profile.rst