class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone])
  end

  around_action :set_time_zone

  def set_time_zone(&block)
    time_zone = current_user.try(:time_zone) || 'EST'
    Time.use_zone(time_zone, &block)
  end
end
