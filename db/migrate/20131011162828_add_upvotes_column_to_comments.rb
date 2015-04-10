class AddUpvotesColumnToComments < ActiveRecord::Migration
  def up
  	add_column :comments, :up_votes, :integer
  end

  def down
  	remove_column :comments, :up_votes
  end
end
