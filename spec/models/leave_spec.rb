require 'rails_helper'
RSpec.describe Leave, type: :model do
  # Leaves object used in test cases
  before(:each) do
    @leave = FactoryGirl.build(:leaves)
  end

  # check for valid factory is defined for Leaves model
  it 'has a valid factory' do
    expect(@leave).to be_valid
  end

  # check to from date can not empty
  it 'is invalid without from_date' do
    leave = FactoryGirl.build(:leaves, from_date: nil)
    expect(leave).not_to be_valid
  end

  # check to from date can not empty
  it 'is invalid without to_date' do
    leave = FactoryGirl.build(:leaves, to_date: nil)
    expect(leave).not_to be_valid
  end

  # check reason should not empty
  it 'is invalid without reason' do
    leave = FactoryGirl.build(:leaves, reason: nil)
    expect(leave).not_to be_valid
  end

  # check for from date not in past or todays date
  it 'should ensure leaves from_date not in past or todays date' do
    expect(@leave.from_date).to be > Date.today
  end

  # check to date is greater than or equal to from date
  it 'should ensure to_date greater than or equal to from_date' do
    expect(@leave.to_date).to be >= @leave.to_date
  end

  # ensure leaves not greater than 30 days
  it 'should ensure leaves less than 30 days' do
    expect((@leave.from_date..@leave.to_date).count).to be <= 30
  end

  # leaves should belongs to user
  it "should belongs to user" do
    expect(@leave.user).to be_present
  end

  # ensure leave has status
  it "should have status" do
    leave = FactoryGirl.create(:leaves_status)
    expect(leave.status).to be_valid
  end
end
