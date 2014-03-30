FactoryGirl.define do
  factory :voicemail do
    url { Faker::Internet.url }
  end
end
