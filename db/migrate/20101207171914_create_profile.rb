class CreateProfile < ActiveRecord::Migration
  def self.up
		create_table :profile do |t|
			t.integer :teacher_id
			t.string :name
			t.string :degree
			t.integer :room_nr
			t.string :email
			t.string :phone
		end
  end

  def self.down
		drop_table :profile
  end
end
