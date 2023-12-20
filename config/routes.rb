
Rails.application.routes.draw do
  root to: 'application#home'


  mount Iro::Engine,      :at => '/trading'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  resources :users

end
