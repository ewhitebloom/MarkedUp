require 'spec_helper'

feature 'user deletes a category', %Q{
  As an authenticated user
  I want to delete a category
  So that I can dis-associate activities from that category
  } do

  # Acceptance criteria:
  #    * I must be signed in to delete a category
  #    * If I’m not signed in, I am not allowed access to delete a category
  #    * From the categories screen, I must click "Delete" next to the appropriate category

  feature "User visits the root path and isn't signed in (or signed up)" do

    it "sees a title" do
      visit root_path
      expect(page).to have_content "geosocial"
    end

    it 'can navigate to about page' do
      click_on "About"
      expect(page).to have_content "Markdup is a geosocial network"
    end

    it 'can signin' do
      click_on 'Sign In'
      expect(page).to have_content 'Sign In'
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
