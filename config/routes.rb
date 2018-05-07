Rails.application.routes.draw do
  resources :reviews
   devise_for :users, only: :omniauth_callbacks, controllers:
  { omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations',passwords: "passwords" }
  scope '(:locale)', locale: /en|vi|ja/ do

  namespace :admin do
    resources :stores
    resources :users
    resources :orders, only: [:index, :show]
    resources :bookings, only: [:index, :show]
    resources :order_details, only: [:index, :show]
    resources :booking_details, only: [:index, :show]

    resources :seatings
    resources :timeslots
    resources :openinghours
    resources :locations
    resources :categories
    resources :dishes
    devise_for :users, skip: :omniauth_callbacks
    { omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: 'registrations' }
    get '', to: 'dashboard#index', as: '/admin' 
  end 

  resources :booking_details
  resources :guesses
  resources :order_details
  resources :bookings
  resources :cart_items do  
    put 'decrement', on: :member
  end
  resources :districts,only:[:show]
  resources :cities,only:[:show]
  resources :carts
  resources :timeslots,only:[:show]
  resources :seatings,only:[:show]
  resources :locations,only:[:show] do
    resources :reviews do
      resources :like, only: %i(create destroy)
    end
    resources :dishes
    resources :likes, only: %i(create destroy)
  end
  resources :categories,only:[:show]
  get :search, controller: :home

  devise_for :users, skip: :omniauth_callbacks
    get 'about' => 'home#about'
    get 'contact' => 'home#contact'
    root to: 'home#index'
  end
  root to: redirect('/#{I18n.default_locale}', status: 302),
  as: :redirected_root
  get '*path' => redirect('/')
end