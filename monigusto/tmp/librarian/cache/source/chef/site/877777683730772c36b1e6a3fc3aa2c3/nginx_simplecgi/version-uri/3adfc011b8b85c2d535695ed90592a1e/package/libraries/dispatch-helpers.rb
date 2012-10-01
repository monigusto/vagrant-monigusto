module NginxSimpleCGI
  # type:: Type of dispatch (currently supported: :php, :cgi (defaults to :cgi))
  # args:: Custom arguments
  #   * :pattern => CGI pattern (defaults: ^/cgi-bin/.*\.cgi$)
  #   * :cgi_bin_dir => CGI bin directory prefix (defaults: '/usr/lib')
  #   * :dispatcher => Dispatcher socket directory  (defaults: directory
  #     provided via node[:nginx_simplecgi][:dispatcher_directory]
  #   * :custom => String appended into location block
  # block:: Eval'ed and result string casted and appended into location block
  #     
  def nginx_dispatch(type = :cgi, args={})
    args = {
      :pattern => type == :php ? '.php$' : '^/cgi-bin/.*\.cgi$', 
      :cgi_bin_dir => '/usr/lib',
      :docroot => '/var/www',
      :dispatcher => "unix:#{File.join(node[:nginx_simplecgi][:dispatcher_directory], "#{type}wrap-dispatch.sock")}"
    }.merge(args)
    %Q(
  location ~ #{args[:pattern]} {
    gzip off; 
    fastcgi_pass  #{args[:dispatcher]};
    fastcgi_index index.#{type};
    #{
      if(type == :cgi)
        "fastcgi_param SCRIPT_FILENAME #{args[:cgi_bin_dir]}$fastcgi_script_name;"
      else
        "fastcgi_param SCRIPT_FILENAME #{args[:docroot]}$fastcgi_script_name;"
      end
    }
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
    #{"fastcgi_param REDIRECT_STATUS        200;" if type == :php}
    #{args[:custom] if args[:custom]}
    #{yield.to_s if block_given?}
  }
    )
  end
end

::Erubis::Context.send(:include, NginxSimpleCGI)
