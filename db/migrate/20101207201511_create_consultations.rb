class CreateConsultations < ActiveRecord::Migration
  def self.up
		create_table :consultations do |t|
			t.string :day
			t.time :start
			t.time :end
			t.text :comments
		end
  end

  def self.down
		drop_table :consultations
  end
end
