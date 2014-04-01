require 'spec_helper'

describe User do
  let(:user){ FactoryGirl.create(:user) }

  it 'should have a valid address' do
    expect(user).to be_valid
    user.address = '123 somerville st.'
    expect(user).to_not be_valid
    user.address = '123 somerville, ma'
    expect(user).to_not be_valid
  end
end
