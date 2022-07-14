Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)

  resources :follow_relationships, only: %i{create destroy}

  get 'users/:user_id/followings', to: 'users#followings', as: 'followings'
  get 'users/:user_id/followers', to: 'users#followers', as: 'followers'
end
