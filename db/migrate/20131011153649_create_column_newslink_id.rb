class CreateColumnNewslinkId < ActiveRecord::Migration
  def up
  	remove_column :comments, :story_id, :integer
  	add_column :comments, :newslink_id, :integer
  end

  def down
  	add_column :comments, :story_id, :integer
  	remove_column :comments, :newslink_id, :integer
  end
end
