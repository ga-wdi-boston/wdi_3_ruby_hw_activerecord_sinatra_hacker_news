class AddPostFkToComment < ActiveRecord::Migration
  def up
    add_column :comments, :storyid, :integer
  end

  def down
    add_columm :comments, :storyid, :integer
  end
end
