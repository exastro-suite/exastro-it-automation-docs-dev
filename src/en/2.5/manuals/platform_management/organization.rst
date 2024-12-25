===================================
Organization
===================================

Introduction
========

| This document aims to explain Organizations in the Exastro system.


Organizations
========================

| Exastro IT Automation 2.0 introduced the Multitenant function. An Organization is 1 tenant.
| It can be used to logically divide Organization spaces. Even one the same Exastro system, users can create an Organization and have it function as a private environment that will not share files with other Organizations.

| The user will need to create an Organization in order to use the different Exastro applications.


.. figure:: /images/ja/diagram/overview_of_the_Organization.png
    :alt: Operation overview figure

Create Operation
==============================

| This section explains how to create Organizations.

Goal
----

| By creating an Organization, the user will also create an Organization administrator and can access an Endpoint URL for the Organization.
| The following processes will also happen within the system.

- Process

  #. Realm data for the Organization and Administrator user will be registered to Keycloak.
  #. The Organization data will be registered to the relational database (MariaDB, MySQL, etc).
  #. A directory for the Organization will be created to the Exastro IT Automation peristent volume.
  #. A user for the Organization will be registered to GitLab.

Pre-requisites
--------

| The workflow in this document requires the following conditions.

- Conditions

  - After installing the system, the user must be able to log in to the Keycloak management console
  - The user must have the following information required by the System management.

    - Management console URL
    - System administrator User ID
    - System administrator Password

  - The following applications must be installed

    - :kbd:`curl`
    - :kbd:`git`
    - :kbd:`jq`

.. _Organization_creation:

Create Organization
------------------------

| There are 2 diferent ways of creating Organizations.

.. tabs::

   .. group-tab:: Web UI

      - Features

      | Organizations can be created from the Web page.

      - Create

      #. From the menu, select :menuselection:`Organization management`.

         .. figure:: /images/ja/manuals/platform/Organization/org_management.png
            :width: 200px
            :align: left
            :class: with-border-thin

      #. This will display the Organization list. Press the :guilabel:`Create` button and create a new Organization.

         .. figure:: /images/ja/manuals/platform/Organization/オーガナイゼーション一覧_作成.png
            :width: 600px
            :align: left
            :class: with-border-thin

      #. Input information for the new Organization and press the :guilabel:`Register` button.

         .. figure:: /images/ja/manuals/platform/Organization/オーガナイゼーション作成_登録.png
            :width: 600px
            :align: left
            :class: with-border-thin

         .. table:: Organization creation input items.
            :widths: 2 1 2 5
            :align: left

            +----------------------------------+------------------------+------------------------+-------------------------------------------------------------------------------------------------+
            |            Input area            |                      Item name                  |                                           Description                                           |
            +==================================+========================+========================+=================================================================================================+
            | Organization standard informatio\| Organization ID                                 | Specify an unique ID for the Organization.                                                      |
            | n settings                       |                                                 |                                                                                                 |
            |                                  |                                                 | This ID specified will be used to link systems.                                                 |
            +                                  +------------------------+------------------------+-------------------------------------------------------------------------------------------------+
            |                                  | Organization name                               | Specify a name for the Organization.                                                            |
            |                                  |                                                 |                                                                                                 |
            +                                  +------------------------+------------------------+-------------------------------------------------------------------------------------------------+
            |                                  | Resource plan                                   | Specify the Resource plan that will be linked to the Organization.                              |
            |                                  |                                                 |                                                                                                 |
            |                                  |                                                 | If shortened, the default resource plans will be specified.                                     |
            |                                  |                                                 |                                                                                                 |
            |                                  |                                                 | For more information regarding Resource plans, see :doc:`./plan`.                               |
            +----------------------------------+------------------------+------------------------+-------------------------------------------------------------------------------------------------+
            | Organization administrator sett\ | Username                                        | Specify a username for the Organization administrator.                                          |
            | ings                             |                                                 |                                                                                                 |
            +                                  +------------------------+------------------------+-------------------------------------------------------------------------------------------------+
            |                                  | Password                                        | Specify an initial password for the Organization administrator.                                 |
            |                                  |                                                 |                                                                                                 |
            +                                  +------------------------+------------------------+-------------------------------------------------------------------------------------------------+
            |                                  | email                                           | Specify an E-mail address for the Organization administrator.                                   |
            |                                  |                                                 |                                                                                                 |
            +                                  +------------------------+------------------------+-------------------------------------------------------------------------------------------------+
            |                                  | Name                                            | Specify a name for the Organization administrator.                                              |
            |                                  |                                                 |                                                                                                 |
            +                                  +------------------------+------------------------+-------------------------------------------------------------------------------------------------+
            |                                  | Last name                                       | Specify a last name for the Organization administrator.                                         |
            |                                  |                                                 |                                                                                                 |
            +                                  +------------------------+------------------------+-------------------------------------------------------------------------------------------------+
            |                                  | Activate                                        | Specify whether the Organization function should be active or not.                              |
            |                                  |                                                 |                                                                                                 |
            |                                  |                                                 | When creating, make sure this is set to Active.                                                 |
            +----------------------------------+------------------------+------------------------+-------------------------------------------------------------------------------------------------+
            | Exastro IT Automation\           | Install driver                                  | Specify which drivers to install.                                                               |
            | Option settings                  |                                                 |                                                                                                 |
            |                                  |                                                 | Installed drivers cannot be deleted.                                                            |
            +                                  +------------------------+------------------------+-------------------------------------------------------------------------------------------------+
            |                                  |                        | CI/CD for IaC          | For more information regarding the driver, see the following document.                          |
            |                                  |                        |                        |                                                                                                 |
            |                                  |                        |                        | :doc:`../cicd_for_iac/index`                                                                    |
            +                                  +                        +------------------------+-------------------------------------------------------------------------------------------------+
            |                                  |                        | Exastro OASE           | MongoDB is required in order to install Exastro OASE.                                           |
            |                                  |                        |                        | The user must input configurations in order to connect to MongoDB.                              |
            |                                  |                        |                        |                                                                                                 |
            |                                  |                        |                        | ・ Document Store : "mongodb" is fixed.                                                         |
            |                                  |                        |                        |                                                                                                 |
            |                                  |                        |                        | ・ Automatic pay-out : Tick the checkbox if the user is using the MongoDB configured when inst\ |
            |                                  |                        |                        | alling the system                                                                               |
            |                                  |                        |                        | If not, untick the checkbox and input a Python connection string.                               |
            |                                  |                        |                        |                                                                                                 |
            |                                  |                        |                        | ・ Python connection string :Input the Python connection string for the MongoDB the user wants \|
            |                                  |                        |                        | to use.                                                                                         |
            |                                  |                        |                        | The MongoDB account must have root role or similar permissions.                                 |
            |                                  |                        |                        |                                                                                                 |
            |                                  |                        |                        | Example: mongodb://username:password@hostname:27017/                                            |
            |                                  |                        |                        |                                                                                                 |
            |                                  |                        |                        | For more information regarding the driver, see the following document.                          |
            |                                  |                        |                        |                                                                                                 |
            |                                  |                        |                        | :doc:`../oase/index`                                                                            |
            +                                  +                        +------------------------+-------------------------------------------------------------------------------------------------+
            |                                  |                        | Terraform CLI driver   | For more information regarding the driver, see the following document.                          |
            |                                  |                        |                        |                                                                                                 |
            |                                  |                        |                        | :doc:`../terraform_driver/terraform_cli`                                                        |
            +                                  +                        +------------------------+-------------------------------------------------------------------------------------------------+
            |                                  |                        | Terraform Cloud/EP \   | For more information regarding the driver, see the following document.                          |
            |                                  |                        | driver                 |                                                                                                 |
            |                                  |                        |                        | :doc:`../terraform_driver/terraform_cloud_ep`                                                   |
            +----------------------------------+------------------------+------------------------+-------------------------------------------------------------------------------------------------+

   .. group-tab:: Rest API

      - Features

      | In order to create Organizations from an external system, the user must use Rest API.

      - Create

      #. Create Organization

         | Create an Organization using Rest API.
         | The usable Parameters are as following.
         | For more information, see :doc:`../../reference/api/system_manager/platform-api`.

         .. list-table:: Organization creation parameters
            :widths: 25 30 20 35
            :header-rows: 1
            :align: left

            * - Item
              - Description
              - Editable
              - Default value/Selectable setting value
            * - Organization ID
              - | Specify an ID for the Organization.
                | Can contain Half width alphanumeric characters, numbers, hyphen and underscore.
                | Maximum 36 characters.
                | ※The first character must be a non-capitalized alphanumeric letter.
                | ※The ID cannot match reserved phrases (More information further down).
              - Yes
              - :kbd:`org001`
            * - Organization name
              - | Specify a name for the Organization
                | Maximum 255 characters.
              - Yes
              - :kbd:`org001-name`
            * - Organization manager's username
              - Specify a username for the Organization manager (Login ID).
              - Yes
              - :kbd:`admin`
            * - Organization manager's email
              - Specify an E-mail for the Organization manager.
              - Yes
              - :kbd:`admin@example.com`
            * - Organization manager's firstName
              - Specify a name for the Organization manager.
              - Yes
              - :kbd:`admin`
            * - Organization manager's lastName
              - Specify a last name for the Organization manager.
              - Yes
              - :kbd:`admin`
            * - Organization manager's initial password
              - Specify the initial password for the Organization manager.
              - Yes
              - :kbd:`password`
            * - options.sslRequired
              - Specify whether to use SSL connection or not.
              - Yes
              - | :program:`external` (default): If fixed to Private IP Address, the user will be able to conenct to Keycloak without SSL.
                | :program:`none`: Not SSL settings.
                | :program:`all`: Asks for SSL for all IP addresses.(Cannot be selected as the internal API uses HTTP to access.)
            * - optionsIta.drivers
              - | Set to True to install the target driver. Set to False if not installing.
                | If no driver key is input, the value will be set to True by default.
                | MongoDB is needed in order to install Exastro OASE. This item is not available if the system does not have MongoDB ("MONGO_HOST" environment variable is empty)
              - Yes
              - | Specify true/false for the following driver keys. Configure whether to install the driver for when creating workspaces or not. Can be ommited.
                | :program:`ci_cd`: CI/CD for IaC
                | :program:`oase`: Exastro OASE
                | :program:`terraform_cloud_ep`: Terraform Cloud/EP driver
                | :program:`terraform_cli`: Terraform CLI driver
                | Example：:program:`"optionsIta": {"drivers": {"ci_cd": true, "oase": true, "terraform_cli": false, "terraform_cloud_ep": true}}`
            * - optionsIta.services.document_store.name
              - | Required if the optionsIta.drivers' Exastro OASE is active.
                | The value is fixed to "mongodb".
              - No
              - :kbd:`mongodb`
            * - optionsIta.services.document_store.owner
              - | Required parameter if the optionsIta.drivers' Exastro OASE is active.
                | Set to True if using the MongoDB configured when installing the system. If the user is specifying a different MongoDB, set to False. optionsIta.services.document_store.connection_string becomes a required item.
              - Yes
              - :kbd:`true or false`
            * - optionsIta.services.document_store.connection_string
              - | Required parameter if the optionsIta.drivers' Exastro OASE is active.
                | Input MongdoDB's Python connection string.
              - Yes
              - | Example: mongodb://username:password@hostname:27017/

      | If using cURL and Rest API, execute the following commands.
      | The authentication information used by the BASIC authentication are the :kbd:`KEYCLOAK_USER` and :kbd:`KEYCLOAK_PASSWORD` registered in :ref:`create_system_manager`.

      .. warning::
         | The Exastro Platform administrator's authentication information must be configured to :kbd:`BASE64_BASIC` in order to use BASIC authentication.

      | The Exastro Platform's Admin URL information must be configured to :kbd:`BASE_URL`.
      | For example, if the :ref:`Service public settings are (Ingress settings) <ingress_setting>`, it will be like the following.

      .. code-block:: bash

        BASE64_BASIC=$(echo -n "KEYCLOAK_USER:KEYCLOAK_PASSWORD" | base64)
        BASE_URL=http://exastro-suite-mng.example.local

        curl -X 'POST' \
          "${BASE_URL}/api/platform/Organizations" \
          -H 'accept: application/json' \
          -H "Authorization: Basic ${BASE64_BASIC}" \
          -H 'Content-Type: application/json' \
          -d '{
          "id": "org001",
          "name": "org001-name",
          "Organization_managers": [
            {
              "username": "admin",
              "email": "admin@example.com",
              "firstName": "admin",
              "lastName": "admin",
              "credentials": [
                {
                  "type": "password",
                  "value": "password",
                  "temporary": true
                }
              ],
              "requiredActions": [
                "UPDATE_PROFILE"
              ],
              "enabled": true
            }
          ],
          "plan": {},
          "options": {},
          "optionsIta": {
            "drivers": {
              "terraform_cloud_ep": true,
              "terraform_cli": true,
              "ci_cd": true,
              "oase": true
            },
            "services": {
              "document_store": {
                "name": "mongodb",
                "owner": false,
                "connection_string": "mongodb://username:password@hostname:27017/"
              }
            }
          }
        }'



Organization list
------------------------

| There are 2 methods for checking the Organization list.

.. tabs::

   .. group-tab:: Web UI

      Follow the steps below.

      #. From the menu, select :menuselection:`Organization management`.

         .. figure:: /images/ja/manuals/platform/Organization/org_management.png
            :width: 200px
            :align: left
            :class: with-border-thin

      #. | This will display the Organization list where users can see all created Organizations.

         .. figure:: /images/ja/manuals/platform/Organization/オーガナイゼーション一覧_選択.png
            :width: 600px
            :align: left
            :class: with-border-thin

      #. | The user can press any Organization to see more detailed information.

         .. figure:: /images/ja/manuals/platform/Organization/オーガナイゼーション詳細_v2-4.png
            :width: 600px
            :align: left
            :class: with-border-thin

   .. group-tab:: Rest API

     | if using cURL and Rest APi, execute the following commands.

     .. code-block:: bash

      BASE64_BASIC=$(echo -n "Specify System administrator's user name: Specify System administrator's Password" | base64)
      BASE_URL=Specify the System administrator's site URL

      curl -k -X GET \
        -H "Content-Type: application/json" \
        -H "Authorization: basic ${BASE64_BASIC}" \
        -d  @- \
        "${BASE_URL}/api/platform/Organizations"

     | The returned items and their descriptions are as following.

     .. list-table:: Return item description
        :widths: 40, 200
        :header-rows: 1
        :align: left

        * - Item
          - Item contents
        * - data.id
          - Organization ID
        * - data.name
          - Organization name
        * - data.optionsIta.drivers
          - | Status of the driver
            | true:Active false:Not active
        * - data.Organization_managers
          - Organization administrator information
        * - data.active_plan.id
          - Corresponding Plan ID when information was fetched
        * - data.plans
          - Plan information configured by Organization
        * - data.enabled
          - | Organization status
            | true:Active false:Not active
        * - data.status
          - | Organization creation status
            | See later in this document for more information regarding Statuses.

     | When an Organization is being created, the status will change to the following in order.

     .. list-table:: Organization creation status
        :widths: 40, 200
        :header-rows: 1
        :align: left

        * - status value
          - Description
        * - Organization Create Start
          - The Organization creation process has started (Status information registered)
        * - Realm Create Complete
          - Platform Organization realm registered
        * - Client Create Complete
          - Platform application default settings complete
        * - Client Role Setting Complete
          - Platform application role initial settings complete
        * - Service Account Setting Complete
          - Platform service account settings complete
        * - Organization User Create Complete
          - Platform Organization user registration complete
        * - Organization User Role Setting Complete
          - Platform Organization user role settings complete
        * - Organization DB Create Complete
          - Platform Organization DB creation complete
        * - Organization DB Update Complete
          - Platform Organization information DB updated
        * - IT Automation Organization Create Complete
          - IT Automation Organization created and initialized
        * - Organization Plan Create Complete
          - Platform Organization plan settings complet
        * - Realm Enabled Complete
          - Platform Organization activated
        * - Organization Create Complete
          - Organization successfully created.


Edit Organization
------------------------

| Follow the steps below to edit Organizations.

.. tabs::

   .. group-tab:: Web UI

      | Users can change the name of Organizations and configure resource plans linked to the Organization.

      #. From the menu, select :menuselection:`Organization management`.

         .. figure:: /images/ja/manuals/platform/Organization/org_management.png
            :width: 200px
            :align: left
            :class: with-border-thin

      #. | This will display the Organization list. Press the :guilabel:`Edit` button on the line with the desired Organization.

         .. figure:: /images/ja/manuals/platform/Organization/オーガナイゼーション編集.png
            :width: 600px
            :align: left
            :class: with-border-thin

      #. | Users can edit the name of the Organization.

         .. figure:: /images/ja/manuals/platform/Organization/orgname_edit_v2-4.png
            :width: 600px
            :align: left
            :class: with-border-thin

         .. tip::
            | The Organization ID cannot be changed.

      #. | Tick the checkbox for desired driver in order to install it.
         | It is not possible to delete installed drivers.

         .. figure:: /images/ja/manuals/platform/Organization/org_edit_driver_v2-4.png
            :width: 600px
            :align: left
            :class: with-border-thin

      #. | Press the :guilabel:`Resource plan settings` button to link resource plans to the Organization.
         | Select the desired Resource plan ID from the pulldown menu, specify a start date and press the :guilabel:`Apply` button.

         .. figure:: /images/ja/manuals/platform/Organization/オーガナイゼーション編集_リソースプラン設定.png
            :width: 600px
            :align: left
            :class: with-border-thin

      #. | The Resource plan will be added to the Organization line.
         | Check that there are no problems with the contents and press the :guilabel:`Register` button.

         .. figure:: /images/ja/manuals/platform/Organization/オーガナイゼーション編集_登録_v2-4.png
            :width: 600px
            :align: left
            :class: with-border-thin

      #. | In order to remove resource plans from the Organization, press :guilabel:`Release` button to release it from the Organization.

         .. figure:: /images/ja/manuals/platform/Organization/オーガナイゼーション編集_リソースプラン解除_v2-4.png
            :width: 600px
            :align: left
            :class: with-border-thin

      #. | In the release confirmation page, input the  :kbd:`Resource plan ID` and press the :guilabel:`Yes, release` button.

         .. figure:: /images/ja/manuals/platform/Organization/オーガナイゼーション編集_解除確認.png
            :width: 600px
            :align: left
            :class: with-border-thin

      #. | Released resource plan lines will be greyed out.
         | Check that there are no problems with the contents and press the :guilabel:`Register` button.

         .. figure:: /images/ja/manuals/platform/Organization/オーガナイゼーション編集_リソースプラン解除登録_v2-4.png
            :width: 600px
            :align: left
            :class: with-border-thin

      .. tip::
         | Users can link and release resource plans at the same time by performing their respective steps and pressing the :guilabel:`Register` button.

   .. group-tab:: Rest API

     | If using cURL and Rest API, execute the following commands.

     - | Edit Organization

     | The available parameters are as following.
     | For more information, see :doc:`../../reference/api/system_manager/platform-api`.

     .. list-table:: Organization parameters
        :widths: 25 30 20 35
        :header-rows: 1
        :align: left

        * - Item
          - Description
          - Editable
          - Default value/Selectable setting value
        * - Organization name
          - | Specify a name for the Organization
            | Maximum 255 characters.
          - Yes
          - :kbd:`org001-name`
        * - enabled
          - | Select whether the Organization should be usable or not.
          - No
          - :kbd:`true`
        * - optionsIta.driver
          - | Specify install driver.
            | Installed drivers cannot be deleted.
          - | If false, this item can be set to true.
          - :kbd:`true`
        * - optionsIta.services.document_store.name
          - | Required parameter if the optionsIta.drivers' Exastro OASE is active. Not required if Exastro OASE is already active.
            | The value is fixed to "mongodb".
          - No
          - :kbd:`mongodb`
        * - optionsIta.services.document_store.owner
          - | Required parameter if the optionsIta.drivers' Exastro OASE is active. Not required if Exastro OASE is already active.
            | Set to True if using the MongoDB configured when installing the system. If the user is specifying a different MongoDB, set to False. optionsIta.services.document_store.connection_string becomes a required item. optionsIta.services.document_store.connection_string is input required.
          - Yes (Not editable if a value is already configured) 
          - :kbd:`true or false`
        * - optionsIta.services.document_store.connection_string
          - | Required parameter if the optionsIta.drivers' Exastro OASE is active.Not required if Exastro OASe is already active and there are no changes to the value.
            | Input MongdoDB's Python connection string.
          - Yes
          - | Example: mongodb://username:password@hostname:27017/


     .. code-block:: bash

         BASE64_BASIC=$(echo -n "Specify System administrator's user name: Specify System administrator's Password" | base64)
         BASE_URL=Specify the System administrator's site URL
         ORG_ID=Specify the ID of the Organization that will be fetched


         curl -k -X 'PUT' \
           -H "Content-Type: application/json" \
           -H "Authorization: basic ${BASE64_BASIC}" \
           -d  @- \
           "${BASE_URL}/api/platform/Organizations/${ORG_ID}" \
           << EOF
         {
           "name": "name of org1",
           "enabled": true,
           "optionsIta": {
             "drivers": {
               "terraform_cloud_ep": true,
               "terraform_cli": true,
               "ci_cd": true,
               "oase": true
             }
           }
         }

     - | Confirm already configured Organization resource plan

     .. code-block:: bash

         BASE64_BASIC=$(echo -n "Specify System administrator's user name: Specify System administrator's Password" | base64)
         BASE_URL=Specify the System administrator's site URL
         ORG_ID=Specify the ID of the Organization that will be fetched

         curl -k -X GET \
             -H "Content-Type: application/json" \
             -H "Authorization: basic ${BASE64_BASIC}" \
             -d  @- \
             "${BASE_URL}/api/platform/${ORG_ID}/plans"

     - | Configure Resource plan to Organization

     .. code-block:: bash

         BASE64_BASIC=$(echo -n "Specify System administrator's user name: Specify System administrator's Password" | base64)
         BASE_URL=Specify the System administrator's site URL
         ORG_ID=Specify the ID of the Organization that will be linked

         curl -k -X POST \
             -H "Content-Type: application/json" \
             -H "Authorization: basic ${BASE64_BASIC}" \
             -d  @- \
             "${BASE_URL}/api/platform/${ORG_ID}/plans" \
             << EOF
         {
             "id": "plan-standard",
             "start_datetime": "2022-12-01 00:00:00"
         }
         EOF

     - | Release Resource plan from Organization

     .. code-block:: bash

         BASE64_BASIC=$(echo -n "Specify System administrator's user name: Specify System administrator's Password" | base64)
         BASE_URL=Specify the System administrator's site URL
         ORG_ID=Specify the ID of the Organization that will be released
         START_DATETIME=Specify when the Resource plan will be released.(Format: yyyy-mm-dd hh:mm:ss)

         curl -k -X DELETE \
             -H "Content-Type: application/json" \
             -H "Authorization: basic ${BASE64_BASIC}" \
             "${BASE_URL}/api/platform/${ORG_ID}/plans/`echo ${START_DATETIME} | sed 's/ /%20/g;s/:/%3A/g'`"


Delete Organization
------------------------

| There are methods for deleting Organizations.

.. tabs::

   .. group-tab:: Web UI

       | Follow the steps below.

       #. From the menu, select :menuselection:`Organization management`.

          .. figure:: /images/ja/manuals/platform/Organization/org_management.png
             :width: 200px
             :align: left
             :class: with-border-thin

       #. | This will display the Organization list. Press the :guilabel:`Delete` button on the line of the desired Organization.

          .. figure:: /images/ja/manuals/platform/Organization/オーガナイゼーション削除_一覧から選択.png
             :width: 600px
             :align: left
             :class: with-border-thin

       #. | A confirmation window will pop up asking if the user really wants to delete the Organization. If yes, input the :kbd:`platform/The ID of the Organization that will be deleted` and press the :guilabel:`Yes, delete` button.

          .. figure:: /images/ja/manuals/platform/Organization/オーガナイゼーション削除_実行確認.png
             :width: 600px
             :align: left
             :class: with-border-thin

   .. group-tab:: Rest API

      | If using cURL and Rest API, execute the following commands.

      .. code-block:: bash

         BASE64_BASIC=$(echo -n "Specify System administrator's user name: Specify System administrator's Password" | base64)
         BASE_URL=Specify the System administrator's site URL
         ORG_ID=Specify the ID of the Organization that will be deleted

        curl -k -X DELETE \
          -H "Authorization: basic ${BASE64_BASIC}" \
          "${BASE_URL}/api/platform/Organizations/${Organization_ID}"

.. warning::

   | Deleted organizations cannot be restored. 

Access Organization
================================

| The Organization site can be displayed through the Web browser.
| For the Helm chart version, access the EXTERNAL_URL_MNG configured in :ref:`Service Public settings<service_setting>`.
| For the Docker Compose version, access the Exastro Management service URL configured in :ref:`Preparation<docker_prep>`.

.. code-block::
   :caption: Format

   http[s]://{Exastro Platform management URL}:{Exastro Platform management port}/{Organization ID}/platform/


.. code-block::
   :caption: Examples

   # Helm chart version
   http://exastro-suite-mng.example.local:30081/org001/platform/

   # Docker Compose version (RHEL environment)
   http://exastro-suite-mng.example.local:81/org001/platform/

   # Docker Compose版 (Non-RHEL environment)
   http://exastro-suite-mng.example.local:30081/org001/platform/


Other restrictions/Remarks
====================

Organization ID reserved phrases
------------------------------

| The Organization ID cannot contain words matching the following phrases.

- master
- platform
- account
- account-console
- admin-cli
- broker
- realm-management
- security-admin-console
- \*-workspaces
- system-\*-auth


Re-creating Organizations
----------------------------------------

| If an Organization failed to be created, rerunning the Organization creation process will not work and display an error like this: "The specified Organization (xxx)has already been created".
| If the user is unable to create an Organization with the same ID of an already failed Organization, add the :kbd:`--retry` option to the command parameter.

.. code-block:: bash

   ./exastro-platform/tools/create-Organization.sh --retry

.. code-block:: bash

   ./exastro-platform/tools/create-Organization.sh ./exastro-platform/tools/create-Organization.sample.json
