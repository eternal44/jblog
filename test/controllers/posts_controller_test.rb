require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @post = posts(:valid_post)
    @regular = users(:steve)
    @admin = users(:james)
  end

  test "should redirect create if not admin" do
    sign_in :users, @regular
    assert_no_difference 'Post.count' do
      post :create, post: {title: "Howdy", text: "Fewer than a hundred characters perhaps"}
    end
    # assert_redirect_to root_url
  end


  test "should create post if admin" do
    sign_in :users, @admin
    assert_difference 'Post.count', 1 do
      post :create, post: {title: "Howdy", text: "Fewer than a hundred characters perhaps"}
    end
    assert_redirect_to posts_url
  end

  test "should redirect destroy if not admin" do
    sign_in :users, @regular
    assert_no_difference 'Post.count' do
      delete :destroy, id: posts(:valid_post)
    end
  end
end
