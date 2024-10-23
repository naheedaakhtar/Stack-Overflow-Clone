require 'rails_helper'

RSpec.describe "replies/show", type: :view do
  before(:each) do
    assign(:reply, Reply.create!(
      text: "Text",
      user: nil,
      votes: 2,
      post: nil,
      reply: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
