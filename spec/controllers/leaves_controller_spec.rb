require 'rails_helper'
RSpec.describe LeavesController, type: :controller do

  it "expect current user" do
    expect(current_user).not_to be_present
  end
end
