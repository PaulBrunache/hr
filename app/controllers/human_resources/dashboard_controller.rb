class HumanResources::DashboardController < ApplicationController
  before_action :authenticate_human_resource!

  def manageReferrals
  end

  def manageAdmins
  end

  def leaderboard
  end

  def profile
  end
end
