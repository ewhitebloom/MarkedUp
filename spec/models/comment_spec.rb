require 'spec_helper'

describe Comment do
  let(:comment){ FactoryGirl.create(:comment) }

  it 'should belong to a user' do
    expect(comment).to respond_to(:user)
    expect(comment.user).to eql(user)
  end

  it 'should belong to a post' do
    expect(comment).to respond_to(:post)
    expect(comment.post).to eql(post)
  end

  it 'should validate presence of user' do
    comment.user = nil
    expect(comment).to_not be_valid
    expect(comment.errors[:user]).to include("can't be blank")
  end

  it 'should validate presence of post' do
    comment.post = nil
    expect(comment).to_not be_valid
    expect(comment.errors[:post]).to include("can't be blank")
  end

  it 'should validate presence of body' do
    comment.body = nil
    expect(comment).to_not be_valid
    expect(comment.errors[:body]).to include("can't be blank")
  end
end
