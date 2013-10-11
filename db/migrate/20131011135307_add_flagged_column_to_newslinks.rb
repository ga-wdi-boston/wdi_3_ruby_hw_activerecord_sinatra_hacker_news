class AddFlaggedColumnToNewslinks < ActiveRecord::Migration
  def up
  	add_column :newslinks, :flagged, :boolean, default: false
  end

  def down
  	remove_column :newslinks, :flagged, :boolean, default: false
  end
end
