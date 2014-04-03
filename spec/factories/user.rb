FactoryGirl.define do
  factory :user do

    sequence(:email) { |n| "johnsmith#{n}@gmail.com"}
    password 'macintosh'
    password_confirmation 'macintosh'
    first 'Barry'
    last 'Smithson'
    address '512 Medford Street, Somerville, MA 02145 USA'
end
end
