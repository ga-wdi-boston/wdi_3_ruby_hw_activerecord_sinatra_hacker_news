class AddDefaultValueToUpvotesComments < ActiveRecord::Migration
  def up
  	remove_column :comments, :up_votes
  	add_column :comments, :up_votes, :integer, default: 0
  end

  def down
  end
end
