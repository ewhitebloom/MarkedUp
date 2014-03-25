require 'spec_helper'

describe User do
  let(:valid_attributes){{first_name: 'Bob', last_name: 'Bill', email: 'bob@bill.com', address: '123 Candy Lane, Somerville, MA 02145', password: 'hello', password_confirmation: 'hello'}}
  let(:user){User.new(valid_attributes)}

  it 'should have a first name' do
    user.first_name = nil
    expect(user).to_not be_valid
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it 'shoud have a last name' do
    user.last_name = nil
    expect(user).to_not be_valid
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it 'should have a valid email' do
    expect(user).to be_valid
    user.email = 'not.com'
    expect(user).to_not be_valid
    user.email = 'hello@'
    expect(user).to_not be_valid
  end

  it 'should have a valid address' do
    expect(user).to be_valid
    user.address = '123 somerville st.'
    expect(user).to_not be_valid
    user.address = '123 somerville, ma'
    expect(user).to_not be_valid
  end

  it 'should have a valid password' do
    expect(user).to be_valid
    user.password = 'a'
    expect(user).to_not be_valid
    user.password = '13a'
    expect(user).to_not be_valid
    user.password = '12dd3123hi'
    user.password_confirmation = '23fff33bye'
    expect(user).to_not be_valid
    user.password = '12dd3123hi'
    user.password_confirmation = '12dd3123hi'
    expect(user).to be_valid
  end
end
