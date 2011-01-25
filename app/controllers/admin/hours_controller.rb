class Admin::HoursController < Admin::AdminController
  def new
		subject = current_teacher.subjects.find(params[:subject_id])
		@hour = subject.hours.new
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

	def destroy
		sub = current_teacher.subjects.find(params[:subject_id])
		sub.hours.find(params[:id]).destroy

		redirect_to [:admin, sub]
	end
end
