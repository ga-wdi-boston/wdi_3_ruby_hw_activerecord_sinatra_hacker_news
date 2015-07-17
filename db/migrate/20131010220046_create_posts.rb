class CreatePosts < ActiveRecord::Migration
  
  # This method is invoked when the migration is run. 
  def up
    create_table :posts do |t|
    	t.text :title
    	t.text :link
    	t.text :body
    	t.integer :up_votes
    	t.integer :down_votes
    	t.timestamp
  	end
  end

  def down
  	drop_table :posts
  end
end
