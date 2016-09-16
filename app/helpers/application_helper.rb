module ApplicationHelper
  def reroute(controller)
    routes = ['human_resources/dashboard','employees/dashboard']
    routes.include? controller
  end
end
