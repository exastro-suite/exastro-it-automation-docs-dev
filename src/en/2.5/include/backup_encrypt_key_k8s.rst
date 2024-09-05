
| Exastro system system passwords, authentication and other sensitive information is all encrypted.
| Make sure to backup the encrypt key fetched below and save it somewhere safe.

.. danger::
   | If the ecrypt key is lost, the user will not be able to restore data when restoring backup data.

.. code-block:: bash
   :caption: Command

   # Exastro IT Automation ENCRYPT_KEY
   kubectl get secret ita-secret-ita-global -n exastro -o jsonpath='{.data.ENCRYPT_KEY}' | base64 -d

.. code-block:: bash
   :caption: Output results

   JnIoXzJtPic2MXFqRl1yI1chMj8hWzQrNypmVn41Pk8=

.. code-block:: bash
   :caption: Command

   # Exastro Platform ENCRYPT_KEY
   kubectl get secret platform-secret-pf-global -n exastro -o jsonpath='{.data.ENCRYPT_KEY}' | base64 -d

.. code-block:: bash
   :caption: Output results

   bHFZe2VEVVM2PmFeQDMqNG4oZT4lTlglLjJJekxBTHE=
