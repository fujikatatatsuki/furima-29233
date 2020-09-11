class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :full_width_family_name, :full_width_name, :full_width_kana_family_name, :full_width_kana_name, :birthday])
  end
end