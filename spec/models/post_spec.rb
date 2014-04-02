require 'spec_helper'

describe Post do
 let(:post){ FactoryGirl.create(:post) }

 describe 'Validations' do

  it 'creates successfully with all required attributes' do
    expect(post).to be_valid
  end

  it { should_not have_valid(:user).when(nil) }

  it { should_not have_valid(:body).when(nil) }
  it { should have_valid(:body).when('asdfasdf','asdfasdf') }

  it { should validate_presence_of(:body) }

  it { should_not have_valid(:category).when(nil) }
  it { should have_valid(:category).when('News','Transportation') }

  it { should validate_presence_of(:category) }

  it { should_not have_valid(:latitude).when(nil) }
  it { should have_valid(:latitude).when(23.23321222,-43.33223332) }

  it { should_not have_valid(:longitude).when(nil) }
  it { should have_valid(:longitude).when(43.2233222,-56.2333) }

  it 'does not allow a body to be more than 180 characters' do
   post.body = 'a' * 181
   expect(post).to_not be_valid
   expect(post.errors[:body]).to include("is too long (maximum is 180 characters)")
 end
end

describe 'Assocations' do

  it { should belong_to :user}
  it { should have_many :comments }
end

end
