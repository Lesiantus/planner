# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
  { first_name: "Alexander", last_name: "Kazantsev", email: "test@test.com", password: "123123", type: "Admin", confirmed_at: Time.now },
  { first_name: "Dmitriy", last_name: "Ivanovitch", email: "test1@test.com", password: "123123",  confirmed_at: Time.now },
  { first_name: "Alexey", last_name: "Petrovitch", email: "test2@test.com", password: "123123",  confirmed_at: Time.now } ])

vacations = Vacation.create!([
  { start_date: Date.today,
    end_date: Date.today + 7.days,
    user_id: User.second.id},
  { start_date: Date.today,
    end_date: Date.today + 8.days,
    user_id: User.second.id},
  { start_date: Date.today,
    end_date: Date.today + 9.days,
    user_id: User.third.id},
  { start_date: Date.today,
    end_date: Date.today + 10.days,
    user_id: User.third.id}])
