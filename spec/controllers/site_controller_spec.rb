require 'rails_helper'

RSpec.describe SiteController, type: :controller do

  before(:each) do
    sign_in FactoryGirl.create(:user)
  end

  it "should get index" do
    get :index
    expect(response.status).to eq(200)
  end

  it "should have current user" do
    get :home
    expect(current_user).to be_present
  end
end
