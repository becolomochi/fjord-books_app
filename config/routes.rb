Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get '/', to: redirect('/users')

  devise_for :users
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
