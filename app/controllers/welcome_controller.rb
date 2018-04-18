class WelcomeController < ApplicationController
  skip_before_action :ensure_subdomain

  def index
    @stores = Store.all
  end
end
