
Rails.application.routes.draw do
  root to: 'application#home'

  # mount IshManager::Engine,      :at => '/manager'
  mount WcoHosting::Engine,      :at => '/hosting'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  resources :users

end
