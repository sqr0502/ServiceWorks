require 'rails_helper'

RSpec.feature "Account creation", :type => :feature do
  scenario "User creates a new account" do
    visit "/users/new"

      fill_in "user_first_name", :with => "first"
      fill_in "user_last_name", :with => "last"
      fill_in "user_email", :with => "first@example.com"
      fill_in "user_phone", :with => "4074948585"
      fill_in "user_street_one", :with => "first street"
      fill_in "user_street_two", :with => "Unit 504"
      fill_in "user_state", :with => "FL"
      fill_in "user_zip", :with => "33898"
      fill_in "user_password", :with => "password"
      fill_in "user_password_confirmation", :with => "password"    
      
      click_button "Create my account"

      expect(page).to have_text("Your account has been succesfully created")
  end
end


# Test fails, how to select check boxes?
RSpec.feature "Business account creation", :type => :feature do
    scenario "User creates a new business account" do
    visit "/users/new"

      fill_in "user_is_provider", :with => "true"
      fill_in "user_company_name", :with => "Company Name"
      fill_in "user_company_desc", :with => "I am a company."    
      
      click_button "Create my account"

      expect(page).to have_text("Your account has been succesfully created")
  end
end
