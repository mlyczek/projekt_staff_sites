class AddNameFieldToLectureResources < ActiveRecord::Migration
  def self.up
		add_column :lecture_resources, :name, :string
  end

  def self.down
		remove_column :lecture_resources, :name
  end
end
