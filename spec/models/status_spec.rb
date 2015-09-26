require 'rails_helper'

RSpec.describe Status, type: :model do# check for valid factory is defined for Leaves model

  before(:each) do
    @status = FactoryGirl.build(:status)
  end

  # check status has valid factory
  it 'has a valid factory' do
    expect(@status).to be_valid
  end

  # check status not to be empty
  it "is invalid without status" do
    status = FactoryGirl.build(:status, status: nil)
    expect(status).to_not be_valid
  end

  # check status should belongs to leave
  it 'should belongs to leave' do
    expect(@status.leave).to be_valid
  end

  it 'should belongs to leave' do
    expect(["Pending","Rejected","Approved"]).to include(@status.status)
  end
end
