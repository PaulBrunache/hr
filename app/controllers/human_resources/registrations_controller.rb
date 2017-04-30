class HumanResources::RegistrationsController < Devise::RegistrationsController

  def new
    flash[:info] = 'Registrations are not open.'
    redirect_to root_path
  end
  def create
    flash[:info] = 'Registrations are not open.'
    redirect_to root_path
  end

  def after_update_path_for(resource)
    edit_human_resource_registration_path
  end
  def account_update_params
    params.require(:human_resource).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
