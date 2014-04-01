FactoryGirl.define do
  factory :post do
    body 'This is a post.'
    category 'News'

    user
  end
end
