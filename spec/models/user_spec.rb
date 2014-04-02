require 'spec_helper'

describe User do
  let(:user){ FactoryGirl.create(:user) }

  it { should have_valid(:address).when('123 Somerville St. Somerville, MA 02145', '123 Massachussetts Street, Boston, MA 02145') }
  it { should_not have_valid(:address).when('123 somerville st.', '123 somerville, ma')}

  it { should validate_presence_of :address }


  describe 'associations' do
    it { should have_many :posts }
    it { should have_many :comments }
    it { should have_many :votes }
  end
end
