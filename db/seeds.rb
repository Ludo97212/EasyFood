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
Category.create!(name: "Poissons")
Category.create!(name: "Légumes")
Category.create!(name: "Veggies")
Category.create!(name: "Fast-Foods")
Category.create!(name: "Pizzas")
Category.create!(name: "Tartes")
Category.create!(name: "Pâtisseries & Viennoiseries")
Category.create!(name: "Laitages")
Category.create!(name: "Desserts")
Category.create!(name: "Smoothies")
Category.create!(name: "Cocktails")

RECIPE = "INGRÉDIENTS / 6 PERS : <br>
  500 g de farine <br>
  250 ml d’eau <br>
  20 g de levure boulangère fraîche <br>
  50 ml de crème <br>
  60 g de sucre <br>
  275 g de beurre <br>
  10 g de sel <br>
  PRÉPARATION : <br>
  1 h 30 min <br>
  1.<br>
  Dans un cul-de-poule, verser l’eau, la crème, la levure, le sucre et la farine et mélangez à l’aide d’une maryse rigide. Incorporez le sel et 25 g de beurre. Sur le plan de travail à peine fariné, formez un rectangle de pâte, enveloppez-le dans un film alimentaire et réservez-le au frais pendant 12 heures.
  <br>
  2.<br>
  Étalez-la au rouleau pour obtenir un rectangle de 8 mm d’épaisseur. Entre deux feuilles de papier cuisson, étaler 250 g de beurre au rouleau à pâtisserie pour obtenir un rectangle de 8 mm d’épaisseur.
  <br>
  3.<br>
  Déposez-le au milieu de la pâte. Repliez les bords de la pâte vers le centre pour qu’ils recouvrent le beurre sans se croiser. Appuyez d’abord légèrement au rouleau à pâtisserie puis étalez la pâte en un rectangle. Pliez le en 3 : le tiers supérieur vers le milieu, le tiers inférieur par-dessus, pour le recouvrir complètement. Filmez et réservez au frais pendant 40 minutes.
  <br>
  4.<br>
  Déposez la pâte sur le plan de travail en vous assurant que l’ouverture sur le dessus se trouve vers la droite. Abaissez-la à nouveau en carré. Pliez chaque pointe vers le centre puis le carré obtenu en deux, sur lui-même. Placez le carré de pâte au réfrigérateur, filmé, pendant 40 minutes.
  <br>
  5.<br>
  Abaissez-le au rouleau jusqu’à 3 mm d’épaisseur. Coupez des rectangles de pâte de 6 x 15 cm. Dans chacun d’entre eux, coupez trois bandes de 2 x 15 cm. Tressez-les ensemble, trois par trois. Enroulez les tresses sur elles-mêmes et déposez-les dans des moules à muffin. Laissez lever pendant 1h à 1h30, à température ambiante.
  <br>
  6.<br>
  Préchauffez le four à 200° C. À l’aide d’un pinceau, badigeonnez les cruffins avec un jaune d’œuf battu et 2 cl de lait. Enfournez pour 20 à 25 minutes. Laissez refroidir sur une grille.
  "

puts "Create foods"

pizza = Food.create!(name: "Pizza Lardons", recipe: RECIPE, category_id: Category.where(name: 'Pizzas').ids.first, user_id: User.first.id)
file = File.open('app/assets/images/Pizza 2.jpg')
pizza.photo.attach(io: file, filename: 'Pizza 2.jpg', content_type: 'image/jpg')

burger = Food.create!(name: "CheeseBurger", recipe: RECIPE, category_id: Category.where(name: 'Fast-Foods').ids.first, user_id: User.first.id)
file = File.open('app/assets/images/CheeseBurger.jpg')
burger.photo.attach(io: file, filename: 'CheeseBurger.jpg', content_type: 'image/jpg')

hot_dog = Food.create!(name: "Hot-Dog", recipe: RECIPE, category_id: Category.where(name: 'Fast-Foods').ids.first, user_id: User.first.id)
file = File.open('app/assets/images/Hot-dog.jpg')
hot_dog.photo.attach(io: file, filename: 'Hot-dog.jpg', content_type: 'image/jpg')

crepe = Food.create!(name: "Crêpe Suzette", recipe: RECIPE, category_id: Category.where(name: 'Pâtisseries & Viennoiseries').ids.first, user_id: User.first.id)
file = File.open('app/assets/images/Crepe.jpg')
crepe.photo.attach(io: file, filename: 'Crepe.jpg', content_type: 'image/jpg')

steak = Food.create!(name: "Big Steak Fumé au charbon", recipe: RECIPE, category_id: Category.where(name: 'Viandes').ids.first, user_id: User.first.id)
file = File.open('app/assets/images/Steak.jpg')
steak.photo.attach(io: file, filename: 'Steak.jpg', content_type: 'image/jpg')

crunchy = Food.create!(name: "Crunchy aux fruits", recipe: RECIPE, category_id: Category.where(name: 'Desserts').ids.first, user_id: User.first.id)
file = File.open('app/assets/images/Crunchy.jpg')
crunchy.photo.attach(io: file, filename: 'Crunchy.jpg', content_type: 'image/jpg')
