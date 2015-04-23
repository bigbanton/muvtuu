class DeviseCustom::RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :type)
  end
end