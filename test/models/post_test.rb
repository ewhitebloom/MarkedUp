require 'spec_helper'

describe Post do
 it 'should belong to a user'
 it 'requires a user'
 it 'requires a body'
 it 'does not allow a body to be more than 280 characters'
 it 'has many comments'
end
