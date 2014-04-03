require 'spec_helper'

describe User do
  let(:user){ FactoryGirl.create(:user) }

  describe 'Validations' do
    it { should have_valid(:address).when('520 Medford St. Somerville, MA 02145 USA', '161 Wilson Drive Lancaste, PA 17603 USA') }
    # it { should_not have_valid(:address).when('123 somerville st.', '123 somerville, ma')}

    it { should validate_presence_of :address }

  end
  describe 'Associations' do
    it { should have_many :posts }
    it { should have_many :comments }
    it { should have_many :votes }
  end
end
