require 'rails_helper'
RSpec.describe AttendencesController, type: :controller do
  before(:each) do
    sign_in FactoryGirl.create(:manager)
  end
end
