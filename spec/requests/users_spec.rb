require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::Test::IntegrationHelpers
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user) }
  let(:valid_attributes) { { firstname: "John", lastname: "Doe", username: "johndoe", email: "johndoe@example.com" } }
  let(:invalid_attributes) { { firstname: "", lastname: "", username: "", email: "invalid_email" } }

  before do
    sign_in user # Ensure that Devise authentication is included in the test
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "assigns the requested user as @user" do
      get :edit, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
      expect(response).to be_successful
    end
  end

  describe "PATCH/PUT #update" do
    context "with valid parameters" do
      it "updates the requested user" do
        patch :update, params: { id: user.id, user: { firstname: "Updated" } }
        user.reload
        expect(user.firstname).to eq("Updated")
        expect(response).to redirect_to(user)
        expect(flash[:notice]).to eq("User was successfully updated.")
      end
    end

    context "with invalid parameters" do
      it "does not update the requested user" do
        patch :update, params: { id: user.id, user: invalid_attributes }
        user.reload
        expect(user.firstname).not_to eq("")
        expect(response).to render_template(:edit)
      end
    end
  end
end
