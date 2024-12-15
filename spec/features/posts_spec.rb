require 'rails_helper'

RSpec.describe "Posts", type: :feature do
  let!(:tag1) { create(:tag, name: "Technology") }
  let!(:tag2) { create(:tag, name: "Education") }
  let!(:post1) { create(:post, title: "Tech Post", text: "Content about technology") }
  let!(:post2) { create(:post, title: "Education Post", text: "Content about education") }

  before do
    post1.tags << tag1
    post2.tags << tag2
  end

  it "displays the form and allows tag selection" do
    visit posts_path
    expect(page).to have_selector('form')
    expect(page).to have_button('Toggle Tag Selection')

    click_button 'Toggle Tag Selection'
    expect(page).to have_selector('.form-check', count: 2)

    check("tag_#{tag1.id}")
    check("tag_#{tag2.id}")

    click_button 'Search Posts'
    expect(current_path).to eq(posts_path)
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post2.title)
  end

  it "displays only posts matching the search query" do
    visit posts_path
    fill_in 'query', with: 'Tech Post'
    click_button 'Search Posts'
    expect(page).to have_content(post1.title)
    expect(page).to_not have_content(post2.title)
  end

  it "displays only posts matching selected tags" do
    visit posts_path
    click_button 'Toggle Tag Selection'
    check("tag_#{tag1.id}")
    click_button 'Search Posts'
    expect(page).to have_content(post1.title)
    expect(page).to_not have_content(post2.title)
  end

  it "displays posts matching both search query and tags" do
    visit posts_path
    fill_in 'query', with: 'Post'
    click_button 'Toggle Tag Selection'
    check("tag_#{tag1.id}")
    click_button 'Search Posts'
    expect(page).to have_content(post1.title)
    expect(page).to_not have_content(post2.title)
  end

  it "returns all posts when no query or tags are selected" do
    visit posts_path
    click_button 'Search Posts'
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post2.title)
  end
end
