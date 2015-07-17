class AddDefaultToAuthor < ActiveRecord::Migration
  def up
		change_column :stories, :author, :string, :default => 'anonymous'
	end

	def down
		change_column :stories, :author, :string, :default => 'anonymous'
	end
end
