class Admin::ContactController < Admin::AdminController
	def index
		@curr_u_profile = current_teacher.profile
	end

	def update
		
	end
end