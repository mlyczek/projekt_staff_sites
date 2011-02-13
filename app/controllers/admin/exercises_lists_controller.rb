class Admin::ExercisesListsController < Admin::AdminController
  def index
		@subject = get_current_subject(params[:subject_id])
		@exercises_list = @subject.exercises_lists.all
	end

	def new
		@subject = get_current_subject(params[:subject_id])
		@exercises_list = @subject.exercises_lists.new

		list_number = @subject.exercises_lists.maximum(:nr) || 0
		@exercises_list.nr = list_number + 1;
	end

	def create
		@subject = get_current_subject(params[:subject_id])
		@exercises_list = @subject.exercises_lists.create(params[:exercises_list])

		if @exercises_list.valid?
			redirect_to admin_subject_exercises_lists_path(@subject)
		else
			render :action => "new"
		end
	end

	def edit
		@subject = get_current_subject(params[:subject_id])
		@exercises_list = @subject.exercises_lists.find(params[:id])
	end

	def update
		@subject = get_current_subject(params[:subject_id])
		@exercises_list = @subject.exercises_lists.find(params[:id])

		if @exercises_list.update_attributes(params[:exercises_list])
			redirect_to admin_subject_exercises_lists_path(@subject)
		else
			render :action => "edit"
		end
	end

	def destroy
		@subject = get_current_subject(params[:subject_id])
		@exercises_list = @subject.exercises_lists.find(params[:id])
		@exercises_list.destroy

		redirect_to admin_subject_exercises_lists_path(@subject)
	end
end
