class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :username, :email, :password, :created_at, :updated_at
end
