# == Schema Information
#
# Table name: estimations
#
#  id         :integer(4)      not null, primary key
#  comment_id :integer(4)
#  user_id    :integer(4)
#  plus       :boolean(1)      default(FALSE)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Estimation do

  before do
    @estimation = Estimation.new(:comment_id => 1, :user_id => 1, :plus => "Theme name",
                                 :created_at => "2012-06-17 16:19:04",:updated_at => "2012-06-17 16:19:04")
  end

  subject { @estimation }

  it { should respond_to(:comment_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:plus) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
end