Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


    get 'services', to: 'pages#services'
    get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'

resources :realisations
resources :articles
resources :banners
resources :clientlogos

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
