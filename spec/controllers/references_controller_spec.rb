require 'spec_helper'

describe ReferencesController do
  integrate_views

  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy
      response.should redirect_to(signin_path)
    end
  end
  
  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
      @attr = { :abstract => "Lorem ipsum" }
      @reference = Factory(:reference, @attr.merge(:user => @user))

      @user.references.stub!(:build).and_return(@reference)
    end

    describe "failure" do

      before(:each) do
        @reference.should_receive(:save).and_return(false)
      end

      it "should render the home page" do
        post :create, :reference => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @reference.should_receive(:save).and_return(true)
      end

      it "should redirect to the home page" do
        post :create, :reference => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :reference => @attr
        flash[:success].should =~ /reference created/i
      end
    end
  end
  
  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        test_sign_in(wrong_user)
        @reference = Factory(:reference, :user => @user)
      end

      it "should deny access" do
        @reference.should_not_receive(:destroy)
        delete :destroy, :id => @reference
        response.should redirect_to(root_path)
      end
    end

    describe "for an authorized user" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
        @reference = Factory(:reference, :user => @user)
        Reference.should_receive(:find).with(@reference).and_return(@reference)
      end

      it "should destroy the reference" do
        @reference.should_receive(:destroy).and_return(@reference)
        delete :destroy, :id => @reference
      end
    end
  end
  
end
