Rails.application.routes.draw do
  namespace :admin do
    resources :order_details
  end
  namespace :admin do
    resources :openinghours
  end
  resources :opening_hours
  namespace :admin do
    resources :locations
  end
  resources :locations
  namespace :admin do
    resources :booking_details
  end
  resources :booking_details
  namespace :admin do
    resources :categories
  end
   devise_for :users, only: :omniauth_callbacks, controllers:
  { omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations' }
  scope '(:locale)', locale: /en|vi|ja/ do

  namespace :admin do
    resources :stores
    resources :users
    resources :orders
    resources :bookings
    devise_for :users, skip: :omniauth_callbacks
    { omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: 'registrations' }
    get '', to: 'dashboard#index', as: '/admin' 
  end 
  
  resources :guesses
  resources :dishes
  resources :categories
  resources :stores
  resources :order_details
  resources :bookings

    devise_for :users, skip: :omniauth_callbacks
    root to: 'home#index'
    get 'features' => 'home#features'
    get 'resources' => 'home#resources'
    get 'about' => 'home#about'
    get 'faq' => 'home#faq'
    get 'contact' => 'home#contact'
  end
  root to: redirect('/#{I18n.default_locale}', status: 302),
  as: :redirected_root
  get '*path' => redirect('/')
end