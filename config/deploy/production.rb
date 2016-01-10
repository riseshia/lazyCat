# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server '108.61.163.242', user: 'deploy', roles: %w{app db web}

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/apps/lazycat'

set :puma_threads, [4, 16]
set :puma_workers, 0

set :nginx_server_name, -> { 'lazycat.nyatorie.com' }

# SSL
set :nginx_use_ssl, false
set :nginx_ssl_cert_path, '/etc/letsencrypt/live/lazycat.nyatorie.com/fullchain.pem'
set :nginx_ssl_key_path, '/etc/letsencrypt/live/lazycat.nyatorie.com/privkey.pem'
