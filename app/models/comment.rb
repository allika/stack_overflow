class Comment < ActiveRecord::Base
  attr_accessible :theme_id, :user_id, :body, :rating, :top_level, :created_at, :updated_at

  belongs_to :theme
  belongs_to :user
  has_many   :estimations, :dependent => :destroy
  has_many   :tag_attachings
  has_many   :tags, :through => :tag_attachings

  validates :body, :presence => true

  scope :sorted, order('top_level DESC, rating DESC')
end
