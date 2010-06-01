require 'spec_helper'

describe "References" do

  before(:each) do
    @user = Factory(:user)
    visit signin_path
    fill_in :email,    :with => @user.email
    fill_in :password, :with => @user.password
    click_button
  end

  describe "creation" do

    describe "failure" do

      it "should not make a new reference" do
        lambda do
          visit root_path
          fill_in :reference_abstract, :with => ""
          click_button
          response.should render_template('pages/home')
          response.should have_tag("div#errorExplanation")
        end.should_not change(Reference, :count)
      end
    end

    describe "success" do

      it "should make a new reference" do
        reference = "Lorem ipsum dolor sit amet"
        lambda do
          visit root_path
          fill_in :reference_abstract, :with => reference
          click_button
          response.should have_tag("span.reference", reference)
        end.should change(Reference, :count).by(1)
      end
    end
  end

  describe "destruction" do

    it "should destroy a reference" do
      # Create a reference.
      visit root_path
      fill_in :reference_abstract, :with => "lorem ipsum"
      click_button
      # Destroy it.
      lambda { click_link "delete" }.should change(Reference, :count).by(-1)
    end
  end
end

