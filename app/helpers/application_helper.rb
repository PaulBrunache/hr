module ApplicationHelper
  def reroute(controller)
    routes = ['hr/dashboard','employees/dashboard']
    routes.include? controller
  end
end
