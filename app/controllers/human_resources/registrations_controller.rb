class HumanResources::RegistrationsController < Devise::RegistrationsController
  protected
    # def after_sign_up_path_for(resource)
    #   signed_in_root_path(resource)
    # end
    #
    def after_update_path_for(resource)
      edit_human_resource_registration_path
    end
    def account_update_params
      params.require(:human_resource).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end

end
