class Createposts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :title
      t.string :link
      t.text :body
      t.integer :up_votes
      t.integer :down_votes
      t.timestamps
    end
  end

  def down
  end
end
