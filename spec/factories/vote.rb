FactoryGirl.define do
  factory :vote do
    vote true

    user
    post
  end
end
