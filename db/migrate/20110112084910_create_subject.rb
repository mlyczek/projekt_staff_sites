class CreateSubject < ActiveRecord::Migration
  def self.up
		create_table :subjects do |t|
			t.integer :teacher_id
			t.string :name
			t.string :academic_year
			t.string :semester
		end
  end

  def self.down
		drop_table :subjects
  end
end
