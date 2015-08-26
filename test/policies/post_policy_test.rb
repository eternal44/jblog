require 'test_helper'

class PostPolicyTest < PolicyTest
  def setup
    @regular = users(:steve)
    @admin = users(:james)
  end

  test "should create post if admin" do
    assert permit(@admin, Post.new, :new)
  end

  test "should not create post if regular user" do
    assert_not permit(@regular, Post.new, :new)
  end
end
