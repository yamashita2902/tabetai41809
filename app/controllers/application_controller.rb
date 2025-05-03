class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :birthday,
      :gender_id,
      :postal_code,
      :prefecture_id,
      :city,
      :street_address,
      :building
  ])
  end
end