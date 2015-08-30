FactoryGirl.define do
  factory :tweet do
    user
    sequence(:id)
    json "{}"

    factory :valid_tweet do
      json { File.read(Rails.root.join('spec', 'support', 'valid-infraction.json')) }
    end
  end
end
