class AddLoginToDevise < ActiveRecord::Migration
  def self.up
		add_column :teachers, :login, :string
		add_index :teachers, :login, :unique => true
  end

  def self.down
		remove_column :teachers, :login
  end
end
