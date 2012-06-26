# == Schema Information
#
# Table name: tags
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  name        :string(255)     default(""), not null
#  description :text
#  popularity  :integer(4)      default(0), not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Tag do

  before { @tag = Tag.new(:user_id => 5, :name => "tag-name#.", :description => "Tag's description'", :popularity => 15,
                          :created_at => "2012-06-17 16:19:04", :updated_at => "2012-06-17 16:19:04") }

  subject { @tag }

  it { should respond_to(:user_id) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:popularity) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }

  describe "when name is not present" do
    before { @tag.name = "" }
    it { should_not be_valid }
  end

  describe "when name is too short" do
    before { @tag.name = "a" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @tag.name = "a"*30 }
    it { should_not be_valid }
  end

  describe "when tag in mixed case" do
    let(:mixed_case_name) { "#Mixed-TaG#NamE." }

    it "should be saved as all lower-case" do
      @tag.name = mixed_case_name
      @tag.save
      @tag.reload.name.should == mixed_case_name.downcase
    end
  end

  describe "when name is not in correct format" do
    before { @tag.name = "aa%a/.a" }
    it { should_not be_valid }
  end

  describe "when name in correct format" do
    before { @tag.name = "#a0-b9.c1+b16#" }
    it { should be_valid }
  end

  describe "when description is not present" do
    before { @tag.description = "" }
    it { should_not be_valid }
  end

  describe "when name is too short" do
    before { @tag.description = "a" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @tag.description = "a"*310 }
    it { should_not be_valid }
  end
end