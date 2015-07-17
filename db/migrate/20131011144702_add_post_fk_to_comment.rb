class AddPostFkToComment < ActiveRecord::Migration
  def up
    add_column :comments, :post_id, :integer
  end

  def down
    drop_column :comments, :post_id
  end
end
