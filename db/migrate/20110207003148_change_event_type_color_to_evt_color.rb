class ChangeEventTypeColorToEvtColor < ActiveRecord::Migration
  def self.up
		remove_column :event_types, :color
		add_column :event_types, :event_type_color_id, :integer

		EventType.all.map { |et|
			if et.name == "Zajęcia w ii"
				et.update_attributes(:event_type_color_id => 1)
			else
				if et.name == "Zajęcia poza ii"
					et.update_attributes(:event_type_color_id => 2)
				end
			end
		}
  end

  def self.down
		remove_column :event_types, :event_type_color_id
		add_column :event_types, :color, :string
  end
end
