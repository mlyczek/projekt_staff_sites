class AddEditableToEvents < ActiveRecord::Migration
  def self.up
		add_column :events, :editable, :boolean, :default => true
  end

  def self.down
		remove_column :events, :editable
  end
end
