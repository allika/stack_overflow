class Theme < ActiveRecord::Base
  attr_accessible :category_id, :user_id, :name, :created_at, :updated_at
end
