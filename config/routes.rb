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
      resources :users, only: [:create]
      post "/login", to: "users#login"
    end
  end

end
