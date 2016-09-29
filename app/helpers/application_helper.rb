module ApplicationHelper
  def reroute(controller)
    routes = ['human_resources/dashboard','employees/dashboard', 'registrations']
    puts "\n controller is: \n\n #{controller}"
    routes.include? controller
  end
end
