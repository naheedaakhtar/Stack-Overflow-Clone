# spec/models/vote_spec.rb
require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:user) { create(:user) }
  let(:post_votable) { create(:post) }
  let(:reply_votable) { create(:reply, post: post_votable, user: user) }

  describe "validations" do
    it "is valid with a valid vote_type and votable_type" do
      vote = build(:vote, user: user, votable: post_votable, vote_type: :up)
      expect(vote).to be_valid
    end

    it "is invalid without a vote_type" do
      vote = build(:vote, user: user, votable: post_votable, vote_type: nil)
      expect(vote).not_to be_valid
    end
  end

  describe "scopes" do
    it "returns only upvotes" do
      create(:vote, user: user, votable: post_votable, vote_type: :up)
      create(:vote, user: create(:user), votable: post_votable, vote_type: :down) # Ensure unique users
      expect(Vote.up.count).to eq(1)
    end

    it "returns only downvotes" do
      create(:vote, user: user, votable: post_votable, vote_type: :down)
      create(:vote, user: create(:user), votable: post_votable, vote_type: :up)
      expect(Vote.down.count).to eq(1)
    end
  end

  describe "associations" do
    it "belongs to a votable" do
      vote = create(:vote, user: user, votable: post_votable, vote_type: :up)
      expect(vote.votable).to eq(post_votable)
    end

    it "belongs to a user" do
      vote = create(:vote, user: user, votable: post_votable, vote_type: :up)
      expect(vote.user).to eq(user)
    end
  end
end
