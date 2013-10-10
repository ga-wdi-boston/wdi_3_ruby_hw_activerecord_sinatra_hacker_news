class AddTotalVotesColumn < ActiveRecord::Migration
  def up
    add_column :posts, :total_votes, :integer, default: 0
  end

  def down
    remove_column :posts, :total_votes
  end
end
