class AddPostFkToComment < ActiveRecord::Migration
  def up
    add_column :comments, :storyid, :integer
  end

  def down
    drop_columm :comments, :storyid, :integer
  end
end
