Rails.application.routes.draw do
  get 'blogs/list'
  get 'blogs/single'
  resources :invoices
  devise_for :users 
  resources :products do
  get 'products/:id', to:'product#show'
end
  get 'carts', to:'carts#show'
  get 'invoices/new', to:'invoices#new'
  get 'invoices', to: 'invoices#index'
  resources :invoices, except: [:edit, :destroy]
  resources :orders
  resources :order_items
  resources :carts
   # post 'products/order_items/:id',to:'products#order_items', as:'order_items' 
  #post 'products/add_to_cart/:id', to:'products#add_to_cart', as: 'add_to_cart'
  #delete 'products/remove_from_cart/:id', to:'products#remove_from_cart', as: 'remove_from_cart'

  root 'homepage#index'
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
