#!/bin/sh

/etc/init.d/mysql start && sleep 5
echo "start mysql server..."

/etc/init.d/apache2 start && sleep 5
echo "start apache server..."

touch /remains
tail -f /remains
