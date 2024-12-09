require 'rails_helper'

RSpec.describe "replies/show", type: :view do
  include Devise::Test::IntegrationHelpers
  include Devise::Test::ControllerHelpers

  let!(:user) { create(:user, username: 'joeschmoe') }
  let(:post) { Post.create!(user_id: user.id) }
  before(:each) do
    sign_in user
    assign(:reply, Reply.create!(
      text: "Text",
      user: user,
      votes: 2,
      post: post,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/joeschmoe/)
  end
end
