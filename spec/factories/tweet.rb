FactoryGirl.define do
  factory :tweet do
    user
    sequence(:id)
    json "{\"created_at\": \"2016-05-02 11:01:40\"}"

    factory :valid_tweet do
      json { File.read(Rails.root.join('spec', 'support', 'valid-infraction.json')) }
    end
  end
end
