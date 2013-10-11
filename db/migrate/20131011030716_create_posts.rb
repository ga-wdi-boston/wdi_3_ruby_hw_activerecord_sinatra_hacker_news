class CreatePosts < ActiveRecord::Migration
   def up
  	create_table :posts do |t|
  	  t.string :title
  	  t.text :body
      t.text :link
      t.integer :up_vote
      t.integer :down_vote
  	  t.timestamps
  	end
  end
  def down
  	drop_table :posts
  end
end
