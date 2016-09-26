class Employees::DashboardController < ApplicationController
  before_action :authenticate_employee!

  def index
  end
end
