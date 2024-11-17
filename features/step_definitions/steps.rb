


Given('these tags exist:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |h|
    Tag.create!(h)
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
    select tag, from: "Tag"
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

  


 
 
  

  