3.times do |i|
    User.create(name: "user#{i+1}", email: "user#{i+1}@example.com", password: "password", password_confirmation: "password")
end






