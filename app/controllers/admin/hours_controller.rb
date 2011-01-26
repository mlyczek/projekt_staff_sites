class Admin::HoursController < Admin::AdminController
  def new
		subject = current_teacher.subjects.find(params[:subject_id])
		@hour = subject.hours.new
		@hour.start = Time.now
		@hour.end = Time.now + 2.hour
	end

	def create
		subject = current_teacher.subjects.find(params[:subject_id])
		@hour = subject.hours.create(params[:hour])

		if @hour.valid?
			redirect_to [:admin, subject]
		else
			render :view => "new"
		end
	end

	def edit
		subject = current_teacher.subjects.find(params[:subject_id])
		@hour = subject.hours.find(params[:id])
	end

	def update
		subject = current_teacher.subjects.find(params[:subject_id])
		@hour = subject.hours.find(params[:id])

		if @hour.update_attributes(params[:hour])
			redirect_to [:admin, subject]
		else
			render :view => "edit"
		end
	end

	def destroy
		sub = current_teacher.subjects.find(params[:subject_id])
		sub.hours.find(params[:id]).destroy

		redirect_to [:admin, sub]
	end
end
