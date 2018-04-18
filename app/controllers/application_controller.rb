# :nodoc:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :set_locale
  before_action :ensure_subdomain

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def current_store
    @current_store ||= Store.find_by(subdomain: request.subdomain)
  end
  helper_method :current_store

  private

  def ensure_subdomain
    redirect_to root_url(subdomain: :www) unless current_store.present?
  end
end
