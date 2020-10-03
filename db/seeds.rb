# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |n|
  User.create(
    email: "test#{n + 1}@test.com",
    name: "テスト太郎#{n + 1}",
    password: "test#{n + 1}",
    password_confirmation: "test#{n + 1}",
    teacher: false
  )
end

5.times do |n|
  User.create(
    email: "test#{n + 1}@test.com",
    name: "テスト太郎先生#{n + 1}",
    password: "test#{n + 1}",
    password_confirmation: "test#{n + 1}",
    teacher: true
  )
end

30.times do |n|
  Word.create(
    content: "word#{n + 1}",
    meaning: "meaning#{n + 1}",
    example: "example#{n + 1}",
    eiken: true,
    toeic: false
    )
end

30.times do |n|
  Word.create(
    content: "word#{n + 1}",
    meaning: "meaning#{n + 1}",
    example: "example#{n + 1}",
    eiken: false,
    toeic: true
    )
end