require 'rails_helper'
RSpec.describe "leaves/new", type: :view do
  before do
    assign :leave, FactoryGirl.build(:leaves)
    # render
  end

  it "displays form to create leaves" do
    # render :template => "leaves/new.html.erb"
    # expect(controller.request.path_parameters["action"]).to eq(nil)
  end
end