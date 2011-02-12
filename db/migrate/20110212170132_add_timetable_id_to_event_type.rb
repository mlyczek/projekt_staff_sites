class AddTimetableIdToEventType < ActiveRecord::Migration
  def self.up
		add_column :event_types, :timetable_id, :integer
  end

  def self.down
		remove_column :event_types, :timetable_id
  end
end
