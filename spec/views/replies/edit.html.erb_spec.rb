require 'rails_helper'

RSpec.describe "replies/edit", type: :view do
  include Devise::Test::IntegrationHelpers
  include Devise::Test::ControllerHelpers

  let!(:user) { create(:user) }
  let(:post) { Post.create!(user_id: user.id) }

  let!(:reply) {
    Reply.create!(
      text: "MyString",
      user: user,
      post: post
    )
  }

  before(:each) do
    sign_in user
    allow(user).to receive(:saved_posts_records).and_return([post])
    assign(:reply, reply)
    assign(:post, post)
  end

  it "renders the edit reply form" do
    render

    assert_select "form[action=?][method=?]", post_reply_path(post, reply), "post" do
      assert_select "input[name=_method][value=patch]", 1
      assert_select "textarea[name=?]", "reply[text]"
    end
  end
end
