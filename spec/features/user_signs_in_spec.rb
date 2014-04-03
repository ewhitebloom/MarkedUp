require 'spec_helper'

feature 'created user signs in', %Q{
   As a registered user,
   I want to sign in,
   so that I can authenticate my information and begin a session in the app.
} do

  # Acceptance Criteria:
  #  * I must enter an email address and password
  #  * If I don't enter them correctly, I'm given several more chances.
  #  * If I enter all criteria correctly, I'm signed into the app and given access to all features.

  scenario 'supplies valid email and password' do
    user = FactoryGirl.create(:user)

    visit '/'
    click_on 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content "Welcome, #{user.first_name}!"
    expect(page).to have_link 'About'
    expect(page).to have_link 'Sign Out'
  end

  scenario 'supplies invalid email or password' do
    visit '/'
    click_on 'Sign In'

    fill_in 'user_email', with: 'someemail@example.com'
    fill_in 'user_password', with: 'some_password'
    click_button 'Sign In'

    expect(page).to have_content 'Invalid email or password.'
    expect(page).to_not have_link 'Sign Out'
  end
end
