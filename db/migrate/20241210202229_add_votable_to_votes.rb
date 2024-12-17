class AddVotableToVotes < ActiveRecord::Migration[6.0]
  def change
    # Add polymorphic references without NOT NULL constraint
    add_reference :votes, :votable, polymorphic: true, type: :integer

    # Update existing records to populate votable_type and votable_id
    reversible do |dir|
      dir.up do
        Vote.reset_column_information

        # Assuming all existing votes are for posts
        Vote.where.not(post_id: nil).find_each do |vote|
          vote.update!(votable_type: 'Post', votable_id: vote.post_id)
        end
      end
    end

    # Add NOT NULL constraints after updating the data
    change_column_null :votes, :votable_type, false
    change_column_null :votes, :votable_id, false

    # Remove the old post_id column since it is no longer needed
    remove_reference :votes, :post, index: true
  end
end
