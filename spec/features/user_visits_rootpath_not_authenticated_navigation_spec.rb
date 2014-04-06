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
      expect(page).to have_content 'geosocial'
    end

    it 'can navigate to about page' do
      click_on 'About'
      expect(page).to have_content 'Markdup is a geosocial network'
    end

    it 'can not see a users page' do
      expect(page).to_not have_link 'Users'
    end

    it 'can not see a profile page' do
      expect(page).to_not have_link 'Profile'
    end

    it 'can not see a list of posts page' do
      expect(page).to_not have_frame 'list-view'
    end

    it 'can sign up' do
      count = User.count
      click_on 'Sign Up'
      fill_in 'First', with: 'John'
      fill_in 'Last', with: 'Smith'
      fill_in 'Email', with: 'johnsmith@gmail.com'
      fill_in 'Address', with: '123 Candy Lane, Somerville, MA 02145'
      click_on 'Submit'
      expect(User.count).to eql(count + 1)
    end
  end
end
