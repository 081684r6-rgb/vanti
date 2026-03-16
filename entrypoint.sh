#!/bin/sh

# Railway (and other platforms) provide $PORT at runtime.
# Apache defaults to port 80, so adjust if needed.
if [ -n "$PORT" ] && [ "$PORT" != "80" ]; then
  sed -i "s/Listen 80/Listen $PORT/" /etc/apache2/ports.conf
  sed -i "s/<VirtualHost \*:80>/<VirtualHost *:$PORT>/" /etc/apache2/sites-available/000-default.conf
fi

# Ensure only one MPM is enabled (Railway sometimes enables multiple MPMs)
rm -f /etc/apache2/mods-enabled/mpm_*.load /etc/apache2/mods-enabled/mpm_*.conf
if [ -f /etc/apache2/mods-available/mpm_prefork.load ]; then
  a2enmod mpm_prefork >/dev/null 2>&1 || true
fi

exec docker-php-entrypoint apache2-foreground
