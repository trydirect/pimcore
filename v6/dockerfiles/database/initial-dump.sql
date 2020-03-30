CREATE DATABASE pimcore charset=utf8mb4;

CREATE USER 'pimcore'@'%' IDENTIFIED BY 'pimcore';
GRANT ALL ON `pimcore`.* TO 'pimcore'@'%';
