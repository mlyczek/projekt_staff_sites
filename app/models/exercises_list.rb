class ExercisesList < ActiveRecord::Base
  belongs_to :subject
	has_one :exercises_lists_file

	validates :nr, :presence => { :message => "Nie podano numeru listy" }
	validates :deadline, :presence => { :message => "Nie podano daty oddania listy lub podano ją w złym formacie" }
	validates :url, :presence => { :message => "Nie podano adresu url listy zadań" }, :if => :upload_present?

	def upload_present?
		exercises_lists_file.nil?
	end
end
