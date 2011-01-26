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
end
