require 'spec_helper'

feature 'unauthenticated user navigation', %Q{
  As an unauthenticated user
  I want to be able to navigate to other pages
  So that I can see sample the app before registering.
  } do

  # Acceptance criteria:
  #    * I can see the title of the page.
  #    * I can sign up.
  #    * I can navigate to the about page
  #    * I can't navigate to any profile, users or list of posts page.

  feature "User visits the root path and isn't signed in (or signed up)" do

    before :each do
      visit '/'
    end

    it 'sees a title' do
      expect(page).to have_content 'geo-social'
    end

    it 'can navigate to about page' do
      click_on 'About'
      expect(page).to have_content 'MarkedUp is a geo-social network'
    end

    it 'can not see a users page' do
      expect(page).to_not have_link 'Users'
    end

    it 'can not see a profile page' do
      expect(page).to_not have_link 'Profile'
    end

    it 'can not see a list of posts page' do
      expect(page).to_not have_css('#list-view')
    end

    it 'can sign up' do
      count = User.count
      user = FactoryGirl.build(:user)

      within('.nav') do
        click_on 'Sign Up'
      end

      fill_in 'First', with: user.first
      fill_in 'Last', with: user.last
      fill_in 'Email', with: user.email
      fill_in 'Address', with: user.address
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password_confirmation
      click_button 'Sign up'
      expect(User.count).to eql(count + 1)
    end
  end
end
