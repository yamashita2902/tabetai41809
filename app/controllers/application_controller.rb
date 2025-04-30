class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
    :nickname,
    :email,
    :encrypted_password, 
    :birthday,
    :gender,
    :postal_code,
    :prefecture_id,
    :city,
    :street_address,
    :building
  ])
  end
end