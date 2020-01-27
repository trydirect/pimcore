#!/bin/bash

mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "ALTER DATABASE $PIMCOREDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
