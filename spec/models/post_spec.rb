require 'spec_helper'

describe Post do
 let(:post){ FactoryGirl.create(:post) }

   describe 'validations' do

    it 'creates successfully with all required attributes' do
      expect(post).to be_valid
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
  end

  describe 'associations' do

    it { should belong_to :user}
    it { should have_many :comments }
  end

end
