require 'test_helper'

class DashboardAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_admin_index_url
    assert_response :success
  end

end
