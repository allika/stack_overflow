# == Schema Information
#
# Table name: themes
#
#  id          :integer(4)      not null, primary key
#  category_id :integer(4)
#  user_id     :integer(4)
#  name        :string(200)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Theme do

  before do
    @theme = Theme.new(:category_id => 1, :user_id => 1, :name => "Theme name",
                       :created_at => "2012-06-17 16:19:04", :updated_at => "2012-06-17 16:19:04")
  end

  subject { @theme }

  it { should respond_to(:category_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:name) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }

  describe "when name is not present" do
    before { @theme.name = "" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @theme.name = 'a'* 250 }
    it { should_not be_valid }
  end

  describe "when theme name is not unique inside the same category" do
    before do
      theme_with_same_name = @theme.dup
      theme_with_same_name.save
    end

    it { should_not be_valid }
  end

  describe "when theme name is not unique inside different categories" do
    before do
      theme_with_same_name = @theme.dup
      @theme.category_id = 2
      theme_with_same_name.save
    end

    it { should be_valid }
  end

  describe "when name is ok" do
    before { @theme.name = "Theme name" }
    it { should be_valid }
  end
end