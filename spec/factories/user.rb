FactoryGirl.define do
  factory :user do
    VCR.use_cassette 'address/520 Medford Street Somerville, MA 02145 USA' do
        sequence(:email) { |n| "johnsmith#{n}@gmail.com"}
        password 'macintosh'
        password_confirmation 'macintosh'
        first 'Barry'
        last 'Smithson'
        address '520 Medford Street Somerville, MA 02145 USA'
    end
end
end
