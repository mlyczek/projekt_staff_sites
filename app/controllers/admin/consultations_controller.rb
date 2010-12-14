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
		if not current_teacher.profile.fb_access_token.nil?
			require 'net/https'

			url = URI.parse("https://graph.facebook.com/#{current_teacher.profile.fb_profile_id}/feed")
			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = (url.scheme == 'https')
			request = Net::HTTP::Post.new(url.path)
			request.set_form_data({'access_token' => current_teacher.profile.fb_access_token,
														'message' => "Dodałem konsultacje w dniu: "+cons.day}, '&')
			response = http.request(request)

			flash[:notice] = response.body
		end
	end
end
