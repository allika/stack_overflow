# == Schema Information
#
# Table name: themes
#
#  id          :integer(4)      not null, primary key
#  category_id :integer(4)
#  user_id     :integer(4)
#  name        :string(200)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Theme < ActiveRecord::Base
  attr_accessible :category_id, :user_id, :name, :created_at, :updated_at, :comments_attributes

  belongs_to :category
  belongs_to :user
  has_many   :comments, :dependent => :destroy
  validates_associated :comments

  validates :name, :presence => true, :length => { :maximum => 200 },
            :uniqueness => { :scope => :category_id, :message => "Category already contain this theme" }

  accepts_nested_attributes_for :comments

  def not_commented_by_user(user_id)
    Comment.where(:theme_id => self.id, :user_id => user_id).first.nil?
  end

  def top_level_comment
    self.comments.where(:top_level => 1).first
  end

  def rating
    self.top_level_comment.rating
  end

  def self.sort_by_top_comment_rating
    Theme.joins(:comments).where('comments.top_level' => 1).order('comments.rating DESC')
  end
end