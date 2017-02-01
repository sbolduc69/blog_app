require "rails_helper"

RSpec.feature "Delete an Article" do
  before do
    tom = User.create(email: "goat@example.com", password: "password")
    login_as(tom)
    @article = Article.create(title: "First Article", body: "Lorem ipsum dolor sit amet.", user: tom)
  end

  scenario "A user deletes an article" do
    visit "/"

    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end
end
