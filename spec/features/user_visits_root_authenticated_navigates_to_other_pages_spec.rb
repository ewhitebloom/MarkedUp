require 'spec_helper'

feature "User visits the root path, and navigates to other pages", %Q{
   As a registered user,
   I want to navigate to other pages in the app,
   so that I can access the content on those pages.
} do

  # Acceptance Criteria:
  #  * User can navigate to the about page
  #  * User can navigate to the users page
  #  * User can navigate to the profile page
  #  * User can navigate to the sign up page
  #  * User can see the map

  before :each do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
  end

  it 'sees the map' do
    expect(page).to have_css('#map')
  end

  it "sees a title" do
    visit root_path
    expect(page).to have_content "MarkedUp"
  end

  it 'can navigate to about page' do
    click_on "About"
    expect(page).to have_content "MarkedUp is a geo-social network"
  end

  it 'can navigate to users page' do
    click_on "Users"
    expect(page).to have_content @user.first
  end

  it 'can navigate to profile page' do
    click_on 'Profile'
    expect(page).to have_content @user.last
    expect(page).to have_content @user.first
    expect(page).to have_content @user.email
    expect(page).to have_content @user.address
  end
end
