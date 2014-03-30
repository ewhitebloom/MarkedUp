require 'spec_helper'

describe Post do
  let(:user){ User.create(first_name: 'Bill', last_name: 'Bob', email: 'test@test.com', address: '123 Candy Lane, Somerville, MA 02145') }
  let(:post){ Post.create(body: 'hello', user: user) }
  let(:comment){ Comment.create(body: 'comment', user: user, post: post) }

 it 'should belong to a user' do
   expect(post).to respond_to(:user)
 end

 it 'requires a user' do
   post.user_id = nil
   expect(post).to_not be_valid
   expect(post.errors[:user]).to include("can't be blank")
 end

 it 'requires a body' do
  post.body = nil
  expect(post).to_not be_valid
  expect(post.errors[:body]).to include("can't be blank")
end

it 'requires a category' do
  post.category = nil
  expect(post).to_not be_valid
  expect(post.errors[:body]).to include("can't be blank")
end

it 'is geocoded' do
  post.latitude = nil
  post.longitude = nil
  expect(post).to_not be_valid
  expect(post.errors[:body]).to include("can't be blank")
  post.address = nil
  expect(post).to_not be_valid
  expect(post.errors[:body]).to include("can't be blank")
end

it 'does not allow a body to be more than 180 characters' do
 post.body = 'a' * 181
 expect(post).to_not be_valid
 expect(post.errors[:body]).to include("is too long (maximum is 180 characters)")
end

it 'has many comments' do
 post.save!
 expect(post).to have_many(:comments)
 comment = Comment.create(user: user, body: 'hello', post: post)
 expect(post.comments).to include(comment)
end

end
