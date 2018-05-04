class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale
  before_action :set_cart
  before_action :set_category
  before_action :set_city_district

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private 
  def  set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound 
    @cart= Cart.create
    session[:cart_id]=@cart.id
  end
  def set_city_district
    @cities = City.all
    @districts = District.all
  end
  def set_category
    @categories = Category.all
  end
end
