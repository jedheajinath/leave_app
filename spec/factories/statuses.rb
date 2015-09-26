FactoryGirl.define do
  factory :status do
    status "Pending"
    association :leave, factory: :leaves
  end
end
