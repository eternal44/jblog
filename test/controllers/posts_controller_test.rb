require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @regular = users(:steve) # not using
    @admin = users(:james)
    sign_in @admin
    @post = posts(:valid_post)
  end

  test 'should create post if admin' do
    assert_difference 'Post.count', 1 do
      post :create, post: {title: "Howdy", text: "Fewer than a hundred characters perhaps"}
    end
  end

  test 'should show post' do
    # get(:show, post: { id: @post.id })
    get :show, id: @post
    assert_equal( "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ", @post.text)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test 'should destroy post' do
    assert_difference 'Post.count', -1 do
      delete :destroy, id: @post
    end
  end
end
