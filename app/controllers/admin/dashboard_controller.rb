class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def manageReferrals
  end

  def manageAdmins
  end

  def leaderboard
  end

  def profile
  end
end
