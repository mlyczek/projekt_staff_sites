class CreateEventTypeColors < ActiveRecord::Migration
  def self.up
		create_table :event_type_colors do |t|
			t.string :name
			t.string :css_class
		end

		EventTypeColor.create(:name => "Niebieski", :css_class => "ii_classes");
		EventTypeColor.create(:name => "Zielony", :css_class => "not_ii");
		EventTypeColor.create(:name => "Fioletowy", :css_class => "violet");
		EventTypeColor.create(:name => "Fioletowy 2", :css_class => "violet2");
		EventTypeColor.create(:name => "Czerwony", :css_class => "red");
		EventTypeColor.create(:name => "Żółty", :css_class => "yellow");
		EventTypeColor.create(:name => "Pomarańczowy", :css_class => "orange");
  end

  def self.down
		drop_table :event_type_colors
  end
end
