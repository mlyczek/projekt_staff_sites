class Admin::EventTypesController < Admin::AdminController
  def new
		@evt_type = EventType.new
	end

	def create
		@evt_type = EventType.create(params[:event_type])

		if @evt_type.valid?
			redirect_to admin_timetable_path
		else
			render :action => "new"
		end
	end

	def edit
		@evt_type = EventType.find(params[:id])
	end

	def update
		@evt_type = EventType.find(params[:id])

		if @evt_type.update_attributes(params[:event_type])
			redirect_to admin_timetable_path
		else
			render :action => "edit"
		end
	end

	def destroy
		evt_type = EventType.find(params[:id])
		evt_type.destroy

		redirect_to admin_timetable_path
	end
end
