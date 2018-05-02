Rails.application.routes.draw do
  get 'site/home'
  get 'site/profile'
  devise_for :users
  resources :orders
  resources :order_items
  resources :products
  root 'site#home'
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"
  #devise_for :users, controllers: { confirmations: 'confirmations' } 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
