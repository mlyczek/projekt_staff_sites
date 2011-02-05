class AddDefaultTypesToEventTypes < ActiveRecord::Migration
  def self.up
		EventType.create(:name => "Zajęcia w ii", :color => "#cedde6", :editable => false)
		EventType.create(:name => "Zajęcia poza ii", :color => "#bee6c8")
  end

  def self.down
		EventType.where(:name => "Zajęcia w ii").first.destroy
		EventType.where(:name => "Zajęcia poza ii").first.destroy
  end
end
