=====================
Terraform driver Common
=====================

Introduction
========

| This document explains the common functions of the "":doc:`./terraform_cloud_ep`" and ":doc:`./terraform_cli`" (Hereinafter written as Terraform Driver).

Overview
====

| This section explains Terraform and the Terraform driver.

Terraform
-----------------

| Terraform is an Orchestration tool created by HashiCorp for optimizing infrastructures.
| It uses infrastructure files coded in HCL (HashiCorp Configuration Language) to generate an Execution plan before executing the construction process.
| Terraform Cloud and Terraform Enterprise can also codify Access policies through something called Policy as Code and manage them on the system.
| For more information regarding Terraform, see the Terraform product manuals..

Terrform driver
--------------------------------
| The Terraform driver is an ITA Function that allows users to execute Terraform and fetch execution logs.
| The module files used for executions (Plan/Apply) and Policy files used to run PolicyChecks are turned into parts on the ITA system where they can be re-used.
| The Terraform Driver can also configure variables within the Module files.
| For more information, see ":ref:`terraform_common_variable_handling`".

.. figure:: /images/ja/diagram/overview.png
   :width: 800px
   :alt: ITA system overview

   ITA system overview

| There are 2 types of Terraform drivers.

-  | **Terraform Cloud/EP driver**
   | Allows users to Create Organizations, Workspaces, execute operations (Plan/PolicyCheck/Apply) to Terraform Cloud and Terraform Enterprises registered to ITA and fetch operation logs. 
   | For more information, see ":doc:`./terraform_cloud_ep`".

-  | **Terraform CLI driver**
   | Allows users to execute operations (Plan/Apply) to and fetch operation logs from Terraform systems installed on the same environment as ITA. 
   | For more information, see ":doc:`./terraform_cli`".

.. _terraform_common_variable_handling:

Handling Variables
==============

Variable types
----------

| In the Terraform driver, users can configure Specific values within Modules from the ITA settings page.

| ※For more information, see ":doc:`./terraform_cloud_ep` -> :ref:`terraform_cloud_ep_substitution_value_auto_registration_setting`" and ":doc:`./terraform_cli` -> :ref:`terraform_cli_substitution_value_auto_registration_setting`".
| The Variable blocks defined within the Module files can be handled as Variables.

+----------+----------------------------------------------------------+
| Type     | Contents                                                 |
+==========+==========================================================+
| Normal v\| Variable that can have specific values configured to t\  |
| ariable  | he Variable names.                                       |
|          |                                                          |
|          | The Variables within the Module files must follow the r\ |
|          | ules of HCL (HashiCorp Configuration Language)'s Variab\ |
|          | le block rules.                                          |
|          |                                                          |
|          | In this case, "xxx" is extracted as variables.           |
|          |                                                          |
|          | Users can also configure type and default values.        |
|          |                                                          |
|          | In this case, "○○" is type and "△△" is extracted as\ |
|          |  variables.                                              |
|          |                                                          |
|          | type and default are not required..                      |
|          |                                                          |
|          | +------------------+                                     |
|          | | variable "xxx" { |                                     |
|          | |                  |                                     |
|          | | 　type = ○○    |                                     |
|          | |                  |                                     |
|          | | 　default = △△ |                                     |
|          | |                  |                                     |
|          | | 　～Shortened～  |                                     |
|          | |                  |                                     |
|          | | }                |                                     |
|          | +------------------+                                     |
+----------+----------------------------------------------------------+

Extracting Variables and registering Specific values,
--------------------------

| User can register specific values by extrating variables out from module files uploaded to ITA.
| The extracted specific values are registered as specific values in the ":doc:`./terraform_cloud_ep` -> :ref:`terraform_cloud_ep_substitution_value_auto_registration_setting`" and ":doc:`./terraform_cli` -> :ref:`terraform_cli_substitution_value_auto_registration_setting`" by linking with the Parameter sheets..

| In the Terraform Cloud/EP driver, registered values and specific values are registered as "Key" for "Variable name" and "Value" for "Specific value" to the Link Terraform's Workspace.
| In the Terraform CLI driver, registered variables and specific values are described and applied as "Key" for the "Variable name" and "Value" for the "Specific value" in the terraform.tfvars file which is generated when execution starts.

.. _terraform_common_variable_type:

Types of variables
--------------------

| Users can configure the type within the variables.
| The variables within the Module must follow the HCL (HashiCorp ConfigurationLanguage) variable rules.

| The variables handled by ITA are as following.

.. list-table:: Variable type
   :widths: 1 3 1 1 2 2
   :header-rows: 1
   :align: left

   * - type
     - Details
     - | Member variable target
       | ※1
     - | Substitute order target
       | ※2
     - type description example
     - default description example
   * - string
     - String type
     - ×
     - ×
     - string
     - ABC
   * - number
     - Number type
     - ×
     - ×
     - number
     - 123
   * - bool
     - Boolean type (True or false).
     - ×
     - ×
     - bool
     - true
   * - list
     - Array type.
     - ×
     - 〇
     - list(string)
     - ["A", "B", "C"]
   * - set
     - | Array type. Asks for unique values.
       | ITA does not check if the specific value is unique or not.
     - ×
     - 〇
     - set(number)
     - [1, 2, 3]
   * - tuple
     - | Array type.The user must decide what number is what type in beforehand.
       | The value's input number is decided, meaning that they can be selected from pulldown selections as Member variables.
     - 〇
     - ×
     - tuple([string, number])
     - ["ABC", 2023]
   * - map
     - | key-value (associative array) type. If a type containing more map types on ITA, the key value cannot be specified from the type information, meaning that the HCL settings must be set to ON if the user is using substitute value auto registration settings.
       | For more information regarding HCL settings, see ":ref:`terraform_cloud_ep_substitution_value_auto_registration_setting`".
     - ×
     - ×
     - map(string)
     - {"test_key" = "test_value"}
   * - object
     - | key-value (associative array)  type. in ITA, the key name is handled as Member variables. the key name cannot contain Japanese characters.
     - 〇
     - ×
     - object({test_key = string})
     - {"test_key" = "test_value"}
   * - any
     - A type that fits everything. however, it will be handled the same way as string types on ITA.
     - ×
     - ×
     - any
     - ABC
   * - No description
     - If no type is described, it will be handled the same way as string types on ITA.
     - ×
     - ×
     - 
     - ABC

.. _terraform_common_member_vars_description:

-  | **※1 …Member variable target**
   | If the variable is a key-value type, it will be a key name..
   | If the variable type is object, <KEY> = <TYPE>'s  <KEY> will be member variable.
   | If the variable type is tuple, the variables defined within the tuple will be numbered from [0],[1],[2]… and become Member variables.

   | If the Variable type is registered to the Variable nest management menu, they will be numbered from [0],[1],[2]… and become Member variables based on the maximum cycle number.
   | For more information regarding variable nests, see ":doc:`./terraform_cloud_ep` -> :ref:`terraform_cloud_ep_nested_variable`" and ":doc:`./terraform_cli` -> :ref:`terraform_cli_nested_variable`".

      -  | **Example: When variable type is object**
   
      #. | tf file and registration values

         .. code-block:: bash 

           variable "VAR_hoge" {
               type = object({
                 NAME = string,
                 IP = string
               })
               default = {
                 “NAME” = “machine_01”,
                 “IP” = “127.0.0.1”
              }
           }

      #. | Substitute value example(Substitute value auto registration settings) 

         .. list-table::
            :widths: 5 10 10 5 10
            :header-rows: 1
            :align: left
         
            * - Item number
              - Variable name
              - Member variable
              - Substitute order
              - Parameter sheet input value
            * -  1
              -  VAR_hoge
              -  NAME
              -  No input
              -  my_machine
            * - 2
              - VAR_hoge
              - IP
              - No input
              - 192.168.100.1

      #. | Value sent to Terraform

         .. code-block:: bash 

            {
                NAME = "my_machine"
                IP = "192.168.100.1"
            }

   |

      -  | **Example: When Variable type is tuple**
   
      #. | tf file and registration value

         .. code-block:: bash 

           variable "VAR_hoge" {
               type = tuple([string,number])
               default = ["abc",2023]
           }

      #. | Substitute value example(Substitute value auto registration settings) 

         .. list-table::
            :widths: 5 10 10 5 10
            :header-rows: 1
            :align: left
         
            * - Item number
              - Variable name
              - Member variable
              - Substitute order
              - Parameter sheet input value
            * -  1
              -  VAR_hoge
              -  [0]
              -  No input
              -  def
            * -  2
              -  VAR_hoge
              -  [1]
              -  No input
              -  2024

      #. | Value sent to Terraform

         .. code-block:: bash 

            ["def", 2024]

   |

      -  | **Example: When variable type is nest management target**
   
      #. | tf file and registration value

         .. code-block:: bash 

           variable "VAR_hoge"{
               type = list(set(string))
               default = [
                 ["aaa","bbb"]
                 ["ccc","ddd"]
               ]
           }

      #. | Substitute value example(Substitute value auto registration settings) 

         .. list-table::
            :widths: 5 10 10 5 10
            :header-rows: 1
            :align: left
         
            * - Item number
              - Variable name
              - Member variable
              - Substitute order
              - Parameter sheet input value
            * -  1
              -  VAR_hoge
              -  [0]
              -  1
              -  AAA
            * -  2
              -  VAR_hoge
              -  [0]
              -  2
              -  BBB
            * - 3
              - VAR_hoge
              - [1]
              - 1
              - CCC
            * - 4
              - VAR_hoge
              - [1]
              - 2
              - DDD

      #. | Value sent to Terraform

         .. code-block:: bash 

            [
               ["AAA", "BBB"],
               ["CCC", "DDD"]
            ]

.. _terraform_common_substitution_order_description:

-  | **※2 …Substitute order target**
   | The substitute order is the order of which specific values are set to variables (starting from top).
   | If the variable type (or the type for the lowest variable in a hierarchy configuration) is "list" or "set", they can be configured in the ":doc:`./terraform_cloud_ep` -> :ref:`terraform_cloud_ep_substitution_value_auto_registration_setting`" and ":doc:`./terraform_cli` -> :ref:`terraform_cli_substitution_value_auto_registration_setting` menus.

      -  | **Example: When Variable type is list**

      #. | tf file and registration value

         .. code-block:: bash 

            variable "VAR_hoge" {
               type = list(string)
            }

      #. | Substitute value example(Substitute value auto registration settings) 

         .. list-table::
            :widths: 5 10 10 5 10
            :header-rows: 1
            :align: left
         
            * - Item number
              - Variable name
              - Member variable
              - Substitute order
              - Parameter sheet input value
            * -  1
              -  VAR_hoge
              -  Input not required
              -  1
              -  ABC
            * - 2
              - VAR_hoge
              - Input not required
              - 2
              - DEF
    
      #. | Value sent to Terraform

         .. code-block:: bash 
        
            ["ABC","DEF"] 

   |

      -  | **Example: When the Hierarchy variable's lowest variable type is "set"**
   
      #. | tf file and registration value

         .. code-block:: bash 
        
            variable "VAR_hoge" {
               type = object({
                  key = set(number)
               })
            }

      #. | Substitute value example(Substitute value auto registration settings) 

         .. list-table::
            :widths: 5 10 10 5 10
            :header-rows: 1
            :align: left
         
            * - Item number
              - Variable name
              - Member variable
              - Substitute order
              - Parameter sheet input value
            * -  1
              -  VAR_hoge
              -  key
              -  1
              -  1
            * - 2
              - VAR_hoge
              - key
              - 2
              - 2

      #. | Value sent to Terraform

         .. code-block:: bash 

            {
                key = [1,2]
            }


Describing construction code
==================

| This section explains how to write Modules and Policies for the Terraform driver.
| The Policy function is only activate for the Terraform Cloud/EP driver.

.. _terraform_common_module_description:

Describing Module
------------

| Module files are written in HasiCorp's original language, HCL (HashiCorp ConfigurationLanguage).
| For more information, see the Terraform product manuals.

.. _terraform_common_policy_description:

Describing Policy
------------

| Policy files are written in HasiCorp's original language, Sentinel language.
| For more information, see the Terraform product manuals.


Appendix
====

.. _terraform_cloud_ep_module_example:

Module file "Variable block" input/register example
--------------------------------------------

This section contains substitute value auto registration settings registration examples and "Variable block" description examples for each variable type.

#. | **Simple pattern**

   #. | string type
    
      .. figure:: /images/ja/terraform_common/variable_string.png
         :alt: string type
         :align: left
         :width: 600px
               
   #. | number type
   
      .. figure:: /images/ja/terraform_common/variable_number.png
         :alt: number type
         :align: left
         :width: 600px
   
   #. | bool type
   
      .. figure:: /images/ja/terraform_common/variable_bool.png
         :alt: bool type
         :align: left
         :width: 600px

   #. | list type
  
      .. figure:: /images/ja/terraform_common/variable_list.png
         :alt: list type
         :align: left
         :width: 600px
  
   #. | set type
   
      .. figure:: /images/ja/terraform_common/variable_set.png
         :alt: set type
         :align: left
         :width: 600px
      

   #. | tuple type
 
      .. figure:: /images/ja/terraform_common/variable_tuple.png
         :alt: tuple type
         :align: left
         :width: 600px

   #. | map type
   
      .. figure:: /images/ja/terraform_common/variable_map.png
         :alt: map type
         :align: left
         :width: 600px
                 

   #. | object type
   
      .. figure:: /images/ja/terraform_common/variable_object.png
         :alt: object type
         :align: left
         :width: 600px

   #. | any type
 
      .. figure:: /images/ja/terraform_common/variable_any.png
         :alt: map type
         :align: left
         :width: 600px
 

   #. | No type description

      .. figure:: /images/ja/terraform_common/variable_no_type.png
         :alt: No type description
         :align: left
         :width: 600px

#. | **Complicated patterns**

   #. | list type within list type

      .. figure:: /images/ja/terraform_common/variable_list_list.png
         :alt: list type within list type
         :align: left
         :width: 600px

   #. | object type within list type
   
      .. figure:: /images/ja/terraform_common/variable_list_object.png
         :alt: object type within list type
         :align: left
         :width: 600px
 

   #. | object type within list type within object type

      .. figure:: /images/ja/terraform_common/variable_object_list_object.png
         :alt: object type within list type within object type
         :align: left
         :width: 600px

#. | **Special pattern**

   #. | map type within list type

      .. figure:: /images/ja/terraform_common/variable_list_map.png
         :alt: map type within list type
         :align: left
         :width: 600px
           
.. _terraform_nested_example:

Variable nest management flow example
----------------------

This section contains examples on operating the Variable nest management menu.

#. | **Increasing maximum number of cycles**

   .. figure:: /images/ja/terraform_common/nested_gain.png
        :alt: Increasing maximum number of cycles
        :align: left
        :width: 600px

#. | **Decreasing maximum number of cycles**

   .. figure:: /images/ja/terraform_common/nested_decrease.png
        :alt: Decreasing maximum number of cycles
        :align: left
        :width: 600px

