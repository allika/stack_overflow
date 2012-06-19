class Comment < ActiveRecord::Base
  attr_accessible :theme_id, :user_id, :body, :rating, :top_level, :created_at, :updated_at

  belongs_to :theme
  belongs_to :user
  has_many   :estimations, :dependent => :destroy

  validates :body, :presence => true

  scope :sorted, order('top_level DESC, rating DESC')

  def rating
    self.rating =
    self.estimations.where(:plus => 1).size -
    self.estimations.where(:plus => 0).size
  end
end
