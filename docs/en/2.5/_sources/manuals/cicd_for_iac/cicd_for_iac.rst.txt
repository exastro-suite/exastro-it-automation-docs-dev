=================
CI/CD For IaC function
=================

Introdction
********

| This document aims to explain how to use the CI/CD for IaC function.


Terminology
**********

| The terminology used in this document is as following.

.. table:: Terminology list
   
   +------------+--------------------------------------------------------+
   | Terminology     | Contents                                          |
   +============+========================================================+
   | ITA        | Abbreviation for "Exastro IT Automation".              |
   +------------+--------------------------------------------------------+
   | Link source file |Displays the files within the git repository \    |
   |            |  linked with the CI/CD for IaC function                |
   +------------+--------------------------------------------------------+
   | Link destination file | The user can upload files\                  |
   |            | from the following menus found\                        |
   |            | in the "Ansible-Driver", "Terraform-Cloud/EP-Driver"\  |
   |            | and "Terraform-CLI-Driver" menus.                      |
   |            |                                                        |
   |            | - Ansible-Legacy/Playbook file collection              |
   |            |                                                        |
   |            | - Ansible-Pioneer/Interactive file collection          |
   |            |                                                        |
   |            | - Ansible-LegacyRole/Role package management           |
   |            |                                                        |
   |            | - Ansible common/ file management                      |
   |            |                                                        |
   |            | - Ansible common/ template management                  |
   |            |                                                        |
   |            | - Terraform-Cloud-EP/Module file collection            |
   |            |                                                        |
   |            | - Terraform-Cloud-EP/Policy management                 |
   |            |                                                        |
   |            | - Terraform-CLI/Module file collection                 |
   +------------+--------------------------------------------------------+


CI/CD For IaC function overview
***********************

Function overview
========

| The CI/CD for IaC function is mainly divided into 2 functions.

#. | Git link function

   | This function clones the Git repository within ITA.
   | It then uses the clone to periodicaly check for changes in the link source files and displays them in a list in the ITA "Remote repository file" menu.

#. | File link function

   | Creates a link between the source and destination files and registers an Operation and a movement for verifying the files.
   | If the link source files are updated, the link destination files will automatically be updated and the previously created verifying movement and operation will be executed.


Function overview diagram
==========

| The CI/CD For IaC function's overview diagram is as following.


.. image:: /images/ja/cicd_for_iac/CICD_overviews.png
   :width: 800px

CI/CD For IaC function menu structure
******************************

| This section explains the CI/CD function's menu structure


Menu/page list
=================

| The CI/CD for IaC menu list is as following

.. table:: Table 2.1-1 CI/CD For IaC function menu list
   
   +--------+---------------+---------------+---------------+
   | **No** | **Menu\       | **Menu\       | **Overview**  |
   |        |  group**      | /page**       |               |
   +========+===============+===============+===============+
   | 1      | CI/CD For IaC | Remote \      | Manages Git\  |
   |        |               | repository    | repository i\ |
   |        |               |               | nformation    |
   +--------+               +---------------+---------------+
   | 2      |               | Remote\       | Manages Git r\|
   |        |               | repository\   | epository fil\|
   |        |               |  file         | e information |
   |        |               |               |               |
   |        |               |               | ※This menu i\|
   |        |               |               | s hidden by\  |
   |        |               |               | default\      |
   |        |               |               |               |
   +--------+               +---------------+---------------+
   | 3      |               | File link     | Manages links\|
   |        |               |               |  and link inf\|
   |        |               |               | ormation for \|
   |        |               |               | source and de\|
   |        |               |               | stinatio\     |
   |        |               |               | n files       |
   +--------+---------------+---------------+---------------+

  

CI/CD For IaC function guide
**************************

| This section explains how to use the CI/CD For IaC function.

Operation flow
==========

| A standard operation flow for the CI/CD For IaC function is as following.
| A more detailed description regarding each of the steps are written below.

.. image:: /images/ja/cicd_for_iac/CICD_flow.png
   :width: 5.68819in
   :height: 3.35972in


**Operation flow details and references**

#. | Register remote repository
   | Register the link Git repository information.
   | For more information, see the ":ref:`cicd_for_iac_remote_repository`" menu.

#. | Register file link
   | Register a link between the source and destination files.
   | For more information, see the ":ref:`cicd_for_iac_file_link`" menu.

#. | Register operation and movement to file link
   | Register an operation and movement for veryfying updated link destination files.
   | For more information, see the ":ref:`cicd_for_iac_file_link`" menu.

#. | Automatically check file update and function validation.
   | Check that the Link destination files are automatically updated when the link source files are update.
   | The user must also check that the movement and operation are automatically executed if they are registered.
   | For more information, see the ":ref:`cicd_for_iac_file_link`" menu.


CI/CD For IaC function menu operation
*********************************

| This section explains how to operate the CI/CD For IaC menu.


 
CI/CD For IaC menu
==========================

| This section describes how to operate the menus displayed when the CI/CD For IaC function is installed.

.. _cicd_for_iac_remote_repository:

Remote repository
------------------

1. | The "Remote repository" menu allows users to register information for the linking Git repository.

.. figure:: /images/ja/cicd_for_iac/remote_repository_menu.png
   :width: 800px
   :alt: Submenu page（remote repositoru）

   Submenu page（remote repository）

2. | The input items in the Remote repository page are as following.

   .. table:: Remote repository page Input item list
      
      +---------------+----------------------------------+----------+---------------+-----------------+
      | **Item**      | **Description**                  | **Requir\| **Input\      | **Restrictions**|          
      |               |                                  | ed Inpu\ |  Method**     |                 |       
      |               |                                  | t**      |               |                 |    
      +===============+==================================+==========+===============+=================+
      | Remote\       | Input the name of the repository.| 〇       | Manual        | Max length \    |
      | repository\   |                                  |          |               | 255 bytes       |  
      |  name         | This name will be the\           |          |               |                 |
      |               | repository's display name。      |          |               |                 |       
      +---------------+----------------------------------+----------+---------------+-----------------+
      | Remote\       | Input the Git repository URL git\| 〇       | Manual        | Max length \    |
      |  repository   |   clone specified by the Git\    |          |               | 255 bytes       |
      | (URL)         |   clone command.                 |          |               |                 |
      +---------------+----------------------------------+----------+---------------+-----------------+
      | Branch        | Input the Git repository branc\  | ー       | Manual        | Max length \    |            
      |               | h name specified by the Git clo\ |          |               | 255 bytes       | 
      |               | ne command.                      |          |               |                 |
      |               |                                  |          |               |                 |  
      |               | If nothing is input, the defaul\ |          |               |                 |    
      |               | t branch will be specified.      |          |               |                 |   
      +---------------+----------------------------------+----------+---------------+-----------------+
      | Protocol      | Select the protocol used when \  | 〇       | List\         |                 |
      |               | connecting to the Git repository |          | selection     |                 |
      |               |                                  |          |               |                 |      
      |               | ● https                         |          |               |                 |
      |               |                                  |          |               |                 | 
      |               | Select if connecting to the rem\ |          |               |                 |
      |               | ote Git repository using HTTPS.  |          |               |                 | 
      |               |                                  |          |               |                 |     
      |               | ● ssh password authentication   |          |               |                 |
      |               |                                  |          |               |                 |
      |               | Select if connecting to the\     |          |               |                 |
      |               | remote Git repository using\     |          |               |                 |
      |               | SSH password.                    |          |               |                 |
      |               |                                  |          |               |                 | 
      |               | ● ssh authentication\           |          |               |                 | 
      |               | (Without passphrase)             |          |               |                 |
      |               |  ※Not available at the moment   |          |               |                 | 
      |               |                                  |          |               |                 | 
      |               | Select if connecting to the \    |          |               |                 |
      |               |  remote Git repository with\     |          |               |                 |    
      |               | ssh key authentication           |          |               |                 |
      |               |                                  |          |               |                 |
      |               | ● ssh authentication\           |          |               |                 |
      |               | (Without passphrase)             |          |               |                 |
      |               |※Not available at the moment     |          |               |                 | 
      |               |                                  |          |               |                 | 
      |               | Select if connecting to the \    |          |               |                 |       
      |               |  remote Git repository\          |          |               |                 |
      |               | with ssh passphrase key auth\    |          |               |                 |
      |               | entication.                      |          |               |                 | 
      +---------------+----------------------------------+----------+---------------+-----------------+ 
      | Visibility\   | Select the Git repository's\     | ー       | List \        |                 |                                    
      | type          |  visibility type \               |          | selection     |                 |
      |               | (Public/Private).                |          |               |                 |    
      |               | If the connection protocol is se\|          |               |                 |      
      |               | t to "https", Visibility type i\ |          |               |                 |
      |               | s required.                      |          |               |                 |    
      +------+--------+----------------------------------+----------+---------------+-----------------+
      | Git\ | User   | Input the user name for the Git. | ー       | Manual        | Max length \    |                           
      | acca\|        |                                  |          |               | 255 bytes       |
      | unt\ |        | If the Visibility type is set to\|          |               |                 | 
      |      |        | private, this item is required.  |          |               |                 |
      |      |        |                                  |          |               |                 |
      |      +--------+----------------------------------+----------+---------------+-----------------+
      |      | Pass\  | Input the password for the Git\  | ー       | Manual        | Max length\     | 
      |      | word   | user .                           |          |               | 255 bytes       |  
      |      |        |                                  |          |               |                 |
      |      |        |                                  |          |               |                 |    
      |      |        | If the Visibility type is set to\|          |               |                 |
      |      |        | private, this item is required.  |          |               |                 |
      |      |        |                                  |          |               |                 | 
      |      |        |                                  |          |               |                 |            
      |      |        | Note that GitHub ended support \ |          |               |                 |          
      |      |        | for password authentication in A\|          |               |                 |   
      |      |        | ugust 2021.                      |          |               |                 |
      |      |        | `See here for more informatio\   |          |               |                 | 
      |      |        | n <https://github.blog/2020-12|  |          |               |                 |  
      |      |        | -15-token-authentication-requir  |          |               |                 |   
      |      |        | ements-for-git-operations/>`__.  |          |               |                 | 
      |      |        | If the user is using GitHub with\|          |               |                 |
      |      |        | password authentication, they \  |          |               |                 |
      |      |        | will need to create a personal\  |          |               |                 |
      |      |        |  access token.                   |          |               |                 |
      |      |        |                                  |          |               |                 |
      |      |        | `For more information regardi    |          |               |                 |
      |      |        | ng personal tokens, see here <\  |          |               |                 |    
      |      |        | https://docs.github.com/ja/authe\|          |               |                 |
      |      |        | ntication/keeping-your-account-a\|          |               |                 |
      |      |        | nd-data-secure/creating-a-person\|          |               |                 |
      |      |        | al-access-token>`__.             |          |               |                 |
      |      |        |                                  |          |               |                 |
      +------+--------+----------------------------------+----------+---------------+-----------------+
      | ssh\ | Pass\  | Input the password for the Linux\| ー       | Manual       | Max length\      |
      | conn\| word   |  user that will run the Git\     |          |               | 255 bytes       |
      | ecti\|        | clone command.                   |          |               |                 | 
      | nfor\|        | If the protocol is set to "ssh\  |          |               |                 |
      | mati\|        | password authentication, this \  |          |               |                 |
      | on   |        | item is required.                |          |               |                 |
      |      +--------+----------------------------------+----------+---------------+-----------------+
      |      | Pass\  | Input the passphrase for the key\| ー       | Manual        | Max length\     |
      |      | phrase\|  file used when running the Git\ |          |               | 255 bytes       |
      |      |        | clone command.                   |          |               |                 |
      |      |        |                                  |          |               |                 |
      |      |        | If the protocol is set to "ssh\  |          |               |                 |
      |      |        |  key authentication", this \     |          |               |                 |
      |      |        | item is required.                |          |               |                 |    
      |      +--------+----------------------------------+----------+---------------+-----------------+
      |      | Connec\| Input the parameter configured\  | ー       | Manual        | Max length \    |
      |      | tion\  | to the "GIT_SSH__COMMAND" enviro\|          |               | 4000 bytes      |
      |      | param\ | nment when running the Git clone\|          |               |                 |
      |      | eter   | command.                         |          |               |                 |
      |      |        |                                  |          |               |                 |
      |      |        | The GIT_SSH_COMMAND is an\       |          |               |                 |
      |      |        |  environment variable that can\  |          |               |                 |
      |      |        |  be configured with Git version  |          |               |                 |    
      |      |        | 2.3 or later versions.           |          |               |                 | 
      |      |        |                                  |          |               |                 |
      |      |        | Any configured parameters will b\|          |               |                 | 
      |      |        | e deactivated if the ITA serve\  |          |               |                 |
      |      |        | r is installed with a Git vers\  |          |               |                 |
      |      |        | ion earlier than 2.3             |          |               |                 |
      |      |        |                                  |          |               |                 |  
      |      |        | The environment variable "GIT_SS\|          |               |                 |
      |      |        | H_COMMAND" has the following \   |          |               |                 |
      |      |        | parameters set by default.       |          |               |                 |
      |      |        | Configured parameters will be\   |          |               |                 |
      |      |        | after the default parameter      |          |               |                 |
      |      |        |                                  |          |               |                 |
      |      |        | UserKnownHostsFile=/dev/null -o \|          |               |                 |
      |      |        | StrictHostKeyChecking=no         |          |               |                 |
      |      |        |                                  |          |               |                 |       
      |      |        | If there is no core.sshCommand\  |          |               |                 |
      |      |        | is set to git config - global, \ |          |               |                 |
      |      |        | configure the following param\   |          |               |                 |
      |      |        | eter.                            |          |               |                 |    
      |      |        | ssh –o UserKnownHostsFile=/dev/n\|          |               |                 |
      |      |        | ull -o StrictHostKeyChecking=no\ |          |               |                 |
      |      |        |                                  |          |               |                 |
      |      |        | If core.sshCommand is set to git\|          |               |                 | 
      |      |        |  config - global, set the \      |          |               |                 |
      |      |        | following parameter.             |          |               |                 |  
      |      |        |                                  |          |               |                 |
      |      |        | -o UserKnownHostsFile=/dev/null\ |          |               |                 |
      |      |        | -o StrictHostKeyChecking=no      |          |               |                 |
      +------+--------+----------------------------------+----------+---------------+-----------------+                   
      | Proxy| Address| Input the address for the proxy\ | ー       | Manual        | Max length      |
      |      |        | server.                          |          |               | 255 bytes\      |
      |      |        |                                  |          |               |                 |  
      |      |        | If ITA is under a proxy environm\|          |               |                 |
      |      |        | ent, the user may need to config\|          |               |                 |  
      |      |        | ure it in order to communicate\  |          |               |                 |    
      |      |        | with the Git server.             |          |               |                 |       
      |      |        |                                  |          |               |                 | 
      |      |        | If the proxy server URL is `htt\ |          |               |                 |   
      |      |        | p://procy.gate.co.jp:8080`,      |          |               |                 |
      |      |        |                                  |          |               |                 |
      |      |        | Input  `http://procy.gate.\|     |          |               |                 |  
      |      |        | co.jp` into the address field.   |          |               |                 |
      |      |        |                                  |          |               |                 |  
      |      |        | Input 8080 into the port.        |          |               |                 |     
      |      +--------+----------------------------------+----------+---------------+-----------------+
      |      | port   | Input the port for the Proxy\    | ー       | Manual        |                 |
      |      |        |  server.                         |          |               |                 |
      |      |        |                                  |          |               |                 |    
      |      |        | If ITA is under a proxy environm\|          |               |                 |
      |      |        | ent, the user may need to config\|          |               |                 |
      |      |        | ure it in order to communicate\  |          |               |                 |
      |      |        | with the Git server.             |          |               |                 | 
      +------+--------+----------------------------------+----------+---------------+-----------------+
      | Remo\| Automa\| Select to automatically synchron\| 〇       | List selection| Default value\  |
      | te \ | tic \  | ize with the Git repository.     |          |               | : active        |
      | repo\| synch\ |                                  |          |               |                 |
      | sito\| roniza\| True: Will synchronize with the \|          |               |                 |
      | ry \ | tion   | Git repository with an interval\ |          |               |                 |
      | sync\|        |  specified by "Cycle(seconds)".  |          |               |                 |
      | hron\|        | False:Will not automatically syn\|          |               |                 |
      | niza\|        | chronize with the Git repository.|          |               |                 |
      | tion\+--------+----------------------------------+----------+---------------+-----------------+
      |  inf\| Cycle\ | Input the cycle time in which th\| ー       | Manual        | Units: Seconds  | 
      | orma\| (secon\| e repository will be synchronize\|          |               |                 |
      | tion\|  ds)   | d with the Git repository.       |          |               |                 |   
      |      |        |                                  |          |               |                 |   
      |      |        | If nothing is input, the default\|          |               |                 |  
      |      |        |  value (60s) will be used.       |          |               |                 | 
      +------+--------+----------------------------------+----------+---------------+-----------------+
      | Conn\| Retry\ | Input how many times the system \| ー       | Manual        |                 |
      | ctio\|  number|  will retry connecting to Git if\|          |               |                 |
      | n \  |        |  it fails.                       |          |               |                 |
      | retr\|        |                                  |          |               |                 |
      | y \  |        | If nothing is input, the default\|          |               |                 |  
      | info\|        |  value (3 times) will be used.   |          |               |                 |  
      | rmat\+--------+----------------------------------+----------+---------------+-----------------+
      | ion  | Cycles\| Input the inerval time between \ | ー       | Manual        | Units: ms       |
      |      | (ms)   | when the system retries to conne\|          |               |                 |
      |      |        | ct to Git if it failes.          |          |               |                 |  
      |      |        | If nothing is input, the default\|          |               |                 |             
      |      |        |  value (1000ms) will be used.    |          |               |                 |
      +------+--------+----------------------------------+----------+---------------+-----------------+
      | Remarks       | Free description field.          | ー       | Manual        | Max length\     |         
      |               |                                  |          |               | 4000 bytes      |          
      +---------------+----------------------------------+----------+---------------+-----------------+


3. | The items displaying the synchronization status of the remote repository are as following.

   .. list-table:: Remote repository page Synchronization status display items
      :widths: 5 20 5 
      :header-rows: 1
      :align: left
      
      * - Item
        - Description
        - Remarks
      * - Status
        - | The Git repository synchronization status displays one of the following statuses.
          | Blank: Status when a record is newly registered, updated or restored.
          | Success: Status when synchronization with Git repository was successful.
          | Error: Status when synchronization with Git repository failed.
          | Re-open: Status when the Re-open button was clicked.
          | If the status changes to Error, the Git repository synchronization will stop.
          | In order to re-open it, click the Re-open button or update the corresponding record.
          | For more information, see ":ref:`cicd_for_iac_repository_register_notes`"
        - 
      * - Detailed information
        - | If the status changes to Error, the error log will be displayed.
          | Click the Re-open button or update the corresponding record to clear the detailed information.
        - 
      * - Last updated date/time
        - | Displays the last date/time the Git repository was synchronized.
          | Click the Re-open button or update the corresponding record to clear the Last updated date/time.
        - 
      * - Re-open button
        - | Re-activates records with an Error status.
          | Clicking the Re-open button changes the status to "Re-open". 
        - 

.. _cicd_for_iac_file_link:

File link
--------

1. | This menu allows users to create a link between the link source files and link destination files with each other and create Operations and Movements for validating the files.
   | If the link source files are updated, an internal function will automatically update the link destination files and run an operation and Movement to validate the files before the processing results are displayed.

.. figure:: /images/ja/cicd_for_iac/file_link_menu.png
   :width: 800px
   :alt: Submenu page（ file link）

   Submenu page（ file link）

2. | The File link page's input items are as following.

   .. table:: File link page Input item list
      :widths: 8 8 8 25 12 12 12
      :align: left    

      +---------------+---------------------------------------------------+----------+---------------+-----------------+
      | **Item**      | **Description**                                   | **Input\ | **Input\      | **Re\           |          
      |               |                                                   | requir\  | method**      | strictions**    |       
      |               |                                                   | ement**  |               |                 |     
      +===============+===================================================+==========+===============+=================+
      | Link destinat\| Input the file name registered for \              | 〇       | Manual        | Max length \    | 
      | ion file name | the link destination file.                        |          |               | 255 bytes       |
      |               | This name is linked to one of the menus below\    |          |               |                 |       
      |               |  depending on the file type of the link \         |          |               |                 |
      |               |  destination file.                                |          |               |                 |               
      |               | Note that the name must meet the same restricti\  |          |               |                 |    
      |               | ons as the item they are input to. The restrict\  |          |               |                 |
      |               | ions applies to both the items and the file name. |          |               |                 |
      |               |                                                   |          |               |                 |
      |               | +----------------------+-------------------+      |          |               |                 |
      |               | | Menu name            | Item name         |      |          |               |                 |
      |               | +======================+===================+      |          |               |                 |
      |               | | Ansible-Legacy/Play\ | Paybook file name |      |          |               |                 |    
      |               | | book File collection |                   |      |          |               |                 |
      |               | +----------------------+-------------------+      |          |               |                 |
      |               | | Ansible-Pioneer/Inte\| No target item    |      |          |               |                 |
      |               | | active File colle\   |                   |      |          |               |                 |
      |               | | ction                |                   |      |          |               |                 |
      |               | +----------------------+-------------------+      |          |               |                 |
      |               | | Ansible-LegacyRole\  | Role package name |      |          |               |                 |   
      |               | | /Role package man\   |                   |      |          |               |                 |
      |               | | agement              |                   |      |          |               |                 |
      |               | +----------------------+-------------------+      |          |               |                 |
      |               | | Ansible common/File\ | File embedded va\ |      |          |               |                 |
      |               | | management           | riable name       |      |          |               |                 |
      |               | +----------------------+-------------------+      |          |               |                 |
      |               | | Ansible common/Temp\ | Template embed\   |      |          |               |                 |   
      |               | | late management      | ded variable name |      |          |               |                 |
      |               | +----------------------+-------------------+      |          |               |                 |
      |               | | Terraform-Cloud-EP/\ | Module file name  |      |          |               |                 |
      |               | | Module file collec\  |                   |      |          |               |                 |       
      |               | | tion                 |                   |      |          |               |                 |        
      |               | +----------------------+-------------------+      |          |               |                 |
      |               | | Terraform-Cloud-EP/\ | Policy name       |      |          |               |                 |
      |               | | Policy management    |                   |      |          |               |                 |
      |               | +----------------------+-------------------+      |          |               |                 |
      |               | | Terraform-CLI/Module\| Module file name  |      |          |               |                 |      
      |               | |  file collection     |                   |      |          |               |                 |
      |               | +----------------------+-------------------+      |          |               |                 |
      |               |                                                   |          |               |                 |
      |               | The link process changes depending on if the  \   |          |               |                 | 
      |               |  Link destination file name is registered or not. |          |               |                 | 
      |               | For more information, see\                        |          |               |                 |
      |               |  "4.Link destination file update process"         |          |               |                 |  
      |               |                                                   |          |               |                 | 
      |               | For information regarding changing there\         |          |               |                 |    
      |               |  link list destination file name, see \           |          |               |                 |
      |               |  "5. Changing Link destination file name".        |          |               |                 |
      +----+----------+---------------------------------------------------+----------+---------------+-----------------+ 
      | Gi\| File path\| Displays the remote repositories reigstered in\  | 〇       | List \        |                 |
      | t\ |          |  the ":ref:`cicd_for_iac_remote_repository`" menu.|          | selection     |                 | 
      | re\|          |                                                   |          |               |                 |            
      | po\|          | If the file tope for the Link destination file is\|          |               |                 |
      | si\|          | "Ansible-LegacyRole/Role package management, \    |          |               |                 |
      | to\+          | see  "":ref:`cicd_for_iac\                        |          |               |                 |
      | ry\|          | _role_package_notes`" for more information        |          |               |                 |           
      | (F\|          |                                                   |          |               |                 | 
      | ro\|          |                                                   |          |               |                 |     
      | m) |          |                                                   |          |               |                 |    
      |    |          |                                                   |          |               |                 |
      +----+----------+---------------------------------------------------+----------+---------------+-----------------+
      | Ex\| Link des\| Select the link destination file type (menu).     | 〇       | List \        |                 |
      | as\| tination\| The available file types are listed below.        |          | selection     |                 |
      | tr\| file typ\| Note that the different types must have their\    |          |               |                 |  
      | o \| e        | driver installed in order to be used.             |          |               |                 |
      | IT\|          |                                                   |          |               |                 |
      | au\|          | +-------------------------+-------------------+   |          |               |                 |
      | tm\|          | | Menu name               | Install required  |   |          |               |                 |
      | at\|          | +=========================+===================+   |          |               |                 |
      | io\|          | | Ansible-Legacy/Playbook\| Ansible-Driver    |   |          |               |                 |  
      | n \|          | |  file collection        |                   |   |          |               |                 |
      | (T\|          | +-------------------------+                   |   |          |               |                 |
      | o) |          | | Ansible-Pioneer/inter\  |                   |   |          |               |                 |
      |    |          | | active file collection  |                   |   |          |               |                 |
      |    |          | +-------------------------+                   |   |          |               |                 |
      |    |          | | Ansible-LegacyRole/role\|                   |   |          |               |                 | 
      |    |          | | package management      |                   |   |          |               |                 | 
      |    |          | +-------------------------+                   |   |          |               |                 |
      |    |          | | Ansible common/file    \|                   |   |          |               |                 |  
      |    |          | | management              |                   |   |          |               |                 |
      |    |          | +-------------------------+                   |   |          |               |                 |
      |    |          | | Ansible common/template\|                   |   |          |               |                 |  
      |    |          | |  management             |                   |   |          |               |                 |
      |    |          | +-------------------------+-------------------+   |          |               |                 |
      |    |          | | Terraform/Module file \ | Terraform-Cloud/\ |   |          |               |                 |
      |    |          | | collection              |                   |   |          |               |                 |
      |    |          | +-------------------------+ EP-Driver         |   |          |               |                 |
      |    |          | | Terraform/Policy \      |                   |   |          |               |                 |
      |    |          | | management              |                   |   |          |               |                 |
      |    |          | +-------------------------+-------------------+   |          |               |                 |
      |    |          | | Terraform-CLI/Module\   | Terraform-CLI-Dri\|   |          |               |                 |  
      |    |          | | file collection         | ver               |   |          |               |                 |
      |    |          | +-------------------------+-------------------+   |          |               |                 |
      |    |          |                                                   |          |               |                 |
      |    +----+-----+---------------------------------------------------+----------+---------------+-----------------+    
      |    | Te\| Var\| If "Ansible common/Template management" is select\| ー       | Manual        | Max length 4000\|  
      |    | np\| iab\| ed as the file type, make sure to input the varia\|          |               |  bytes          |
      |    | la\| le \| ble definitions needed for the file               |          |               |                 | 
      |    | te\| def\| This item is not required if the file type is not\|          |               |                 | 
      |    |  l\| ini\|  "Ansible common/Template management              |          |               |                 | 
      |    | is\| tio\|                                                   |          |               |                 |  
      |    | t  | n   |                                                   |          |               |                 | 
      |    |    |     |                                                   |          |               |                 |
      |    +----+-----+---------------------------------------------------+----------+---------------+-----------------+
      |    | An\| Int\| Displays the interactive file types registered in\| ー       | List selection|                 |
      |    | si\| era\|  the "Ansible-Pioneer/Interactive file type menu. |          |               |                 |
      |    | bl\| cti\| If the selected file type is the "Ansible-Pioneer\|          |               |                 |  
      |    | e-\| ve \| /Interactive file collection" menu, select a inte\|          |               |                 | 
      |    | Pi\| fil\| ractive file type from the list                   |          |               |                 | 
      |    | on\| e t\| This item is not required if the file type is not\|          |               |                 |
      |    | eer| ype |  "Ansible-Pionner/ Interactive file collecction". |          |               |                 |
      |    |    |     |                                                   |          |               |                 |
      |    |    +-----+---------------------------------------------------+----------+---------------+-----------------+
      |    |    | OS\ | Displays the OS types registered in the "Ansible-\| ー       | List selection|                 |
      |    |    | type| Pioneer/OS type menu.                             |          |               |                 |
      |    |    |     | If the selected file type is the "Ansible-Pioneer\|          |               |                 |
      |    |    |     | /Interactive file collection" menu, select an OS\ |          |               |                 |
      |    |    |     |  type from the list.                              |          |               |                 |
      |    |    |     | This item is not required if the file type is not\|          |               |                 |
      |    |    |     |  "Ansible-Pionner/ Interactive file collecction". |          |               |                 |
      |    |    |     |                                                   |          |               |                 |
      +----+----+-----+---------------------------------------------------+----------+---------------+-----------------+
      | Fi\| Automati\| Select to automatically synchronize the Link dest\| 〇       | List selection| Default value:\ |
      | le\| c synchr\| ination files with the Git repository files when \|          |               |  active         |
      |  s\| onizatio\| they change.                                      |          |               |                 | 
      | nc\| n        |                                                   |          |               |                 |
      | hr\|          | True: Will automatically synchronize the list des\|          |               |                 |
      | on\|          | tination file whenever the linked Git repository \|          |               |                 |
      | iz\|          | file is updated.                                  |          |               |                 |
      | at\|          | False: Will not automatically synchronize the lis\|          |               |                 |
      | io\|          | t destination file whenever the linked Git reposi\|          |               |                 |
      | n \|          | tory file is updated.                             |          |               |                 |
      | in\|          |                                                   |          |               |                 |
      | fo\|          |                                                   |          |               |                 |
      | rm\|          |                                                   |          |               |                 |
      | at\|          |                                                   |          |               |                 |
      | io\|          |                                                   |          |               |                 |
      | n  |          |                                                   |          |               |                 |
      +----+----------+---------------------------------------------------+----------+---------------+-----------------+
      | De\| Opera\   | Displays the Operations registered in the "Basic\ | ー       | List selection|                 |
      | li\| tion     |  console/Input operation list" menu.              |          |               |                 | 
      | ve\|          |                                                   |          |               |                 | 
      | ry\|          | Select the Operation that executes the Movement\  |          |               |                 |
      |  i\|          | that will be executed when the link destination \ |          |               |                 | 
      | nf\|          | file changes.                                     |          |               |                 |
      | or\+----------+---------------------------------------------------+----------+---------------+-----------------+
      | ma\| Movement | Displays Movements registered in the "Basic conso\| ー       | List selection|                 |
      | ti\|          | le/Movement list" menu.                           |          |               |                 |
      | on\|          |                                                   |          |               |                 |
      |    |          | Select the Movment that will be executed when the\|          |               |                 |
      |    |          |  link destination file changes.                   |          |               |                 |
      |    +----------+---------------------------------------------------+----------+---------------+-----------------+
      |    | Dry run \| Select the Movement execution mode.               | ー       | List selection|                 |     
      |    |          |                                                   |          |               |                 |
      |    |          | True:Will execute the Movement in Dry run mode \  |          |               |                 |
      |    |          | (Dry run for Ansible driver and Plan check for \  |          |               |                 | 
      |    |          | Terraform driver.                                 |          |               |                 |
      |    |          |                                                   |          |               |                 |
      |    |          | If "False" or nothing is selected, the movement\  |          |               |                 |
      |    |          |  will noe bt executed in Dry run mode             |          |               |                 |
      +----+----------+---------------------------------------------------+----------+---------------+-----------------+  
      | Remarks       | Free description field.                           | ー       | Manual        | Max length \    |
      |               |                                                   |          |               | 4000 bytes      |
      +---------------+---------------------------------------------------+----------+---------------+-----------------+                                              


3. | The items that displays the synchronization status between Git repository and the link destination files are as following.
  
   .. table:: File link page Status display item list
      :widths: 1 2 6 1
      :align: left

      +-------------------------+---------------------------------------------------+-------------+
      | **Item**                | **Description**                                   | **Remarks** |       
      +======+==================+===================================================+=============+
      | File\| Status           | Displays the synchronization status between the \ |             |
      |  syn\|                  | link source file and the link destination file.   |             |      
      | chro\|                  | The statuses are as following.                    |             | 
      | niza\|                  |                                                   |             |
      | tion\|                  | Blank: Status when a record is newly registered, \|             |
      |  inf\|                  | updated or restored                               |             |
      | orma\|                  |                                                   |             |
      | tion |                  | Success: Status when synchronization with Git rep\|             |
      |      |                  | ository was successful.                           |             |
      |      |                  |                                                   |             |
      |      |                  | Error: Displayed for the following 2 cases.       |             |
      |      |                  |                                                   |             |  
      |      |                  | ・When an error occurred during the source and de\|             |
      |      |                  | stination file synchronization.                   |             |
      |      |                  |                                                   |             |
      |      |                  | ・When the a source file was updated and the conf\|             |
      |      |                  | igured operation and Movement could not be execu\ |             | 
      |      |                  | ted※1                                            |             |
      |      |                  |                                                   |             |
      |      |                  | Re-open: Status when the Re-open button is clicke\|             |
      |      |                  | d.                                                |             |
      |      |                  |                                                   |             |
      |      |                  | If the status changes to Error, the Git repositor\|             |
      |      |                  | y synchronization will stop. In order to re-open \|             |
      |      |                  | it, click the Re-open button or update the corres\|             |
      |      |                  | ponding record.                                   |             |
      |      +------------------+---------------------------------------------------+-------------+         
      |      | Detailed informa\| If the status changes to Error, the error log wil\|             |
      |      | tion             | l be displayed                                    |             |
      |      |                  |                                                   |             |  
      |      |                  | Click the Re-open button or update the correspond\|             |
      |      |                  | ing record to clear the detailed information.     |             |
      |      +------------------+---------------------------------------------------+-------------+
      |      | Last date/time   | Displays the last date/time the source and destin\|             |
      |      |                  | ation file was synchronized.                                    |            
      |      |                  |                                                   |             |    
      |      |                  | Click the Re-open button or update the correspond\|             |
      |      |                  | ing record to clear the Last date/time.           |             |
      |      +------------------+---------------------------------------------------+-------------+
      |      | Re-open button   | Re-activates records with an Error status.        |             |
      |      |                  |                                                   |             |
      |      |                  | Clicking the Re-open button changes the status to\|             |
      |      |                  |  "Re-open".                                       |             |
      +------+------------------+---------------------------------------------------+-------------+ 
      | Deli\| Detailed informa\| Displays why an error occured if the configured O\|             |
      | very\| tion             | peration and Movement failed to execute when a li\|             |
      |  inf\|                  | nk destination was changed.※1                    |             |
      | orma\|                  |                                                   |             |
      | tion |                  | Note that this item is not deciding the status of\|             |
      |      |                  |  the operation if it was executed.※2.            |             |
      |      |                  | Click the "Check Operation status" button in orde\|             |
      |      |                  | r to see the execution results in the different \ |             |
      |      |                  | drivers' "Operation status confirmation" menu.    |             |
      |      |                  |                                                   |             |
      |      |                  | Click the Re-open button or update the correspond\|             |
      |      |                  | ing record to clear the detailed information.     |             |
      |      +------------------+---------------------------------------------------+-------------+
      |      | Operation instan\| Dispalys the Operation instance number when an op\|             |
      |      | ce No.           | eration and Movement is successfully executed.    |             |
      |      |                  |                                                   |             | 
      |      |                  | Click the Re-open button or update the correspond\|             |
      |      |                  | ing record to clear the Operation instance number.|             |
      |      |                  |                                                   |             |
      |      +------------------+---------------------------------------------------+-------------+   
      |      | Check Operation \| This button is only active if the corresponding \ |             |
      |      | status button    | Operation and Movement was successfully executed. |             |
      |      |                  |                                                   |             |
      |      |                  | Clicking the Check Operation status button moves \|             | 
      |      |                  | the user to the corresponding driver's "Operation\|             |
      |      |                  |  status confirmation" status where they can \     |             |
      |      |                  | check the status of the corresponding operation.  |             |
      |      |                  |                                                   |             |
      |      |                  | For more information regarding "Operation status \|             |
      |      |                  | confirmation", see the user manuals for the diffe\|             | 
      |      |                  | rent drivers.                                     |             |
      |      |                  |                                                   |             |
      |      |                  | Click the Re-open button or update the correspond\|             |
      |      |                  | ing record to deactivate the button               |             |
      +------+------------------+---------------------------------------------------+-------------+



| ※1 Cases where Operations or Movements has been deleted.
| ※2 Cases where something is wrong with the link destination file or there is missing information needed to execute the opearation.

.. _cicd_for_iac_link_file_upload_flow:

4. | Updating Link destination files

   .. image:: /images/ja/cicd_for_iac/CICD_flow2.png
      :width: 600px

| ※1 If the link destination file type is set to "Ansible-Pionner/Interactive file collection", the link destination file name will be a combination of the interactive and OS type.
| ※2 If there is missing information, the operation might not execute successfully.
| ※3 Difference in items also includes the "Remarks" item. Note that the Remarks item will always be updated as "blank".
| ※4 Causes the ":ref:`cicd_for_iac_file_link`" menu's "File synchronization information/Status" item to display "Error" and the "File synchronization information/Detailed information" to display the cause of the error.
| ※5 Causes the ":ref:`cicd_for_iac_file_link`" menu's "File synchronization information/Status" item to display "Error" and the "Delivery information/Detailed information" to display the cause of the error.
| ※6 Causes the ":ref:`cicd_for_iac_file_link`" menu's "File synchronization information/Status" item to display "Success".

.. _cicd_for_iac_file_link_change_name:

1. | Points regarding changing the Link destination file name
   | Changing the Link destination file name creates a new version of the same record with a new name. The old version will still be there.


CI/CD For IaC hidden menus
============================

| This section explains how to operate CI/CD for IaC menus that are hidden by default.
| In order to access the different menus, access "Management console/Role/Menu link management" menu and restore the corresponding menus. This will un-hide the menus and make them accessible.


Remote repository files
----------------------

1. | This menu displays all linked source files.
    
   | The information displayed is updated by an internal function.
   | We highly recommend against adding, updating and deleting records in this menu.


.. figure:: /images/ja/cicd_for_iac/remote_repository_file_menu.png
   :width: 800px
   :alt: Submenu page (Remote repository files)

   Submenu page (Remote repository files)


2. | The items found in the Remote repository file menu are as following.

   .. table:: Remote repository file page Item list

      +---------------+---------------+--------+------------+---------------+
      | **Item**      | **Descriptio\ | **Inpu\| **Input\   | *Restriction\ |
      |               | n**           | t Requ\|  method**  | s**           |
      |               |               | ired** |            |               |
      +===============+===============+========+============+===============+
      | Remote repo\  | Displays the \| ○     | List selec\|               |
      | sitory name   | name of the r\|        | tion       |               |
      |               | ry name regis\|        |            |               |
      |               | tered in the \|        |            |               |
      |               | ":ref:`cicd_f\|        |            |               |
      |               | or_iac_remote\|        |            |               |
      |               | _repository`".|        |            |               |
      +---------------+---------------+--------+------------+---------------+
      | File path     | Displays the \| ○     | Manual     | Max length\   |
      |               | file path of \|        |            | 4096 bytes    |
      |               | the link sour\|        |            |               |
      |               | ce file       |        |            |               |
      |               |               |        |            |               |  
      |               | Remote reposi\|        |            |               |
      |               | tories with "\|        |            |               |
      |               | Error" set fo\|        |            |               |
      |               | r their "Sync\|        |            |               |
      |               | hronization \ |        |            |               |
      |               | status" in th\|        |            |               |
      |               | e ":ref:`cicd\|        |            |               |
      |               | _for_iac_remo\|        |            |               |
      |               | te_repositor\ |        |            |               |
      |               | y`" menu will\|        |            |               |
      |               |  not have the\|        |            |               |
      |               | ir file path \|        |            |               |
      |               | displayed.    |        |            |               |
      |               |               |        |            |               |
      +---------------+---------------+--------+------------+---------------+
      | File type     | If the target\| ○     | List selec\|               |
      |               |  is an Ansibl\|        | tion       |               |
      |               | e-LegacyRole \|        |            |               |
      |               | file, the fil\|        |            |               |
      |               | e type is"Rol\|        |            |               |
      |               | es directory"\|        |            |               |
      |               | . Any other\  |        |            |               |
      |               |  is "File".   |        |            |               |
      |               |               |        |            |               |
      +---------------+---------------+--------+------------+---------------+

Appendix
****

.. _cicd_for_iac_repository_register_notes:

Notes regarding registering files to Git repositories.
===========================================

| Make sure to read the following points when registering files to Git repositories.

#. | Registering Git repositories with file names exceeding 256 to the ":ref:`cicd_for_iac_remote_repository`" menu will cause the Git clone command to end in an error.

#. | Registering Git repositories with file paths and file names exceeding 4096 bytes combined to the ":ref:`cicd_for_iac_remote_repository`" menu will cause the Git clone command to end in an error.

.. _cicd_for_iac_role_package_notes:

Notes regarding registering files that are linked with the Role package management to Git repositories.
=========================================================================

| Make sure to read the following points when registering files linked with the "Ansible-LegacyRole/Role package management" to Git repositories.

#. | Create a directory that contains a directory with the name "roles" and put all the files and directories required by the Role package function in there.
   | Files compressed as Role packages are put under in the upper directory of the "roles" directory. However, creating a directory called "roles" directory under the Git repository route directory will not work, as it will not be recognized as such by the "Ansible-LegacyRole/Role package list" menu.

   | Directories configured like the one in the example below will have its "sample/roles" recognized as a role directory. HOwever, the "roles" directory will not be recognized. 

   | Git repository route directory


   .. code-block:: bash
     :caption: Git repository route directory

     |-  roles          ・・・・・・・Not recognized as roles directory.
     |   |  ita_readme_test_role.yml
     |   |- test_role
     |      |-  defaults
     |      |     main.yml
     |      |-  tasks
     |            main.yml
     |
     |- sample
         | ita_readme_test_role.yml
         |- roles       ・・・・・・・Recognized as roles directory.
             |- test_role
                |- defaults
                |     main.yml
                |- tasks
                      main.yml

  
                            
| The "sample/roles" displayed in the :ref:`cicd_for_iac_file_link`"menu's file path. Select "sample/roles" for file paths linking to the "Ansible-LegacyRole/Role package management" menu.

.. figure:: /images/ja/cicd_for_iac/sample_roles.png
   :width: 800px
   :alt: sample_role
