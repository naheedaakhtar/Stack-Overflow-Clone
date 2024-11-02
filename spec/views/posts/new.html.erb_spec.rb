require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  let(:user) { User.create!() }

  before(:each) do
    assign(:post, Post.new(
      title: "MyString",
      text: "MyString",
      user_id: user.id,
      votes: 1
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "input[name=?]", "post[title]"

      assert_select "input[name=?]", "post[text]"

      assert_select "input[name=?]", "post[user_id]"

      assert_select "input[name=?]", "post[votes]"
    end
  end
end
