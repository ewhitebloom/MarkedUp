require 'spec_helper'

feature 'user registers', %Q{
   As an unregistered user,
   I want to create an account,
   so that I can interact with the site.
} do

  # Acceptance Criteria:
  #  * I must enter an email address
  #  * I must enter a password and matching password confirmation.
  #  * I must enter a address in this format: '123 Candy Lane Boston, MA 02145'
  #  * I can optionally enter my first and last name.
  #  * If I enter all criteria correctly, I'm registered and signed into the app and given access to all features.

  before :each do
    visit '/users/sign_up'
  end

  scenario 'supplies all valid attributes' do

    fill_in 'user_email', with: 'barry@samuels.com'
    fill_in 'user_address', with: '520 Medford Street Somerville, MA USA'
    fill_in 'user_first', with: 'George'
    fill_in 'user_last', with: 'Washington'
    fill_in 'user_password', with: 'apassword123'
    fill_in 'user_password_confirmation', with: 'apassword123'
    click_button 'Sign up'

    expect(page).to have_content "Welcome to MarkdUp!"
    expect(page).to have_link 'About'
    expect(page).to have_link 'Sign Out'
  end

  scenario 'supplies invalid email' do

    fill_in 'user_email', with: nil
    fill_in 'user_address', with: '520 Medford Street Somerville, MA USA'
    fill_in 'user_first', with: 'George'
    fill_in 'user_last', with: 'Washington'
    fill_in 'user_password', with: 'apassword123'
    fill_in 'user_password_confirmation', with: 'apassword123'
    click_button 'Sign up'

    expect(page).to have_content 'Invalid email or password.'
    expect(page).to_not have_link 'Sign Out'
  end

  scenario 'supplies invalid password' do

    fill_in 'user_email', with: 'barry@samuels.com'
    fill_in 'user_address', with: '520 Medford Street Somerville, MA USA'
    fill_in 'user_first', with: 'George'
    fill_in 'user_last', with: 'Washington'
    fill_in 'user_password', with: nil
    fill_in 'user_password_confirmation', with: 'apassword123'
    click_button 'Sign up'

    expect(page).to have_content 'Invalid email or password.'
    expect(page).to_not have_link 'Sign Out'
  end

    scenario 'supplies no first or last name' do

    fill_in 'user_email', with: 'barry@samuels.com'
    fill_in 'user_address', with: '520 Medford Street Somerville, MA USA'
    fill_in 'user_first', with: nil
    fill_in 'user_last', with: nil
    fill_in 'user_password', with: 'apassword123'
    fill_in 'user_password_confirmation', with: 'apassword123'
    click_button 'Sign up'

    expect(page).to have_content "Welcome to MarkdUp!"
    expect(page).to have_link 'About'
    expect(page).to have_link 'Sign Out'
  end
end
