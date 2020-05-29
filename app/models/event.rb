class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendances

	validates :start_date,
		presence: true

	validate :event_is_not_past

	validates :duration,
		presence: true,
		numericality: { only_integer: true, greater_than: 0, message: "please enter a number greater than 0"}

	validate :event_duration_is_mutiple_of_5

	validates :title,
		presence: true,
		length: { in: 5..140}

	validates :description,
		presence: true,
		length: { in: 20..1000}

	validates :price,
		presence: true,
		numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than: 1000 }


	validates :location,
		presence: true


	private
		def event_is_not_past
			return if start_date.blank? 
			if Time.now > start_date
				errors.add(:start_date, "il est impossible de créer ou modifier un événement dans le passé")
  			end
  	end

  	def event_duration_is_mutiple_of_5
  		return if duration.blank? 
  		if (duration%5) != 0
  			errors.add(:duration, "le nombre de minutes doit etre un multiple de 5")
  		end
  	end

end
