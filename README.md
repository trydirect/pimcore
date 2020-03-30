
[![Build Status](https://travis-ci.com/trydirect/wordpress.svg?branch=master)](https://travis-ci.com/trydirect/pimcore)
![Docker Stars](https://img.shields.io/docker/stars/trydirect/pimcore.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/trydirect/pimcore.svg)
![Docker Automated](https://img.shields.io/docker/cloud/automated/trydirect/pimcore.svg)
![Docker Build](https://img.shields.io/docker/cloud/build/trydirect/pimcore.svg)
[![Coverage Status](https://coveralls.io/repos/github/trydirect/pimcore/badge.svg?branch=master)](https://coveralls.io/github/trydirect/pimcore?branch=master)

# Pimcore stack
Deploy Pimcore with docker-compose multistage

## Stack includes:
- Official PHP docker image: 7.3-fpm
- PHP 7.3 fpm
- Pimcore v6


# About Pimcore platform
Pimcore, the leading open-source enterprise software platform for PIM, DAM & eCommerce

Docker hub dev image: https://cloud.docker.com/repository/docker/trydirect/pimcore:6-dev
Docker hub prod image: https://cloud.docker.com/repository/docker/trydirect/pimcore:6-prod

## RUN installer
```
docker-compose exec pimcore bash -c 'chmod 0777 -R app/config bin composer.json pimcore var web/var'
docker-compose exec pimcore sh -c './vendor/bin/pimcore-install --no-interaction --admin-username=pimcore --admin-password=pimcore --mysql-host-socket=db --mysql-username=root --mysql-password=pimcore --mysql-database=pimcore'
```


## Quick deployment to cloud
##### Amazon AWS, Digital Ocean, Hetzner and others

Pimcore version 5 [<img src="https://img.shields.io/badge/quick%20deploy-%40try.direct-brightgreen.svg">](https://try.direct/server/user/deploy/InBpbWNvcmV8NnwxMiI.EAoFeA.NqZkUfUOLs9kNJG3WHwkjPePTkE/)



