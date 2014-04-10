FactoryGirl.define do

  factory :comment do
    sequence(:body) { |n| "This is the #{n}th comment."}

    association :post
    association :user
  end

  factory :post do
    category 'News'
    body 'This is a post.'
    address '520 Medford Street Somerville, MA 02145'

    association :user
  end

  factory :user do

    sequence(:email) { |n| "johnsmith#{n}@gmail.com"}
    password 'macintosh'
    password_confirmation 'macintosh'
    first 'Barry'
    last 'Smithson'
    address '512 Medford Street, Somerville, MA 02145 USA'
  end

  factory :vote do
    vote true

    association :user
    association :post
  end
end
