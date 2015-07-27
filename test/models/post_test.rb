# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @admin = users(:james)
    @regular = users(:steve)
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
    @post.user_id = @steve
    assert_not @post.valid?
  end

  test "order should be most recent first" do
    assert_equal Post.first, posts(:most_recent)
  end
end
