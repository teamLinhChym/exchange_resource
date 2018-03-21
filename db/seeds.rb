puts "Creating Users ..."
User.destroy_all
20.times do
  user_params = {
    email: Faker::Internet.unique.email,
    password: 123123123
  }
  User.create(user_params)
end

puts "Creating Skills ..."
Skill.destroy_all
20.times do
  skill_params = {
    name: Faker::Job.unique.field
  }
  Skill.create(skill_params)
end
