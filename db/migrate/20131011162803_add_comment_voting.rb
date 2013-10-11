class AddCommentVoting < ActiveRecord::Migration
  def up
    add_column :comments, :comment_upvotes, :integer, default: 0
  end

  def down
    drop_column :comments, :comment_upvotes, :integer
  end
end
