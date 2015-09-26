FactoryGirl.define do
  factory :leaves, :class => 'Leave' do
    reason "Mytext"
    from_date Date.today + 1
    to_date Date.today + 1
    association :user, factory: :user

    factory :leaves_status do
      after(:create) do |leave|
        create(:status, leave: leave)
      end
    end
  end
end
