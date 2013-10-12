class AddColumnStoryid < ActiveRecord::Migration
	def up
		add_column :comments, :story_id, :integer
		add_column :comments, :up_votes, :integer, default: 0
		add_column :comments, :down_votes, :integer, default: 0
	end

	def down
		remove_column :comments, :story_id, :integer
		remove_column :comments, :up_votes, :integer, default: 0
		remove_column :comments, :down_votes, :integer, default: 0
	end
end
