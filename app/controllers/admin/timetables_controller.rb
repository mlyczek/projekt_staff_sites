class Admin::TimetablesController < Admin::AdminController
  def show
		@timetable = current_teacher.timetable
	end
end
