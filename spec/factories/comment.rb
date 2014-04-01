FactoryGirl.define do
  factory :comment do
    body 'this is a comment on a post.'

    post
    user
  end
end
