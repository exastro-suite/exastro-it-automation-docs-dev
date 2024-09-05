
| The following is a list of points to keep in mind when executing operations with Ansible Automation Controller in a cluster configuration for Movements including Playbooks, which uses the following ITA proprietary variables to output files.
|
| 　Target ITA original variables
| 　・ __workflowdir_\_
| 　・ __conductor_workflowdir_\_
| 　・ __movement_status_filepath_\_
| 　・ __parameters_dir_for_epc_\_
| 　・ __parameters_file_dir_for_epc_\_
| 　・ __parameter_dir_\_
| 　・ __parameters_file_dir_\_
|

Managing files created using ITA's original variables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| The Output directory of the files created using the ITA proprietary values is set to the Ansible Automation Controller's ITA Operation directory, "/var/lib/exastro". Before Movements are executed, the result data is transferred as a file to "/var/lib/exastro" under the Ansible Automation Controller's ITA operation directory.The file created when the Movement is executed is transferred from the Ansible Automation Controllers to the result data in overwrite mode. If a file with the same name as an already existing file is created, the result data of the updated file might not be displayed correctly.

.. figure:: /images/ja/ansible_common/template_management/original_hensu.png
   :width: 7.49606in
   :height: 5.84593in
   :align: center

#. | If a Movement is executed from conductor The files placed under the corresponding conductor instance is transfered to the Ansible Automation Controller's ITA operation directory.
#. | The files under the corresponding Movements are transfered to the Ansible Automation Controller's ITA operation directory before the Movement is executed.
#. | If a Movement is executed from conductor, the file created by the corresponding movement in the ITA operation directory in the Ansible Automation Controller is transferred to the result data.
#. | The file created under the corresponding conductor instance under the Ansible Automation Controller's ITA operation directory is transferred to the result data after the Movement is executed.


Important notes
^^^^^^^^

#. | Make sure that the file name includes ansible "inventory_hostname" for each target host linked to the movement in order to avoiding overlapping of file names.
#. | If executing from conductor, make sure that the movement file names don't overlap.

