Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "products#index"

  resources :carts do
    collection do
      post :checkout
      delete :clean
    end
  end

  namespace :admin do
    resources :products
    resources :orders
    resources :users do
      member do
        post :to_admin
        post :to_normal
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :items, controller: "cart_items"

  resources :orders do
    member do
      get :pay_with_credit_cart
    end
  end

  namespace :account do
    resources :orders
  end

end
