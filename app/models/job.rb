class Job < ApplicationRecord	
	default_scope { order(created_at: :desc) }	
	belongs_to :user
	validates :pickup_address, :dropoff_address, :pickup_lat, :pickup_long, :dropoff_lat, :dropoff_long, presence: true
end
