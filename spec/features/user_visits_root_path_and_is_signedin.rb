require 'spec_helper'

feature "User visits the root path, with the map and other features" do
  # As a user visits the root path, he will see the map, and all associated features.
  let(:user){ User.create!(first_name: 'Bob', last_name: 'Bill', email: 'bob@bill.com', address: '123 Candy Lane, Somerville, MA 02145', password: 'hello', password_confirmation: 'hello')}

  it "sees a title" do
    visit root_path
    expect(page).to have_content "MarkdUp"
  end

  it 'can navigate to about page' do
    click_on "About"
    expect(page).to have_content "Markdup is a geosocial network"
  end

  it 'can navigate to users page' do
    click_on "Users"
  end

  it 'can navigate to profile page' do
    click_on 'Profile'
    expect(page).to have_content user.last_name
    expect(page).to have_content user.first_name
    expect(page).to have_content user.email
    expect(page).to have_content user.address
  end
  it 'can navigate to signup page' do
    click_on 'Signup'
    expect(page).to have_content 'Signup'
  end

  within_frame 'list_view' do

    it 'can write a post' do
      visit root_path
      fill_in 'Category',  'with:Transportation'
      fill_in 'Body', with: "some post content."
      fill_in 'Location', location: '123 Maple Lane, Boston, MA 02145'
      click_button "Submit"
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
end
