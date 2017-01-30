require 'rails_helper'

RSpec.feature "Users signin" do
  before do
    @tom = User.create!(email: "goat@example.com", password: "password")
  end

  scenario "with valid credentials" do
    visit "/"

    click_link "Sign In"
    fill_in "Email", with: @tom.email
    fill_in "Password", with: @tom.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Signed in as #{@tom.email}")
    expect(page).not_to have_link("Sign In")
    expect(page).not_to have_link("Sign Up")
  end
end
