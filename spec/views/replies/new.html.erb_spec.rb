require 'rails_helper'

RSpec.describe "replies/new", type: :view do
  include Devise::Test::IntegrationHelpers
  include Devise::Test::ControllerHelpers

  before(:all) do
    @user = create(:user)
    @post = Post.create(user: @user)
  end

  after(:all) do
    @user.destroy if @user.present?
    @post.destroy if @post.present?
  end

  before(:each) do
    sign_in @user
    assign(:reply, Reply.new(
      text: "MyString",
      user: @user,
      post: @post
    ))
  end

  it "renders new reply form" do
    render
    puts response.body
    assert_select "form[action=?][method=?]", post_replies_path(@post), "post" do
      assert_select "textarea[name=?]", "reply[text]"
      assert_select "input[name=?]", "reply[user_id]"
    end
  end
end
