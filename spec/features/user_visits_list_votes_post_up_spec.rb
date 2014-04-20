require 'spec_helper'
require 'rubygems'
require 'vcr'

feature "User visits the list page, votes up a post", %Q{
  As an authenticated user,
  I want to be able to vote up a post,
  So that I can show that it is relevant/good quality, to other users.
} do

# Acceptance Criteria:
  #  * I must be an authenticated user.
  #  * I can vote up any post, one time.

  it 'can vote a post up' do
    post = FactoryGirl.create(:post)
    sign_in_as(post.user)
    visit '/posts'
    click_on 'Toggle Comments'
    click_on 'Vote'
    expect(post.votes.count).to eql 1
  end

  it 'can vote a post up only once' do
    post = FactoryGirl.create(:post)
    sign_in_as(post.user)
    visit '/posts'
    click_on 'Toggle Comments'
    click_on 'Vote'
    expect(post.votes.count).to eql 1
    click_on 'Toggle Comments'
    click_on 'Vote'
    expect(post.votes.count).to eql 1
  end

end
