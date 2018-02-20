Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi|ja/ do
  devise_for :users
  root to: "home#index"
  end
  root to: redirect("/#{I18n.default_locale}", status: 302),
  as: :redirected_root
end
