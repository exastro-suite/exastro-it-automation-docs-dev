========================
Organization settings
========================

.. This is a comment11.

Introduction
========

| This document explains the system settings that can be customized by the Organization administrator
| ※The user must have Organization administrator permission to run the API written in this document.


Pre-requisites
========

| This process requires the following command. Make sure that it is installed.

- Operation client required application

  - :kbd:`curl`

Setting items category
==========================

| This section explains the setting contents for the different categories. For more information, see the corresponding category section.


.. list-table:: Setting item categories
    :widths: 20, 40
    :header-rows: 1
    :align: left

    * - Category
      - Configure contents.
    * - Token
      - Configure API Token's validation period.


Configure Token
==============

| Users can configure the validation period of the refresh_token and access_token used by the API
|
| ※ If the number of validation days are shortened, the validation period of all user issued tokens will also be shortened.
| 　 Note that increasing the number of valudation days will not have the same effect. The validation period of user issued tokens will not by lengthened.

- Confirm settings

  - Command
     
    .. code-block:: bash

       BASEURL="https://severname"
       ORGANAIZATION_ID="Organization ID"
       USERNAME="Username"
       PASSWORD="Password"
   
       curl -u "${USERNAME}:${PASSWORD}" \
       "${BASEURL}/api/${ORGANAIZATION_ID}/platform/setting" \
       | jq ".data.token"

       
  - Execution results

    .. code-block:: bash

       {
        "access_token_lifespan_minutes": 2880,
        "refresh_token_max_lifespan_days": 365,
        "refresh_token_max_lifespan_enabled": true
       }

- Changed settings
  
  - Command
     
    .. code-block:: bash

       BASEURL="https://severname"
       ORGANAIZATION_ID="Organization ID"
       USERNAME="Username"
       PASSWORD="Password" 

       cat <<EOS | curl -u "${USERNAME}:${PASSWORD}" -H "Content-type: application/json" \
       -X PATCH -d @- "${BASEURL}/api/${ORGANAIZATION_ID}/platform/setting"
       {
           "token": {
             "refresh_token_max_lifespan_enabled": true,
             "refresh_token_max_lifespan_days": 365,
             "access_token_lifespan_minutes": 2880
           }
       }
       EOS
       
  - Execution result (success) 

    .. code-block:: bash

        {
        "data": null,
        "message": "SUCCESS",
        "result": "000-00000",
        "ts": "2023-01-24T05:12:16.382Z"
        }


- Item

  .. list-table:: Token item description
      :widths: 20, 40
      :header-rows: 1
      :align: left

      * - Item
        - Contents
      * - refresh_token_max_lifespan_enabled
        -  | Decide whether the refresh_token will have a validation period or not(required).
           | true: With validation period
           | false: No validation period
           | Default: true
      * - refresh_token_max_lifespan_days
        -  | Number of refresh_token validation days
           | ※Required if refresh_token_max_lifespan_enabled=true
           | Default: 365 (1 year)
           | Minimum value: 1
           | Maximum value: 1,095(3 year)
      * - access_token_lifespan_minutes
        -  | Number of minutes the access_token is valid(required)
           | Default: 1,440 (1 days)
           | Minimum value: 1
           | Maximum value: 10,080 (7 days)


