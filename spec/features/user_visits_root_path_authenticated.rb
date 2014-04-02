require 'spec_helper'

feature "User visits the root path, with the map and other features" do
  # As a user visits the root path, he wants a list of posts, in order to make posts.

  context 'Post list view' do

    within_frame 'list_view' do

      it 'can write a post' do
        visit root_path
        fill_in 'Category',  'with:Transportation'
        fill_in 'Body', with: "some post content."
        fill_in 'Location', location: '123 Maple Lane, Boston, MA 02145'
        click_button "Submit"
      end

      it 'can vote up a post' do
        post = FactoryGirl.create(:post)
        vote = FactoryGirl.create(:vote)
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
  end
end
