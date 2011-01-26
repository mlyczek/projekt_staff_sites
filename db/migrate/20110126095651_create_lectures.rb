class CreateLectures < ActiveRecord::Migration
  def self.up
		create_table :lectures do |t|
			t.integer :subject_id
			t.integer :nr
			t.string  :title
			t.date    :date
			t.text    :abstract

			t.timestamps
		end
  end

  def self.down
		drop_table :lectures
  end
end
