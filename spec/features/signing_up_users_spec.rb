require "rails_helper"

RSpec.feature "Creating Users" do

  scenario "Signup users" do
    visit "/"

    click_link "Sign Up"

    fill_in "Email", with: "goat@example.com"
    fill_in "Password", with: "GreatestOfAllTime"
    fill_in "Password confirmation", with: "GreatestOfAllTime"

    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
  end

  scenario "Signup failed" do
    visit "/"

    click_link "Sign Up"

    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""

    click_button "Sign up"

    #expect(page).to have_content("You have not signed up successfully")
  end
end
