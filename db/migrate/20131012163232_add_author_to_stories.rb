class AddAuthorToStories < ActiveRecord::Migration
	def up
		add_column :stories, :author, :string
	end

	def down
		remove_column :stories, :author, :string
	end
end
