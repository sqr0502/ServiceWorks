require 'rails_helper'

RSpec.feature "Account creation", :type => :feature do
  scenario "User creates a new account" do
    visit "/users/new"

    fill_in "Name", :with => "My Widget"
    click_button "Create My Account"

      expect(page).to have_text("errors")
  end
end
