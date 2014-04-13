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

  it 'should only see users within a certain radius of their address' do
    users = []

    5.times do
      users << FactoryGirl.create(:user)
    end

    out_area = User.create(first: 'Bill', last: 'Coddingham', address: '905 Cleveland St, Durham, NC 27701', email: 'bsmith@gmail.com', password: 'password12', password_confirmation: 'password12')

    visit '/users'

    users.each do |user|
      expect(page).to have_content user.first
      expect(page).to have_content user.last
      expect(page).to have_content user.address
    end

    expect(page).to_not have_content out_area.first
    expect(page).to_not have_content out_area.last
    expect(page).to_not have_content out_area.address
  end

  it 'should only see users\' first and last name, address and email' do
    visit users_path

    @users = []

    5.times do
     @users << FactoryGirl.create(:user)
    end

    @users.each do |user|
      expect(page).to have_content user.first
      expect(page).to have_content user.last
      expect(page).to have_content user.address
    end
  end

  it 'should not be able to see users page if not signed in' do
    click_on 'Sign Out'
    expect(page).to_not have_link 'Users'
  end
end
