FactoryGirl.define do
  factory :user do
    email 'johnsmith@gmail.com'
    password 'macintosh'
    password_confirmation 'macintosh'
    first 'John'
    last 'Smith'
    address '123 Candy Lane Boston, MA 02145'
  end
end
