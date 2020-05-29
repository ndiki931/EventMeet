class User < ApplicationRecord
	has_many :attendances
	has_many :events, through: :attendances

	after_create :welcome_user

  	def welcome_user
    	UserMailer.welcome_email(self).deliver_now
  	end

end

