require 'rails_helper'

RSpec.describe "replies/new", type: :view do
  before(:all) do
    @user=User.create()
    @post=Post.create(user: @user) # creates post necessary for reply to be created
  end

  after(:all) do
    @user.destroy if @user.present?
    @post.destroy if @post.present?
  end

  before(:each) do
    assign(:reply, Reply.new(
      text: "MyString",
      user: @user,
      votes: 1,
      post: @post
    ))
  end

  it "renders new reply form" do
    assert_select "form[action=?][method=?]", replies_path, "post" do
      assert_select "input[name=?]", "reply[text]"

      assert_select "input[name=?]", "reply[user_id]"
    end
  end
end
