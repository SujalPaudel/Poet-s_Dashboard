require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PoetDashboard
  class Application < Rails::Application #make this available to rest of the application
    config.eager_load_paths << "#{Rails.root}/lib" #rails root, I want u to pass in /lib path 
    config.secret_key_base = ENV["SECRET_KEY_BASE"]
  end
end
