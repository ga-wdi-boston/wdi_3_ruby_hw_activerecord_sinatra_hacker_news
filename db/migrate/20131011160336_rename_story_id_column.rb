class RenameStoryIdColumn < ActiveRecord::Migration
  def up
    rename_column :comments, :storyid, :story_id
  end

  def down
    rename_column :comments, :story_id, :storyid
  end
end
