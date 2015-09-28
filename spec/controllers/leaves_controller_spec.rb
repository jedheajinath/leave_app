require 'rails_helper'
RSpec.describe LeavesController, type: :controller do
  before(:each) do
    sign_in FactoryGirl.create(:user)
    @leave = FactoryGirl.create(:leaves)
  end

  # index
  describe 'LEAVE #index' do
    before(:each) do
      get :index
    end

    it "expect current user" do
      expect(:user).to be_present
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    # unsucessful
    it 'should expect only current_user leave' do
      user = FactoryGirl.create(:user)
      @leaves = FactoryGirl.create(:leaves, user: user)
    end
  end

  # leave create
  describe 'LEAVE #create' do
    context 'with valid attribuites' do
      it 'creates the leaves' do
        post :create,
        leave: FactoryGirl.attributes_for(:leaves)
        expect(response).to redirect_to :leaves
      end
    end

    context 'with invalid attributes' do
      it 're-renders the new view' do
        post :create,
        leave: FactoryGirl.attributes_for(:leaves, from_date: nil)
        expect(response).to render_template :new
      end
    end
  end

  # delete/:id
  describe 'LEAVE #destroy' do
    it 'expect current_user should be Manager' do
      sign_in FactoryGirl.create(:manager)
      expect(:manager).to be_present
    end

    it 'expect respond with js' do
      expect{ delete :destroy, id: @leave.id, format: :js }
      expect(response.status).to eq(200)
    end
  end

  # new leave
  it 'assigns a new Leave' do
    get :new
    expect(assigns(:leave)).to be_a_new(Leave)
  end

  # show/:id
  it "finds a specific Leave" do
    get :show, id: @leave
    expect(assigns(:leave)).to eq(@leave)
  end
end
