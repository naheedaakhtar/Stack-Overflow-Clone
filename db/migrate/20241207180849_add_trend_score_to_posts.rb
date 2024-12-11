class AddTrendScoreToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :trend_score, :float
  end
end
