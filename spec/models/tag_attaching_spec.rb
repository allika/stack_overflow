# == Schema Information
#
# Table name: tag_attachings
#
#  id         :integer(4)      not null, primary key
#  tag_id     :integer(4)
#  comment_id :integer(4)
#  user_id    :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe TagAttaching do

  before do
    @tag_attaching = TagAttaching.new(:tag_id => 5, :comment_id => 9, :user_id => 12,
                                      :created_at => "2012-06-17 16:19:04", :updated_at => "2012-06-17 16:19:04")
  end

  subject { @tag_attaching }

  it { should respond_to(:tag_id) }
  it { should respond_to(:comment_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
end
