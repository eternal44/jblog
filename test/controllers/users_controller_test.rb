require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @me    = users(:james)
    @other = users(:steve)
  end

  test "should redirect when not logged in" do
    get :index
    assert_redirected_to root_url
  end
end
