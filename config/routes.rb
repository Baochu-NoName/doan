Rails.application.routes.draw do
  devise_for :users 
 #
  root 'product#index'
 #get 'homepage/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # root 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end