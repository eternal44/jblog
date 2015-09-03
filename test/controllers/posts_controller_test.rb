require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @regular = users(:steve) # not using
    @admin = users(:james)
    @request.headers['Accept'] = Mime::JSON
    @request.headers['Content-Type'] = Mime::JSON.to_s
  end

  test 'should create post if admin' do
    sign_in @admin
    assert_difference 'Post.count', 1 do
      post :create, post: {title: "Howdy", text: "Fewer than a hundred characters perhaps"}
    end
  end

  # include once I properly apply authenticate
  # test 'should not create post if regular' do
  #   sign_in @regular
  #   assert_no_difference 'Post.count' do
  #     post :create, post: {title: "Howdy", text: "Fewer than a hundred characters perhaps"}
  #   end
  #   assert_redirected_to posts_path
  # end
end
