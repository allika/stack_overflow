class Tag < ActiveRecord::Base
  attr_accessible :user_id, :name, :description, :usage, :created_at, :updated_at

  belongs_to :user
  has_many :tag_attachings
  has_many :comments, :through => :tag_attachings
end
