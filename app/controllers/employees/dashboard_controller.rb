class Employees::DashboardController < ApplicationController
  before_action :authenticate_employee!

  def index
  end
  def my_referrals
    id = current_employee.id
    @employee_referral_list = Referral.where(employee_id: id)
    puts "\n\nthis list is: #{@employee_referral_list.size}\n\n"
    @employee_referral_list
    
  end
end
