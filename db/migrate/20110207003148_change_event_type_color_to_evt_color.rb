class ChangeEventTypeColorToEvtColor < ActiveRecord::Migration
  def self.up
		EventType.all.map { |et|
			if et.name == "Zajęcia w ii"
				et.update_attributes(:color => "1")
			else
				if et.name == "Zajęcia poza ii"
					et.update_attributes(:color => "2")
				end
			end
		}

		change_column :event_types, :color, :integer
		rename_column :event_types, :color, :event_type_color_id
  end

  def self.down
		rename_column :event_types, :event_type_color_id, :color
		change_column :event_types, :color, :string
  end
end
