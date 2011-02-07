class Admin::EventsController < Admin::AdminController
  def new
		@event = current_teacher.timetable.events.new(:start => Time.now, :end => Time.now + 2.hour)
	end

	def create
		@event = current_teacher.timetable.events.create(params[:event])

		if @event.valid?
			redirect_to admin_timetable_path
		else
			render :action => "new"
		end
	end

	def edit
		@event = current_teacher.timetable.events.find(params[:id])
	end

	def update
		@event = current_teacher.timetable.events.find(params[:id])

		if @event.update_attributes(params[:event])
			redirect_to admin_timetable_path
		else
			render :action => "edit"
		end
	end

	def destroy
		event = current_teacher.timetable.events.find(params[:id])
		event.destroy

		redirect_to admin_timetable_path
	end
end
