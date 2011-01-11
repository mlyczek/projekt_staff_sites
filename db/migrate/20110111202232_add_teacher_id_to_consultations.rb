class AddTeacherIdToConsultations < ActiveRecord::Migration
  def self.up
		add_column :consultations, :teacher_id, :integer
  end

  def self.down
		remove_column :consultations, :teacher_id
  end
end
