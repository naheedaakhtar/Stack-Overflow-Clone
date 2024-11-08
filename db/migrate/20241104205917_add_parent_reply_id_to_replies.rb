class AddParentReplyIdToReplies < ActiveRecord::Migration[7.2]
  def change
    add_column :replies, :parent_reply_id, :integer
  end
end
