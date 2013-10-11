class CreatePosts < ActiveRecord::Migration
  
  def up
  	create_table :newslinks do |t|
  	  t.text :title
  	  t.text :link, default: ""
  	  t.text :body, default: ""
  	  t.integer :up_votes, default: 0
  	  t.integer :down_votes, default: 0
  	  t.timestamps
  	end
  end

  def down
  	drop_table :newslinks
  end
end
