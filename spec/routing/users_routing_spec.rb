require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::Test::IntegrationHelpers
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user) }

  before do
    sign_in user  # Ensure the user is signed in if using Devise
  end

  describe "GET #show" do
    it "returns a successful response" do
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end

    it "assigns the requested user to @user" do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it "renders the 'show' template" do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end
end
