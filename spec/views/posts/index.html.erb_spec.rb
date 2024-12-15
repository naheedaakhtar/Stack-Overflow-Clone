require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  let(:user) { create(:user) }
  before(:each) do
    assign(:posts, [
      Post.create!(
        title: "Title",
        text: "Text",
        user_id: user.id,
        votes: 2
      ),
      Post.create!(
        title: "Title",
        text: "Text",
        user_id: user.id,
        votes: 2
      )
    ])
  end

  it "renders a list of posts" do
    render
    cell_selector = 'div.card-body > h5.card-title'
    assert_select cell_selector, text: Regexp.new("Title"), count: 2
    cell_selector = 'div.card-body > p.card-text'
    assert_select cell_selector, text: Regexp.new("Text"), count: 2
    cell_selector = 'div.card-body > a.btn.btn-primary'
    assert_select cell_selector, text: "View this post", count: 2
  end
end

RSpec.describe "posts/index.html.erb", type: :view do
  let!(:tag1) { create(:tag, name: "Technology") }
  let!(:tag2) { create(:tag, name: "Education") }
  let!(:post1) { create(:post, title: "Tech Post", text: "Content about technology") }
  let!(:post2) { create(:post, title: "Education Post", text: "Content about education") }
  before do
    post1.tags << tag1
    post2.tags << tag2
  end
  it "renders the form with the tag selection dropdown" do
    assign(:posts, [ post1, post2 ])
    render

    expect(rendered).to have_selector('form')
    expect(rendered).to have_button('Toggle Tag Selection')
    expect(rendered).to have_selector('.form-check', count: 2)
  end

  it "displays the posts with the correct title and content" do
    assign(:posts, [ post1, post2 ])
    render

    expect(rendered).to include(post1.title)
    expect(rendered).to include(post2.title)
  end
end
