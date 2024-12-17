class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_votable

  def create
    @vote = @votable.votes.find_or_initialize_by(user: current_user)
  
    if @vote.persisted? && @vote.vote_type == vote_params[:vote_type]
      @vote.destroy
      redirect_to @votable, notice: 'Your vote has been removed.'
    else
      @vote.vote_type = vote_params[:vote_type]
      if @vote.save
        redirect_to @votable, notice: 'Your vote has been updated.'
      else
        redirect_to @votable, alert: 'An error occurred while updating your vote.'
      end
    end
  end
  
  
  

  def destroy
    @vote = @votable.votes.find_by(user: current_user)

    if @vote
      @vote.destroy
      redirect_to @votable, notice: 'Your vote has been removed.'
    else
      redirect_to @votable, alert: 'You haven’t voted.'
    end
  end

  private

  def set_votable
    if params[:reply_id]
      @votable = Reply.find(params[:reply_id])
    elsif params[:post_id]
      @votable = Post.find(params[:post_id])
    else
      raise ActiveRecord::RecordNotFound, "Votable not found"
    end
  end

  def vote_params
    params.require(:vote).permit(:vote_type)
  end
end
