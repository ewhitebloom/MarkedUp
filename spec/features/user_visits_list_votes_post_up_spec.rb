require 'spec_helper'

feature "User visits the list page" do
  # As a user, I should be able to vote up a post in the list view, as in the the map view.

  before :each do
    @user = FactoryGirl.create(:user)
    login(@user)
  end

  it 'can vote a post up'

end
