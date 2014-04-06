require 'spec_helper'

feature "User visits the about page", %Q{
   As a registered or unregistered user,
   I want to visit see the about page,
   so that I can learn about the app.
} do

  # Acceptance Criteria:
  #  * I can be registered or unregistered to view the page.
  #  * I can see the page from any other page in the app.
  #  * I can the title.
  #  * I can see all content from the page.


  it "sees a title" do
    visit '/about'
    expect(page).to have_content "MarkedUp"
  end

  it 'can navigate to the about page when not signed in' do
    visit '/about'
    expect(page).to have_content 'MarkedUp is a geo-social network'
  end

  it 'can navigate to the about page when signed in' do
    user = FactoryGirl.create(:user)

    visit '/'
    click_on 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    click_link 'About'
    expect(page).to have_content 'MarkedUp is a geo-social network'
  end
end
