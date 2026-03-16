#!/bin/sh

# Railway (and other platforms) provide $PORT at runtime.
# Apache defaults to port 80, so adjust if needed.
if [ -n "$PORT" ] && [ "$PORT" != "80" ]; then
  sed -i "s/Listen 80/Listen $PORT/" /etc/apache2/ports.conf
  sed -i "s/<VirtualHost \*:80>/<VirtualHost *:$PORT>/" /etc/apache2/sites-available/000-default.conf
fi

exec docker-php-entrypoint apache2-foreground
