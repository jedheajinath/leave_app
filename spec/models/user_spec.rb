require 'rails_helper'
RSpec.describe User, type: :model do
  # user object used in test cases
  before(:each) do
    @user = FactoryGirl.build(:user)
  end

  # check for valid factory is defined user model
  it 'has a valid factory' do
    expect(@user).to be_valid
  end

  # user is invalid without email
  it "is invalid without a email" do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).not_to be_valid
  end

  # user is invalid without password
  it "is invalid without a password" do
    user = FactoryGirl.build(:user, password: nil)
    expect(user).not_to be_valid
  end

  # ensure the length of password at least 8
  it "should ensure length of password is at least 8 " do
    expect(@user.password.length).to be >= 8
  end

  # ensure user has many leaves
  it "has many leaves" do
    user = FactoryGirl.create(:user_with_leaves)
    expect(user).to be_valid
  end

  # ensure user has many attendences
  it "has many attendences" do
    user = FactoryGirl.create(:user_with_attendences)
    expect(user).to be_valid
  end
end
