Rails.application.routes.draw do
  resources :book_table_details
  resources :book_tables
  resources :guesses
  resources :dishes
  resources :categories
  resources :stores
  namespace :admin do
    resources :sessions
    devise_for :users, skip: :omniauth_callbacks
     { omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations' }
    get '', to: 'dashboard#index', as: '/admin' 
  end

  devise_for :users, only: :omniauth_callbacks, controllers:
  { omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations' }
  scope '(:locale)', locale: /en|vi|ja/ do
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
