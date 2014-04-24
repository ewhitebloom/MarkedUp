require 'spec_helper'

feature "User visits the list path inside of root path, enters general-area posts", %Q{
 As an authenticated user,
 I want to write general-area posts,
 so that I can write posts that are not location-specific.
 } do

  # Acceptance Criteria:
  #  * I must specify a category, approximate address and a body in my post.
  #  * If I don't specify all criteria, I can't submit the post.

  before :each do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
  end

  it 'submits a valid post' do
    within('.general_area_post') do
      visit '/posts/new'
      count = Post.count
      select 'News', from:' Category'
      fill_in 'Address', with: '33 Harrison Avenue Boston, MA'
      fill_in 'Body', with: "some post content."
      click_button "Submit"
      expect(page).to have_content 'Posts in Your Area'
      expect(Post.count).to eql(count + 1)
    end
  end

  it 'submits an invalid post' do
    within('.general_area_post') do
      visit '/posts/new'
      click_button 'Submit'
      expect(page).to have_content "Please review the problems below"
    end
  end

  it 'User sees all posts' do
    post1 = Post.create!(category: 'Transportation', body: 'Leaf', address: '515 Medford Street Somerville, MA 02145', user_id: @user.id )
    post2 = Post.create!(category: 'News', body: 'Electric', address: '520 Medford Street Somerville, MA 02145', user_id: @user.id)
    post3 = Post.create!(category: 'Neighborhood', body: 'Fire', address: '518 Medford Street Somerville, MA 02145', user_id: @user.id)
    posts = [post1, post2, post3]

    visit '/posts'

    posts.each do |post|
      expect(page).to have_content post.category
      expect(page).to have_content post.body
      expect(page).to have_content post.address
    end
  end
end
