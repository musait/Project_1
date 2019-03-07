class ApplicationController < ActionController::Base

    before_action :configure_devise_parameters,if: :devise_controller?

    def configure_devise_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:lastname, :surname, :email, :password, :password_confirmation, :id_number, :position)}
    end
    def configure_devise_parameters
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:lastname, :surname, :email, :password, :password_confirmation, :id_number, :position)}
    end

    def after_sign_in_path_for(resource)
      if current_user.admin?
        admin_index_path
      else
        formation_path
      end
    end
end
