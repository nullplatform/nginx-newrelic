#!/bin/sh
# Create a self signed default certificate, so Ngix can start before we have
# any real certificates.

_term() {
  echo "Stopping nginx"
  nginx -g "daemon off;" -c $NGINX_CONFIG -s stop
}
unset term_child_pid
unset term_kill_needed
trap '_term' TERM INT

NGINX_CONFIG=/app/config/nginx.conf
cp /app/config/nginx.conf.tpl $NGINX_CONFIG

CPUS=$(cat /proc/cpuinfo | grep processor | wc -l)
sed -i "s/##CPUS##/$CPUS/g" $NGINX_CONFIG
echo "Staring nginx";
nginx -g "daemon off;" -c $NGINX_CONFIG