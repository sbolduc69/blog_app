require 'rails_helper'

RSpec.feature "Signing out users" do
  before do
    @tom = User.create!(email: "goat@example.com", password: "password")

    visit '/'
    click_link "Sign In"
    fill_in "Email", with: @tom.email
    fill_in "Password", with: @tom.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Signed in as #{@tom.email}")
    expect(page).not_to have_link("Sign In")

  end

    scenario do
    visit "/"

    click_link "Sign Out"

    expect(page).to have_content("Signed out successfully")
    expect(page).not_to have_content("Sign Out")
  end
end
