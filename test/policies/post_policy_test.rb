require 'test_helper'

class PostPolicyTest < Minitest::Test
  def setup
    @post = posts(:valid_post)
    @regular = users(:steve)
    @admin = users(:james)
  end

  # def test_admin_can_post
  #   # assert PostPolicy.new(@admin, @post).publish? #write method later (see PS)
  # end

#   test "should create post if admin" do
#     sign_in :users, @admin
#     assert_difference 'Post.count', 1 do
#       post :create, post: {title: "Howdy", text: "Fewer than a hundred characters perhaps"}
#     end
#     assert_redirect_to posts_url
#   end

  # test "should redirect destroy if not admin" do
  #   sign_in :users, @regular

  #   assert_equal @regular.role, "nil"
  #   assert_no_difference 'Post.count' do
  #     delete :destroy, id: posts(:valid_post)
  #   end
end
