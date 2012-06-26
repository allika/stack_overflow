# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(200)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Category do

  before { @category = Category.new(:name => "Category Name",:created_at => "2012-06-17 16:19:04", :updated_at => "2012-06-17 16:19:04") }

  subject { @category }

  it { should respond_to(:name) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }

  describe "when name is not present" do
    before { @category.name = " " }
    it { should_not be_valid }
  end

  describe "when name is ok" do
    before { @category.name = "Test category" }
    it { should be_valid }
  end

  describe "when name is too long" do
    before { @category.name = "a" * 250 }
    it { should_not be_valid }
  end
end