class EventType < ActiveRecord::Base
  has_many :events
	belongs_to :event_type_color
end
