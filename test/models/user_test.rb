require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:james)
  end

  test "should be valid" do
    @user.email = "   "
    assert_not @user.valid?
  end
end
