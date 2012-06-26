# == Schema Information
#
# Table name: comments
#
#  id         :integer(4)      not null, primary key
#  theme_id   :integer(4)
#  user_id    :integer(4)
#  body       :text
#  rating     :integer(4)      default(0), not null
#  top_level  :boolean(1)      default(FALSE)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Comment do

  before do
    @comment = Comment.new(:theme_id => 1, :user_id => 1, :body => "Theme name"*200, :rating => 50, :top_level => 1,
                           :created_at => "2012-06-17 16:19:04", :updated_at => "2012-06-17 16:19:04")
  end

  subject { @comment }

  it { should respond_to(:theme_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:body) }
  it { should respond_to(:rating) }
  it { should respond_to(:top_level) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }

  describe "when body is not present" do
    before { @comment.body = "" }
    it { should_not be_valid }
  end

  describe "when body is ok" do
    before { @comment.body = "comment's body" }
    it { should be_valid }
  end
end
