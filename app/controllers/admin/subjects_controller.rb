class Admin::SubjectsController < Admin::AdminController
  def index
		@subjects = current_teacher.subjects.all
	end

	def new
		@subject = current_teacher.subjects.new
	end

	def create
		sub = current_teacher.subjects.create(params[:subject])

		if sub.valid?
			redirect_to [:admin, sub]
		else
			@subject = sub
			render :action => "new"
		end
	end

	def show
		@subject = current_teacher.subjects.find(params[:id])
	end

	def destroy
		sub = current_teacher.subjects.find(params[:id])
		sub.destroy

		redirect_to admin_subjects_path
	end
end
