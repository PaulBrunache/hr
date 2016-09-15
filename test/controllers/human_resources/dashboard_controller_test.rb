require 'test_helper'

class HumanResources::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get manageReferrals" do
    get human_resources_dashboard_manageReferrals_url
    assert_response :success
  end

  test "should get manageAdmins" do
    get human_resources_dashboard_manageAdmins_url
    assert_response :success
  end

  test "should get leaderboard" do
    get human_resources_dashboard_leaderboard_url
    assert_response :success
  end

  test "should get profile" do
    get human_resources_dashboard_profile_url
    assert_response :success
  end

end
