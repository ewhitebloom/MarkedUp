require 'spec_helper'

feature 'Authenticated user can write and see other comments', %Q{
 As a registered user,
 I want to comment on a post,
 so that I can give feedback to that post.
 } do

  # Acceptance Criteria:
  #  * I must be an authenticated user.
  #  * I can click on the comments button below any post, to see a form for a new comment and also see other users' comments.

  within_frame 'list_view' do

    it 'can post a comment for a given post' do
      visit '/'
    end

    it 'can see other comments for a post'
  end
end

