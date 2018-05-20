class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale
  before_action :set_cart
  before_action :get_category
  before_action :get_city_district
  before_action :get_num_cart_item
  before_action :configure_permitted_parameters, if: :devise_controller?

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
  def get_city_district
    @cities = City.all
    @districts = District.all
  end
  def get_category
    @categories = Category.all
  end
  def get_num_cart_item
    @num_cart = CartItem.where(cart_id: session[:cart_id]).count
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :name,:birthday,:sex,:phone,:address,:current_password,:password,:password_confirmation])
  end
end
