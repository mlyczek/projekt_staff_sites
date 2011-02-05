class CreateTimetables < ActiveRecord::Migration
  def self.up
		create_table :timetables do |t|
			t.integer :teacher_id
			t.string :comment
			t.datetime :changed
		end
  end

  def self.down
		drop_down :timetables
  end
end
