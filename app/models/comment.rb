# == Schema Information
#
# Table name: comments
#
#  id         :integer(4)      not null, primary key
#  theme_id   :integer(4)
#  user_id    :integer(4)
#  body       :text
#  rating     :integer(4)      default(0), not null
#  top_level  :boolean(1)      default(FALSE)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Comment < ActiveRecord::Base
  attr_accessible :theme_id, :user_id, :body, :rating, :top_level, :created_at, :updated_at

  belongs_to :theme
  belongs_to :user
  has_many   :estimations, :dependent => :destroy
  has_many   :tag_attachings, :dependent => :destroy
  has_many   :tags, :through => :tag_attachings

  validates :body, :presence => true

  scope :sorted, order('top_level DESC, rating DESC')
end

