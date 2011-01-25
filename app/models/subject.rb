class Subject < ActiveRecord::Base
  belongs_to :teacher
	has_many :hours

	validates :name, :presence => { :message => "Nie podano nazwy przedmiotu" }
	validates :semester, :inclusion => { :in => ['zimowy', 'letni'], :message => "Nieprawidłowy semestr" }
end
