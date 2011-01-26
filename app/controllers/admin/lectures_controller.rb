class Admin::LecturesController < Admin::AdminController
  def index
		@subject = get_current_subject(params[:subject_id])
		@lectures = @subject.lectures.all
	end

	def new
		@subject = get_current_subject(params[:subject_id])
		@lecture = @subject.lectures.new
	end

	def create
		@subject = get_current_subject(params[:subject_id])
		@lecture = @subject.lectures.create(params[:lecture])

		if @lecture.valid?
			redirect_to admin_subject_lectures_path(@subject)
		else
			render :action => "new"
		end
	end

	def edit
		@subject = get_current_subject(params[:subject_id])
		@lecture = @subject.lectures.find(params[:id])
	end

	def update
		@subject = get_current_subject(params[:subject_id])
		@lecture = @subject.lectures.find(params[:id])

		if @lecture.update_attributes(params[:lecture])
			redirect_to admin_subject_lectures_path(@subject)
		else
			render :action => "edit"
		end
	end

	def show
		@subject = get_current_subject(params[:subject_id])
		@lecture = @subject.lectures.find(params[:id])
	end

	def destroy
		@subject = get_current_subject(params[:subject_id])
		@lecture = @subject.lectures.find(params[:id])

		@lecture.destroy
		redirect_to admin_subject_lectures_path(@subject)
	end
end
