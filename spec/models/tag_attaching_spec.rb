require 'spec_helper'

describe TagAttaching do

  before { @tag_attaching = TagAttaching.new(:tag_id => 5, :comment_id => 9, :user_id => 12,
                                             :created_at => "2012-06-17 16:19:04", :updated_at => "2012-06-17 16:19:04") }

  subject { @tag_attaching }

  it { should respond_to(:tag_id) }
  it { should respond_to(:comment_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
end
