# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

org = Organisation.create(name: 'leeto')
User.create(email: 'admin@leeto.com', password: '123456', password_confirmation: '123456', organisation_id: org.id)
Perk.create(name: 'subsidy', amount: 100.00, start: Date.today, end: Date.today + 1.months, organisation_id: org.id)
