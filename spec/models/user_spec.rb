require 'spec_helper'

describe User do

  before { @user = User.new(:first_name => "F Name", :last_name => "L Name", :username => "example_user", :email => "user@example.com",
                            :created_at => "2012-06-17 16:19:04", :updated_at => "2012-06-17 16:19:04") }

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }

  describe "when first_name is not present" do
    before { @user.first_name = "" }
    it { should_not be_valid }
  end

  describe "when first_name is too long" do
    before { @user.first_name = "a" * 50 }
    it { should_not be_valid }
  end

  describe "when last_name is not present" do
    before { @user.last_name = "" }
    it { should_not be_valid }
  end

  describe "when last_name is too long" do
    before { @user.last_name = "a" * 50 }
    it { should_not be_valid }
  end

  describe "when username is not present" do
    before { @user.username = "" }
    it { should_not be_valid }
  end

  describe "when username is too long" do
    before { @user.username = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email is not in correct format" do
    before { @user.email = "aaa" }
    it { should_not be_valid }
  end
end
