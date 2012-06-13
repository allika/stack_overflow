class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :username, :email, :hashed_password, :salt, :created_at, :updated_at
end
