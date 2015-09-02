# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string
#  text         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  published_at :datetime
#

class Post < ActiveRecord::Base
  default_scope     ->{ order('created_at DESC') }
  scope :draft,     ->{ where(published_at: nil) }
  scope :published, ->{ where.not(published_at: nil).where("published_at <= ?", Time.zone.now) }
  scope :scheduled, ->{ where.not(published_at: nil).where("published_at > ?", Time.zone.now) }

  attr_accessor :status

  # mount_uploader :picture, PictureUploader

  before_validation :clean_up_status
  validates :title, presence: true
  validates :text, presence: true

  has_many :comments, as: :commentable

  private
  # watch screen cast and figure out the logic.  Has something to do with an easier way of
  # working with javascript and generating html by enforcing the logic via rails instead...
  # I think I got that right?
  def clean_up_status
    self.published_at = case status
                        when "Draft"
                          nil
                        when "Published"
                          Time.zone.now
                        else
                          published_at
                        end
    true # for when drafts are saved so we don't get errors.
  end
end
