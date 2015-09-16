# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  title              :string
#  text               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  published_at       :datetime
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:valid_post)
  end

  test 'should be valid' do
    assert @post.valid?
  end

  test 'title should be present' do
    @post.title = ""
    assert_not @post.valid?
  end

  test 'text should be present' do
    @post.text = ""
    assert_not @post.valid?
  end

  test 'most recent should be first' do
    assert_equal posts(:most_recent), Post.first
  end
end

