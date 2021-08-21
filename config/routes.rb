Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  get '/users/:id/followings', to: 'users#followings'
  get '/users/:id/followers', to: 'users#followers'
  resources :books
  resources :users, only: %i(index show)
  resources :relationships, only: %i(create destroy)
end
