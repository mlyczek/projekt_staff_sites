class Admin::EventsController < Admin::AdminController
  def new
		load_timetable
		@event = current_teacher.timetable.events.new(:start => Time.zone.now, :end => Time.zone.now + 2.hour)
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
		load_timetable
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

	private
	def load_timetable
		@timetable = current_teacher.timetable
	end
end
