class CreateStories < ActiveRecord::Migration
  def up
    create_table :stories do |t|
     t.string :title
     t.string :author
     t.text :body
     t.integer :up_votes
     t.integer :down_votes
     t.timestamps
   end 

 end

 def down
  drop_table stories
 end
end
