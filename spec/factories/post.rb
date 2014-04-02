FactoryGirl.define do
  factory :post do
    body 'This is a post.'
    category 'News'
    latitude 34.2232311
    longitude -52.23322222

    user
    comment
    vote
  end
end
