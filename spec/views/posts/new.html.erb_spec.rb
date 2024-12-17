require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  include Devise::Test::IntegrationHelpers
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }

  before(:each) do
    assign(:post, Post.new(
      title: "MyString",
      text: "MyString",
      user_id: user,
    ))
    sign_in user
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "input[name=?]", "post[title]"
      assert_select "textarea[name=?]", "post[text]"
      assert_select "input[name=?]", "post[user_id]"
    end
  end
end
