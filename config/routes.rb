Rails.application.routes.draw do

  root 'publics/items#index'

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
    resources :endusers, only: [:show, :destroy, :edit, :update]
  end
   scope module: :publics do
    resources :items, only: [:index, :show]
    resource :favorites, only:[:create, :destroy]
    resource :reviews, only:[:create]
    get 'items/ranking'
  end

  namespace :admins do
    resources :labels, only: [:create, :new]
  end
  namespace :admins do
    resources :genres, only: [:create, :new]
  end
  namespace :admins do
    resources :add_items, only: [:create, :index, :new]
  end
  namespace :admins do
    resources :freights, only: [:edit, :update]
  end
  namespace :admins do
    resources :contact_repliess, only: [:create, :new]
  end
  namespace :admins do
    resources :contacts, only: [:index, :destroy]
    get 'contacts/complete'
  end
  namespace :admins do
    resources :orders, only: [:index]
  end
  namespace :admins do
    resources :reviews, only: [:destroy, :edit, :update]
  end
  namespace :admins do
    resources :endusers, only: [:index, :show, :destroy, :edit, :update]
  end
  namespace :admins do
    resources :items
    get 'items/ranking'
  end
  namespace :admins do
    resources :artists, only: [:create, :new]
  end
  devise_for :admins, controllers: {
  	sessions: 'admins/sessions',
  	passwords: 'admins/passwords',
  	registrations: 'admins/registrations'
  }
  devise_for :endusers, controllers:{
  	sessions: 'endusers/sessions',
  	passwords: 'endusers/passwords',
  	registrations: 'endusers/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
