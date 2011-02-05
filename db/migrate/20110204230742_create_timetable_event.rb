class CreateTimetableEvent < ActiveRecord::Migration
  def self.up
		create_table :events do |t|
			t.integer :timetable_id
			t.integer :event_type_id
			t.string :title
			t.string :week_day
			t.text :description
			t.time :start
			t.time :end
		end
  end

  def self.down
		drop_table :events
  end
end
