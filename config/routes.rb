Rails.application.routes.draw do
  devise_for :users
  resources :users

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  resources :relationships,       only: [:create, :destroy]
  resources :microposts,          only: [:create, :destroy]

  resources :users do
    member do
      get :following, :followers
    end
  end
end
