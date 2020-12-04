# docker-nginx-php-supervisor

Description
===========

This is based on the <a href="https://github.com/corbosman/nginx-php">corbosman/nginx</a> use sock mode for php-fpm <br/>
and add Supervisor

Some config
===========
can edit http.conf(server part) or supervisor.ini is map /www in container, connect it to the container data volume


Some Command location
=====================
/usr/sbin/nginx
/usr/local/sbin/php-fpm
/usr/bin/supervisord -c /etc/supervisord.conf
/usr/bin/supervisorctl reload
/usr/bin/supervisorctl start all



