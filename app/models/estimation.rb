class Estimation < ActiveRecord::Base
  attr_accessible :comment_id, :user_id, :plus, :created_at, :updated_at

  belongs_to :user
  belongs_to :comment
end
