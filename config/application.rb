require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

begin
  require "dotenv"
rescue LoadError => e
  #
end

if defined?(Dotenv)
  Dotenv.load
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module AirbrakeToPushoverApi
  class Application < Rails::Application
    config.assets.enabled = false
    config.time_zone = 'Eastern Time (US & Canada)'
  end
end
