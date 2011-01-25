class ChangeHoursTypeToGenre < ActiveRecord::Migration
  def self.up
		rename_column :hours, :type, :genre
  end

  def self.down
		rename_column :hours, :genre, :type
  end
end
