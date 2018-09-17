require 'rails_helper'

feature 'user forms group', %Q{
  As a signed-in admin
  I want to form a group
  So that others can join and use it
} do

  scenario 'user forms group' do
    user = User.create(
      username: 'JohnAdmin',
      password: 'password',
      email: 'johnadmin@gmail.com',
      role: 'admin'
    )

    visit new_user_session_path

    fill_in 'Email:', with: user.email
    fill_in 'Password:', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')

    visit new_group_path

    fill_in 'Group name:', with: 'group_name'

    click_button 'Create group'

    expect(page).to have_content('Group added successfully')
  end
end
