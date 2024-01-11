# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
Rails.application.config.action_dispatch.cookies_serializer = :json
Rails.application.config.filter_parameters += [
  :passw, :secret, :token, :_key, :crypt, :salt, :certificate, :otp, :ssn
]
ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: [:json]
end

