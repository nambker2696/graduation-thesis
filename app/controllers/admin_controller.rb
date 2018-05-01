class AdminController < ActionController::Base
  skip_before_action :authenticate_user!
  def login
  end
end