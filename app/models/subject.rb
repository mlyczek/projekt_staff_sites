class Subject < ActiveRecord::Base
  belongs_to :teacher
	has_many :hours
	has_many :exercises_lists

	validates :name, :presence => { :message => "Nie podano nazwy przedmiotu" }
	validates :semester, :inclusion => { :in => ['zimowy', 'letni'], :message => "Nieprawidłowy semestr" }

	# będzie zwracać tylko typy zajęć
	def hours_genres
		types = Array.new
		self.hours.each do |h|
			if !types.include?(h.genre_str)
				types.push(h.genre_str)
			end
		end
		return types
	end
end
