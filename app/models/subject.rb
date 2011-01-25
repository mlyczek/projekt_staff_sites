class Subject < ActiveRecord::Base
  belongs_to :teacher
	has_many :hours

	validates :name, :presence => { :message => "Nie podano nazwy przedmiotu" }
	validates :semester, :inclusion => { :in => ['zimowy', 'letni'], :message => "Nieprawidłowy semestr" }

	# będzie zwracać tylko typy zajęć
	def hours_genres
		types = Array.new
		self.hours.each do |h|
			if !types.include?(h.genre)
				types.push(h.genre)
			end
		end
		return types
	end
end
