require 'spec_helper'

feature 'created user signs out', %Q{
   As a registered user,
   I want to sign out,
   so that I can terminate my session with the app, and not allow others to use my account.
} do

  # Acceptance Criteria:
  #  * I only need to click the sign out button in order to sign out.
  #  * When I sign out I'm prompted with the sign in or sign up page.


  before :each do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
  end

  scenario 'attempts to sign out' do
    visit '/users/sign_out'
    click_on 'Sign Out'

    expect(page).to have_link 'Sign In'
    expect(page).to have_link 'Sign Up'
  end

end
