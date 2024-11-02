require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  let(:user) { User.create!() }
  before(:each) do
    assign(:post, Post.create!(
      title: "Title",
      text: "Text",
      user_id: user.id,
      votes: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Text/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
