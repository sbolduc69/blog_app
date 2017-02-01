require "rails_helper"

RSpec.feature "Show Article" do
  before do
    tom = User.create(email: "goat@example.com", password: "password")
    login_as(tom)
    @article = Article.create(title: "First Article", body: "Lorem ipsum dolor sit amet.", user: tom)
  end

  scenario "A user displays an article" do
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end

end
