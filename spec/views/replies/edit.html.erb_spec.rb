require 'rails_helper'

RSpec.describe "replies/edit", type: :view do
  before(:all) do
    @user=User.create()
    @post=Post.create(user: @user) # creates post necessary for reply to be created
  end

  after(:all) do
    @user.destroy if @user.present?
    @post.destroy if @post.present?
  end

  let(:reply) {
    Reply.create!(
      text: "MyString",
      user: @user,
      votes: 1,
      post: @post
    )
  }

  before(:each) do
    assign(:reply, reply)
  end

  it "renders the edit reply form" do
    render

    assert_select "form[action=?][method=?]", reply_path(reply), "patch" do
      assert_select "input[name=?]", "reply[text]"

      assert_select "input[name=?]", "reply[votes]"
    end
  end
end
