
.. list-table:: Parameters when registering Ansible Automation Controller
   :widths: 15 20 15
   :header-rows: 1
   :align: left
   :class: filter-table
        
   * - Parameter
     - Description
     - Setting value
   * - Input_limit_setting
     - | Decides whether the user can edit :menuselection:`Ansible common --> Interface information` (partly※) 
     and :menuselection:`Ansible Automation Controller Host list`.
       | ▼ Items in :menuselection:`Ansible common --> Interface information` that will have input limits applied:
       | - :menuselection:`Execution engine`
       | - :menuselection:`Ansible Automation Controller Interface`
       | - :menuselection:`Proxy`
     - | :program:`true`: Cannot edit from Exastro IT Automation page
       | :program:`false`: Can edit from Exastro IT Automation page
   * - execution_engine_list
     - | Specify items for the options in :menuselection:`Ansible common --> Interface information --> Execution engine`.
     - | :kbd:`Ansible-Core`: Ansible community version
       | :kbd:`Ansible Automation Controller`: Red Hat Ansible Automation Controller
       | One of the following or both.
   * - initial_data.ansible_automation_controller_host_list[*].file.ssh_private_key_file
     - Base64 encoded value for the secret key file needed to connect to Ansible Automation Controller.
     - Base64 encoded string for secret key file.
   * - initial_data.ansible_automation_controller_host_list[*].parameter.host
     - Specify host name for Ansible Automation Controller control node.
     - Ansible Automation Controller control node host name
   * - initial_data.ansible_automation_controller_host_list[*].parameter.authentication_method
     - | Select authentication method
       | Select the authentication method used when connecting from Ansible Core or Ansible Automation Controller to the execution target device. 
     - | :kbd:`Password authentication` : Requires login password and selecting ● for the login password management.
       | :kbd:`Key authentication(No passphrase)` : Requires SSH secret key file(id_ras).
       | :kbd:`Key authentication(With passphrase)` : RequiresSSH secret key file(id_ras) and passphrase.
       | :kbd:`Key authentication(Key exchanged)` : No need to upload SSH secret key file(id_ras).
   * - initial_data.ansible_automation_controller_host_list[*].parameter.user
     - | Specify Username if SSH connecting to Ansible Automation Controller.
       | Write control for Project path(/var/lib/awx/projects) requried
     - | awx
   * - initial_data.ansible_automation_controller_host_list[*].parameter.password
     - | Specify password for Password authentication.
       | ※ Maximum 128 bytes
     - Free string
   * - initial_data.ansible_automation_controller_host_list[*].parameter.ssh_private_key_file
     - File name for the Secret key file required to connect to Ansible Automation Controller.
     - File name for the secret key file
   * - initial_data.ansible_automation_controller_host_list[*].parameter.passphrase
     - | Specify passphrase if a passphrase is configured to the SSH secret key file
       | ※ Maximum 256 bytes
     - Passphrase
   * - initial_data.ansible_automation_controller_host_list[*].parameter.ansible_automation_controller_port
     - Specify port number for ssh connecting to Ansible Automation Controller. If nothing is selected, 22 will be used.
     - Port number
   * - initial_data.ansible_automation_controller_host_list[*].parameter.execution_node
     - Specify whether this node is an Ansible Automation Controller Execution node or not.
     - | :kbd:`True` : Execution node
       | :kbd:`False` : Not Execution node
       | Key name can be isolated_tower instead of execution_node.
   * - initial_data.ansible_automation_controller_host_list[*].parameter.remarks
     - Remarks
     - Free string
   * - initial_data.parameter.execution_engine
     - | Execution engine specification
     - | :kbd:`Ansible-Core`: Ansible community version
       | :kbd:`Ansible Automation Controller`: Red Hat Ansible Automation Controller
       | Specify one of the above.
   * - initial_data.parameter.representative_server
     - | Host
       | Select an Ansible Automation Controller host that will connect to Exastro IT Automation from the hosts registered in :menuselection:`Ansible Automation Controller Host list`.
       | ※ If Execution engine is Ansible Automation Controller, input is required
     - Ansible Automation Controller host
   * - initial_data.parameter.ansible_automation_controller_protocol
     - | Select the connection protocol to the Ansible Automation Controller server. Select either :kbd:`http` or :kbd:`https`. 
       | Standard is https.
       | ※ If Execution engine is Ansible Automation Controller, input is required
     - | :kbd:`http`
       | :kbd:`https`
       | One of the above.
   * - initial_data.parameter.ansible_automation_controller_port
     - | Input the Ansible Automation Controller server connection port(80/443). Standard is HTTPS(443). 
       | ※ If Execution engine is Ansible Automation Controller, input is required
     - Port number
   * - initial_data.parameter.organization_name
     - | Select Organization name registered in the Ansible Automation Controller server. 
       | ※ Required if the Execution engine is not Ansible Core.
     - Organization name string
   * - initial_data.parameter.authentication_token
     - | Input the authentication token for the user that will connect from Exastro IT Automation to Ansible Automation Controller.
       | ※ If Execution engine is Ansible Automation Controller, input is required
     - Authentication token string
   * - initial_data.parameter.delete_runtime_data
     - | Select whether temporary data generated by Exastro IT Automation and Ansible Automation Controller are deleted or not after execution.
       | ※ If Execution engine is Ansible Automation Controller, input is required
     - | :kbd:`True` : Deletes resources after execution
       | :kbd:`False` : Does not delete resources after execution
   * - initial_data.parameter.proxy_address
     - | If Exastro IT Automation is under a Proxy environment, users might have to configure settings in order to communicate with the Ansible/ Ansible Automation Controller server.
       | If the Proxy server URL is http://proxy.example.com:8080 input :kbd:`http://proxy.example.com`.
       | ※ Maximum 128 bytes
     - Proxy server URL
   * - initial_data.parameter.proxy_port
     - | If Exastro IT Automation is under a Proxy environment, users might have to configure settings in order to communicate with the Ansible/ Ansible Automation Controller server.
       | If the Proxy server URL is http://proxy.example.com:8080, input :kbd:`8080`.
     - Proxy server port number