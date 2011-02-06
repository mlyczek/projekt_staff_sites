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
end
