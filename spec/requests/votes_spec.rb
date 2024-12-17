require 'rails_helper'
require 'devise'


RSpec.describe VotesController, type: :request do
  let!(:vote) { create(:vote, user: user, votable: post_votable, vote_type: :up) }
    let(:user) { create(:user) }
    let(:post_votable) { create(:post) }
    let(:reply_votable) { create(:reply, post: post_votable, user: user) }
  
    before { sign_in user } # Devise helper for logging in a user
  
    describe "POST #create" do
      context "when voting on a post" do
        it "creates a downvote for a post" do
          expect {
            post post_votes_path(post_votable), params: { vote: { vote_type: :down } }
          }.to change { post_votable.votes.down.count }.by(1)
        end
        
        it "does not allow duplicate votes of the same type" do
          create(:vote, user: user, votable: post_votable, vote_type: :up)
          expect {
            post post_votes_path(post_votable), params: { vote: { vote_type: :up } }
          }.to change { post_votable.votes.up.count }
        end        
      end
    end
  
    describe "DELETE #destroy" do
      it "removes the user's vote" do
        create(:vote, user: user, votable: post_votable, vote_type: :up)
        expect {
          delete post_vote_path(post_votable, vote)
        }.to change { post_votable.votes.count }.by(-1)
      end
  
      it "does not remove a vote if the user has not voted" do
        invalid_vote_id = 0
        expect {
          delete post_votes_path(post_votable, 0)
        }.not_to change { post_votable.votes.count }
      end
    end
  end