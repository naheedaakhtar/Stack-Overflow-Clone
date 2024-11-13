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
    cell_selector = 'div.list-group-item > div'
    assert_select cell_selector, text: Regexp.new("Firstname"), count: 2
    assert_select cell_selector, text: Regexp.new("Lastname"), count: 2
    assert_select cell_selector, text: Regexp.new("Username"), count: 2
    assert_select cell_selector, text: Regexp.new("Email"), count: 2
    cell_selector = 'div.list-group-item > a.btn.btn-primary'
    assert_select cell_selector, text: "View this user", count: 2
    assert_select 'a.btn.btn-success', text: "New user", count: 1
  end
end
