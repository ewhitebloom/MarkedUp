FactoryGirl.define do
  factory :user do
    email 'johnsmith@gmail.com'
    password 'macintosh'
    password_confirmation 'macintosh'
    first 'Barry'
    last 'Smithson'
    address '123 Candy Lane Boston, MA 02145'

    association :post
    association :comment
    association :vote
  end
end
