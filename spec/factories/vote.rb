FactoryGirl.define do
  factory :vote do
    vote True

    user
    post
  end
end
