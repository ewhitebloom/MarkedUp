require 'spec_helper'
require 'rubygems'
require 'vcr'
include Sign_In_Sign_Out

feature "User visits the list page, votes up a post", %Q{
  As an authenticated user,
  I want to be able to vote up a post,
  So that I can show that it is relevant/good quality, to other users.
} do

# Acceptance Criteria:
  #  * I must be an authenticated user.
  #  * I can vote up any post, one time.

  before :each do
    sign_in_as(post.user)
  end

  it 'can vote a post up' do
    FactoryGirl.create(:vote)
    expect(@post).votes to_eql 1
  end

  it 'can vote a post up only once' do
    FactoryGirl.create(:vote)
    FactoryGirl.create(:vote)
    expect(@post).votes to_eql 1
    expect(@post).to have_error_message('can only vote up post one time')
  end

end
