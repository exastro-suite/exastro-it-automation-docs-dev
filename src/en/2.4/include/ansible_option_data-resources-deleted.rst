
| If :menuselection:`Ansible common --> Interface information`'s :menuselection:`Execute data deletion` is set to "true", the deleted data resources are as following.

.. table:: Data resource deleted when Data deletion is executed (Ansible Automation Controller side)
   :align: Left

   +----------------------------------------------------------------+-----------------------+-----------------------------------------------+
   | Data resource                                                  | Resource type         | Remarks                                       |
   |                                                                |                       |                                               |
   +================================================================+=======================+===============================================+
   | ITA execution directory                                        | Directory             |                                               |
   |                                                                |                       |                                               |
   | /var/lib/exastro/ita_<Divided>_executions_ExecutionNumber      |                       |                                               |
   |                                                                |                       |                                               |
   +----------------------------------------------------------------+-----------------------+-----------------------------------------------+
   | SCM management directory                                       | Directory             | ※Deleted by Project resource deletion        |
   |                                                                |                       |                                               |
   | /var/lib/awx/projects/ita_<Divided>_executions_ExecutionNumber |                       |                                               |
   |                                                                |                       |                                               |
   +----------------------------------------------------------------+-----------------------+-----------------------------------------------+
   | Inventory　                                                    | Resource              |                                               |
   |                                                                |                       |                                               |
   | Resource Name: ita_<Divided>_executions_inventory_Execution\   |                       |                                               |
   | Number_SerialNumber                                            |                       |                                               |
   +----------------------------------------------------------------+-----------------------+-----------------------------------------------+
   | Authentication information                                     | Resource              |                                               |
   |                                                                |                       |                                               |
   | Resource Name: ita_<Divided>_executions_credential_Executio\   |                       |                                               |
   | nNumber_SerialNumber                                           |                       |                                               |
   | 　　　　　　ita_<Divided>_executions_vault_credential_E\       |                       |                                               |
   | xecutionNumber                                                 |                       |                                               |
   | 　　　　　　ita_<Divided>_executions_git_credential_E          |                       |                                               |
   | xecutionNumber                                                 |                       |                                               |
   +----------------------------------------------------------------+-----------------------+-----------------------------------------------+
   | Project                                                        | Resource              |                                               |
   |                                                                |                       |                                               |
   | Resource Name: ita_<Divided>_executions_project_ExecutionNumber|                       |                                               |
   |                                                                |                       |                                               |
   +----------------------------------------------------------------+-----------------------+-----------------------------------------------+
   | Job template                                                   | Resource              |                                               |
   |                                                                |                       |                                               |
   | Resource Name: ita_<Divided>_executions_jobtpl_ExecutionNumber\|                       |                                               |
   | _SerialNumber                                                  |                       |                                               |
   +----------------------------------------------------------------+-----------------------+-----------------------------------------------+
   | Workflow job template                                          | Resource              |                                               |
   |                                                                |                       |                                               |
   | Resource Name: ita_<Divided>_executions_workflowtpl_Ex\        |                       |                                               |
   | ecutionNumber                                                  |                       |                                               |
   +----------------------------------------------------------------+-----------------------+-----------------------------------------------+
   | Job                                                            | Resource              |                                               |
   |                                                                |                       |                                               |
   | Resource Name: JobNumber—ita_<Divided>_executions_workflo\     |                       |                                               |
   | wtpl_ExecutionNumber                                           |                       |                                               |
   | 　　　　　　JobNumber—ita_<Divided>_executions_jobtpl_Exe      |                       |                                               |
   | cutionNumber                                                   |                       |                                               |
   +----------------------------------------------------------------+-----------------------+-----------------------------------------------+
   

.. table:: Data resource deleted when Data deletion is executed (ITA side)
   :align: Left
   
   +-----------------------------------------------------------------------+-----------------------+-----------------------------------------------+
   | Data resource                                                         | Resource type         | Remarks                                       |
   |                                                                       |                       |                                               |
   +=======================================================================+=======================+===============================================+
   | Git repository                                                        | Git repository        | Deletes per Directory                         |
   |                                                                       |                       |                                               |
   | /tmp/git_repositories/<Divided>_ExecutionNumber                       |                       | ※ Delete regardless of the :menuselecti\     |
   |                                                                       |                       |    on:`Execute data deletion` setting value.  |
   |                                                                       |                       |                                               |
   +-----------------------------------------------------------------------+-----------------------+-----------------------------------------------+


