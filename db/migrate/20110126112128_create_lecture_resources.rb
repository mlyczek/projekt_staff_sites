class CreateLectureResources < ActiveRecord::Migration
  def self.up
		create_table :lecture_resources do |t|
			t.integer :lecture_id
			t.string  :url
			t.string  :description
		end
  end

  def self.down
		drop_table :lecture_resources
  end
end
