module ApplicationHelper
  def reroute(controller)
    routes = ['human_resources/dashboard','employees/dashboard', 'referrals']
    puts "\n controller is: #{controller}\n\n "
    actions = ['edit']
    if routes.include?(controller) or current_page?(edit_human_resource_registration_path) or
      current_page?(edit_employee_registration_path)
      return true
    else
      false
    end
  end

  def is_hr_logged_in?(controller)
      if controller == 'human_resources/dashboard'
        true
      else
        false
      end
  end
end
