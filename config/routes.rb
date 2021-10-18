Rails.application.routes.draw do
  devise_for :users 
  get 'product', to:'product#index'
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
