module ApplicationHelper
  def reroute(controller)
    routes = ['human_resources/dashboard','employees/dashboard', 'registrations']
    puts "\n controller is: \n\n #{controller}"
    routes.include? controller
  end

  def is_hr_logged_in?(controller)
      if controller == 'human_resources/dashboard'
        true
      else
        false
      end
  end
end
