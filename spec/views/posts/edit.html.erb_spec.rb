require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  include Devise::Test::IntegrationHelpers
  include Devise::Test::ControllerHelpers

  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  before(:each) do
    assign(:post, post)
    sign_in user
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(post), "post" do
      assert_select "input[name=?]", "post[title]"
      assert_select "textarea[name=?]", "post[text]"
      assert_select "input[name=?]", "post[user_id]"
      assert_select "input[name=?]", "post[votes]"
      assert_select "input[name=?][value=?]", "_method", "patch"
    end
  end
end
