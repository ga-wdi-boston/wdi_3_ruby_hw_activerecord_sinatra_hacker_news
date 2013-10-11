class CreateStories < ActiveRecord::Migration

# db:migrate
  def up
  	create_table :stories do |t|
  		t.text :title
  		t.text :url
  		t.text :body
  		t.timestamps
  		t.integer :upvotes, default: 0
  		t.integer :downvotes, default: 0
  	end
  end

# db:rollback
  def down
  	drop_table :stories
  end
end
