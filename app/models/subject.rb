class Subject < ActiveRecord::Base
  belongs_to :teacher

	validates :name, :presence => { :message => "Nie podano nazwy przedmiotu" }
	validates :semester, :inclusion => { :in => ['winter', 'summer'], :message => "Nieprawidłowy semestr" }

	def semester
		if self[:semester] == 'winter'
			'zimowy'
		else
			'letni'
		end
	end
end
