# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = :ja

Task.create!(
  name: "健康寿命",
  deadline: DateTime.strptime("04/30/2048 09:00", "%m/%d/%Y %H:%M"),
)

Task.create!(
  name: "卒業",
  deadline: DateTime.strptime("02/21/2019 15:00", "%m/%d/%Y %H:%M"),
)

tasks = Task.order(:created_at).take(2)

tasks.each do |task|
  remaining_time = task.deadline.in_time_zone('Tokyo') - Time.zone.now
  d = (remaining_time / 60 / 60 / 24).to_i

  task.comments.create!(
    content: "残り #{d} #{"day".pluralize(d)}"
  )

  5.times do
    task.comments.create!(
      content: Faker::Lorem.sentence(3)
    )
  end
end


5.times do |n|
  Task.create!(
    name: Faker::Lorem.word,
    deadline: Faker::Time.forward(20, :day)
  )
end

tasks = Task.where(id: 2..Float::INFINITY)

tasks.each do |task|
  5.times do
    task.comments.create!(
      content: Faker::Lorem.sentence(4)
    )
  end
end
