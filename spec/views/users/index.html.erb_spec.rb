require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        firstname: "Firstname",
        lastname: "Lastname",
        username: "Username",
        email: "Email",
        password: "Password"
      ),
      User.create!(
        firstname: "Firstname",
        lastname: "Lastname",
        username: "Username",
        email: "Email",
        password: "Password"
      )
    ])
  end

  it "renders a list of users" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Firstname".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Lastname".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Username".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
  end
end
