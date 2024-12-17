require 'rails_helper'

RSpec.describe "replies/index", type: :view do
  include Devise::Test::IntegrationHelpers
  include Devise::Test::ControllerHelpers
  let!(:user) { create(:user) }
  let(:post) { Post.create!(user_id: user.id) }
  before(:each) do
    sign_in user
    assign(:replies, [
      Reply.create!(
        text: "Text",
        user: user,
        post: post
      ),
      Reply.create!(
        text: "Text",
        user: user,
        post: post
      )
    ])
  end

  it "renders a list of replies" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Text".to_s), count: 2
  end
end
