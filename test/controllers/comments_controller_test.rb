require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:valid_post)
    @regular = users(:steve)
  end

  test 'should create post comment as regular' do
    sign_in @regular
    assert_difference 'Comment.count', 1 do
      comment = @post.comments.build
      comment.save!
      assert_equal 'Post', comment.commentable_type
      assert_equal @post.id, comment.commentable_id
    end
  end
end
