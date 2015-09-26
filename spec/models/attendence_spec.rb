require 'rails_helper'

RSpec.describe Attendence, type: :model do

  # user object used in test cases
  before(:each) do
    @attendence = FactoryGirl.build(:attendence)
  end

  # check for valid factory is defined for Attendence model
  it 'has a valid factory' do
    expect(@attendence).to be_valid
  end

  # check attendence date should not empty
  it "is invalidn without Attendence date" do
    attendence = FactoryGirl.build(:attendence, attendence_date: nil)
    expect(attendence).not_to be_valid
  end

  # check attendence should take boolean value
  it "should ensure attendence boolean" do
    expect([true, false]).to include(@attendence.attendence)
  end

  # attendence should belongs to user
  it "should belongs to user" do
    expect(@attendence.user).to be_valid
  end
end
