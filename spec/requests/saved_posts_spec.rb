require 'rails_helper'

RSpec.describe "SavedPosts", type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) {create(:user)}
  let(:post_record) {create(:post)}

  before do 
    sign_in user
  end

  describe "POST /posts/:post_id/saved_post" do
    it "creates a saved post" do
      expect{post post_saved_post_path(post_record)}.to change(SavedPost, :count).by(1)
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(post_path(post_record))
      follow_redirect!
      expect(response.body).to include("Post Saved Successfully")
    end

    it "doesn't save a post twice" do
      create(:saved_post, user: user, post: post_record)
      expect{post post_saved_post_path(post_record)}.not_to change(SavedPost,:count)

      expect(response).to redirect_to(post_path(post_record))
      follow_redirect!
      expect(response.body).to include("Post Already Saved")
    end
  end

  describe "DELETE /posts/:post_id/saved_post" do
    let!(:saved_post) { create(:saved_post, user: user, post: post_record) }
    it "unsaves a post successfully" do
      expect{delete post_saved_post_path(post_record)}.to change(SavedPost,:count).by(-1)
      expect(response).to redirect_to(post_path(post_record))
      follow_redirect!
      expect(response.body).to include("Post Unsaved")
    end
    it "fails to unsave a post that doesn't exist" do
      saved_post.destroy
      expect{delete post_saved_post_path(post_record)}.not_to change(SavedPost, :count)
      expect(response).to redirect_to(post_path(post_record))
      follow_redirect!
      expect(response.body).to include("Failed to Unsave Post")
    end
  end
end
