require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Load local ENV vars
local_env = "config/local_variables.rb"
load(local_env) if File.exists?(local_env)

module Tp4me
  class Application < Rails::Application
    config.api_only = true
  end
end
