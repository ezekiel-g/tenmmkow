require 'rails_helper'

feature 'user forms group', %Q{
  As a signed in user
  I want to join a group
  So I can become a member of it
} do

  scenario 'user joins group' do
    user = User.create(
      username: 'JohnMember',
      password: 'password',
      email: 'johnthemember@gmail.com',
    )

    army = Army.create(
      name: 'Sloblins'
    )

    group = Group.create(
      id: 96,
      name: 'Fake Group',
      owner: user
    )

    visit new_user_session_path

    fill_in 'Email:', with: user.email
    fill_in 'Password:', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')

    visit new_group_membership_path(group.id)

    select army.name, from: 'Army fielded for this group:'

    click_button 'Join'

    expect(page).to have_content('Group joined successfully')
  end
end
