class CreateUserCreds < ActiveRecord::Migration[7.2]
  def change
    create_table :user_creds do |t|
      t.string :name
      t.string :details
      t.string :school
      t.boolean :approved
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
