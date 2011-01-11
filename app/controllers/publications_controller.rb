class PublicationsController < ApplicationController
  def index
		teacher = Teacher.find(params[:teacher_id])
		@publications = teacher.publications
	end
end
