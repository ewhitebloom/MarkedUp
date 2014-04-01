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

FactoryGirl.define do
  factory :post do
    body 'This is a post.'
    category 'News'

    user
  end
end

FactoryGirl.define do
  factory :comment do
    body 'this is a comment on a post.'

    post
    user
  end
end
