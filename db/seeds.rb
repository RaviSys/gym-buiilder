# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
monthly_plan = Plan.create(name: 'Monthly', price: 1000, duration: '1 Month')
quarterly_plan = Plan.create(name: 'Quarterly', price: 2200, duration: '3 Months')
yearly_plan = Plan.create(name: 'Yearly', price: 7500, duration: '12 Months')
