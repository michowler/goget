3.times do |i|
    User.create(name: "user#{i+1}", email: "user#{i+1}@example.com", password: "password", password_confirmation: "password")
end

Job.create(user_id: 1, pickup_address: "Taman Tun Dr Ismail", dropoff_address: "Kelana Jaya", pickup_lat: 120.24, pickup_long: 125.0, dropoff_lat: 149.0, dropoff_long: 210.0, book_status: false )
Job.create(user_id: 1, pickup_address: "Kepong", dropoff_address: "Cheras", pickup_lat: 120.24, pickup_long: 115.0, dropoff_lat: 183.0, dropoff_long: 116.0, book_status: false )
Job.create(user_id: 2, pickup_address: "Subang Jaya", dropoff_address: "Bandar Utama", pickup_lat: 180.24, pickup_long: 105.0, dropoff_lat: 143.0, dropoff_long: 136.0, book_status: false )








