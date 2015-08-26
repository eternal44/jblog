require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest
  def setup
    @post = posts(:valid_post)
  end

  test 'display comments' do
    assert @post.comments.first.body == 'hello'
  end
end
