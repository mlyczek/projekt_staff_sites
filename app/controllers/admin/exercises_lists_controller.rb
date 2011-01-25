class Admin::ExercisesListsController < Admin::AdminController
  def index
		@subject = get_all_subjects
		@exercises_list = @subject.exercises_lists.all
	end

	def new
		@subject = get_all_subjects
		@exercises_list = @subject.exercises_lists.new

		@list_number = @subject.exercises_lists.maximum(:nr) + 1
	end

	def create
		@subject = get_all_subjects
		@exercises_list = @subject.exercises_lists.create(params[:exercises_list])

		if @exercises_list.valid?
			redirect_to admin_subject_exercises_lists_path(@subject)
		else
			render :action => "new"
		end
	end

	private
	def get_all_subjects
		return current_teacher.subjects.find(params[:subject_id])
	end
end
