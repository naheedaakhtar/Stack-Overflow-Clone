require 'rails_helper'

RSpec.describe SavedPost, type: :model do

  it "doesn't allow the same user to save a post twice" do
    user=create(:user)
    post=create(:post)
    create(
      :saved_post,
      user: user,
      post: post
    )
    duplicates= build(:saved_post, user: user, post: post)
    expect(duplicates).not_to be_valid
    expect(duplicates.errors[:user_id]).to include("Post already saved")
  end

  it "stores saved posts for individual users" do
    user1 = create(:user)
    user2 = create(:user)
    post1 = create(:post, user: user1) 
    post2 = create(:post, user: user2) 
    create(:saved_post, user: user1, post: post1) 
    create(:saved_post, user: user2, post: post2)
  
    saved_posts_for_user1 = SavedPost.where(user_id: user1.id)
    expect(saved_posts_for_user1).to include(SavedPost.find_by(post: post1))
    expect(saved_posts_for_user1).not_to include(SavedPost.find_by(post: post2))
  end
  
end
