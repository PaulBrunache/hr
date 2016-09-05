class Employee::DashboardController < ApplicationController
  before_action :authenticate_employee!
  def index
  end
end
