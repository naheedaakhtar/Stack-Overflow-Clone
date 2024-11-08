require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  let(:user) { User.create!() }
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
    cell_selector = 'div>article>h2'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    cell_selector = 'div>article>p.post-content'
    assert_select cell_selector, text: Regexp.new("Text".to_s), count: 2
    cell_selector = 'div>article>p.post-author'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end