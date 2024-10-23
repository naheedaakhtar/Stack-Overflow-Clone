require 'rails_helper'

RSpec.describe "replies/index", type: :view do
  before(:each) do
    assign(:replies, [
      Reply.create!(
        text: "Text",
        user: nil,
        votes: 2,
        post: nil,
        reply: nil
      ),
      Reply.create!(
        text: "Text",
        user: nil,
        votes: 2,
        post: nil,
        reply: nil
      )
    ])
  end

  it "renders a list of replies" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Text".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
