class Admin::ContactController < Admin::AdminController
	def index
		@profile = current_teacher.profile
	end

	def update
		current_teacher.profile.update_attributes(params[:profile])
		redirect_to admin_root_path
	end
end