class HumanResources::DashboardController < ApplicationController
  before_action :authenticate_human_resource!

  def manageReferrals
    @referral_list = Referral.all
    @referral_count = @referral_list.size
  end

  def manageAdmins
    @admin = HumanResource.new
  end

  def create_hr
    puts "\n\nThe parameters passed:\n #{params.inspect}\n\n"
    password = generate_password

    @admin = HumanResource.new(email: params[:admin_email],
    password: password, password_confirmation: password, role: params[:role])

    if @admin.valid?
      @admin.save!
      flash[:success] = "HR Admin was successfully created"
      render :manageAdmins
    else
      render :manageAdmins
    end
  end

  def leaderboard
    @employee_list = Employee.order(points: :asc)
  end

  def profile
  end
  #Phases
  def phase_one
    puts "\n\nThese are the Params: \n #{params.to_json}\n\n"
  end
  def phase_two

  end
  def phase_three
  end

  private
    def generate_password
      Devise.friendly_token.first(6)
    end
end
