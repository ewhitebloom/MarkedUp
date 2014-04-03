require 'spec_helper'

feature "User visits the root path, and wants to navigate to other pages", %Q{
   As a registered user,
   I want to navigate to other pages in the app,
   so that I can access the content on those pages.
} do
  let(:user){ FactoryGirl.create(:user)}

  it "sees a title" do
    visit root_path
    expect(page).to have_content "MarkdUp"
  end

  it 'can navigate to about page' do
    click_on "About"
    expect(page).to have_content "Markdup is a geosocial network"
  end

  it 'can navigate to users page' do
    click_on "Users"
    expect(page).to have_content user.username
  end

  it 'can navigate to profile page' do
    click_on 'Profile'
    expect(page).to have_content user.last_name
    expect(page).to have_content user.first_name
    expect(page).to have_content user.email
    expect(page).to have_content user.address
  end
  it 'can navigate to signup page' do
    click_on 'Signup'
    expect(page).to have_content 'Signup'
  end
end
