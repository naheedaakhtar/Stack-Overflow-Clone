
Given('these tags exist:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |h|
    Tag.create!(h)
  end
end

Given('these posts exist:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |h|
    Post.create!(h)
  end
end

Given('these users exist:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |h|
    User.create!(h)
  end
end

Given('I am logged in') do
    User.create!(username: 'admin', password: 'password', firstname: 'admin', lastname: 'admin', email: 'admin@colgate.edu', role: 'admin')
    visit "/users/sign_in"
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'password'
    page.find_by_id('Log in').click
end

Given('I go to create a post') do
    visit new_post_path
end

When('I fill in {string} with {string}') do |field, fill|
    fill_in field, with: fill
end


When('I select the {string} tag') do |tag|
    check tag
end


When('I create the post') do
    click_on "Save Post"
end


When('I edit the post') do
    click_on "Edit this post"
end

When('I finish the edit') do
    click_on "Save Post"
end

When('I click {string}') do |string|
    click_on string
end

Then('I should see {string}') do |string|
    expect(page).to have_content(string)
end

Then('I should not see {string}') do |string|
    expect(page).not_to have_content(string)
end

When('I look at the {string} page') do |tag|
    visit tag_path(Tag.find_by(name: tag))
end




Given('I request certification') do
  visit user_path(User.find_by(username: 'admin'))
  click_on "Send Credentials"
  click_on "Submit Credentials"
end

Given('I am on my profile') do
  visit user_path(User.find_by(username: 'admin'))
end

Given('certification is approved by a moderator') do
  visit user_path(User.find_by(username: 'admin'))
  click_on "Approve Credentials"
  click_on "Approve"
end

Given('I am on post {string}') do |string|
  visit post_path(Post.find_by(title: string))
end

Given('I leave a reply') do
  click_on "New reply"
  fill_in "Text", with: "test"
  click_on "Submit Reply"
end

When('certification is denied by a moderator') do
  visit user_path(User.find_by(username: 'admin'))
  click_on "Approve Credentials"
  click_on "Deny"
end

Given('{string} exists') do |title|
  visit new_post_path
  fill_in "Title", with: title
  click_on "Save Post"
end
