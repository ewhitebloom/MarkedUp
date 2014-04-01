require 'spec_helper'

describe User do
  let(:user){ FactoryGirl.create(:user) }

  describe 'validations' do
    it 'should have a valid address' do
      expect(user).to be_valid
      user.address = '123 somerville st.'
      expect(user).to_not be_valid
      user.address = '123 somerville, ma'
      expect(user).to_not be_valid
    end
  end

  describe 'associations' do
    it { should have_many :posts }
    it { should have_many :comments }
    it { should have_many :votes }
  end
end
