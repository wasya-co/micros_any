
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
    config.encoding = "utf-8"

    config.generators do |g|
      g.orm :mongoid
    end

    config.time_zone = 'Central Time (US & Canada)'
  end
end

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put]
  end
end

def puts! a, b=''
  puts "+++ +++ #{b}:"
  puts a.inspect
end

DEBUG = true
