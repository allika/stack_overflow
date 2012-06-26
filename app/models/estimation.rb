# == Schema Information
#
# Table name: estimations
#
#  id         :integer(4)      not null, primary key
#  comment_id :integer(4)
#  user_id    :integer(4)
#  plus       :boolean(1)      default(FALSE)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Estimation < ActiveRecord::Base
  attr_accessible :comment_id, :user_id, :plus, :created_at, :updated_at

  belongs_to :user
  belongs_to :comment
end