class CreatePublicatinos < ActiveRecord::Migration
  def self.up
		create_table :publications do |t|
			t.integer :teacher_id
			t.string :co_authors
			t.string :title
			t.integer :year
			t.string :link
		end
  end

  def self.down
		drop_table :publications
  end
end
