class Employees::RegistrationsController < Devise::RegistrationsController
  protected
    # def after_sign_up_path_for(resource)
    #   signed_in_root_path(resource)
    # end
    #
    # def after_update_path_for(resource)
    #   signed_in_root_path(resource)
    # end
    #
    # def after_sign_in_path_for(resource)
    #   welcome_path
    # end
end
