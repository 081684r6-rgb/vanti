#!/bin/sh

# Railway (and other platforms) provide $PORT at runtime.
# Use PHP's built-in server instead of Apache to avoid Apache MPM conflicts.
PORT=${PORT:-80}

cd /var/www/html
exec php -S 0.0.0.0:$PORT router.php
