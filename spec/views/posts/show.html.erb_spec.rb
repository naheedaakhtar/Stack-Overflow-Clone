require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  include Devise::Test::IntegrationHelpers
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  before(:each) do
    assign(:post, Post.create!(
      title: "Title",
      text: "Text",
      user_id: user.id,
    ))
    sign_in user
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Text/)
    expect(rendered).to match(//)
  end
end
