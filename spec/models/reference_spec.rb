require 'spec_helper'

describe Reference do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :authors => "value for authors",
      :abstract => "value for abstract",
      :journal => "value for journal",
      :pmid => 1,
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Reference.create!(@valid_attributes)
  end
end
