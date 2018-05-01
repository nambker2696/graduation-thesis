class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  before_action :set_locale
  before_action :set_cart
  before_action :set_category

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

  def set_category
    @categories = Category.all
  end

    
  protected
    def authorize
      #可以使用实例方法 session 获取会话
      unless User.find_by(id: session[:user_id])
        redirect_to new_user_session_url,notice: "Please log in"
      end
    end
end
