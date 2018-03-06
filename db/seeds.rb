User.create! email: "test@gmail.com", password: 123123123
puts "Creating Company ..."
Company.destroy_all
20.times do |index|
  company_params = {
    name: "Company #{index}",
    description: "Description #{index}"
  }
  Company.create(company_params)
end
