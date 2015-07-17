class CreateComment < ActiveRecord::Migration
  def up
  	create_table :comments do |t|
  		t.string :author, :default => 'anonymous'
  		t.text :body
  	end

  end

  def down
  	remove_table :comments
  end
end
