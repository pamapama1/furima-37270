class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :email, :encrypted_password, :first_name, :second_name, :first_name_kana,
                                             :second_name_kana, :birthday])
  end
end
