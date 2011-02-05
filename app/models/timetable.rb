class Timetable < ActiveRecord::Base
	belongs_to :teacher

  has_many :events, :dependent => :destroy
end
