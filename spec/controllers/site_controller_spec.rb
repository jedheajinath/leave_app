require 'rails_helper'

RSpec.describe SiteController, type: :controller do
  it "should get index" do
    get :index
    expect(response.status).to eq(200)
  end

  it "should have current user" do
    get :home
    expect(current_user).not_to be_present
  end
end
