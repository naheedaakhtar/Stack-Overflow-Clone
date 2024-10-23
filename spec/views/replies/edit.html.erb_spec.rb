require 'rails_helper'

RSpec.describe "replies/edit", type: :view do
  let(:reply) {
    Reply.create!(
      text: "MyString",
      user: nil,
      votes: 1,
      post: nil,
      reply: nil
    )
  }

  before(:each) do
    assign(:reply, reply)
  end

  it "renders the edit reply form" do
    render

    assert_select "form[action=?][method=?]", reply_path(reply), "post" do

      assert_select "input[name=?]", "reply[text]"

      assert_select "input[name=?]", "reply[user_id]"

      assert_select "input[name=?]", "reply[votes]"

      assert_select "input[name=?]", "reply[post_id]"

      assert_select "input[name=?]", "reply[reply_id]"
    end
  end
end
