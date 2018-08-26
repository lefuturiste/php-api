#!/bin/bash
# env vars
if [ -e /env_vars_added.check ]
then
    rm /etc/php/7.2/fpm/pool.d/www.conf
    cp /etc/php/7.2/fpm/pool.d/www.conf.opsave /etc/php/7.2/fpm/pool.d/www.conf
else
    # first time
    echo "coping..."
    cp /etc/php/7.2/fpm/pool.d/www.conf /etc/php/7.2/fpm/pool.d/www.conf.opsave
    touch /env_vars_added.check
fi
echo "adding env vars..."
echo "" >> /etc/php/7.2/fpm/pool.d/www.conf
echo "env[APP_NAME] = $APP_NAME;" >>  /etc/php/7.2/fpm/pool.d/www.conf
echo "env[APP_ENV] = $APP_ENV;" >>  /etc/php/7.2/fpm/pool.d/www.conf
echo "env[DEBUG] = $DEBUG;" >>  /etc/php/7.2/fpm/pool.d/www.conf
echo "Done!"

echo "Starting php7.2-fpm..."
service php7.2-fpm start
echo "Done!"

echo "Starting nginx server..."
nginx -g "daemon off;"
echo "End of nginx server"