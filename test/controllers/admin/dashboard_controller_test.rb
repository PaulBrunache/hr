require 'test_helper'

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get manageReferrals" do
    get admin_dashboard_manageReferrals_url
    assert_response :success
  end

  test "should get manageAdmins" do
    get admin_dashboard_manageAdmins_url
    assert_response :success
  end

  test "should get leaderboard" do
    get admin_dashboard_leaderboard_url
    assert_response :success
  end

  test "should get profile" do
    get admin_dashboard_profile_url
    assert_response :success
  end

end
