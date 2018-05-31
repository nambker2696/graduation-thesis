class Admin::BaseController < ApplicationController
  before_action :authenticate_admin
  layout 'admin'
  def admin_authorize
    redirect_to '/login' unless current_user
  end
  private
  def authenticate_admin
    if current_user.admin == 0 || current_user.admin.nil?
      redirect_to root_url
    end
  end
end