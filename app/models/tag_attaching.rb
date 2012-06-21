class TagAttaching < ActiveRecord::Base
  attr_accessible :tag_id, :comment_id, :user_id, :created_at, :updated_at

  belongs_to :tag
  belongs_to :comment
end
