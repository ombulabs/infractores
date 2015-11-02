FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "snitch-#{n}"}
    name "John Doe"
    twitter_user_id 1
  end
end
