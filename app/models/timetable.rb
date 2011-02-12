class Timetable < ActiveRecord::Base
	belongs_to :teacher
  has_many :events, :dependent => :destroy
	has_many :event_types, :dependent => :destroy

	def events_for_all_days
		day_events = Array.new(7)
		days = day_names

		for i in 0..6
			subjects_h = Hour.joins(:subject).where(:subjects => { :teacher_id => self.teacher.id },
																														:week_day => days[i]).all
			sub_evts = subjects_h.map { |sub|
										self.events.new(
											:event_type_id => EventType.where(:name => "Zajęcia w ii").first.id,
											:title         => sub.subject.name,
											:week_day      => sub.week_day,
											:description   => sub.genre_str,
											:start         => sub.start,
											:end           => sub.end,
											:editable      => false
										)
									}

			day_events[i] = (self.events.where(:week_day => days[i]).order(:start).all) | sub_evts
		end

		return day_events
	end

	def day_names
		return ["poniedziałek", "wtorek", "środa", "czwartek", "piątek", "sobota", "niedziela"]
	end

	def event_types_with_default
		default_types = EventType.default_types

		return default_types | self.event_types
	end
end
