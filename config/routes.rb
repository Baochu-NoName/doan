Rails.application.routes.draw do
  resources :invoices
  devise_for :users 
  resources :products do
  get 'products/:id', to:'product#show'
  resources :reviews, except: [:show, :index]
end

  resources :invoices, except: [:edit, :destroy]
  resources :orders
  resources :order_items
  root 'homepage#index'
  get 'blogs/list'
  get 'blogs/single'  
  get 'blogs/contact'
  get 'carts', to:'carts#show'
  get 'invoices/new', to:'invoices#new'
  get 'invoices', to: 'invoices#index'
  get 'errors/not_found'
  get 'errors/internal_server_error'
  #get 'homepage/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  match "/404", to:"errors#not_found", via: :all
  match "/500", to:"errors#internal_server_error", via: :all
  # root 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
