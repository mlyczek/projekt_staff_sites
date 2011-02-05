class CreateTimetableEventTypes < ActiveRecord::Migration
  def self.up
		create_table :event_types do |t|
			t.string :name
			t.string :color
			t.boolean :editable, :default => 1
		end
  end

  def self.down
		drop_table :event_types
  end
end
