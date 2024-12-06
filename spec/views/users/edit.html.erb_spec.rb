require 'rails_helper'

RSpec.describe "users/edit.html.erb", type: :view do
  include Devise::Test::IntegrationHelpers
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user) }

  before do
    sign_in user
    assign(:user, user)
  end

  it "renders the edit profile form with pre-populated fields" do
    render

    expect(rendered).to have_selector("form[action='#{user_path(user)}'][method='post']")
    expect(rendered).to have_field('user[firstname]', with: user.firstname)
    expect(rendered).to have_field('user[lastname]', with: user.lastname)
    expect(rendered).to have_field('user[username]', with: user.username)
    expect(rendered).to have_field('user[email]', with: user.email)
    expect(rendered).to have_button('Update Profile')
  end
end
