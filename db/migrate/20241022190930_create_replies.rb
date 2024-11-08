class CreateReplies < ActiveRecord::Migration[7.2]
  def change
    create_table :replies do |t|
      t.string :text
      t.references :user, null: false, foreign_key: true
      t.integer :votes
      t.references :post, null: false, foreign_key: true
      t.references :reply, null: false, foreign_key: true, optional: true

      t.timestamps
    end
  end
end
