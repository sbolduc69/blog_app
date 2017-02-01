require "rails_helper"
RSpec.feature "Creating Articles" do

  before do
    @tom = User.create!(email: "goat@example.com", password: "password")
    login_as(@tom)
  end

  scenario "A user creates a new article" do
    visit "/"

    click_link "New Article"

    fill_in "Title", with: "Creating a blog post"
    fill_in "Body", with: "lorem Ipsum"

    click_button "Create Article"

    expect(Article.last.user).to eq(@tom)
    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
    expect(page).to have_content("Created by: #{@tom.email}")
  end

  scenario "A user fails to create a new article" do
    visit "/"

    click_link "New Article"

    fill_in "Title", with: ""
    fill_in "Body", with: ""

    click_button "Create Article"

    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
