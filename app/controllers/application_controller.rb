class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:許可するキー])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :full_width_family_name, :full_width_name, :full_width_kana_family_name, :full_width_kana_name, :birthday])
  end
end


# t.string :nickname ,null: false
# t.string :email , null: false
# t.string :encrypted_password, null: false
# t.string :encrypted_password_confirmation ,null: false
# t.string :full_width_family_name ,null: false
# t.string :full_width_name  ,null: false
# t.string :full_width_kana_family_name ,null: false
# t.string :full_width_kana_name ,null: false
# t.date :birthday ,null: false