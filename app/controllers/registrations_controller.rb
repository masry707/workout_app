class RegistrationsController < Devise::RegistrationsController

  private

    # override sign_up_params to add first name and last name
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    # override account_update_params to add first name and last name
    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end