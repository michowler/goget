class Job < ApplicationRecord
	belongs_to :user
	default_scope { order(created_at: :desc) }
	validates :pickup_address, :dropoff_address, :pickup_lat, :pickup_long, :dropoff_lat, :dropoff_long, presence: true
end
