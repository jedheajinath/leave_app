require 'rails_helper'

RSpec.describe User, type: :model do
#   # pending "add some examples to (or delete) #{__FILE__}"
#   # it "is invalid without a factory"

  it "is invalid without a email" do
    user = FactoryGirl.build(:user)
    email_fact = FactoryGirl.build(:user, email: nil)
    expect(user).not_to eq(email_fact)
  end

  it "is invalid without a password" do
    user = FactoryGirl.build(:user)
    password_fact = FactoryGirl.build(:user, password: nil)
    expect(user).not_to eq(password_fact)
  end

  it "should ensure length of password is at least 8 " do
    user = FactoryGirl.build(:user)
    password_fact1 = FactoryGirl.build(:user, password: "1234567")
    expect(user).not_to eq(password_fact1)
  end
end
