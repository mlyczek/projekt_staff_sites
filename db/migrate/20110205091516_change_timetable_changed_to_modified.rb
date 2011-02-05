class ChangeTimetableChangedToModified < ActiveRecord::Migration
  def self.up
		rename_column :timetables, :changed, :modified
  end

  def self.down
		rename_column :timetables, :modified, :changed
  end
end
