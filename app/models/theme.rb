class Theme < ActiveRecord::Base
  attr_accessible :category_id, :user_id, :name, :created_at, :updated_at

  belongs_to :category
  belongs_to :user
  has_many   :comments, :dependent => :destroy

  validates :name, :presence => true, :length => { :maximum => 200 }

  def rating
    self.comments.where(:top_level => 1).first.rating
  end

  def self.sort_by_top_comment_rating

  end
end
