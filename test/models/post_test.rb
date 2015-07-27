require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:james)
    @post = posts(:valid_post)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "title should be present" do
    @post.title = ""
    assert_not @post.valid?
  end

  test "text should be present" do
    @post.text = ""
    assert_not @post.valid?
  end

  test "james should be the only one to create" do
    @post.user_id = 2
    assert_not @post.valid?
  end
end

