==========
Writing guidelines
==========

Document structure
==================

.. code-block:: bash

    exastro-it-automation-docs
    |-- LICENSE
    |-- README.md
    |-- apple-touch-icon.png
    |-- asset                    # Where files are stored
    |   |-- css                  # CSS files
    |   |-- img                  # Image files
    |   `-- json                 # Content data
    |       `-- faq.json         # FAQ data
    |-- documentation
    |   |-- Makefile
    |   |-- _static
    |   |   |-- custom.css
    |   |   `-- favicon.ico
    |   |-- conf.py
    |   |-- exastro_documents
    |   |   |-- layout.html
    |   |   |-- static
    |   |   |   |-- exastro_documents.css
    |   |   |   |-- exastro_documents.js
    |   |   |   |-- fonts
    |   |   |   |-- img
    |   |   |   `-- option.css_t
    |   |   `-- theme.conf
    |   |-- html
    |   |   |-- _images
    |   |   |-- _sources
    |   |   |-- _static
    |   |   |-- genindex.html
    |   |   |-- index.html
    |   |   |-- objects.inv
    |   |   |-- search.html
    |   |   |-- searchindex.js
    |   |   `-- 2.0
    |   |       |-- index.html
    |   |       |-- ja
    |   |       `-- ja_manual_design
    |   |-- images
    |   |   |-- ja_manual_design
    |   |   |   |-- before_after_2_0.png
    |   |   |   |-- chart.png
    |   |   |   |-- image2.png
    |   |   |   |-- indexrst_syntax1_v2_0.png
    |   |   |   |-- role_of_index_rst_v2_0.png
    |   |   |   |-- sample_img_v2_0.png
    |   |   |   |-- title_in_index_rst_v_2_0.png
    |   |   |   |-- toctree2_v2_0.png
    |   |   |   |-- toctree_lvl1.png
    |   |   |   `-- toctree_lvl2.png
    |   |   `-- platform
    |   |       `-- administrator-console.png
    |   |-- index.rst
    |   |-- requirements.txt
    |   `-- 2.0
    |       |-- index.rst
    |       `-- ja
    |           |-- ansible-driver
    |           |-- appendix
    |           |-- create_param
    |           |-- index.rst
    |           |-- installation
    |           |-- installation_appendix
    |           |-- it_automation_base
    |           |-- manual_design
    |           |-- platform
    |           `-- rest_api
    |-- documents.html
    |-- documents_ja.html
    |-- downloads.html
    |-- downloads_ja.html
    |-- faq.html
    |-- faq_ja.html
    |-- favicon.ico
    |-- index.html
    |-- index_ja.html
    |-- learn.html
    |-- learn_ja.html
    |-- overview.html
    |-- overview_ja.html
    `-- webinar_ja.html


Guidelines for writing
============

Goal
----

| This section describes how to write better and more comprehensive text for the users.

Prerequisites
--------

| This guide is created for the following writers

- Writers that wants to know what kind of expressions to use when writing documents. 
- Writers that wants to level up their writing-skills.


Overview
----

| Documentation should help users reach their goal step by step while also being concise and comprehensive.
| Good documentation should therefore share what the guide aims to do and should be clear with the process of achieving said goal.
| The documentation should also contain a section for prerequisites in order to prevent process divergence. 


Details
----

| Starting the documentation with a goal and following it with a clear step by step process on how to reach said goal.
| Using cooking as a metaphor, most recipes starts with describing what recipe is for (goal), continues to show the ingredients (prerequisites) before going into the process of cutting vegetables, cooking and seasoning (overview and details).
| The guide should contain information regarding what the user really is looking for. Not the size of the pan or the type of knife they are using, but how to create the meal they want to eat.

| A good document structure should contain the following.

1. Goal
2. Rerequisites
3. Overview
4. Details
5. Example
6. Appendix

| 1. Goal. 
The "Goal" section should be written in order to make sure that you and the user are on the same page.
| Writing clear steps and reasoning them helps the user understand the process and keeps them on the same wavelength. The introduction is also crucial, as it is what the user will use to decide if this is what they were looking for or not.

| 2. Prerequisites.
The "Prerequisites" section should be a part of the document in order to make sure the user are able to follow the document without any errors and stops caused by system fluctuation
| That being said, writing too many requisites limits the what users this applies to, so make sure to keep it open.

| 3. Overview.
 The "Overview" section shortly explains what the procedure the user will have to follow in order to accomplish the goal.
| The detailed procedure will come right after this, so this section should be simple and easy to understand.

| 4. Details.
 The "Details" section is where the procedure starts and tells the user what to do step-by-step.
 While it can be OK to explain more about each function and their features, writing too much can overflow the user with information. Any extensive extra information can be written in the "6. Appendix." section.

| 5. Example.
 The "Example" section should contain examples that should help the user understand the procedure and the function better.

| 6. Appendix. 
 The "Appendix" section can be used to include more detailed information for those who wants to learn more about the contents and the function(s) used.


Example
------

| This guide is written using this structure.


Style, Vocabulary and other guidelines
==========

Style:
  | Documentation should use pronouns and use phrases such as "the user" and "the reader". 
  | Documentation should use the same writing style. The official Exastro guides uses English (US).
  | Documentation should be written in a professional manner. 
  | The reader should be addressed in third-person (The reader user). The guide can refer to the authors as "We", but not "I". 
  | Documentation should be objective.

Consistency
==========

|  Make sure to keep the vocabulary consistent when writing. If there are two words that holds the same meaning in the document, change one of them to match the other.
|  e.g. 
|  　Build、create  --> Unify to "Build".
|  　Execute, Run  -->  Unify to "Run".


Terminology
==============

| Any terminology used in the document should be be defined and have their meaning explained before being used.


Syntax errors
==========

| No Warning or Error should be included in the output results from building and/or checking syntax using an editor.
| Only commit after you are sure that there are no grammatical errors.