NginxSimpleCGI
==============

This cookbook provides CGI support for NGINX via SimpleCGI.

Repository
----------

https://github.com/heavywater/chef-nginx_simplecgi

Options
-------

* `node[:nginx_simplecgi][:cgi] -> Enable CGI dispatch`
* `node[:nginx_simplecgi][:php] -> Enable PHP dispatch`
* `node[:nginx_simplecgi][:php_cgi_bin] -> PHP executable path for CGI`
* `node[:nginx_simplecgi][:init_type] -> Init style for dispatchers`
* `node[:nginx_simplecgi][:dispatcher_directory] -> Directory to contain socket and pid files`
* `node[:nginx_simplecgi][:dispatcher_processes] -> Number of dispatcher processes for handling requests`

Template Helper
---------------

A template method helper, `dispatch` is provided to add the require location 
block into your nginx configuration files:

```ruby
<%= nginx_dispatch(:cgi) %>
```

The default call will output:

```
  location ~ ^/cgi-bin/.*\.cgi$ {
    gzip off; 
    fastcgi_pass  unix:/var/run/nginx/cgiwrap-dispatch.sock;
    fastcgi_index index.cgi;
    fastcgi_param SCRIPT_FILENAME /usr/lib$fastcgi_script_name;
    fastcgi_param QUERY_STRING     $query_string;
    fastcgi_param REQUEST_METHOD   $request_method;
    fastcgi_param CONTENT_TYPE     $content_type;
    fastcgi_param CONTENT_LENGTH   $content_length;
    fastcgi_param GATEWAY_INTERFACE  CGI/1.1;
    fastcgi_param SERVER_SOFTWARE    nginx;
    fastcgi_param SCRIPT_NAME        $fastcgi_script_name;
    fastcgi_param REQUEST_URI        $request_uri;
    fastcgi_param DOCUMENT_URI       $document_uri;
    fastcgi_param DOCUMENT_ROOT      $document_root;
    fastcgi_param SERVER_PROTOCOL    $server_protocol;
    fastcgi_param REMOTE_ADDR        $remote_addr;
    fastcgi_param REMOTE_PORT        $remote_port;
    fastcgi_param SERVER_ADDR        $server_addr;
    fastcgi_param SERVER_PORT        $server_port;
    fastcgi_param SERVER_NAME        $server_name;
  }
```

Available options:

* `:pattern -> change the pattern nginx matches`
* `:cgi_bin_dir -> change the prefix directory of the local cgi-bin`
* `:dispatcher -> use a custom dispatcher (socket or tcp based)`
* `:custom -> string to be appended within the location block`

The method will also accept a block that will be eval'd and the result appended
within the location block.
