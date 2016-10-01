class RegistrationsController < Devise::RegistrationsController
  protected
    # def after_sign_up_path_for(resource)
    #   signed_in_root_path(resource)
    # end
    #
    def after_update_path_for(resource)
      puts "\n\nit's not working ???? #{resource.to}\n\n"
      hr_dashboard_manageReferrals_path
    end

end
