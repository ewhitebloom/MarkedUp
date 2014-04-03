require 'spec_helper'

feature 'Authenticated user can write and see other comments', %Q{
 As a registered user,
 I want to comment on a post,
 so that I can give feedback to that post.
 } do

  # Acceptance Criteria:
  #  * I must be an authenticated user.
  #  * I can click on the comments button below any post, to see a form for a new comment and also see other users' comments.

  before :each do
    @user = FactoryGirl.create(:user)
    login(@user)
    visit '/'
    within_frame 'list_view'
    within_div 'first_post_div'
  end

  it 'can post a comment for a given post' do
    click_link 'Toggle Comments'
    fill_in 'body', with: 'This is a comment.'
    click_link 'Submit'
  end

  it 'can see other comments for a post' do
    FactoryGirl.create(:post)

    5.times do
     comments =  FactoryGirl.create(:comment)
    end

   comments.each do
    expect(div).to have_content comment.body
   end
  end
end

