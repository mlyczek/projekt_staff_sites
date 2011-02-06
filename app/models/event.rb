class Event < ActiveRecord::Base
  belongs_to :timetable
	belongs_to :event_type

	# podaje ile minut trwa dane wydarzenie/zajęcia
	def duration_in_minutes
		return ((self.end - self.start) / (60 * 2)).to_i;
	end

	# podaje ile minut upłynęło od początku dnia do rozpoczęcia wydarzenia
	def minutes_since_beginning
		beginning = Time.utc(start.year, start.month, start.day, 7, 0)

		return ((start - beginning) / (60 * 2)).to_i
	end

	# podaje ile pixeli powinna wynosić wysokość wydarzenia (uwzględnia też linie poziome, które są szerokości 1px)
	def height_pixels
		duration = duration_in_minutes

		if duration > 30
			duration = duration + (duration / 30).to_i
		end

		return duration.to_s + "px"
	end

	# podaje ile pixeli od góry wydarzenie powinno być przesunięte (uwzględnia też linie poziome, które są szerokości 1px)
	def pixels_from_top
		minutes = minutes_since_beginning
		pixels = (minutes + (minutes / 30) -1).to_i

		return pixels.to_s + "px"
	end
end
