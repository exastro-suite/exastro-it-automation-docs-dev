====
format
====

Heading
======

H1 (Heading 1, Title)
----------------------

| Format used for H1 heading.

Method
^^^^^^^^

| Input the same amount of :kbd:`=` (equal signs) as the string both over and under the title.

Example
^^^^^^
.. code-block::

   =====
   Title
   =====

Results
^^^^^^^^

See the title of this page.


H2 (Heading 2)
------------

| Format used for H2 heading.

Method
^^^^^^^^

| Input the same amount of :kbd:`=` (equal signs) as the string under the heading.

Example
^^^^^^

.. code-block::

   Heading 2
   =========


H3 (Header 3)
------------

| Format used for H3 heading.

Method
^^^^^^^^
| Input the same amount of :kbd:`-` (hyphen) as the string under the heading.

Example
^^^^^^

.. code-block::

   Heading 3
   -------


H4 (Heading 4)
------------

| Format used for H4 heading.

Method
^^^^^^^^

| Input the same amount of :kbd:`^` (caret) as the string under the heading.

Example
^^^^^^

.. code-block::

   Heading 4
   ^^^^^^^


H5 (Heading 5)
------------

| Format used for H5 heading.

Method
^^^^^^^^

| Input the same amount of :kbd:`*` (asterisk) as the string under the heading.

Example
^^^^^^

.. code-block::

   Heading 5
   *******


H6 (Heading 6) and above
-----------------------

| The Exastro Documentation does not use Heading over H6.

.. danger::
   | Using Heading levels over H6 might overcomplicate the structure and make the document harder to read.


Heading examples (H2-H6)
==============================

Heading 3
-------

Heading 4
^^^^^^^

Heading 5
*******

Heading 6
~~~~~~~

Paragraphs
==========

| All sentences must be formatted as paragraphs.

Explanation
----

Method
^^^^^^^^

| Input :kbd:`| ` (Pipe + space) in front of the text

Example
^^^^^^

.. code-block:: bash

   | Start of the paragraph
   | The continuation

   | Paragraph number 2

   Heading
     | Contents 1
     | Contents 2


Results
^^^^^^^^

| First line of first paragraph.
| Second line of first paragraph.

| First line of second paragraph.
| Second line of second paragraph.

heading
  | Contents 1
  | Contents 2

Tab 
====

| Used when there are multiple choices when explaining.

Description
----

Method
^^^^^^^^

| Define directives with :kbd:`.. tabs::`.

Example
^^^^^^

.. code-block:: bash

   Programs that outputs Hello world

   .. tabs::

      .. tab:: C language

         Use :kbd:`printf`.

         .. code-block:: c
            :caption: helloworld.c
            :linenos:

            #include <stdio.h>

            main()
            {
               printf("Hello World\n");
            }

      .. tab:: Shell script

         Use :kbd:`echo`.

         .. code-block:: shell
            :caption: helloworld.sh
            :linenos:

            #!/bin/bash
            echo "Hello World"
            exit 0

      .. tab:: Python

         Use :kbd:`print`.

         .. code-block:: python
            :caption: helloworld.py
            :linenos:

            print("Hello World")

Results
^^^^^^^^

Programs that outputs Hello world

.. tabs::

   .. tab:: C language

      Use :kbd:`printf`.

      .. code-block:: c
         :caption: helloworld.c
         :linenos:

         #include <stdio.h>

         main()
         {
            printf("Hello World\n");
         }

   .. tab:: Shell script

      Use :kbd:`echo`.

      .. code-block:: shell
         :caption: helloworld.sh
         :linenos:

         #!/bin/bash
         echo "Hello World"
         exit 0

   .. tab:: Python

      Use :kbd:`printf`.

      .. code-block:: python
         :caption: helloworld.py
         :linenos:

         print("Hello World")


.. _manual_syntax_word:

Code
======

Explanation
----

| Used when displaying source code and commands.

Method
^^^^^^^^
| Define directives with :kbd:`.. code-block:: [Code language]`.

The options are as following


.. list-table:: code-block options
   :widths: 20, 40, 30
   :header-rows: 1
   :align: left

   * - Option
     - Explanation
     - Setting value
   * - name
     - Reference definition
     - exastro_yaml
   * - caption
     - File name
     - (E.g.) exastro.yaml
   * - linenos
     - Display/Dont display number of lines
     - (Not needed)
   * - lineno-start
     - Number of the starting display line
     - 5 (Numeric value)
   * - emphasize-lines
     - Emphasize specific lines within a code
     - 12,13 (Line area)


.. note::
   | The code-block's definition and the actual code needs to be seperated by one line.
   | Indents requires 3 spaces.

Example
^^^^^^

.. code-block:: yaml

   .. code-block:: yaml
      :name: exastro_yaml
      :caption: exastro.yaml
      :linenos:
      :lineno-start: 5
      :emphasize-lines: 12,13

      # Default values for Exastro.
      # This is a YAML-formatted file.
      # Declare variables to be passed into your templates.
      global:
        itaGlobalDefinition:
          name: ita-global
          enabled: true
          image:
            registry: "docker.io"
            organization: exastro
            package: exastro-it-automation
          config:
            DEFAULT_LANGUAGE: "ja"
            LANGUAGE: "en"

Results
^^^^^^^^

.. code-block:: yaml
   :name: exastro_yaml
   :caption: exastro.yaml
   :linenos:
   :lineno-start: 5
   :emphasize-lines: 12,13

   # Default values for Exastro.
   # This is a YAML-formatted file.
   # Declare variables to be passed into your templates.
   global:
     itaGlobalDefinition:
       name: ita-global
       enabled: true
       image:
         registry: "docker.io"
         organization: exastro
         package: exastro-it-automation
       config:
         DEFAULT_LANGUAGE: "ja"
         LANGUAGE: "en"

Word expressions
========

| This manual uses the following words for the following expressions.

.. list-table:: Word expressions
   :widths: 20, 20, 40, 30
   :header-rows: 1
   :align: left

   * - Name
     - Expression example
     - Format
     - Written example(Input example)
   * - menuselection
     - Menu/ Screen/ Screen item
     - | ``:menuselection:`Menu --> Submenu```
       | ``:menuselection:`Screen name```
       | ``:menuselection:`Item```
     - | :menuselection:`Menu --> Submenu`
       | :menuselection:`Screen name`
       | :menuselection:`Item`
   * - guilabel
     - Button
     - ``:guilabel:`Button```
     - :guilabel:`Button`
   * - kbd
     - Keyboard inputs
     - | ``:kbd:`Ctrl + Z```
       | ``:kbd:`Character string```
     - | :kbd:`Ctrl + Z`
       | :kbd:`Character string`
   * - program
     - Setting item/value on GUI
     - | ``:program:`Item```
       | ``:program:`Input data```
     - | :program:`Item`
       | :program:`Input data`
   * - file
     - File/ Directory path
     - ``:file:`/path/to/file```
     - :file:`/path/to/file`
   * - dfn
     - Terminology definition
     - ``:dfn:`Terminology```
     - :dfn:`Terminology`

.. danger::
   | Do not use "" or make boldify characters in order to emphasize them.
   | Use one of the word expressions listed above.

Picture
====

Picture(Normal use)
--------------

| Use the figures in order to insert pictures inbetween text.
| Align pictures to the left.

Method
^^^^^^^^

| Use the following format in order to insert figures.

Example
^^^^^^

.. code-block:: bash

   | Display with a width of 100px

   .. figure:: ../../../images/manual_design/charg.png
      :width: 100px
      :alt: role_of_index

       width 100px Picture <--- Caption

Results
^^^^^^^^

| This will display a picture with the width of 100px.

.. figure:: /images/manual_design/chart.png
   :width: 100px
   :alt: role_of_index

   100px wide picture

.. note::
   | When updating manuals and inserting updated pictures, create a new file that includes the version in the file name.
   |
   | Old file name: sample.png
   | New file name: sample_v2-3.png

Picture(Text reference)
--------------

| Use images in order to use pictures that takes the same space as 1 line and can be used between characters.

Method
^^^^^^^^

| Use the following format in order to insert images.


Example
^^^^^^

.. code-block:: bash

   Insert images in strings |aa|  like this.

   .. |aa| image:: ../../../images/manual_design/chart.png
      :width: 2.0em
      :alt: Sample picture

Results
^^^^^^^^

Insert images in strings |aa|  like this.

.. |aa| image:: /images/manual_design/chart.png
   :width: 2.0em
   :alt: Sample picture


Tables
============

List table(recommended)
--------------------

| Format for writing list tables.
| Exastro ITA documentation mainly uses list tables, not grid tables.

.. danger::
   | List tables are used for the reason that they are both easy to read and write.
   | Grid tables on the other hand are more advanced and harder to write.

Method
^^^^^^^^

| Use the following format to create a list table with headers and record.

Example
^^^^^^

.. code-block:: bash

   .. list-table:: List table sample
      :widths: 10 10 20
      :header-rows: 1
      :align: left

      * - Column 1
        - Column 2
        - | Column 3
          | (Multiple lines)
      * - Record 1
        - | Field (1,2)
        - | Field (1,3)
          | List tables can
          | contain multiple
          | lines within 1 cell.
      * - Record 2
        - Field (2,2)
        - Field (2,3)

Results
^^^^^^^^

.. list-table:: List table sample
   :widths: 10 10 20
   :header-rows: 1
   :align: left

   * - Column 1
     - Column 2
     - | Column 3
       | (Multiple lines)
   * - Record 1
     - | Field (1,2)
     - | Field (1,3)
       | List tables can
       | contain multiple
       | lines within 1 cell.
   * - Record 2
     - Field (2,2)
     - Field (2,3)

List tables with filters
----------------------------

| Format for creating list tables with column filters.

Method
^^^^^^^^

| Use the following format to create a list table with headers and record.
| Specify :kbd:`filter-table`  for the classes.

Example
^^^^^^

.. code-block:: bash
   :emphasize-lines: 5

   .. list-table:: List table sample
      :widths: 10 10 20
      :header-rows: 1
      :align: left
      :class: filter-table

      * - Column 1
        - Column 2
        - | Column 3
          | (Multiple lines)
      * - Record 1
        - | Field (1,2)
        - | Field (1,3)
          | List tables can
          | contain multiple
          | lines within 1 cell.
      * - Record 2
        - Field (2,2)
        - Field (2,3)

Results
^^^^^^^^

.. list-table:: List table sample
   :widths: 10 10 20
   :header-rows: 1
   :align: left
   :class: filter-table

   * - Column 1
     - Column 2
     - | Column 3
       | (Multiple lines)
   * - Record 1
     - | Field (1,2)
     - | Field (1,3)
       | List tables can
       | contain multiple 
       | lines within 1 cell.
   * - Record 2
     - Field (2,2)
     - Field (2,3)



Grid table(not recommended)
------------------------

| Grid tables uses ASCII characters to create tables.
| This is only used when displaying code and other advanced expressions in tables.

.. danger::
   | List tables are used for the reason that they are both easy to read and write.
   | Grid tables on the other hand are more advanced and harder to write.

Example
^^^^^^
.. code-block:: bash

   .. table:: Grid table sample

      +----------+-------+---------+
      | Head1    | Head2 | Head3   |
      |          |       |         |
      +==========+=======+=========+
      | Cont1    | Cont2 | Cont3   |
      +----------+-------+---------+

Results
^^^^^^^^

.. table:: Grid table sample

   +----------+-------+---------+
   | Head1    | Head2 | Head33   |
   |          |       |         |
   +==========+=======+=========+
   | Cont1    | Cont2 | Cont3   |
   +----------+-------+---------+


Caution for writing grid tables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Newlines within the same row
**************************************

| If the text is too long, the user can input :kbd:`\\` (backslash) in order create newlines within the same row. This makes sure that the next line does not start with a space.

- Correct example

  .. code-block:: bash

     +-------
     | Communication proto\    --> outputs "Communication protocol" 
     | col

  | Enter :kbd:`\ \\` (space + backslash) to create newlines with spaces.

  .. code-block:: bash

     | Access \                 | --> outputs "Access to Exastro ITA Web c ontents"
     | to Exastro ITA \         |
     | Web contents             |
     |                          |
    -+--------------------------+

- Bad example

  .. code-block:: bash

     +-------
     | Communication proto    --> outputs "Communication proto col"
     | col

  .. code-block:: bash

     | Access\                  | --> Breaks the string. (Line 2 starts with a space)
     |  to Exastro ITA\         |
     | Web contents             |
     |                          |
    -+--------------------------+

List notations within tables
^^^^^^^^^^^^^^^^

Example
******

.. code-block:: bash

   .. table:: Table group example 1

      +-----------------+---------+
      | New\            | ItemB   |
      | Functions       |         |   --> Use either "*" or "#." to list items.
      |                 |         |   --> Requires space between the line before.
      | * Item1         |         |
      | * Item2         |         |
      +-----------------+---------+


CSV table (Usage forbidden)
^^^^^^^^^^^^^^^^^^^^^

| Format for creating CSV tables.
| Do not use CSV tables. Use the previously described methods to create newlines within fields.

Example
^^^^^^
.. code-block:: bash

   .. csv-table:: CSV table sample
      :header: Item name 1, Item name 2, Item name 3
      :widths: 10, 30, 30

      Contents 1, Contents 2, Contents 3

Results
^^^^^^^^

.. csv-table:: CSV table sample
   :header: Item name 1, Item name 2, Item name3
   :widths: 10, 30, 30

   Contents 1, Contents 2, Contents 3


.. _manual_syntax_note:

Memo
====

| Memo notations are divided by urgency levels.
| While Note and Tip Memos can be skipped without having large effects on operations, Warning and Danger contains information crucial to the operation and might have large effects on the end product if skipped.
| See below for more information regarding each of the Memo notations.

Explanation
----

Method
^^^^^^^^

| When using Memo notations, make sure that the label fits the contents.
| There are 4 different levels from :kbd:`Note` to :kbd:`Danger`.
| See the Example section below for explanations regarding the different levels.

Example
^^^^^^

.. code-block::

   # Note
   .. note::
      | Contains extra information.
      | Note memo notations should be skipable without the user having any problems.

   # Tip
   .. tip::
      | Contains know-how and tips regarding how to operate the system and operations.
      | Tip memo notations can contain information that might confuse the user if skipped.

   # Warning
   .. warning::
      | Contains information that might be crucial to operating the system.
      | Warning memo notations should contain information that the user should know.

   # Danger
   .. danger::
      | Contains information that might have large effects on the service.
      | Danger memo notations should contain information that might cause large problems if skipped.

Results
^^^^^^^^

.. note::
   | Contains extra information.
   | Note memo notations should be skipable without the user having any problems.

.. tip::
   | Contains know-how and tips regarding how to operate the system and operations.
   | Tip memo notations can contain information that might confuse the user if skipped.

.. warning::
   | Contains information that might be crucial to operating the system.
   | Warning memo notations should contain information that the user should know.

.. danger::
   | Contains information that might have large effects on the service.
   | Danger memo notations should contain information that might cause large problems if skipped.


List ・Items
================

List without numbers
--------------

| Creates a simple list.

Method
^^^^^^^^

| Input :kbd:`-\ ` (hyphen + space) at the start of the string in order to create a list.

.. warning::
   | The parent list and children list must be divided by 1 line.

Example
^^^^^^
.. code-block:: bash

   - Item 1
   - Item 2

     - Item 2-1
     - Item 2-2
   - | Item 3
     | (Multiple lines)

     - | Item 3-1
     - | Item 3-2
       | It is possible to write multiple lines.

Results
^^^^^^^^

- Item 1
- Item 2

  - Item 2-1
  - Item 2-2
- | Item 3
  | (Multiple lines)

  - | Item 3-1
  - | Item 3-2
    | It is possible to write multiple lines.


List with numbers
--------------

| Creates a numbered list.

Method
^^^^^^^^

| Input :kbd:`#.\ ` (sharp or number + dot or space) at the start of the string in order to create a list.
| If the user is creating a list with parent/childs, all the childs (except for the first one) must be created with a number.

.. warning::
   | The parent list and children list must be divided by 1 line.

Example
^^^^^^
.. code-block:: bash

   1. Item 1
   2. Item 2

      #. Item 2-1
      #. Item 2-2
   3. | Item 3
      | (Multiple lines)

      # | Item 3-1
      # | Item 3-2
        | It is possible to write multiple lines.

Results
^^^^^^^^

1. Item 1
2. Item 2

   #. Item 2-1
   #. Item 2-2
3. | Item 3
   | (Multiple lines)

   #. | Item 3-1
   #. | Item 3-2
      | It is possible to write multiple lines.


List ・Items (Special)
=========================

| Use the following method to create stylized lists / items.

List without numbers (Special)
-----------------------

| Creates a simple list (Special).

Method
^^^^^^^^

| Input :kbd:`-\ ` (hyphen + space) at the start of the string in order to create a list.
| Writing items over multiple lines or making an indent on the concurring line creates a normal list.

Example
^^^^^^
.. code-block:: bash

   - Item 1

   | Paragraph 1

   - Item 2

   | Paragraph 2

   - | Item 3
      | Inputting multiple lines creates normal numerized items.

   - Item 4

     Inputting an indent on the next line creates a normal numerized item.

Results
^^^^^^^^

- Item 1

| Paragraph 1

- Item 2

| Paragraph 2

- Item 3
      | Inputting multiple lines creates normal numerized items.

- Item 4

  Inputting an indent on the next line creates a normal numerized item.



List with numbers (Special)
-----------------------

| Creates a list (Special) with numbers.

Method
^^^^^^^^

| Input :kbd:`N.\ ` (number + period +space) at the start of the string in order to create a list (Special) with numbers.
| Writing items over multiple lines or making an indent on the concurring line creates a normal list.

Example
^^^^^^
.. code-block:: bash

   1. Item 1

   | Paragraph 1

   2. Item 2

   | Paragraph 2

   3. | Item 3
      | Inputting multiple lines creates normal numerized items.

   4. Item 4

      Inputting an indent on the next line creates a normal numerized item.

Results
^^^^^^^^

1. Item 1

| Paragraph 1

2. Item 2

| Paragraph 2

3. | Item 3
   | Inputting multiple lines creates normal numerized items.

4. Item 4

   Inputting an indent on the next line creates a normal numerized item.


Reference link expressions
------------------

| Specifying and changing titles is forbidden.

.. code-block:: bash
   :name: Links with specified titles and reference examples.

   OK：:doc:`Reference`
   OK：:ref:`Reference`
   BAD：:doc:`title<Reference>`
   BAD：:ref:`title<Reference>`


.. note::
         | OK： 「:doc:`../../manuals/ansible-driver/index`」
         | BAD： 「:doc:`Click here for the Ansible Driver Manual <../../manuals/ansible-driver/index>` 」

         | OK：  「:ref:`manual_syntax_word`」
         | BAD：  「:ref:`Click here for the Code <manual_syntax_word>`」

| Links that leads to external sites are excluded from this rule and can have their titles changed.

.. code-block:: bash
   :name: Links with specified titles and reference exception examples.

   Reference
   `title <Reference>`
   # E.g.
   OK： The Japanese Sphinx manuals can be found here https://www.sphinx-doc.org/ja/master/.
   OK： `Japanese Sphinx manuals <https://www.sphinx-doc.org/ja/master/>`_
   OK： The Japanese Sphinx manuals can be found `here <https://www.sphinx-doc.org/ja/master/>`_.

.. note::
         | OK： The Japanese Sphinx manuals can be found here https://www.sphinx-doc.org/ja/master/.
         | OK： `Japanese Sphinx manuals <https://www.sphinx-doc.org/ja/master/>`_
         | OK： The Japanese Sphinx manuals can be found `here <https://www.sphinx-doc.org/ja/master/>`_.



Prohibited expressions
========

H6 (Heading 6) and higher
-----------------------

| Format used for H6 heading and higher.
| The use of H6 and higher level headings are prohibited.

| Using H6 level headings (or higher) complicates the text and makes it harder for the reader.
| Do not change the format to include level H6 level headings or higher levels.


Emphasize(Italic, bold)
^^^^^^^^^^^^^^^^^^^^^^

| The use of Bold or Italic text is prohibited.
| Use any of the following :ref:`manual_syntax_word` to stylize text.

.. code-block:: bash

   *Prohibited(Italic)*
   **Prohibited(Bold)**

*Prohibited(Italic)*
**Prohibited(Bold)**

CSV table
^^^^^^^^^^^

| Format for creating CSV tables.
| As using newlines within fields makes CSV tables hard to distinguish from the previously mentioned 2 table methods, the use of CSV tables is prohibited.
