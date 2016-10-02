class Employees::DashboardController < ApplicationController
  before_action :authenticate_employee!

  def index
  end
  def my_referrals
    id = current_employee.id
    puts "\n\n#{id} this is the id \n\n"
    @employee_referral_list = Referral.where(employee_id: id)
  end
end
