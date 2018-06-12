Rails.application.routes.draw do
   devise_for :users, only: :omniauth_callbacks, controllers:
  { omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations',passwords: "passwords"}
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
  resources :reviews
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
  get :search_location, controller: :home
  get :get_location, controller: :home
  get :create_chef, controller: :home
  get :chef_signup, controller: :home
  get "users/bookings" => "users#bookings"
  get "users/orders" => "users#orders"
  get "users/wishlist_chefs" => "users#wishlist_chefs"
  get "users/rate_chefs" => "users#rate_chefs"
  get "users/password" => "users#password"
  get "users/address" => "users#address"
  get "users/messages" => "users#messages"
  devise_for :users, skip: :omniauth_callbacks
    get 'about' => 'home#about'
    get 'contact' => 'home#contact'
    root to: 'home#index'
  end
  resources :conversations do
    resources :messages
  end

  root to: redirect('/#{I18n.default_locale}', status: 302),
  as: :redirected_root
  get '*path' => redirect('/')
end