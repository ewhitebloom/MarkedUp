require 'spec_helper'

feature "User visits the root path, with the map and other features" do
  # As a user visits the root path, he will see the map, and all associated features.

  it "sees a title" do
    visit root_path
    expect(page).to have_content "MarkdUp"
  end

  it 'can navigate to about page'
  it 'can navigate to users page'
  it 'can navigate to profile page'
  it 'can navigate to signup page'
  within_frame 'id' do

    it 'can write a post' do
      visit root_path
      fill_in "Category", with: 'Transportation'
      fill_in "Body", with: "some post content."
      click_button "Submit"
    end

    scenario "User sees all posts" do
      post1 = Post.create!(category: 'Transportation', body: 'Leaf')
      post2 = Post.create!(category: 'News', body: 'Electric')
      post3 = Post.create!(category: 'Neighborhood', body: 'Fire')
      posts = [post1, post2, post3]

      visit root_path

      posts.each do |pokemon|
        expect(page).to have_content post.category
        expect(page).to have_content post.body
      end
    end
  end
end
