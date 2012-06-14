class Category < ActiveRecord::Base
  attr_accessible :name, :created_at, :updated_at

  has_many :themes, :dependent => destroy

  validates :name, :presence => true, :length => { :maximum => 200 }
end
