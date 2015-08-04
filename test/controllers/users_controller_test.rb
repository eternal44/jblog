require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @me    = users(:james)
    @other = users(:steve)
  end
end
