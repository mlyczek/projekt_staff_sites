class CreateSubjectHours < ActiveRecord::Migration
  def self.up
		create_table :hours do |t|
			t.integer :subject_id
			t.string  :type
			t.integer :week_day
			t.time    :start
			t.time    :end
			t.string  :room
		end
  end

  def self.down
		drop_table :hours
  end
end
