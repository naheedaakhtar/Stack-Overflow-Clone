class RemoveVotesFromReplies < ActiveRecord::Migration[7.2]
  def change
    remove_column :replies, :votes, :integer
  end
end
