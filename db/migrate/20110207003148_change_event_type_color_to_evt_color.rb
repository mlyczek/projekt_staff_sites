class ChangeEventTypeColorToEvtColor < ActiveRecord::Migration
  def self.up
		change_column :event_types, :color, :integer
		rename_column :event_types, :color, :event_type_color_id

		EventType.all.map { |et| et.update_attributes(:event_type_color_id => 1) }
  end

  def self.down
		rename_column :event_types, :event_type_color_id, :color
		change_column :event_types, :color, :string
  end
end
