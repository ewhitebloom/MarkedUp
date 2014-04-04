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

  it 'can write a post' do
    fill_in 'Category',  'with:Transportation'
    fill_in 'Body', with: "some post content."
    fill_in 'Location', location: '123 Maple Lane, Boston, MA 02145'
    click_button "Submit"
  end

  it 'can vote up a post' do
    post = FactoryGirl.create(:post)
    FactoryGirl.create(:vote)
    expect(post.votes).to eql 1
  end

  scenario 'User sees all posts' do
    post1 = Post.create!(category: 'Transportation', body: 'Leaf', location: '123 Maple Lane, Boston, MA 02145')
    post2 = Post.create!(category: 'News', body: 'Electric', location: '123 Oak Lane, Somerville, MA 02145')
    post3 = Post.create!(category: 'Neighborhood', body: 'Fire', location: '123 Mulberry Lane, Brookline, MA 02145')
    posts = [post1, post2, post3]

    visit root_path

    posts.each do |post|
      expect(page).to have_content post.category
      expect(page).to have_content post.body
    end
  end
end
