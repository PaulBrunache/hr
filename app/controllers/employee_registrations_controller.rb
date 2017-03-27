class EmployeeRegistrationsController < Devise::RegistrationsController
  protected
    # def after_sign_up_path_for(resource)
    #   signed_in_root_path(resource)
    # end
    #
    def after_update_path_for(resource)
      edit_employee_registration_path
    end
    def account_update_params
      params.require(:employee).permit(:first_name, :last_name, :employee_number,:department_id,:phone_number,:email, :password, :password_confirmation, :current_password)
    end

end
