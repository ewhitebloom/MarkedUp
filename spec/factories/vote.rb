FactoryGirl.define do
  factory :vote do
    vote true

    association :user
    association :post
  end
end
