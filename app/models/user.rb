class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :username, :email, :hashed_password, :salt, :created_at, :updated_at

  has_many :themes
  has_many :comments
  has_many :estimations

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates :first_name, :presence => true, :length => { :maximum => 25 }
  validates :last_name, :presence => true, :length => { :maximum => 35 }
  validates :username, :length => { :within => 3..35 }, :uniqueness => true
  validates :email, :presence => true, :length => { :maximum => 60 },
            :format => EMAIL_REGEX, :confirmation => true

end
