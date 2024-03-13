#!/bin/bash

PHP_OUTPUT=$(php -v)
PHP_VERSION=${PHP_OUTPUT:4:3}

NEW_PHP_VERSION=$1

if [ $# -eq 0 ]
  then
    echo "Usage: phpvm <version>"
    exit 1
fi

case $NEW_PHP_VERSION in
    5.6|7.1|7.2|7.3|7.4|8.0)
        # do nothing
        ;;
    *)
        # error
        echo "Error: PHP v${NEW_PHP_VERSION} is not available! (available versions: 5.6, 7.1, 7.2, 7.3, 7.4, 8.0)" >&2
        exit 1
esac

if [ "$PHP_VERSION" == "$NEW_PHP_VERSION" ]; then
    echo "PHP v${PHP_VERSION} is already selected!"
else
    /usr/local/bin/brew unlink php@${PHP_VERSION} && /usr/local/bin/brew link php@${NEW_PHP_VERSION}
fi