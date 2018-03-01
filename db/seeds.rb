User.delete_all

User.create! email: "test@gmail.com", password: 123123123

# Create authenticate USER
5.times.each do |i|
  otp_secret = User.generate_otp_secret
  User.create! email: "authenticate#{i + 1}@gmail.com", password: "password123",
    otp_required_for_login: true, otp_secret: otp_secret
end
