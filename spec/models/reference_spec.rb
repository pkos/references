require 'spec_helper'

describe Reference do
  
  before(:each) do
    @user = Factory(:user)
    @attr = {
      :title => "value for title",
      :authors => "value for authors",
      :abstract => "value for abstract",
      :journal => "value for journal",
      :pmid => 1,
    }
  end

  it "should create a new instance given valid attributes" do
    @user.references.create!(@attr)
  end
  
  describe "user associations" do

    before(:each) do
      @reference = @user.references.create(@attr)
    end

    it "should have a user attribute" do
      @reference.should respond_to(:user)
    end

    it "should have the right associated user" do
      @reference.user_id.should == @user.id
      @reference.user.should == @user
    end
  end
  
  describe "validations" do

    it "should require a user id" do
      Reference.new(@attr).should_not be_valid
    end

    it "should require nonblank abstract" do
      @user.references.build(:abstract => "  ").should_not be_valid
    end

    it "should reject long abstract" do
      @user.references.build(:abstract => "a" * 1001).should_not be_valid
    end
  end
  
  
end
