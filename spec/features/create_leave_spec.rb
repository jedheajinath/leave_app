require 'spec_helper'

feature 'create leave ' do

  before(:each) do
    # @user = FactoryGirl.create(:user)
    # sign_in FactoryGirl.create(:user)
  end

  # scenario 'with valid from date to date and reason' do
  #   FactoryGirl.create(:user)
  #   visit new_leafe_path
  #   expect(page).to have_content('Create Leave')
  #   # create_leave_with Date.today+1, Date.today+1, "Mytext"
  #   # expect(page).to have_content('Sign up')
  # end

  # # scenario 'with invalid email' do
  # #   sign_up_with 'invalid_email', 'password'
  # #   expect(page).to have_content('Sign in')
  # # end

  # # scenario 'with blank password' do
  # #   sign_up_with 'valid@example.com', ''
  # #   expect(page).to have_content('Sign in')
  # # end

  # def create_leave_with(from_date, to_date, reason)
  #   visit new_leafe_path
  #   fill_in 'from_date', with: from_date
  #   fill_in 'to_date', with: to_date
  #   fill_in 'reason', with: reason
  #   click_button 'Create Leave'
  # end
end