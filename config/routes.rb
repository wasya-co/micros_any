
require 'sidekiq/web'

# Sidekiq::Web.use Rack::Auth::Basic do |username, password|
#   username == BASIC_AUTH_NAME && password == BASIC_AUTH_PASSWORD
# end

Rails.application.routes.draw do
  root to: 'application#home'


  mount WcoEmail::Engine => '/email/'
  mount Sidekiq::Web     => '/sidekiq'
  mount Wco::Engine      => '/wco'

  post '/api/email/messages/from-ses', to: 'wco_email/messages#create_from_ses'


  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  resources :users

end
