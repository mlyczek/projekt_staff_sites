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

	def destroy
		evt_type = EventType.find(params[:id])
		evt_type.destroy

		redirect_to admin_timetable_path
	end
end
