class EventType < ActiveRecord::Base
  has_many :events
	belongs_to :event_type_color
	belongs_to :timetable

	def self.default_types
		return self.where(:timetable_id => nil).all
	end
end
