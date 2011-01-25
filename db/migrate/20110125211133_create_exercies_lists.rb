class CreateExerciesLists < ActiveRecord::Migration
  def self.up
		create_table :exercises_lists do |t|
			t.integer :subject_id
			t.integer :nr
			t.date    :deadline
			t.integer :exercises_files_list_id
			t.string  :url
			t.string  :comment

			t.timestamps
		end
  end

  def self.down
  end
end
