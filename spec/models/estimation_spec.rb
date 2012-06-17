require 'spec_helper'

describe Estimation do

  before { @estimation = Estimation.new(:comment_id => 1, :user_id => 1, :plus => "Theme name", :created_at => "2012-06-17 16:19:04",
                                        :updated_at => "2012-06-17 16:19:04") }

  subject { @estimation }

  it { should respond_to(:comment_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:plus) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
end
