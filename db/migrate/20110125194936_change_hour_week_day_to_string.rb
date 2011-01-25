class ChangeHourWeekDayToString < ActiveRecord::Migration
  def self.up
		change_column :hours, :week_day, :string
  end

  def self.down
		change_column :hours, :week_day, :integer
  end
end
