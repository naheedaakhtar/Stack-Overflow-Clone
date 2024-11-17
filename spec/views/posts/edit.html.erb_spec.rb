require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  include Devise::Test::IntegrationHelpers
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user) }

  let(:post) {
    Post.create!(
      title: "MyString",
      text: "MyString",
      user_id: user.id,
      votes: 1
    )
  }

  before(:each) do
    sign_in user
    assign(:post, post)
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(post), "post" do
      assert_select "input[name=?]", "post[title]"

      assert_select "input[name=?]", "post[text]"

      assert_select "input[name=?]", "post[user_id]"

      assert_select "input[name=?]", "post[votes]"
    end
  end
end
