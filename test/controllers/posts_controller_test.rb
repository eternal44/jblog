require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @post = posts(:valid_post)
    @regular = users(:steve)
    @admin = users(:james)
  end

  test "should create post if admin" do
    sign_in @admin
    assert_difference 'Post.count', 1 do
      post :create, post: {title: "Howdy", text: "Fewer than a hundred characters perhaps"}
    end
    assert_redirected_to post_path(assigns(:post))
  end
end
