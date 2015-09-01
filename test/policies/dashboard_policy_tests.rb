require 'test_helper'

class DashboardPolicyTest < PolicyTest
  # not working.  fix later
  test 'admin should get scheduled posts' do
    sign_in @admin
    get :scheduled
    assert_response :success
  end

  test 'regular user should not get scheduled posts' do
    sign_in @regular
    get :scheduled
    refute_permit(@regular, Post.scheduled, :scheduled)
  end
end

