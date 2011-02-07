class SubjectsController < ApplicationController
  def index
		@subjects = get_all_subjects
		@timetable = Teacher.find(params[:teacher_id]).timetable
	end

	def show
		@subjects = get_all_subjects
		@subject = @subjects.find(params[:id])
	end

	private
	def get_all_subjects
		return Teacher.find(params[:teacher_id]).subjects
	end
end
