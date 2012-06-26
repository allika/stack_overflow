# == Schema Information
#
# Table name: users
#
#  id              :integer(4)      not null, primary key
#  first_name      :string(25)
#  last_name       :string(35)
#  username        :string(35)
#  email           :string(60)      default(""), not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

require 'spec_helper'

describe User do

  before do
    @user = User.new(:first_name => "F Name", :last_name => "L Name", :username => "example_user", :email => "user@example.com",
                     :password => "password", :password_confirmation => "password",
                     :created_at => "2012-06-17 16:19:04", :updated_at => "2012-06-17 16:19:04")
  end

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

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
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when username has already been taken" do
    before do
      user_with_same_username = @user.dup
      user_with_same_username.save
    end

    it { should_not be_valid }
  end

  describe "when email is not in correct format" do
    before { @user.email = "aaa" }
    it { should_not be_valid }
  end

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      @user.email = mixed_case_email
      @user.save
      @user.reload.email.should == mixed_case_email.downcase
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = "" }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end