require 'faker'

User.destroy_all
Category.destroy_all
Food.destroy_all

# USER
puts "Create an user"
User.create!(email: "ludo.cooks@gmail.com", password: "azerty", username: "Ludo972")

# FOODS
# {[1.99...44.99].to_a.sample}
#{Faker::Food.description}
#{Faker::Food.dish}
# Food.create!(name: "test", description: "xxx")
puts "Create categories"
Category.create!(name: "Viandes")
Category.create!(name: "Fast-Foods")
Category.create!(name: "Patisseries / Viennoiseries")
Category.create!(name: "Desserts glacés")
Category.create!(name: "Desserts aux fruits")


puts "Create foods"

Food.create!(name: "Pizza Cochonaille", recipe: "#{Faker::Food.description}", category_id: "#{Category.where(name: 'Fast-Foods').ids}", user_id: User.first.id)
Food.create!(name: "CheeseBurger", recipe: "#{Faker::Food.description}", category_id: "Fast-Foods", user_id: User.first.id)
Food.create!(name: "Hot-Dog", recipe: "#{Faker::Food.description}", category_id: "Fast-Foods", user_id: User.first.id)
Food.create!(name: "Crêpe Suzette", recipe: "#{Faker::Food.description}", category_id: "Patisseries / Viennoiseries", user_id: User.first.id)
Food.create!(name: "Big Steak Fumé au charbon", recipe: "#{Faker::Food.description}", category_id: "Viandes", user_id: User.first.id)
Food.create!(name: "Crunchy aux fruits", recipe: "#{Faker::Food.description}", category_id: "Desserts aux fruits", user_id: User.first.id)
