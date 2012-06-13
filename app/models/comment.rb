class Comment < ActiveRecord::Base
  attr_accessible :theme_id, :user_id, :body, :rating, :top_level, :created_at, :updated_at
end
