require 'rails_helper'

RSpec.feature "UserProfiles", type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario "User visits their profile page" do
    visit user_path(user)

    expect(page).to have_content(user.firstname)
    expect(page).to have_content(user.lastname)
    expect(page).to have_content(user.username)
    expect(page).to have_content(user.email)
    expect(page).to have_link('Edit Profile')
  end

  scenario "User clicks the edit button and updates their profile" do
    visit user_path(user)
    click_link 'Edit Profile'

    expect(current_path).to eq(edit_user_path(user))

    fill_in 'Firstname', with: 'UpdatedFirstName'
    fill_in 'Lastname', with: 'UpdatedLastName'
    click_button 'Update Profile'

    expect(page).to have_content('User was successfully updated.')
    expect(page).to have_content('UpdatedFirstName')
    expect(page).to have_content('UpdatedLastName')
  end
end
