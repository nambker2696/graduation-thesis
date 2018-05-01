class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_cart ,except: [:destroy]
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      reset_session
      session[:user_id] = user.id
      session[:cart_id] = @cart.id
      redirect_to root_url
    else
      logger.debug "Invalid user/password #{user.inspect}"
      logger.tagged("login") { logger.info "Invalid user/password" }
      redirect_to root_url,alert: "Invalid user/password#{user.inspect}"
    end
  end

  def destroy 
    session[:user_id] = nil
    redirect_to root_url,notice: "Logged out"
  end
end
