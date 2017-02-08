#!/bin/bash

composer install

PHP_FILES=$(find . -path ./vendor -prune -o -type f -iname "*.php" -print)

echo "--- PHP Syntax"
for PHP_FILE in ${PHP_FILES}; do
  php -l ${PHP_FILE}
  if [ $? -ne 0 ]; then
    exit 1
  fi
done
