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
    @post = FactoryGirl.create(:post)
    sign_in_as(@post.user)
    visit '/posts'
  end

  it 'posts a valid comment' do
    click_on 'Toggle Comments'
    fill_in 'Body', with: 'This is a comment.'
    click_on 'Submit'
    expect(page).to have_content 'Posts in Your Area'
  end

  it 'posts an invalid comment' do
    click_on 'Toggle Comments'
    click_on 'Submit'
    expect(page).to have_content "can't be blank"
  end

  it 'can see other comments for a post' do
    Comment.create(user_id: @post.user_id, post_id: @post.id, body: 'comment 1')
    Comment.create(user_id: @post.user_id, post_id: @post.id, body: 'comment 2')
    Comment.create(user_id: @post.user_id, post_id: @post.id, body: 'comment 3')
    visit '/posts'
    click_on 'Toggle Comments'

    expect(page).to have_content 'comment 1'
    expect(page).to have_content 'comment 2'
    expect(page).to have_content 'comment 3'
  end

end

