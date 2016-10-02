class Employees::DashboardController < ApplicationController
  before_action :authenticate_employee!

  def index
  end
  def my_referrals
    id = current_employee.id
    @employee_referral_list = Referral.where(employee_id: id)
    @employee_referral_list.each do |referral|
    puts  "\n\nThe referrals are\n\n"
    puts  "#{referral.first_name.capitalize} #{referral.last_name.capitalize}\n"
    end
    @employee_referral_list
  end
end
