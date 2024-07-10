
| The Ansible common menu list are as following.

.. list-table::  Ansible common menu list
   :widths: 2 6 20
   :header-rows: 1
   :align: left

   * - No
     - Menu
     - Description
   * - 1
     - Device list
     - Manages target device information
   * - 2
     - Interface information
     - | Select which execution engine will be used, Ansible Core or Ansible Automation Controller.
       | Manages connection interface information for the Execution engine.
   * - 3
     - Ansible Automation Controller host list
     - Manages information required to run Ansible Automation Controller's RestAPI and the information required to send construction files to Ansible Automation Controller
   * - 4
     - Global variable management
     - Manages the variables and their specific values used between all of the mode's Playbook and Interactive files.
   * - 5
     - File management
     - Manages Files and embedded variables used by both the different mode's Playbook and Interactive files.
   * - 6
     - Template management
     - Manages Files and embedded variables used by both the different mode's Playbook and Template files.
   * - 7
     - Unmanaged variable list
     - Manages variables extracted with ":ref:`ansible_common_var_listup`" the user does not want to display in :menuselection:`Mode --> Substitute value auto registration settings`'s :menuselection:`Movement name:Variable name` item.
   * - 8
     - Common variable use list (※1) 
     - Allows users to view which variables registered in :menuselection:`Ansible common --> Global variable management` ・ :menuselection:`Ansible common --> File management` ・ :menuselection:`Ansible common --> Template management` are used with in what file( :menuselection:`Ansible-Legacy --> Playbook file collection` ・ :menuselection:`Ansible-Pioneer --> Interactive file collection` ・ :menuselection:`Ansible-LegacyRole --> Role package list` ).

