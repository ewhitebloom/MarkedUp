require 'spec_helper'

describe Comment do
  let(:comment){ FactoryGirl.create(:comment) }

  describe 'validations' do

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

  describe 'associations' do

    it { should belong_to :user }
    it { should belong_to :post }
  end
end
