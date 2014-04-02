require 'spec_helper'

describe Comment do
  let(:comment){ FactoryGirl.create(:comment) }

  describe 'validations' do

    it { should_not have_valid(:post).when(nil) }

    it { should have_valid(:body).when('a body of a post', "even .mreo asdfasdf") }
    it { should_not have_valid(:body).when(nil, '') }
  end

  describe 'associations' do

    it { should belong_to :user }
    it { should belong_to :post }
  end
end
