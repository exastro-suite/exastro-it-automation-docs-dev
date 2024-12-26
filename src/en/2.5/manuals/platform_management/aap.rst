================================
Ansible Automation Platform link
================================

Introduction
====

| This document aims to explain how System administrators can control Ansible Core and/or Ansible Automation controller usage for users.


Register Ansible Automation Controller
====================================

| By registering a Ansible Automation Controller, users can create job templates by combining "Projects", "Inventories" and "Authentication information" and execute them with Ansible.
| By combining multiple "Job templates" together,  users can create a "Workflow template". This can be used to create more varied workflows.

Pre-requisites
--------

| The workflow in this document requires that the following commands can be run. Make sure that they are installed.

- Operation client required applications

  - :kbd:`curl`
  - :kbd:`git`
  - :kbd:`jq`
 
Steps to register
--------

| There are two ways to register Ansible Automation Controller to Exastro IT Automation.

.. tabs::

   .. group-tab:: Using setting file and scripts

      - Features
       
      | Compared to registering using Rest API, this method does not require the user to prepare any parameter information. We recommend this method for user that does not want to prepare any extra information.

      - Registration method

      | Execute the Shell script from the files fetched from the GitHub repository and register an Ansible Automation Controller.

      #. Fetch the Ansible Automation Controller registration shell script from the Repository with :kbd:`git clone`.

         .. code-block:: bash
            :caption: Command

            # Acquire Exastro Platform files
            git clone https://github.com/exastro-suite/exastro-platform.git

      #. Configure the Exastro system's Management endpoint URL to the :kbd:`CONF_BASE_URL` in the setting file.

         .. code-block:: bash
            :caption: Command

            # Register settings information in order to connect to the Exastro Platform
            vi ./exastro-platform/tools/api-auth.conf

         | For example, if the :ref:`Service public settings are (Ingress settings) <ingress_setting>`, it will be like the following.

         .. code-block:: diff
            :caption: api-auth.conf
     
            - CONF_BASE_URL=http://platform-auth:8001
            + CONF_BASE_URL=http://exastro-suite-mng.example.local
              CURL_OPT=-sv
        
         .. tip::
       | If the user is using a self-signed certificate, a certificate error will occur.
       | Changing the :kbd:`CURL_OPT=-sv` within the setting file to :kbd:`CURL_OPT=-svk` prevents the error from occuring, but it is recommended that the user installs a valid certificate.
            
      #. Configure Ansible Automation Controller information

         | The setting file is created based on the JSON file specified by the Ansible Automation Controller information created based on :file:`./exastro-platform/tools/initial-settings-ansible.sample.json`

         .. code-block:: bash
            :caption: Command

            cp -pi ./exastro-platform/tools/initial-settings-ansible{.sample,}.json

            vi ./exastro-platform/tools/initial-settings-ansible.json


         .. raw:: html

            <details> 
              <summary>initial-settings-ansible.sample.json</summary>

         .. code-block:: json

            {
              "input_limit_setting": true,
              "execution_engine_list": [
                "Ansible Automation Controller"
              ],
              "initial_data": {
                "ansible_automation_controller_host_list": [
                  {
                    "file": {
                      "ssh_private_key_file": "LS0tLS1CRUdJTiBPUEVOU1NIIFBSSVZBVEUgS0VZLS0tLS0KYjNCbGJuTnphQzFyWlhrdGRqRUFBQUFBQkc1dmJtVUFBQUFFYm05dVpRQUFBQUFBQUFBQkFBQUJsd0FBQUFkemMyZ3RjbgpOaEFBQUFBd0VBQVFBQUFZRUF0V0ZvVVA5ZkZSRlhUTTV0U2s4cmU1dTVEVjNqclF3VVd5d2swMkwrZ0tkNElsOFQ4TnBkCk40Z3ZGVkMxM1VueGNxc1pxVWdEWk41NnphSnMrdThQcTBlVjl2R0dkWmZDcU11OHRrbzh5WUw2MGQ2VUVoVXFOVVJkb1UKSEJ3bngzbjZidlNWMVE0em56V0JBNVBqOFl3SENiL0swVGFEMndvMkRkbFhqTXhhTlpXTXlpRFVMbE1pSk02VFdCU0lYMwo2emE5ZnI2cGFmak5Vc0hBTk9YSTdGbUFQcC9Jcy80TmtJVkhZN2M1UkJkUTUvNWgrTCtxRmlVazhKbE9vcFdnMjJOWWlXCkpKUGM0U09iTWxtRUY1OEdMdloxZTlCS0FvaXEvdWIvVmlhZG9hRFlyTzlEM0U3UW1NTldWMjNNMnMyN2tnS0ZKcFJJSUMKbmllZlJyaTdkOVhEYldoclBFY1FlRUMyZnNrRzVyY3Q0RFhrQUtVVCtSTkdwMll6bWZqSHlHNkRPWkJIa1RCNnJ5OVF3SgpRaFpFTjEvM3k2K0Q1V1BpbWlxeVFBNmtXdnZYZUtHWkhzZEhLdG5QaGZra1EyUWlteFgyWFRHaGZwdjRSUkUzZWNGUmxRClQvenRLeWg5enIzWmd4UU1nWHgwdEJ5V2dZSUJwZVZHa1dFTTVkeTNBQUFGa1BlMkRlYjN0ZzNtQUFBQUIzTnphQzF5YzIKRUFBQUdCQUxWaGFGRC9YeFVSVjB6T2JVcFBLM3VidVExZDQ2ME1GRnNzSk5OaS9vQ25lQ0pmRS9EYVhUZUlMeFZRdGQxSgo4WEtyR2FsSUEyVGVlczJpYlBydkQ2dEhsZmJ4aG5XWHdxakx2TFpLUE1tQyt0SGVsQklWS2pWRVhhRkJ3Y0o4ZDUrbTcwCmxkVU9NNTgxZ1FPVDQvR01Cd20veXRFMmc5c0tOZzNaVjR6TVdqV1ZqTW9nMUM1VElpVE9rMWdVaUY5K3Mydlg2K3FXbjQKelZMQndEVGx5T3haZ0Q2ZnlMUCtEWkNGUjJPM09VUVhVT2YrWWZpL3FoWWxKUENaVHFLVm9OdGpXSWxpU1QzT0VqbXpKWgpoQmVmQmk3MmRYdlFTZ0tJcXY3bS8xWW1uYUdnMkt6dlE5eE8wSmpEVmxkdHpOck51NUlDaFNhVVNDQXA0bm4wYTR1M2ZWCncyMW9henhIRUhoQXRuN0pCdWEzTGVBMTVBQ2xFL2tUUnFkbU01bjR4OGh1Z3ptUVI1RXdlcTh2VU1DVUlXUkRkZjk4dXYKZytWajRwb3Fza0FPcEZyNzEzaWhtUjdIUnlyWno0WDVKRU5rSXBzVjlsMHhvWDZiK0VVUk4zbkJVWlVFLzg3U3NvZmM2OQoyWU1VRElGOGRMUWNsb0dDQWFYbFJwRmhET1hjdHdBQUFBTUJBQUVBQUFHQkFMRHVJTzBKL3YwMUdqeXhETWswNjB5N2ZjCnM5TUErb3ZkNmw5QkpEK2RFVUM4c3poZWNuaTFEVlJtQjdoN3dpR2lYcUk3RU9yMGpoQVZmQVBxQ1ZQR3F1L09tVGRyOFUKMSswQ09NWjFLbEREdE5tdVRqQkpkdy9ZN2FDVTNXWlROZm1GeE51QzdKbUsrUWFKWk4yRWZTZVRjWVlNYXViL2JtUWc1RwpXZkhka1kyOW9VVzJ1bU9wOHArRzV4SS9qVHZpQXpHS3dmWG5FaUkxKzc0anQzZndTVzFkUEExKzVFUDRVZmphRUdwUlQzCnpaTlFnTTgrWDdNVWJyRklTdjJzQ0VWSU54cGJDSE9iQkRZcTdodUljeDdKUVEvcW5EMVJGdFhBa3d4M1ZkMFF4elZUTDUKZXF6ci9jc3h6S3l1M08yVE5weWVodE1SWVB6M2dXZ2xieFI1SStObWl1VGlTQWFHa1o2OXJqblY0bVNmL25xUnJwUWRpeAozS1E1bUZldVNUUFdEdXZQNFdWNlJybzBPajRjalZnNTlGNHVWM05xQmpvMFpXYmt1QnhZeDRBK2hsZjcwMmdMLzVMZTBPCllTc1dFS0U5aFhueHZ5b0NBUTBCLy9meDFnaHkxY2xQWi9JR3FpWDYwUEQrY0FmTnFWNmt6aFo5WmZmQmVOZ2x3NThRQUEKQU1FQTBqbVF4VVc2WW9ZRnovUFg5aXgrNEd3VXh4WWFTdlVYRDJHZGt4cGtkYS9EV3lKUlJFd1FjTzhPQTdhWUFhV0hxSwp1T1ZCWVJlY3h0Z01SbzUreUNpZjVoNE9HNzVyVEtSQ0NRLy9Td2hyS25iQjFoOVJ0Q2dWNjlSd0tMSUhxcXo0dGQ0V20wCkw0NmFtditjd0ZrVVdxOFRtdzNkR1NlV3AydURQcjVxSjVGWDlEdmZRWUNKSEVkNThnN2lESXdzMUd3VExKaTJ3L0J1QlEKbzB2MUw4dGo0eG1MTUxpcW1zdDZLRHM3cHBlOGpJYTgycHVTSUJ1ZWJ5Y3pKdXljcmNBQUFBd1FEbU5SV25qcisxWmJSdgpPRjJVT2hGQ2I2UVlpQkFsTzVuWVZQUnQ2amhMWmdvMjlkUVUwUmRnYzNObmtOdzY1ZFpQbnZVMTlaamkzcFBlRnVQczJQCnEyaDg1aFNCK3VRR3JodEovRGM2MU1ZS2k5cjkxQmtvd0ZHSDR3YW9mSUsyYmF1V2VFMGg3UFFmajhrSzZVbndLbnpPSTcKc1o2anJTZStxaHQwMzkxUzhTb2F1bkhnMXNsOTRYS092bG1RQUpQMHNuS2VMcGIyalZIR0ZTR0JRdG1GQUh2aXV6Zm5nUgpGc3hrd2ROSU1ERGxLNmxVMnFhbkppL0NBM0VOQldDLzhBQUFEQkFNbXoyUkVEbllkSjM0N2prWWFDNzNHdGtjWDZDN0NxCjZ6cGRXQkZ6Zjd0NkhJbzJMdUlPenVFa2IxV0VjOFZibTBHbTA1YkZ4YnFEYjF2OWpJRmErTG9qTHVOUmFoSEZHVFRRUDYKTk9DMzA2SDd2TWgwMStNUVJNaERKYW9GRlRRVy9uSVBIQldwcDVJNzFVN0FNa0d6cXJoWVU5dlVNSXBNS2taQUQyYWF3dwpreUp6eFZzTFhUQXhrT3BVU3lWZmJsZVBKZXJpVmIydmVXbm5RUmRnRm02empSeXpSTXlYODFkaldzelNDTVZUeWI2YW9GCjdBYjZPZzlib0lnRmVQU1FBQUFCTnpjR2hwYm5oQU1qWmxNR05pWkRrM05UZGxBUUlEQkFVRwotLS0tLUVORCBPUEVOU1NIIFBSSVZBVEUgS0VZLS0tLS0K"
                    },
                    "parameter": {
                      "host": "aap.example.com",
                      "authentication_method": "Key authentication(No passphrase)",
                      "user": "awx",
                      "password": null,
                      "ssh_private_key_file": "aap_id_rsa",
                      "passphrase": null,
                      "ansible_automation_controller_port": null,
                      "execution_node": "False",
                      "remarks": null
                    }
                  }
                ],
                "interface_info_ansible": {
                  "parameter": {
                    "execution_engine": "Ansible Automation Controller",
                    "representative_server": "aap.example.com",
                    "ansible_automation_controller_protocol": "https",
                    "ansible_automation_controller_port": "443",
                    "organization_name": null,
                    "authentication_token": "LwWw3dwoHGx19ZhP1YQZU0JdZzobFv",
                    "delete_runtime_data": "True",
                    "proxy_address": null,
                    "proxy_port": null
                  }
                }
              }
            }

         .. raw:: html

            </details>

         | See the following for more information regarding the different parameters.

         .. raw:: html

           <details> 
             <summary>Parameters when registering Ansible Automation Controller(Displayed・Hidden)</summary>

         .. include:: ../../include/api_option_initial_settings_ansible.rst

         .. tip::
             | ※ Distributing public key file required for configuring Key authentication (Keys exchanged).
             | ・For Ansible Core
             | SSH connect from the execution host of the server where Ansible is installed (User configured to Ansible common console=> Interface information) to the target host.
             | Copy the execution user's public key file to the login destination user's "authorized_keys".
             |
             | ・ For Ansible Automation Controller
             | SSH connect from the Ansible Automation Controller's awx to the target host.
             | Copy the awx user's public key file to the login destination user's "authorized_keys". Then from the browser, log in to the Ansible Automation Controller and configure "/var/lib/awx/.ssh/" to "Settings"→"Job"→"Divided job publication path"

         .. raw:: html

           </details> 

        
      #. Create Ansible Automation Controller

         .. code-block:: bash
            :caption: Command

            ./exastro-platform/tools/initial-settings-ansible.sh ./exastro-platform/tools/initial-settings-ansible.json

            organization id : INPUT-ORGANIZATION-ID-TO-SET # Configuration destination's Organization ID

            your username : INPUT-YOUR-USERNAME # System admin username
            your password : INPUT-USER-PASSWORD # System admin password

            Create an organization, are you sure? (Y/other) : Y # Inputing Y starts the Ansible Automation Controller registration process.


         -  Results when execution succeeds

            The result "000-00000" means that the Ansible Automation Controller has been successfully created.
            
            .. code-block:: bash
               :caption: Execution results(Success)

               ...
               < HTTP/1.1 200 OK
               < Date: Thu, 18 Aug 2022 01:49:13 GMT
               < Server: Apache/2.4.37 (Red Hat Enterprise Linux) mod_wsgi/4.7.1 Python/3.9
               < Content-Length: 107
               < Content-Type: application/json
               < 
               {
                 "data": null, 
                 "message": "SUCCESS", 
                 "result": "000-00000", 
                 "ts": "2022-08-18T01:49:17.251Z"
               }
               * Connection #0 to host platform-auth left intact


         -  Results when execution fails

            .. code-block:: bash
               :caption: Execution results(Failure)
 
               ...
               < HTTP/1.1 400 BAD REQUEST
               < Date: Thu, 18 Aug 2022 05:29:35 GMT
               < Server: Apache/2.4.37 (Red Hat Enterprise Linux) mod_wsgi/4.7.1 Python/3.9
               < Content-Length: 252
               < Connection: close
               < Content-Type: application/json
               <
               { [252 bytes data]
               * Closing connection 0
               {
                 "data": null,
                 "message": "Error message,
                 "result": "Error code",
                 "ts": "2022-08-18T05:29:35.643Z"
               }

   .. group-tab:: Using Rest API

      - Features

      | Registering using Rest API is recommended for registering Ansible Automation Controller from external systems.

      - Registration method

      1. SSH key file encoding

         | As the user neds to upload a SSH hidden key, they will have to encode it with Base64.

         .. code-block::
           :caption: Command
   
           MY_KEY=`base64 -w 0 my-aac-key.pem`

      2. Command

         | The Organization ID must be configured to :kbd:`ORG_ID`.
         | In order to use Basic authentication, the System administrator's authentication information must be configured to :kbd:`BASE64_BASIC`.
         | The authentication information is the same as the information:ref:`registered when installing <create_system_manager>`.
         | If using cURL, use the following commands.


         | See below for more information regarding the different parameters.

         .. raw:: html
          
            <details> 
              <summary>Parameters when registering Ansible Automation Controller</summary>

         .. include:: ../../include/api_option_initial_settings_ansible.rst
          
         .. raw:: html
          
            </details> 

         .. code-block:: bash
            :caption: Command

            ORG_ID=org001
            BASE64_BASIC=$(echo -n "KEYCLOAK_USER:KEYCLOAK_PASSWORD" | base64)
            BASE_URL=http://exastro-suite-mng.example.local

            curl -X 'POST' \
              "http://${BASE_URL}/api/ita/${ORG_ID}/initial-settings/ansible/" \
              -H 'accept: application/json' \
              -H "Authorization: Basic ${BASE64_BASIC}" \
              -H 'Content-Type: application/json' \
              -d '{
                    "input_limit_setting": true,
                    "execution_engine_list": [
                      "Ansible Automation Controller"
                    ],
                    "initial_data": {
                      "ansible_automation_controller_host_list": [
                        {
                          "file": {
                            "ssh_private_key_file": "LS0tLS1CRUdJTiBPUEVOU1NIIFBSSVZBVEUgS0VZLS0tLS0KYjNCbGJuTnphQzFyWlhrdGRqRUFBQUFBQkc1dmJtVUFBQUFFYm05dVpRQUFBQUFBQUFBQkFBQUJsd0FBQUFkemMyZ3RjbgpOaEFBQUFBd0VBQVFBQUFZRUF0V0ZvVVA5ZkZSRlhUTTV0U2s4cmU1dTVEVjNqclF3VVd5d2swMkwrZ0tkNElsOFQ4TnBkCk40Z3ZGVkMxM1VueGNxc1pxVWdEWk41NnphSnMrdThQcTBlVjl2R0dkWmZDcU11OHRrbzh5WUw2MGQ2VUVoVXFOVVJkb1UKSEJ3bngzbjZidlNWMVE0em56V0JBNVBqOFl3SENiL0swVGFEMndvMkRkbFhqTXhhTlpXTXlpRFVMbE1pSk02VFdCU0lYMwo2emE5ZnI2cGFmak5Vc0hBTk9YSTdGbUFQcC9Jcy80TmtJVkhZN2M1UkJkUTUvNWgrTCtxRmlVazhKbE9vcFdnMjJOWWlXCkpKUGM0U09iTWxtRUY1OEdMdloxZTlCS0FvaXEvdWIvVmlhZG9hRFlyTzlEM0U3UW1NTldWMjNNMnMyN2tnS0ZKcFJJSUMKbmllZlJyaTdkOVhEYldoclBFY1FlRUMyZnNrRzVyY3Q0RFhrQUtVVCtSTkdwMll6bWZqSHlHNkRPWkJIa1RCNnJ5OVF3SgpRaFpFTjEvM3k2K0Q1V1BpbWlxeVFBNmtXdnZYZUtHWkhzZEhLdG5QaGZra1EyUWlteFgyWFRHaGZwdjRSUkUzZWNGUmxRClQvenRLeWg5enIzWmd4UU1nWHgwdEJ5V2dZSUJwZVZHa1dFTTVkeTNBQUFGa1BlMkRlYjN0ZzNtQUFBQUIzTnphQzF5YzIKRUFBQUdCQUxWaGFGRC9YeFVSVjB6T2JVcFBLM3VidVExZDQ2ME1GRnNzSk5OaS9vQ25lQ0pmRS9EYVhUZUlMeFZRdGQxSgo4WEtyR2FsSUEyVGVlczJpYlBydkQ2dEhsZmJ4aG5XWHdxakx2TFpLUE1tQyt0SGVsQklWS2pWRVhhRkJ3Y0o4ZDUrbTcwCmxkVU9NNTgxZ1FPVDQvR01Cd20veXRFMmc5c0tOZzNaVjR6TVdqV1ZqTW9nMUM1VElpVE9rMWdVaUY5K3Mydlg2K3FXbjQKelZMQndEVGx5T3haZ0Q2ZnlMUCtEWkNGUjJPM09VUVhVT2YrWWZpL3FoWWxKUENaVHFLVm9OdGpXSWxpU1QzT0VqbXpKWgpoQmVmQmk3MmRYdlFTZ0tJcXY3bS8xWW1uYUdnMkt6dlE5eE8wSmpEVmxkdHpOck51NUlDaFNhVVNDQXA0bm4wYTR1M2ZWCncyMW9henhIRUhoQXRuN0pCdWEzTGVBMTVBQ2xFL2tUUnFkbU01bjR4OGh1Z3ptUVI1RXdlcTh2VU1DVUlXUkRkZjk4dXYKZytWajRwb3Fza0FPcEZyNzEzaWhtUjdIUnlyWno0WDVKRU5rSXBzVjlsMHhvWDZiK0VVUk4zbkJVWlVFLzg3U3NvZmM2OQoyWU1VRElGOGRMUWNsb0dDQWFYbFJwRmhET1hjdHdBQUFBTUJBQUVBQUFHQkFMRHVJTzBKL3YwMUdqeXhETWswNjB5N2ZjCnM5TUErb3ZkNmw5QkpEK2RFVUM4c3poZWNuaTFEVlJtQjdoN3dpR2lYcUk3RU9yMGpoQVZmQVBxQ1ZQR3F1L09tVGRyOFUKMSswQ09NWjFLbEREdE5tdVRqQkpkdy9ZN2FDVTNXWlROZm1GeE51QzdKbUsrUWFKWk4yRWZTZVRjWVlNYXViL2JtUWc1RwpXZkhka1kyOW9VVzJ1bU9wOHArRzV4SS9qVHZpQXpHS3dmWG5FaUkxKzc0anQzZndTVzFkUEExKzVFUDRVZmphRUdwUlQzCnpaTlFnTTgrWDdNVWJyRklTdjJzQ0VWSU54cGJDSE9iQkRZcTdodUljeDdKUVEvcW5EMVJGdFhBa3d4M1ZkMFF4elZUTDUKZXF6ci9jc3h6S3l1M08yVE5weWVodE1SWVB6M2dXZ2xieFI1SStObWl1VGlTQWFHa1o2OXJqblY0bVNmL25xUnJwUWRpeAozS1E1bUZldVNUUFdEdXZQNFdWNlJybzBPajRjalZnNTlGNHVWM05xQmpvMFpXYmt1QnhZeDRBK2hsZjcwMmdMLzVMZTBPCllTc1dFS0U5aFhueHZ5b0NBUTBCLy9meDFnaHkxY2xQWi9JR3FpWDYwUEQrY0FmTnFWNmt6aFo5WmZmQmVOZ2x3NThRQUEKQU1FQTBqbVF4VVc2WW9ZRnovUFg5aXgrNEd3VXh4WWFTdlVYRDJHZGt4cGtkYS9EV3lKUlJFd1FjTzhPQTdhWUFhV0hxSwp1T1ZCWVJlY3h0Z01SbzUreUNpZjVoNE9HNzVyVEtSQ0NRLy9Td2hyS25iQjFoOVJ0Q2dWNjlSd0tMSUhxcXo0dGQ0V20wCkw0NmFtditjd0ZrVVdxOFRtdzNkR1NlV3AydURQcjVxSjVGWDlEdmZRWUNKSEVkNThnN2lESXdzMUd3VExKaTJ3L0J1QlEKbzB2MUw4dGo0eG1MTUxpcW1zdDZLRHM3cHBlOGpJYTgycHVTSUJ1ZWJ5Y3pKdXljcmNBQUFBd1FEbU5SV25qcisxWmJSdgpPRjJVT2hGQ2I2UVlpQkFsTzVuWVZQUnQ2amhMWmdvMjlkUVUwUmRnYzNObmtOdzY1ZFpQbnZVMTlaamkzcFBlRnVQczJQCnEyaDg1aFNCK3VRR3JodEovRGM2MU1ZS2k5cjkxQmtvd0ZHSDR3YW9mSUsyYmF1V2VFMGg3UFFmajhrSzZVbndLbnpPSTcKc1o2anJTZStxaHQwMzkxUzhTb2F1bkhnMXNsOTRYS092bG1RQUpQMHNuS2VMcGIyalZIR0ZTR0JRdG1GQUh2aXV6Zm5nUgpGc3hrd2ROSU1ERGxLNmxVMnFhbkppL0NBM0VOQldDLzhBQUFEQkFNbXoyUkVEbllkSjM0N2prWWFDNzNHdGtjWDZDN0NxCjZ6cGRXQkZ6Zjd0NkhJbzJMdUlPenVFa2IxV0VjOFZibTBHbTA1YkZ4YnFEYjF2OWpJRmErTG9qTHVOUmFoSEZHVFRRUDYKTk9DMzA2SDd2TWgwMStNUVJNaERKYW9GRlRRVy9uSVBIQldwcDVJNzFVN0FNa0d6cXJoWVU5dlVNSXBNS2taQUQyYWF3dwpreUp6eFZzTFhUQXhrT3BVU3lWZmJsZVBKZXJpVmIydmVXbm5RUmRnRm02empSeXpSTXlYODFkaldzelNDTVZUeWI2YW9GCjdBYjZPZzlib0lnRmVQU1FBQUFCTnpjR2hwYm5oQU1qWmxNR05pWkRrM05UZGxBUUlEQkFVRwotLS0tLUVORCBPUEVOU1NIIFBSSVZBVEUgS0VZLS0tLS0K"
                          },
                          "parameter": {
                            "host": "aap.example.com",
                            "authentication_method": "Key authentication (No passphrase)",
                            "user": "awx",
                            "password": null,
                            "ssh_private_key_file": "aap_id_rsa",
                            "passphrase": null,
                            "ansible_automation_controller_port": null,
                            "execution_node": "False",
                            "remarks": null
                          }
                        }
                      ],
                      "interface_info_ansible": {
                        "parameter": {
                          "execution_engine": "Ansible Automation Controller",
                          "representative_server": "aap.example.com",
                          "ansible_automation_controller_protocol": "https",
                          "ansible_automation_controller_port": "443",
                          "organization_name": null,
                          "authentication_token": "LwWw3dwoHGx19ZhP1YQZU0JdZzobFv",
                          "delete_runtime_data": "True",
                          "proxy_address": null,
                          "proxy_port": null
                        }
                      }
                    }
                  }'

Confirm Ansible Automation Contoller link
---------------------------------------

#. Check the Organization creation results.

.. tabs::

   .. group-tab:: Using Setting file and Script

      .. code-block:: bash
         :caption: Command
    
         ./exastro-platform/tools/get-initial-settings-ansible.sh
          
         organization id : INPUT-ORGANIZATION-ID-TO-SET # Configuration destination's Organization ID
    
         your username : INPUT-YOUR-USERNAME # System admin username
         your password : INPUT-USER-PASSWORD # System admin password

      -  Results

         The result "000-00000" means that the Ansible Automation Controller has been successfully created.
          
         .. code-block:: json
            :caption: Execution results(Success)

            {
              "data": {
                "execution_engine_list": [
                  "Ansible Automation Controller"
                ],
                "initial_data": {
                  "ansible_automation_controller_host_list": [
                    {
                      "file": {
                        "ssh_private_key_file": "LS0tLS1CRUdJTiBPUEVOU1NIIFBSSVZBVEUgS0VZLS0tLS0KYjNCbGJuTnphQzFyWlhrdGRqRUFBQUFBQkc1dmJtVUFBQUFFYm05dVpRQUFBQUFBQUFBQkFBQUJsd0FBQUFkemMyZ3RjbgpOaEFBQUFBd0VBQVFBQUFZRUF0V0ZvVVA5ZkZSRlhUTTV0U2s4cmU1dTVEVjNqclF3VVd5d2swMkwrZ0tkNElsOFQ4TnBkCk40Z3ZGVkMxM1VueGNxc1pxVWdEWk41NnphSnMrdThQcTBlVjl2R0dkWmZDcU11OHRrbzh5WUw2MGQ2VUVoVXFOVVJkb1UKSEJ3bngzbjZidlNWMVE0em56V0JBNVBqOFl3SENiL0swVGFEMndvMkRkbFhqTXhhTlpXTXlpRFVMbE1pSk02VFdCU0lYMwo2emE5ZnI2cGFmak5Vc0hBTk9YSTdGbUFQcC9Jcy80TmtJVkhZN2M1UkJkUTUvNWgrTCtxRmlVazhKbE9vcFdnMjJOWWlXCkpKUGM0U09iTWxtRUY1OEdMdloxZTlCS0FvaXEvdWIvVmlhZG9hRFlyTzlEM0U3UW1NTldWMjNNMnMyN2tnS0ZKcFJJSUMKbmllZlJyaTdkOVhEYldoclBFY1FlRUMyZnNrRzVyY3Q0RFhrQUtVVCtSTkdwMll6bWZqSHlHNkRPWkJIa1RCNnJ5OVF3SgpRaFpFTjEvM3k2K0Q1V1BpbWlxeVFBNmtXdnZYZUtHWkhzZEhLdG5QaGZra1EyUWlteFgyWFRHaGZwdjRSUkUzZWNGUmxRClQvenRLeWg5enIzWmd4UU1nWHgwdEJ5V2dZSUJwZVZHa1dFTTVkeTNBQUFGa1BlMkRlYjN0ZzNtQUFBQUIzTnphQzF5YzIKRUFBQUdCQUxWaGFGRC9YeFVSVjB6T2JVcFBLM3VidVExZDQ2ME1GRnNzSk5OaS9vQ25lQ0pmRS9EYVhUZUlMeFZRdGQxSgo4WEtyR2FsSUEyVGVlczJpYlBydkQ2dEhsZmJ4aG5XWHdxakx2TFpLUE1tQyt0SGVsQklWS2pWRVhhRkJ3Y0o4ZDUrbTcwCmxkVU9NNTgxZ1FPVDQvR01Cd20veXRFMmc5c0tOZzNaVjR6TVdqV1ZqTW9nMUM1VElpVE9rMWdVaUY5K3Mydlg2K3FXbjQKelZMQndEVGx5T3haZ0Q2ZnlMUCtEWkNGUjJPM09VUVhVT2YrWWZpL3FoWWxKUENaVHFLVm9OdGpXSWxpU1QzT0VqbXpKWgpoQmVmQmk3MmRYdlFTZ0tJcXY3bS8xWW1uYUdnMkt6dlE5eE8wSmpEVmxkdHpOck51NUlDaFNhVVNDQXA0bm4wYTR1M2ZWCncyMW9henhIRUhoQXRuN0pCdWEzTGVBMTVBQ2xFL2tUUnFkbU01bjR4OGh1Z3ptUVI1RXdlcTh2VU1DVUlXUkRkZjk4dXYKZytWajRwb3Fza0FPcEZyNzEzaWhtUjdIUnlyWno0WDVKRU5rSXBzVjlsMHhvWDZiK0VVUk4zbkJVWlVFLzg3U3NvZmM2OQoyWU1VRElGOGRMUWNsb0dDQWFYbFJwRmhET1hjdHdBQUFBTUJBQUVBQUFHQkFMRHVJTzBKL3YwMUdqeXhETWswNjB5N2ZjCnM5TUErb3ZkNmw5QkpEK2RFVUM4c3poZWNuaTFEVlJtQjdoN3dpR2lYcUk3RU9yMGpoQVZmQVBxQ1ZQR3F1L09tVGRyOFUKMSswQ09NWjFLbEREdE5tdVRqQkpkdy9ZN2FDVTNXWlROZm1GeE51QzdKbUsrUWFKWk4yRWZTZVRjWVlNYXViL2JtUWc1RwpXZkhka1kyOW9VVzJ1bU9wOHArRzV4SS9qVHZpQXpHS3dmWG5FaUkxKzc0anQzZndTVzFkUEExKzVFUDRVZmphRUdwUlQzCnpaTlFnTTgrWDdNVWJyRklTdjJzQ0VWSU54cGJDSE9iQkRZcTdodUljeDdKUVEvcW5EMVJGdFhBa3d4M1ZkMFF4elZUTDUKZXF6ci9jc3h6S3l1M08yVE5weWVodE1SWVB6M2dXZ2xieFI1SStObWl1VGlTQWFHa1o2OXJqblY0bVNmL25xUnJwUWRpeAozS1E1bUZldVNUUFdEdXZQNFdWNlJybzBPajRjalZnNTlGNHVWM05xQmpvMFpXYmt1QnhZeDRBK2hsZjcwMmdMLzVMZTBPCllTc1dFS0U5aFhueHZ5b0NBUTBCLy9meDFnaHkxY2xQWi9JR3FpWDYwUEQrY0FmTnFWNmt6aFo5WmZmQmVOZ2x3NThRQUEKQU1FQTBqbVF4VVc2WW9ZRnovUFg5aXgrNEd3VXh4WWFTdlVYRDJHZGt4cGtkYS9EV3lKUlJFd1FjTzhPQTdhWUFhV0hxSwp1T1ZCWVJlY3h0Z01SbzUreUNpZjVoNE9HNzVyVEtSQ0NRLy9Td2hyS25iQjFoOVJ0Q2dWNjlSd0tMSUhxcXo0dGQ0V20wCkw0NmFtditjd0ZrVVdxOFRtdzNkR1NlV3AydURQcjVxSjVGWDlEdmZRWUNKSEVkNThnN2lESXdzMUd3VExKaTJ3L0J1QlEKbzB2MUw4dGo0eG1MTUxpcW1zdDZLRHM3cHBlOGpJYTgycHVTSUJ1ZWJ5Y3pKdXljcmNBQUFBd1FEbU5SV25qcisxWmJSdgpPRjJVT2hGQ2I2UVlpQkFsTzVuWVZQUnQ2amhMWmdvMjlkUVUwUmRnYzNObmtOdzY1ZFpQbnZVMTlaamkzcFBlRnVQczJQCnEyaDg1aFNCK3VRR3JodEovRGM2MU1ZS2k5cjkxQmtvd0ZHSDR3YW9mSUsyYmF1V2VFMGg3UFFmajhrSzZVbndLbnpPSTcKc1o2anJTZStxaHQwMzkxUzhTb2F1bkhnMXNsOTRYS092bG1RQUpQMHNuS2VMcGIyalZIR0ZTR0JRdG1GQUh2aXV6Zm5nUgpGc3hrd2ROSU1ERGxLNmxVMnFhbkppL0NBM0VOQldDLzhBQUFEQkFNbXoyUkVEbllkSjM0N2prWWFDNzNHdGtjWDZDN0NxCjZ6cGRXQkZ6Zjd0NkhJbzJMdUlPenVFa2IxV0VjOFZibTBHbTA1YkZ4YnFEYjF2OWpJRmErTG9qTHVOUmFoSEZHVFRRUDYKTk9DMzA2SDd2TWgwMStNUVJNaERKYW9GRlRRVy9uSVBIQldwcDVJNzFVN0FNa0d6cXJoWVU5dlVNSXBNS2taQUQyYWF3dwpreUp6eFZzTFhUQXhrT3BVU3lWZmJsZVBKZXJpVmIydmVXbm5RUmRnRm02empSeXpSTXlYODFkaldzelNDTVZUeWI2YW9GCjdBYjZPZzlib0lnRmVQU1FBQUFCTnpjR2hwYm5oQU1qWmxNR05pWkRrM05UZGxBUUlEQkFVRwotLS0tLUVORCBPUEVOU1NIIFBSSVZBVEUgS0VZLS0tLS0K"
                      },
                      "parameter": {
                        "authentication_method": "\u9375\u8a8d\u8a3c(\u30d1\u30b9\u30d5\u30ec\u30fc\u30ba\u306a\u3057)",
                        "host": "aap.example.com",
                        "ansible_automation_controller_port": null,
                        "execution_node": "False",
                        "passphrase": null,
                        "password": null,
                        "remarks": null,
                        "ssh_private_key_file": "aap_id_rsa",
                        "user": "awx"
                      }
                    }
                  ],
                  "interface_info_ansible": {
                    "parameter": {
                      "ansible_automation_controller_port": "443",
                      "ansible_automation_controller_protocol": "https",
                      "authentication_token": "LwWw3dwoHGx19ZhP1YQZU0JdZzobFv",
                      "delete_runtime_data": "True",
                      "execution_engine": "Ansible Automation Controller",
                      "organization_name": null,
                      "proxy_address": null,
                      "proxy_port": null,
                      "representative_server": "aap.example.com"
                    }
                  }
                },
                "input_limit_setting": true
              },
              "message": "SUCCESS",
              "result": "000-00000",
              "ts": "2023-02-03T14:47:10.185Z"
            }     


      -  Results when execution fails

         .. code-block:: bash
            :caption: Execution results(Failure)

            ...
            < HTTP/1.1 400 BAD REQUEST
            < Date: Thu, 18 Aug 2022 05:29:35 GMT
            < Server: Apache/2.4.37 (Red Hat Enterprise Linux) mod_wsgi/4.7.1 Python/3.9
            < Content-Length: 252
            < Connection: close
            < Content-Type: application/json
            <
            { [252 bytes data]
            * Closing connection 0
            {
              "data": null,
              "message": "Error message,
              "result": "Error code",
              "ts": "2022-08-18T05:29:35.643Z"
            }

   .. group-tab:: Using Rest API

      .. code-block:: bash
         :caption: Command
    
         curl -X 'GET' \
           'http://exastro-suite-mng.example.local/api/ita/org001/initial-settings/ansible/' \
            -H 'accept: application/json'

      -  Execution results

         The result "000-00000" means that the Ansible Automation Controller has been successfully created.
          
         .. code-block:: json
            :caption: Execution results(Success)

            {
              "data": {
                "execution_engine_list": [
                  "Ansible Automation Controller"
                ],
                "initial_data": {
                  "ansible_automation_controller_host_list": [
                    {
                      "file": {
                        "ssh_private_key_file": "LS0tLS1CRUdJTiBPUEVOU1NIIFBSSVZBVEUgS0VZLS0tLS0KYjNCbGJuTnphQzFyWlhrdGRqRUFBQUFBQkc1dmJtVUFBQUFFYm05dVpRQUFBQUFBQUFBQkFBQUJsd0FBQUFkemMyZ3RjbgpOaEFBQUFBd0VBQVFBQUFZRUF0V0ZvVVA5ZkZSRlhUTTV0U2s4cmU1dTVEVjNqclF3VVd5d2swMkwrZ0tkNElsOFQ4TnBkCk40Z3ZGVkMxM1VueGNxc1pxVWdEWk41NnphSnMrdThQcTBlVjl2R0dkWmZDcU11OHRrbzh5WUw2MGQ2VUVoVXFOVVJkb1UKSEJ3bngzbjZidlNWMVE0em56V0JBNVBqOFl3SENiL0swVGFEMndvMkRkbFhqTXhhTlpXTXlpRFVMbE1pSk02VFdCU0lYMwo2emE5ZnI2cGFmak5Vc0hBTk9YSTdGbUFQcC9Jcy80TmtJVkhZN2M1UkJkUTUvNWgrTCtxRmlVazhKbE9vcFdnMjJOWWlXCkpKUGM0U09iTWxtRUY1OEdMdloxZTlCS0FvaXEvdWIvVmlhZG9hRFlyTzlEM0U3UW1NTldWMjNNMnMyN2tnS0ZKcFJJSUMKbmllZlJyaTdkOVhEYldoclBFY1FlRUMyZnNrRzVyY3Q0RFhrQUtVVCtSTkdwMll6bWZqSHlHNkRPWkJIa1RCNnJ5OVF3SgpRaFpFTjEvM3k2K0Q1V1BpbWlxeVFBNmtXdnZYZUtHWkhzZEhLdG5QaGZra1EyUWlteFgyWFRHaGZwdjRSUkUzZWNGUmxRClQvenRLeWg5enIzWmd4UU1nWHgwdEJ5V2dZSUJwZVZHa1dFTTVkeTNBQUFGa1BlMkRlYjN0ZzNtQUFBQUIzTnphQzF5YzIKRUFBQUdCQUxWaGFGRC9YeFVSVjB6T2JVcFBLM3VidVExZDQ2ME1GRnNzSk5OaS9vQ25lQ0pmRS9EYVhUZUlMeFZRdGQxSgo4WEtyR2FsSUEyVGVlczJpYlBydkQ2dEhsZmJ4aG5XWHdxakx2TFpLUE1tQyt0SGVsQklWS2pWRVhhRkJ3Y0o4ZDUrbTcwCmxkVU9NNTgxZ1FPVDQvR01Cd20veXRFMmc5c0tOZzNaVjR6TVdqV1ZqTW9nMUM1VElpVE9rMWdVaUY5K3Mydlg2K3FXbjQKelZMQndEVGx5T3haZ0Q2ZnlMUCtEWkNGUjJPM09VUVhVT2YrWWZpL3FoWWxKUENaVHFLVm9OdGpXSWxpU1QzT0VqbXpKWgpoQmVmQmk3MmRYdlFTZ0tJcXY3bS8xWW1uYUdnMkt6dlE5eE8wSmpEVmxkdHpOck51NUlDaFNhVVNDQXA0bm4wYTR1M2ZWCncyMW9henhIRUhoQXRuN0pCdWEzTGVBMTVBQ2xFL2tUUnFkbU01bjR4OGh1Z3ptUVI1RXdlcTh2VU1DVUlXUkRkZjk4dXYKZytWajRwb3Fza0FPcEZyNzEzaWhtUjdIUnlyWno0WDVKRU5rSXBzVjlsMHhvWDZiK0VVUk4zbkJVWlVFLzg3U3NvZmM2OQoyWU1VRElGOGRMUWNsb0dDQWFYbFJwRmhET1hjdHdBQUFBTUJBQUVBQUFHQkFMRHVJTzBKL3YwMUdqeXhETWswNjB5N2ZjCnM5TUErb3ZkNmw5QkpEK2RFVUM4c3poZWNuaTFEVlJtQjdoN3dpR2lYcUk3RU9yMGpoQVZmQVBxQ1ZQR3F1L09tVGRyOFUKMSswQ09NWjFLbEREdE5tdVRqQkpkdy9ZN2FDVTNXWlROZm1GeE51QzdKbUsrUWFKWk4yRWZTZVRjWVlNYXViL2JtUWc1RwpXZkhka1kyOW9VVzJ1bU9wOHArRzV4SS9qVHZpQXpHS3dmWG5FaUkxKzc0anQzZndTVzFkUEExKzVFUDRVZmphRUdwUlQzCnpaTlFnTTgrWDdNVWJyRklTdjJzQ0VWSU54cGJDSE9iQkRZcTdodUljeDdKUVEvcW5EMVJGdFhBa3d4M1ZkMFF4elZUTDUKZXF6ci9jc3h6S3l1M08yVE5weWVodE1SWVB6M2dXZ2xieFI1SStObWl1VGlTQWFHa1o2OXJqblY0bVNmL25xUnJwUWRpeAozS1E1bUZldVNUUFdEdXZQNFdWNlJybzBPajRjalZnNTlGNHVWM05xQmpvMFpXYmt1QnhZeDRBK2hsZjcwMmdMLzVMZTBPCllTc1dFS0U5aFhueHZ5b0NBUTBCLy9meDFnaHkxY2xQWi9JR3FpWDYwUEQrY0FmTnFWNmt6aFo5WmZmQmVOZ2x3NThRQUEKQU1FQTBqbVF4VVc2WW9ZRnovUFg5aXgrNEd3VXh4WWFTdlVYRDJHZGt4cGtkYS9EV3lKUlJFd1FjTzhPQTdhWUFhV0hxSwp1T1ZCWVJlY3h0Z01SbzUreUNpZjVoNE9HNzVyVEtSQ0NRLy9Td2hyS25iQjFoOVJ0Q2dWNjlSd0tMSUhxcXo0dGQ0V20wCkw0NmFtditjd0ZrVVdxOFRtdzNkR1NlV3AydURQcjVxSjVGWDlEdmZRWUNKSEVkNThnN2lESXdzMUd3VExKaTJ3L0J1QlEKbzB2MUw4dGo0eG1MTUxpcW1zdDZLRHM3cHBlOGpJYTgycHVTSUJ1ZWJ5Y3pKdXljcmNBQUFBd1FEbU5SV25qcisxWmJSdgpPRjJVT2hGQ2I2UVlpQkFsTzVuWVZQUnQ2amhMWmdvMjlkUVUwUmRnYzNObmtOdzY1ZFpQbnZVMTlaamkzcFBlRnVQczJQCnEyaDg1aFNCK3VRR3JodEovRGM2MU1ZS2k5cjkxQmtvd0ZHSDR3YW9mSUsyYmF1V2VFMGg3UFFmajhrSzZVbndLbnpPSTcKc1o2anJTZStxaHQwMzkxUzhTb2F1bkhnMXNsOTRYS092bG1RQUpQMHNuS2VMcGIyalZIR0ZTR0JRdG1GQUh2aXV6Zm5nUgpGc3hrd2ROSU1ERGxLNmxVMnFhbkppL0NBM0VOQldDLzhBQUFEQkFNbXoyUkVEbllkSjM0N2prWWFDNzNHdGtjWDZDN0NxCjZ6cGRXQkZ6Zjd0NkhJbzJMdUlPenVFa2IxV0VjOFZibTBHbTA1YkZ4YnFEYjF2OWpJRmErTG9qTHVOUmFoSEZHVFRRUDYKTk9DMzA2SDd2TWgwMStNUVJNaERKYW9GRlRRVy9uSVBIQldwcDVJNzFVN0FNa0d6cXJoWVU5dlVNSXBNS2taQUQyYWF3dwpreUp6eFZzTFhUQXhrT3BVU3lWZmJsZVBKZXJpVmIydmVXbm5RUmRnRm02empSeXpSTXlYODFkaldzelNDTVZUeWI2YW9GCjdBYjZPZzlib0lnRmVQU1FBQUFCTnpjR2hwYm5oQU1qWmxNR05pWkRrM05UZGxBUUlEQkFVRwotLS0tLUVORCBPUEVOU1NIIFBSSVZBVEUgS0VZLS0tLS0K"
                      },
                      "parameter": {
                        "authentication_method": "\u9375\u8a8d\u8a3c(\u30d1\u30b9\u30d5\u30ec\u30fc\u30ba\u306a\u3057)",
                        "host": "aap.example.com",
                        "ansible_automation_controller_port": null,
                        "execution_node": "False",
                        "passphrase": null,
                        "password": null,
                        "remarks": null,
                        "ssh_private_key_file": "aap_id_rsa",
                        "user": "awx"
                      }
                    }
                  ],
                  "interface_info_ansible": {
                    "parameter": {
                      "ansible_automation_controller_port": "443",
                      "ansible_automation_controller_protocol": "https",
                      "authentication_token": "LwWw3dwoHGx19ZhP1YQZU0JdZzobFv",
                      "delete_runtime_data": "True",
                      "execution_engine": "Ansible Automation Controller",
                      "organization_name": null,
                      "proxy_address": null,
                      "proxy_port": null,
                      "representative_server": "aap.example.com"
                    }
                  }
                },
                "input_limit_setting": true
              },
              "message": "SUCCESS",
              "result": "000-00000",
              "ts": "2023-02-03T14:47:10.185Z"
            }


      -  Results when execution fails

         .. code-block:: bash
            :caption: Execution results(Failure)

            ...
            < HTTP/1.1 400 BAD REQUEST
            < Date: Thu, 18 Aug 2022 05:29:35 GMT
            < Server: Apache/2.4.37 (Red Hat Enterprise Linux) mod_wsgi/4.7.1 Python/3.9
            < Content-Length: 252
            < Connection: close
            < Content-Type: application/json
            <
            { [252 bytes data]
            * Closing connection 0
            {
              "data": null,
              "message": "Error message,
              "result": "Error code",
              "ts": "2022-08-18T05:29:35.643Z"
            }


Other restrictions / Remarks
--------------------

Re-registering Ansible Automation Controller
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| In order to re-register the Ansible Automation Controller, edit the settings file and re-run the script.

.. code-block:: bash
   :caption: Command

   vi ./exastro-platform/tools/initial-settings-ansible.json

.. code-block:: bash
   :caption: Command

   ./exastro-platform/tools/initial-settings-ansible.sh ./exastro-platform/tools/initial-settings-ansible.json

