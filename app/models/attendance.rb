class Attendance < ApplicationRecord
	belongs_to :user
	belongs_to :event

	after_create :notify_eventcreator

  	def notify_eventcreator
    	AttendanceMailer.notify_event_participation_to_usercreator(self).deliver_now
  	end
end
