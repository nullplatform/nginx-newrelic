# Nginx Template

## What is this template for ?

This template is designed to streamline the creation of an internal traffic management layer, thereby simplifying the routing of traffic.

## How to use it ?

### config/rules.conf

This file contains all the rules for managing your traffic. If you intend to direct a specific path to a particular pool, please consider adding something similar to the following example:
```nginx
  location ~ ^/my_path {
      proxy_pass https://my_scope_url;
  }
```

### config/nginx.conf.tpl

This file contains the primary configuration of the nginx server. Upon instance startup, it will be copied as nginx.conf, and a series of replacements will take place. If you wish to include additional replacements, kindly add them to the `entrypoint.sh` file.
