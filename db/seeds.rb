# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# generate 20 users
time = DateTime.parse('2021-01-01')
(1..20).each do |id|
  User.create!(
    # each user is assigned an id from 1-20
    id: id, 
    email: Faker::Internet.email,
    # issue each user the same password
    password: "password", 
    password_confirmation: "password",
    created_at: time,
    updated_at: time
    # a user can have only one of these roles
  )
  time += [5,10,15].sample.hours
end

# create 10 tickets in DB
time += 3.days 
(1..40).each do |id|
  Post.create!(
    id: id,
    # we have userIds between 1 and 20. Assign a ticket to a user 
    # randomly
    user_id: rand(1..20), 
    title: [Faker::University.name, Faker::Device.model_name, Faker::Company.catch_phrase, Faker::Mountain.name, Faker::Book.title].sample,
    post_status: %w[draft published archived].sample,
    # generate a fake paragraph
    body: [Faker::Lorem.paragraph(sentence_count: 7), Faker::Lorem.paragraph(sentence_count: 4), Faker::Lorem.paragraph(sentence_count: 6), Faker::Lorem.paragraph(sentence_count: 3)].join("\n"),
    created_at: time,
    updated_at: time
  )
  time += [15,25,35].sample.hours
end

# create comments in DB. Comments belong to tickets
time -= 3.days 
(1..50).each do |id|
  Comment.create!(
    id: id,
    user_id: rand(1..20),
    body: Faker::Lorem.paragraph(sentence_count: 2),
    post_id: rand(1..10),
  )
  time += [5,10,15].sample.hours
end
