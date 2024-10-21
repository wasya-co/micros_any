
Rails.application.routes.draw do
  root to: 'application#home'

  get 'test-exception', to: 'application#test_exception'


  mount Wco::Engine,        at: '/wco'
  mount WcoHosting::Engine, at: '/hosting'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  resources :users

end
