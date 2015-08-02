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

class Post < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  # mount_uploader :picture, PictureUploader
  validates :title, presence: true
  validates :text, presence: true

  has_many :comments, as: :commentable
end
