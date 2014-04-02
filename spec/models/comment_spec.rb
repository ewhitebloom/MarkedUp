require 'spec_helper'

describe Comment do
  let(:comment){ FactoryGirl.create(:comment) }

  describe 'Validations' do

    it { should_not have_valid(:post).when(nil) }

    it { should have_valid(:body).when('a body of a post', "even .mreo asdfasdf") }
    it { should_not have_valid(:body).when(nil, '') }

    it { should validate_presence_of(:body) }
  end

  describe 'Associations' do

    it { should belong_to :user }
    it { should belong_to :post }
  end
end
