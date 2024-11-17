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
