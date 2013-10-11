class WdiNews < ActiveRecord::Migration #should be create
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

#for rollback
  def down
    drop_table :posts #wrong! should be :stories
  end
end


#if adding columns, creat another file like this, then run: add_colum :new_column, :new_column2 / :remove_column :new_column, new_column2