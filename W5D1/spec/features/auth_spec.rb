require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'email', :with => "testing@email.com"
      fill_in 'password', :with => "biscuits"
      click_on "Submit"
    end

    scenario "redirects to bands index page after signup" do
      expect(page).to have_content("List of bands:")
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'email', :with => "ameet01@gmail.com"
      click_on "Submit"
    end

    scenario "re-renders the signup page after failed signup" do
      expect(page).to have_content("Email has already been taken")
    end
  end

end
