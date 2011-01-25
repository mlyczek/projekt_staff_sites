class Hour < ActiveRecord::Base
	belongs_to :subject

	def genre_str
		case self.genre
		when "w"
			"wykład"
		when "rep"
			"repetytorium"
		when "cw"
			"ćwiczenia"
		when "prac"
			"pracownia"
		when "cwprac"
			"ćwiczenia + pracownia"
		else
			"nieznany"
		end
	end
end
