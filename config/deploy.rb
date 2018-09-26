# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "tp4me"
set :keep_releases, 3
set :repo_url, "git@github.com:tomprats/tp4me.git"

# Rails options
set :keep_assets, 3
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"
set :migration_role, :app

# Other plugin options
set :init_system, :systemd
set :nginx_server_name, "tp4.me"
set :nginx_ssl_cert, "fullchain.pem"
set :nginx_ssl_cert_path, "/etc/letsencrypt/live/tp4.me/"
set :nginx_ssl_cert_key, "privkey.pem"
set :nginx_ssl_cert_key_path, "/etc/letsencrypt/live/tp4.me/"
set :nginx_upload_local_cert, false
set :nginx_use_ssl, true
set :pg_system_user, "deploy"
set :pg_without_sudo, true
set :pg_generate_random_password, true
set :rvm_custom_path, "/usr/share/rvm"
set :unicorn_logrotate_enabled, true
