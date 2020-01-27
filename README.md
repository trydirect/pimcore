
[![Build Status](https://travis-ci.com/trydirect/wordpress.svg?branch=master)](https://travis-ci.com/trydirect/pimcore)
![Docker Stars](https://img.shields.io/docker/stars/trydirect/pimcore.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/trydirect/pimcore.svg)
![Docker Automated](https://img.shields.io/docker/cloud/automated/trydirect/pimcore.svg)
![Docker Build](https://img.shields.io/docker/cloud/build/trydirect/pimcore.svg)
[![Coverage Status](https://coveralls.io/repos/github/trydirect/pimcore/badge.svg?branch=master)](https://coveralls.io/github/trydirect/pimcore?branch=master)

# Pimcore stack
Deploy Pimcore with docker-compose (development only)

## Stack includes:
- Pimcore v6
- PHP 7.3 fpm
- Ubuntu 18.04



# About Pimcore platform
Pimcore, the leading open-source enterprise software platform for PIM, DAM & eCommerce

Docker hub image: https://cloud.docker.com/repository/docker/trydirect/pimcore

## RUN installer
```
docker-compose exec --user=pimcore pimcore bash -c "chmod 0777 -R /var/www/html/web/var"
docker-compose exec db bash -c /scripts/mysql.sh
docker-compose exec --user=pimcore pimcore ./vendor/bin/pimcore-install --mysql-host-socket db --admin-username "admin" --admin-password "admin" --mysql-username "pimcore" --mysql-password "pimcore" --mysql-database "pimcore" --no-interaction 
```

## Quick deployment to cloud
##### Amazon AWS, Digital Ocean, Hetzner and others

Pimcore version 5 [<img src="https://img.shields.io/badge/quick%20deploy-%40try.direct-brightgreen.svg">](https://try.direct/server/user/deploy/InBpbWNvcmV8NnwxMiI.EAoFeA.NqZkUfUOLs9kNJG3WHwkjPePTkE/)

