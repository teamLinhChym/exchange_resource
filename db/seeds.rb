puts "Create Companies ..."

Company.destroy_all
10.times do
  name = Faker::Company.name
  email = "#{name}@gmail.com"
  company_params = { name: name, email: email }

  Company.create! company_params
end

puts "Creating Users ..."

Company.all.each do |company|
  3.times do
    user_params = {
      email: Faker::Internet.unique.email,
      password: 123123123,
      company_id: company.id
    }
    User.create! user_params
  end
end

puts "Creating Skills ..."
Skill.destroy_all
20.times do
  skill_params = {
    name: Faker::Job.unique.field
  }
  Skill.create! skill_params
end
