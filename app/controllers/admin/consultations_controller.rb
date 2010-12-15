class Admin::ConsultationsController < Admin::AdminController
  def index
		@consultations = Consultation.all
		@consult = Consultation.new
	end

	def create
		@consult = Consultation.create(params[:consultation])
		post_on_fb(@consult)

		redirect_to admin_consultations_path
	end

	def destroy
		@consult = Consultation.find(params[:id])
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
