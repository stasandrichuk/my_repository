Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :products, only: [:show, :index]
  resource :shopping_cart, only: [:show] do
    get 'add/:product_id', to: 'shopping_carts#add', as: :add_one_to
    get 'remove/:product_id', to: 'shopping_carts#remove', as: :remove_one_from
  end

  resources :charges, only: [:index] do
  	
  end

  match "charges/stripe", to: 'charges#stripe', :via => :post, as: :charge_by_stripe
  match "charges/paypal", to: 'charges#paypal', :via => :post, as: :charge_by_paypal

  root 'products#index'
end
