class CreateCommentTable < ActiveRecord::Migration
  def up
  	  create_table :comments do |t|
  	  t.string :author, default: "anonymous"
  	  t.text :body
  	  t.integer :story_id
  	  t.integer :up_votes, default: 0
  	  t.integer :down_votes, default: 0
  	  t.timestamps
  	end
  end

  def down
  	drop_table :comments
  end
end
