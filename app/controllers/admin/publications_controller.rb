class Admin::PublicationsController < Admin::AdminController
  def index
		@publications = current_teacher.publications.all
		@pub = current_teacher.publications.new
	end

	def create
		@pub = current_teacher.publications.create(params[:publication])

		redirect_to admin_publications_path
	end

	def edit
		@pub = current_teacher.publications.find(params[:id])
	end

	def update
		@pub = current_teacher.publications.find(params[:id])

		if @pub.update_attributes(params[:publication])
			redirect_to admin_publications_path
		else
			render :action => "edit"
		end
	end

	def destroy
		pub = current_teacher.publications.find(params[:id])
		pub.destroy()

		redirect_to admin_publications_path
	end
end
