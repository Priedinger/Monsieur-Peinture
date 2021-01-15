Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


    get 'services', to: 'pages#services'
    get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'
    get 'admin', to: 'pages#admin'

resources :realisations do
  member do
    patch :move
  end
end
resources :articles
resources :banners
resources :clientlogos
resources :verbatims
resources :counters


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
