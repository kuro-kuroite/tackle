# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Task.create!(
  name: "lifespan",
  deadline: DateTime.strptime("04/30/2048 09:00", "%m/%d/%Y %H:%M"),
)

Task.create!(
  name: "graduate",
  deadline: DateTime.strptime("02/21/2019 15:00", "%m/%d/%Y %H:%M"),
)

# 5.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(
#     name: Faker::Job.title
#     deadline: Faker::Date
#   )
# end


tasks = Task.order(:created_at).take(2)

tasks.each do |task|
  remaining_time = task.deadline - Time.current

  task.comments.create!(
    content: "about #{Time.at(remaining_time).day} #{"day".pluralize(remaining_time.to_i)}"
  )

  5.times do
    task.comments.create!(
      content: Faker::Lorem.sentence(5)
    )
  end
end
