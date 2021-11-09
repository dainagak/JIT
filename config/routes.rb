Rails.application.routes.draw do
  scope module: 'customers' do
    root to: 'homes#top'
    get "/home/about" => "homes#about"
    resources :items, only: [:show, :index]
  end

  scope module: :customers do
    resource :customers, only: [:update, :edit, :show]
    get 'quit' => 'customers#quit'
    patch 'withdraw' => 'customers#withdraw', as: 'customers_withdraw'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items' => 'cart_items#all_destroy', as: 'all_destroy'
    get 'orders/about' => 'orders#about', as: 'orders_about'
    get 'orders/thanks' => 'orders#thanks'
    resources :orders, only: [:create, :new, :index, :show]
  end

  #会員側のルート
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  #管理者側のルート
  devise_for :admins, controllers: {
   sessions:      'admins/sessions',
   passwords:     'admins/passwords',
   registrations: 'admins/registrations'
  }

  namespace :admins do
    root to: 'homes#top'
    resources :customers, only: [:index, :edit, :update, :show]
    resources :items, only: [:show, :index, :new, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

end