FactoryGirl.define do
  factory :user do
    email 'johnsmith@gmail.com'
    password 'macintosh'
    password_confirmation 'macintosh'
    address '123 Candy Lane Boston, MA 02145'

    post
    comment
    vote
  end
end
