require 'rails_helper'

RSpec.describe "users/show.html.erb", type: :view do
  include Devise::Test::IntegrationHelpers
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user) }

  before do
    assign(:user, user)
    sign_in user 
  end

  it "renders user profile information" do
    render

    expect(rendered).to match(user.firstname)
    expect(rendered).to match(user.lastname)
    expect(rendered).to match(user.username)
    expect(rendered).to match(user.email)
  end

  it "renders the 'Edit Profile' button" do
    render
    expect(rendered).to have_link('Edit Profile', href: edit_user_path(user))
  end
end
