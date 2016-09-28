class HumanResources::DashboardController < ApplicationController
  before_action :authenticate_human_resource!

  def manageReferrals
  end

  def manageAdmins
    @admin = HumanResource.new
  end

  def create_hr
    begin
      @admin = HumanResource.new(email: params[:admin_email],
      password: params[:password], password_confirmation: params[:password_confirmation])
      @admin.save!
      flash[:success] = "Admin was successfully created"
    rescue
      render :manage_admin
    end
  end

  def leaderboard
  end

  def profile
  end
end
