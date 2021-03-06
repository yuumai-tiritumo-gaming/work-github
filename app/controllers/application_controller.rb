class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :family_name, :first_name, :family_kana, :first_kana, :postal_code, :address, :phone_number])
  end
  
  def valid_admin?
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end
end

