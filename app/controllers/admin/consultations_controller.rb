class Admin::ConsultationsController < Admin::AdminController
  def index
		@consultations = current_teacher.consultations
		@consult = current_teacher.consultations.new
		@consult.start = Time.zone.now
		@consult.end = Time.zone.now + 2.hour
	end

	def create
		@consult = current_teacher.consultations.create(params[:consultation])
		post_on_fb(@consult)

		redirect_to admin_consultations_path
	end

	def edit
		@consult = current_teacher.consultations.find(params[:id])
	end

	def update
		@consult = current_teacher.consultations.find(params[:id])

		if @consult.update_attributes(params[:consultation])
			redirect_to admin_consultations_path
		else
			render :action => "edit"
		end
	end

	def destroy
		@consult = current_teacher.consultations.find(params[:id])
		@consult.destroy()

		redirect_to admin_consultations_path
	end

	private
	def post_on_fb(cons)
		fb = current_teacher.facebook
		unless fb.nil?
			fb.post_to_wal("Dodałem konsultacje w dniu: "+cons.day)
		end
	end
end
