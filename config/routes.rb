Rails.application.routes.draw do
  resources :brands
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :brands
      resources :main_categories
      resources :inventories
      resources :products
      resources :sub_categories
      resources :users, only: [:create,:index]
      post "/login", to: "users#login"
      resources :order_items
      resources :orders
      resources :cart_items
      resources :carts
      resources :user_addresses
      resources :reviews
    end
  end

end
