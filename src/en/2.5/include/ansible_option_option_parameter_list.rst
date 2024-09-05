
| Explains the :menuselection:`Option parameter` in :menuselection:`Ansible common --> Interface information` and :menuselection:`Mode --> Movement list`.
| In ITA, the Option parameters are configured with the following priority. If parameters that only allows single values are defined multiple times, :menuselection:`Mode --> Movement list`'s  :menuselection:`Option parameter` will be active.

#. | :menuselection:`Mode --> Movement list`'s :menuselection:`Option parameter`
#. | :menuselection:`Ansible common --> Interface information`'s :menuselection:`Option parameter`

| ▼ When :menuselection:`Ansible common --> Interface information`'s :menuselection:`Execution engine` is Ansible Core
| 　　Input the ansible-playbook command's Option parameter.
| 　　For more information regarding Ansible-Palybook command's Option parameters and how they work, run the following command and refer to the help information.

.. code-block:: none

   ansible-playbook -h

|
| ▼ When :menuselection:`Ansible common --> Interface information`'s :menuselection:`Execution engine` is Ansible Automation Controller
| 　　Inputable Option parameters are as following.
|

.. list-table:: Usable option parameters for Ansible Automation Controller
   :widths: 20 30 40 50
   :header-rows: 1
   :align: left

   * - Option parameter
     - Specification method
     - Ansible Automation Controller configuration area
     - Remarks
   * - | -v
       | --verbose 
     - | -v
       | -vv
       | -vvv
       | -vvvv
       | -vvvvv
       | --verbose 
     - number of v are configured to :menuselection:`Template`'s :menuselection:`Details`.
     - | ・Applies total amount of v 
       | ・--verbose is same as -v
       | Example：--verbose -vvv is same as -vvvv
       | ・If more than 6 v are specified, it 5 v will be used.
   * - | -f
       | --forks
     - | -f FORKS
       | --forks=FORKS
     - FORKS value is configured to :menuselection:`Template`'s :menuselection:`Fork`.
     - | ・Specify numeric value to FORKS.
       | ・If multiple are defined, the last defined parameter is used.
       | Example：For -f 1-forks=10, --forks=10 will be used
       | ・Non-numeric values will cause an error.
   * - | -l
       | --limit
     - | -l SUBSET
       | --limit=SUBSET
     - SUBMIT value is configured to :menuselection:`Template`'s :menuselection:`Limited`.
     - | ・SUBSET:Host name in Device list
       | ・If multiple are defined, the last defined parameter is used.
   * - | -e
       | --extra-vars
     - | -e EXTRA_VARS
       | --extra-vars=EXTRA_VARS
     - EXASTRA_VARS value is configured to :menuselection:`Template`'s :menuselection:`Additional variable`.
     - | ・EXTRA_VARS:variable name and specific value is either JSON or YAML format.
       | e.g.) JSON format
       | 　-extra-vars={"VAR_1":"directory"}
       | e.g.) YAML format
       | 　-extra-vars=VAR_1:directory
       | ・If multiple are defined, the last defined parameter is used.
   * - | -t
       | --tags
     - | -t TAGS
       | --tags=TAGS
     - TAGS value is configured to :menuselection:`Template`'s :menuselection:`Job tag`.
     - | ・TAGS:tag name
       | ・Allows for multiple parameters
   * - | -b
       | --become
     - | -b
       | --become
     - :menuselection:`Template`'s :menuselection:`Permission promotion activation` is checked.
     - ・Active if at least 1 is specified
   * - | -D
       | --diff
     - | -D
       | --diff
     - :menuselection:`Template`'s :menuselection:`Edit` display is activated.
     - ・Active if at least 1 is specified
   * - --skip-tags
     - --skip-tags=SKIP_TAGS
     - SKIP_TAGS value is configured to :menuselection:`Template`'s :menuselection:`Skip tag`.
     - | ・SKIP_TAGS:Skip tag name
       | ・Allows multiple parameters
   * - --start-at-task
     - --start-at-task=START_AT_TASK
     - | ※--start-at-task is not displayed on Ansible Automation Controller's WebUI.
       | Handled the same as ansible-playbook command's --start-at-task.
     - ・If multiple are defined, the last defined parameter is used.
   * - | -ufc
       | --use _fact_cache
     - | -ufc
       | --use_fact_cache
     - :menuselection:`Template`'s :menuselection:`Fact cache activation` is checked.
     - ・Active if at least 1 is specified
   * - | -as
       | --allow_simultaneous
     - | -as
       | --allow_simultaneous
     - :menuselection:`Template`'s :menuselection:`simultaneou job execution activation` is checked.
     - ・Active if at least 1 is specified
   * - | -jsc
       | --jobslice_count
     - | -jsc Job slice number
       | --job_slice_count=Job slice number
     - Job slice number value is configured to :menuselection:`Template`'s :menuselection:`Job slice number`.
     - | ・Specify numeric value for Job slice number
       | ・If multiple are defined, the last defined parameter is used.



| ※For more information regarding Ansible Automation Controller's Option parameters and how they work, see the Ansible Automation Controller official manuals.

