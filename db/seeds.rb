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

5.times do |s|
  User.create(
    email: "test#{s + 1}@test.com",
    name: "テスト太郎先生#{s + 1}",
    password: "test#{s + 1}",
    password_confirmation: "test#{s + 1}",
    teacher: true
  )
end

30.times do |e|
  Word.create(
    content: "word#{e + 1}",
    meaning: "meaning#{e + 1}",
    example: "example#{e + 1}",
    eiken: true,
    toeic: false
    )
end

30.times do |t|
  Word.create(
    content: "word#{t + 1}",
    meaning: "meaning#{t + 1}",
    example: "example#{t + 1}",
    eiken: false,
    toeic: true
    )
end