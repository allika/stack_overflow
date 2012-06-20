class TagAttaching < ActiveRecord::Base
  attr_accessible :tad_id, :comment_id, :created_at, :updated_at

  belongs_to :tag
  belongs_to :comment
end
