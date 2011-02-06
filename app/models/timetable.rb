class Timetable < ActiveRecord::Base
	belongs_to :teacher
  has_many :events, :dependent => :destroy

	def events_for_all_days
		day_events = Array.new(7)
		days = day_names

		for i in 0..6
			day_events[i] = self.events.where(:week_day => days[i]).order(:start).all
		end

		return day_events
	end

	def day_names
		return ["poniedziałek", "wtorek", "środa", "czwartek", "piątek", "sobota", "niedziela"]
	end
end
