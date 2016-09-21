module ApplicationHelper
  def reroute(controller)
    routes = ['human_resources/dashboard','employees/dashboard']
    puts "\n\n\nthis is the controller: #{controller}\n\n\n"
    routes.include? controller
  end
end
