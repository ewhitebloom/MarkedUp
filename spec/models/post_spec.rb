require 'spec_helper'

describe Post do

  it 'should belong to a user' do
   expect(post).to respond_to(:user)
  end

  it 'requires a user' do
   post.user = nil
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
   expect(post).to respond_to(:comments)
   comment = Comment.create(user: user, body: 'hello', post: post)
   expect(post.comments).to include(comment)
  end

end