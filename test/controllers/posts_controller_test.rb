require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @post = posts(:valid_post) # not using
    @regular = users(:steve) # not using
    @admin = users(:james)
  end

  test 'should create post if admin' do
    sign_in @admin
    assert_difference 'Post.count', 1 do
      post :create, post: {title: "Howdy", text: "Fewer than a hundred characters perhaps"}
    end
    assert_redirected_to post_path(assigns(:post))
  end

  test 'should create post comment as regular' do
    sign_in @regular
    assert_difference 'Comment.count', 1 do
      post :create, post: {commentable_type: :posts,
                           commentable: @post,
                           user_id: @regular}

    end
  end
end
