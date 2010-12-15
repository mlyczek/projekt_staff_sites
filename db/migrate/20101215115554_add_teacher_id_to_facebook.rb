class AddTeacherIdToFacebook < ActiveRecord::Migration
  def self.up
		add_column :facebook, :teacher_id, :integer
  end

  def self.down
		remove_column :facebook, :teacher_id
  end
end
