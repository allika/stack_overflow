# == Schema Information
#
# Table name: tag_attachings
#
#  id         :integer(4)      not null, primary key
#  tag_id     :integer(4)
#  comment_id :integer(4)
#  user_id    :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class TagAttaching < ActiveRecord::Base
  attr_accessible :tag_id, :comment_id, :user_id, :created_at, :updated_at

  belongs_to :tag
  belongs_to :comment
end