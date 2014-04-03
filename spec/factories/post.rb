FactoryGirl.define do
  factory :post do
    category 'News'
    body 'This is a post.'
    latitude 34.2232311
    longitude (-52.23322222)

    association :user
    association :comment
    association :vote
  end
end
