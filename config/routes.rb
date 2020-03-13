Rails.application.routes.draw do
  root 'items#index'


  resources :users, path: 'mon_compte'
  devise_for :users, path: ''

  resources :carts, path: 'mon_panier', only: [:show,:index] do
    resources :orders, path: 'mes_commandes', only: [:new, :create, :show]
  end


  resources :items, path: 'kitty' do
    resources :cart_items
    resources :cat_pictures
  end

end
