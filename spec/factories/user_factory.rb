FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "snitch-#{n}"}
  end
end
