class Admin::AdminController < ApplicationController
	layout 'admin'
	before_filter :authenticate_teacher!

	private
	def get_current_subject(id)
		return current_teacher.subjects.find(id)
	end
end
