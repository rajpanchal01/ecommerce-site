Rails.application.routes.draw do
  # resources :discount_items
  # resources :discounts
  # resources :brands
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
      resources :orders
      resources :cart_items
      resources :carts
      resources :user_addresses
      resources :users, only: [:create,:index]
      post "/login", to: "users#login"
      get "/search", to: "products#search"
      get "/rating", to: "products#rating"
      get "/verify", to: "users#verify"
      get "/set_seller", to: "users#set_seller"
      resources :order_items
      resources :orders
      resources :cart_items
      resources :carts
      resources :user_addresses
      resources :payments
      resources :reviews
      resources :wishlists
      resources :wishlist_items
      resources :discounts
      resources :discount_items
      resources :sellers
    end
  end

end
