Rails.application.routes.draw do

  root 'publics/items#index'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :endusers, controllers:{
    sessions: 'publics/sessions',
    passwords: 'publics/passwords',
    registrations: 'publics/registrations'
  }

   scope module: :publics do
    resources :contacts, only: [:create, :new]
    get 'contacts/complete'
  end
   scope module: :publics do
    resources :addresses, only: [:create, :new]
  end
   scope module: :publics do
    resources :orders, only: [:create, :index, :new]
    get 'orders/complete'
  end
   scope module: :publics do
    resources :carts, only: [:show, :update, :destroy, :create]
  end
   scope module: :publics do
    resources :cart_items, only: [:create, :update, :destroy]
  end
   scope module: :publics do
    resources :endusers, only: [:show, :destroy, :edit, :update]
  end
   scope module: :publics do
    resources :items, only: [:index, :show] do
      resource :favorites, only:[:create, :destroy]
      resource :reviews, only:[:create]
  end

    get 'ranking' => 'items#ranking'

  end

  namespace :admins do
    resources :labels, only: [:create, :new, :index]
  end
  namespace :admins do
    resources :genres, only: [:create, :new, :index]
  end
  namespace :admins do
    resources :additems, only: [:create, :index, :new]
  end
  namespace :admins do
    resources :freights, only: [:edit, :update, :index]
  end
  namespace :admins do
    resources :contact_replies, only: [:create, :show, :update]
  end
  namespace :admins do
    resources :contacts, only: [:index, :destroy, :show]
    get 'contacts/complete'
  end
  namespace :admins do
    resources :orders, only: [:index]
  end
  namespace :admins do
    resources :endusers, only: [:index, :show, :destroy, :edit, :update]
  end
  namespace :admins do
    resources :items do
      resources :reviews, only: [:destroy, :edit, :update]
    end
    get 'items/ranking'
  end
  namespace :admins do
    resources :artists, only: [:create, :new, :index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
