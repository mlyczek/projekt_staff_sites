class Admin::EventTypesController < Admin::AdminController
  def new
		load_timetable
		@evt_type = current_teacher.timetable.event_types.new
	end

	def create
		@evt_type = current_teacher.timetable.event_types.create(params[:event_type])

		if @evt_type.valid?
			redirect_to admin_timetable_path
		else
			render :action => "new"
		end
	end

	def edit
		load_timetable
		@evt_type = current_teacher.timetable.event_types.find(params[:id])
	end

	def update
		@evt_type = current_teacher.timetable.event_types.find(params[:id])

		if @evt_type.update_attributes(params[:event_type])
			redirect_to admin_timetable_path
		else
			render :action => "edit"
		end
	end

	def destroy
		evt_type = current_teacher.timetable.event_types.find(params[:id])
		evt_type.destroy

		redirect_to admin_timetable_path
	end

	private
	def load_timetable
		@timetable = current_teacher.timetable
	end
end
