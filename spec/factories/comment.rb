FactoryGirl.define do
  factory :comment do
    body 'this is a comment on a post.'

    association :post
    association :user
  end
end
