require 'faker'

# USER
# puts "Create an user"
# User.create(email: "toto@gmail.com", password: "azerty", username: "toto972")

# FOODS
#{[1.99...44.99].to_a.sample}
# puts "Create foods"
# Food.create!(name: "", price: 1.99, description: "")
# Food.create!(name: "", price: 4.99, description: "")
# Food.create!(name: "", price: 6.99, description: "")
# Food.create!(name: "", price: 9.99, description: "")
# Food.create!(name: "", price: 4.99, description: "")
# Food.create!(name: "", price: 6.50, description: "")
# Food.create!(name: "", price: 9.99, description: "")
# Food.create!(name: "", price: 9.99, description: "")
# Food.create!(name: "", price: 7.50, description: "")

puts "#{Faker::Food.description}"
Faker::Food.description
