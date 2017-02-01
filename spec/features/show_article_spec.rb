require "rails_helper"

RSpec.feature "Show Article" do
  before do
    @tom = User.create(email: "goat@example.com", password: "password")
    @gronk = User.create(email: "gronk@example.com", password: "password2")
    @article = Article.create(title: "First Article", body: "Lorem ipsum dolor sit amet.", user: @tom)
  end

  scenario "Hide Edit and Delete buttons to non-signed users" do
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end

  scenario "Display Edit and Delete buttons to owner" do
    login_as(@gronk)
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end

  scenario "Signed in owner sees both Edit and Delete buttons" do
    login_as(@tom)
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article")
  end
end
