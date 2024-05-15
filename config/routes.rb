
require 'sidekiq/web'

# Sidekiq::Web.use Rack::Auth::Basic do |username, password|
#   username == BASIC_AUTH_NAME && password == BASIC_AUTH_PASSWORD
# end

Rails.application.routes.draw do
  root to: 'application#home'


  mount WcoEmail::Engine   => '/email'
  mount WcoHosting::Engine => '/hosting'
  mount Iro::Engine        => '/trading'
  mount Sidekiq::Web       => '/sidekiq'
  mount Wco::Engine        => '/wco'

  post '/api/email/messages/from-ses', to: 'wco_email/api#create_email_message'
  get  '/api/obf/:id',                 to: 'wco/obfuscared_redirects#show', as: :obf

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  resources :users

end
