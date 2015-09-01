require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  def setup
    @regular = users(:steve)
    @admin = users(:james)
  end

  test 'admin should get scheduled posts' do
    sign_in @admin
    get :overview
    assert_response :success
  end

  test 'regular user should not get scheduled posts' do
    sign_in @regular
    get :overview
    assert :error
  end
end
