class Admin::BaseController < ApplicationController
  layout 'admin'
  def admin_authorize
    redirect_to '/login' unless current_user
  end
end