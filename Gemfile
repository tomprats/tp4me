source "https://rubygems.org"

ruby "2.5.0"

gem "rails"

gem "pg"
gem "unicorn"

gem "geocoder"
gem "user_agent_parser"

group :development do
  gem "capistrano-postgresql"
  gem "capistrano-rails"
  gem "capistrano-rails-collection"
  gem "capistrano-rvm"
  gem "capistrano-secrets-yml"
  gem "capistrano-unicorn-nginx", github: "capistrano-plugins/capistrano-unicorn-nginx", branch: "systemd"

  gem "pry"
  gem "spring"
end
