require 'spec_helper'
require 'rubygems'
require 'vcr'

include AuthenticationHelper

feature "User visits users page, sees other users listed.", %Q{
  As an registered, authenticated user,
  I want to see other users with a certain mile radius of my address,
  So that I can see other users on my neighborhood.
  } do

  # Acceptance criteria:
  #    * I must be signed in
  #    * I can see only other users whose address is within a certain mile radius of my address.
  #    * I can see the user's first and last name, address and email.


  before :each do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
  end

  it 'should only see users within a certain radius of their address'

  it 'should only see users\' first and last name, address and email' do

    5.times do
      @users = FactoryGirl.create(:user)
    end

    @users.each do
      expect(page).to have_content user.first
      expect(page).to have_content user.last
      expect(page).to have_content user.address
      expect(page).to have_content user.email
    end

  end

  it 'should not be able to see users page if not signed in' do
    sign_out(@user)
    visit '/'
    expect(page).to_not have_link 'Users'
  end
end
