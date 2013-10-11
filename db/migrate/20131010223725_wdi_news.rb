class WdiNews < ActiveRecord::Migration
  def up
    create_table :stories do |s|
      s.string :title
      s.string :link
      s.text :body
      s.integer :up_votes
      s.integer :down_votes
      s.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
