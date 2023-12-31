# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Submission.destroy_all
Post.destroy_all
League.destroy_all
User.destroy_all

user1 = User.create!(
  email: 'test1@test.com',
  first_name: 'russell',
  last_name: 'testing',
  password: '123456',
  password_confirmation: '123456'
)
file = URI.open("https://res.cloudinary.com/dcu7y5wnn/image/upload/v1687964064/roy_x3uphs.webp")
user1.photo.attach(io: file, filename: "profile_img.jpg", content_type: "image/jpg")
user1.save

user2 = User.create!(
  email: 'test2@test.com',
  first_name: 'russell',
  last_name: 'testing',
  password: '123456',
  password_confirmation: '123456'
)
file = URI.open("https://res.cloudinary.com/dcu7y5wnn/image/upload/v1687685063/IMG_0004_cnpzut.jpg")
user2.photo.attach(io: file, filename: "profile_img.jpg", content_type: "image/jpg")
user2.save

league1 = League.create!(name: 'Russells League', description: 'testing', max_players: 8, no_rounds: 4)
league2 = League.create!(name: 'Again Russells League', description: 'testing', max_players: 8, no_rounds: 4)

league1.users << user1
league1.users << user2
league2.users << user2

league1.posts.create!(title: 'this round is mad', body: 'i cant think of anything', user: user1)
league1.posts.create!(title: 'this round is still mad', body: 'i cant think of anything', user: user2)

league2.posts.create!(title: 'this round is mad', body: 'i cant think of anything', user: user2)
