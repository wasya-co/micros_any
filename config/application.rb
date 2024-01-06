require_relative "boot"

require "active_model/railtie"
require "active_job/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

require 'wco_models'

module MicrosEmail
  class Application < Rails::Application
    config.load_defaults 6.1

    config.generators.system_tests = nil

    config.generators do |g|
      g.orm :mongoid
    end

  end
end
