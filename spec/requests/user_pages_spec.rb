require 'spec_helper'

describe "UserPages" do
  describe "User page" do

    subject { page }

    describe "signup page" do
      let(:user) { FactoryGirl.create(:user) }

      before { visit signup_path }

      it { should have_selector('h1', text: 'Sign up') }
    end
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "First name",   with: "First"
        fill_in "Last name",    with: "Last"
        fill_in "Username",     with: "username"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "password"
        fill_in "Confirmation", with: "password"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_selector('h1',    text: "Update your profile") }
      it { should have_selector('title', text: "Edit User") }
      it { should have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_username)  { "new_username" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Username",         with: new_username
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"
      end

      it { should have_selector('title', text: new_username) }
      it { should have_link('Sign out', href: signout_path) }
      specify { user.reload.username.should  == new_username }
      specify { user.reload.email.should == new_email }
    end
  end
end
