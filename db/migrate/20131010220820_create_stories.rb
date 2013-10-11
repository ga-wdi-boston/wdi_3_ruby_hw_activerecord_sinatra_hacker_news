class CreateStories < ActiveRecord::Migration

  def up
  	create_table :stories do |t|
  		t.text :title
  		t.text :url
  		t.text :body
  		t.timestamps
  		t.integer :upvotes
  		t.integer :downvotes
  	end
  end

  def down
  	drop_table :stories
  end
end
