FactoryGirl.define do
  factory :comment do
    sequence(:body) { |n| "This is the #{n}th comment."}

    association :post
    association :user
  end
end
