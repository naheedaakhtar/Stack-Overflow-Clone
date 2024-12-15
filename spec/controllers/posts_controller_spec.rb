require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:tag1) { create(:tag, name: "Technology") }
  let!(:tag2) { create(:tag, name: "Education") }
  let!(:post1) { create(:post, title: "Tech Post", text: "Content about technology") }
  let!(:post2) { create(:post, title: "Education Post", text: "Content about education") }
  before do
    post1.tags << tag1
    post2.tags << tag2
  end
  describe "GET #index" do
    context "when no query or tags are provided" do
      it "returns all posts" do
        get :index
        expect(assigns(:posts)).to match_array([ post1, post2 ])
      end
    end

    context "when a search query is provided" do
      it "returns posts matching the query" do
        get :index, params: { query: 'Tech Post' }
        expect(assigns(:posts)).to include(post1)
        expect(assigns(:posts)).to_not include(post2)
      end
    end

    context "when tag IDs are provided" do
      it "returns posts matching the selected tags" do
        get :index, params: { tag_ids: [ tag1.id ] }
        expect(assigns(:posts)).to include(post1)
        expect(assigns(:posts)).to_not include(post2)
      end
    end

    context "when a query and tag IDs are provided" do
      it "returns posts matching both the query and tags" do
        get :index, params: { query: 'Post', tag_ids: [ tag1.id ] }
        expect(assigns(:posts)).to include(post1)
        expect(assigns(:posts)).to_not include(post2)
      end
    end
  end
end
