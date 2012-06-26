# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(200)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Category < ActiveRecord::Base
  attr_accessible :name, :created_at, :updated_at

  has_many :themes, :dependent => :destroy

  validates :name, :presence => true, :length => { :maximum => 200 }

  scope :newest_first, order('categories.created_at DESC')
end