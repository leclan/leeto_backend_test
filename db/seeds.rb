# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

org = Organisation.find_or_create_by!(name: 'Leeto')
Employee.create!(first_name: 'Stefan', last_name: 'A', email: 'stefan@a.com', password: '123456', hire_date: '2019-02-26', organisation: org)
Employee.create!(first_name: 'Jérémy', last_name: 'B', email: 'jeremy@b.com', password: '123456', hire_date: '2020-06-10', organisation: org)

Perk.create!(name: 'Netflix', start_date: '2020-01-01', end_date: '2020-12-31', seniority: 6, maximum_amount: 12.99, organisation: org)
Perk.create!(name: 'Amazon Prime', start_date: '2020-01-01', end_date: '2020-12-31', seniority: 0, maximum_amount: 49.99, organisation: org)
