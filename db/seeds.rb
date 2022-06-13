require 'faker'

User.destroy_all
Food.destroy_all

# USER
puts "Create an user"
User.create!(email: "ludo.cooks@gmail.com", password: "azerty", username: "Ludo972")

# FOODS
# {[1.99...44.99].to_a.sample}
#{Faker::Food.description}
#{Faker::Food.dish}
# Food.create!(name: "test", description: "xxx")
puts "Create foods"
Food.create!(name: "#{Faker::Food.dish}", price: 1.99, description: "#{Faker::Food.description}", user_id: User.first.id)
Food.create!(name: "#{Faker::Food.dish}", price: 4.99, description: "#{Faker::Food.description}", user_id: User.first.id)
Food.create!(name: "#{Faker::Food.dish}", price: 6.99, description: "#{Faker::Food.description}", user_id: User.first.id)
Food.create!(name: "#{Faker::Food.dish}", price: 9.99, description: "#{Faker::Food.description}", user_id: User.first.id)
Food.create!(name: "#{Faker::Food.dish}", price: 4.99, description: "#{Faker::Food.description}", user_id: User.first.id)
Food.create!(name: "#{Faker::Food.dish}", price: 6.50, description: "#{Faker::Food.description}", user_id: User.first.id)
Food.create!(name: "#{Faker::Food.dish}", price: 9.99, description: "#{Faker::Food.description}", user_id: User.first.id)
Food.create!(name: "#{Faker::Food.dish}", price: 9.99, description: "#{Faker::Food.description}", user_id: User.first.id)
Food.create!(name: "#{Faker::Food.dish}", price: 7.50, description: "#{Faker::Food.description}", user_id: User.first.id)
