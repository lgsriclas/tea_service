# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer = Customer.create(first_name: "Charlie", last_name: "Brown", email: "charlie@peanuts.com", address: "123 Main Street")
tea_1 = Tea.create(title: "Jasmine Tea", description: "Green", temperature: 120, brew_time: 7)
tea_2 = Tea.create(title: "Chai Tea", description: "Black", temperature: 110, brew_time: 5)
subscription_1 = Subscription.create(title: "My Subscription", price: 10, status: "Active", frequency: "Monthly", customer_id: customer.id, tea_id: tea_1.id)
subscription_2 = Subscription.create(title: "My Tea", price: 15, status: "Active", frequency: "Monthly", customer_id: customer.id, tea_id: tea_2.id)