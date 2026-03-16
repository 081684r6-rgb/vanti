FROM php:8.2-apache

# Ensure required PHP extensions are installed (mysqli + pdo_mysql for MySQL)
RUN docker-php-ext-install mysqli pdo_mysql

# Ensure only one MPM is enabled (some platforms may enable multiple by default)
RUN rm -f /etc/apache2/mods-enabled/mpm_*.load /etc/apache2/mods-enabled/mpm_*.conf \
 && a2enmod mpm_prefork

# Force unload any other MPMs in case the environment tries to enable them
RUN printf 'UnloadModule mpm_event_module\nUnloadModule mpm_worker_module\n' > /etc/apache2/conf-available/disable-other-mpms.conf \
 && a2enconf disable-other-mpms

# Enable Apache rewrite rules (needed for your panel.htaccess)
RUN a2enmod rewrite

# Ensure .htaccess is honored
RUN sed -ri 's!<Directory /var/www/>!<Directory /var/www/html/>!g' /etc/apache2/apache2.conf \
 && sed -ri 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Copy the entire project into the container
COPY . /var/www/html

# Copy entrypoint script and ensure it is executable
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Ensure Apache user owns the files
RUN chown -R www-data:www-data /var/www/html

# Prevent Apache warning about fully-qualified domain name
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80

# Healthcheck for container orchestrators (Railway, etc.)
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
