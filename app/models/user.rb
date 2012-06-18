class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :username, :email, :password, :password_confirmation, :created_at, :updated_at
  has_secure_password

  has_many :themes
  has_many :comments
  has_many :estimations

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :first_name, :presence => true, :length => { :maximum => 25 }
  validates :last_name, :presence => true, :length => { :maximum => 35 }
  validates :username, :length => { :within => 3..35 }, :uniqueness => true
  validates :email, :presence => true, :length => { :maximum => 60 },
            :format => EMAIL_REGEX, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => { :on => :create }, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
