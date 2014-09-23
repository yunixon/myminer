class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  layout :layout_by_resource
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
 
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def set_ru_locale
    I18n.locale = :ru
    redirect_to root_url
  end

  def set_en_locale
    I18n.locale = :en
    redirect_to root_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nick, :password) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:nick, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nick, :password, :current_password) }
  end
      
  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
      
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

end
