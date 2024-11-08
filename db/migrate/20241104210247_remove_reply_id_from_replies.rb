class RemoveReplyIdFromReplies < ActiveRecord::Migration[7.2]
  def change
    remove_column :replies, :reply_id, :integer
  end
end
