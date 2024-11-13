require 'rails_helper'

RSpec.describe "replies/edit", type: :view do
  let!(:user) {User.create!}
  let!(:post) { Post.create!(user: user) }

  let!(:reply) {
    Reply.create!(
      text: "MyString",
      user: user,
      votes: 1,
      post: post
    )
  }

  before(:each) do
    assign(:reply, reply)
    assign(:post, post)
  end

  it "renders the edit reply form" do
    render
    assert_select "form[action=?][method=?]", post_reply_path(post,reply), "post" do
      assert_select "input[name=_method][value=patch]", 1
      assert_select "input[name=?]", "reply[text]"
      assert_select "input[name=?]", "reply[votes]"
    end
  end
end
