class Admin::ConsultationsController < Admin::AdminController
  def index
		@consultations = Consultation.all
		@consult = Consultation.new
	end

	def create
		@consult = Consultation.create(params[:consultation])

		redirect_to admin_consultations_path
	end

	def destroy
		@consult = Consultation.find(params[:id])
		@consult.destroy()

		redirect_to admin_consultations_path
	end
end
