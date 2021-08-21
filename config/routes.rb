Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    scope module: :users do
      resources :followings, only: %i(index)
      resources :followers, only: %i(index)
    end
  end
  resources :relationships, only: %i(create destroy)
end
