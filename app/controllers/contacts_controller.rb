class ContactsController < ApplicationController
	def show
		teacher = Teacher.find(params[:teacher_id])
		@profile = teacher.profile
		@email = teacher.email

		@consultations = teacher.consultations
	end
end
