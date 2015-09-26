FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@factory.com" }
    password "12345678"

    factory :user_with_leaves do
      after(:create) do |user|
        create(:leaves, user: user)
      end
    end

    factory :user_with_attendences do
      after(:create) do |user|
        create(:attendence, user: user)
      end
    end
  end
end