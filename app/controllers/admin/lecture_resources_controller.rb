class Admin::LectureResourcesController < Admin::AdminController
  def new
		@subject = get_current_subject(params[:subject_id])
		lecture = @subject.lectures.find(params[:lecture_id])
		@resource = lecture.lecture_resources.new
	end

	def create
		@subject = get_current_subject(params[:subject_id])
		lecture = @subject.lectures.find(params[:lecture_id])
		@resource = lecture.lecture_resources.create(params[:resource])

		if @resource.valid?
			redirect_to admin_subject_lecture_path(@subject, lecture)
		else
			render :action => "new"
		end
	end

	def edit
		@subject = get_current_subject(params[:subject_id])
		lecture = @subject.lectures.find(params[:lecture_id])
		@resource = lecture.lecture_resources.find(params[:id])
	end

	def update
		@subject = get_current_subject(params[:subject_id])
		lecture = @subject.lectures.find(params[:lecture_id])
		@resource = lecture.lecture_resources.find(params[:id])

		if @resource.update_attributes(params[:resource])
			redirect_to admin_subject_lecture_path(@subject, lecture)
		else
			render :action => "edit"
		end
	end

	def destroy
		@subject = get_current_subject(params[:subject_id])
		lecture = @subject.lectures.find(params[:lecture_id])
		@resource = lecture.lecture_resources.find(params[:id])

		@resource.destroy
		redirect_to admin_subject_lecture_path(@subject, lecture)
	end
end
