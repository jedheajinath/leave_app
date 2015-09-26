FactoryGirl.define do
  factory :attendence do
    attendence_date Date.new(2012, 12, 3)
    attendence true
    association :user, factory: :user
  end
end
