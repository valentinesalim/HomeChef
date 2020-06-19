# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "now creating ingredients and one weekly_ingredients_list"

# INGREDIENTS
onion = Ingredient.new(name: "Onion",
                        unit: "piece",
                        price_per_unit: 0.2
                          )
onion.photo.attach(io: URI.open(Rails.root.join('app', 'assets', 'images', 'ingredients', 'onion.jpg')), filename: 'onion.jpg')
onion.save!

potato = Ingredient.new(name: "Potato",
                        unit: "piece",
                        price_per_unit: 0.6
                          )
potato.photo.attach(io: URI.open(Rails.root.join('app', 'assets', 'images', 'ingredients', 'potato.jpg')), filename: 'potato.jpg')
potato.save!

zucchini = Ingredient.new(name: "Zucchini",
                          unit: "piece",
                          price_per_unit: 0.4
                            )
zucchini.photo.attach(io: URI.open(Rails.root.join('app', 'assets', 'images', 'ingredients', 'zucchini.jpg')), filename: 'zucchini.jpg')
zucchini.save!

eggplant = Ingredient.new(name: "Eggplant",
                          unit: "piece",
                          price_per_unit: 0.7
                            )
eggplant.photo.attach(io: URI.open(Rails.root.join('app', 'assets', 'images', 'ingredients', 'eggplant.jpg')), filename: 'eggplant.jpg')
eggplant.save!

ground_beef = Ingredient.new(name: "Ground Beef",
                              unit: "100g",
                              price_per_unit: 1
                                )
ground_beef.photo.attach(io: URI.open(Rails.root.join('app', 'assets', 'images', 'ingredients', 'ground_beef.jpg')), filename: 'ground_beef.jpg')
ground_beef.save!

tomato = Ingredient.new(name: "Tomato",
                        unit: "piece",
                        price_per_unit: 0.3
                          )
tomato.photo.attach(io: URI.open(Rails.root.join('app', 'assets', 'images', 'ingredients', 'tomato.jpg')), filename: 'tomato.jpg')
tomato.save!

milk = Ingredient.new(name: "Milk",
                      unit: "100ml",
                      price_per_unit: 0.8
                        )
milk.photo.attach(io: URI.open(Rails.root.join('app', 'assets', 'images', 'ingredients', 'milk.jpg')), filename: 'milk.jpg')
milk.save!

egg = Ingredient.new(name: "Egg",
                      unit: "piece",
                      price_per_unit: 0.4
                        )
egg.photo.attach(io: URI.open(Rails.root.join('app', 'assets', 'images', 'ingredients', 'egg.jpg')), filename: 'egg.jpg')
egg.save!

parmesan = Ingredient.new(name: "Parmesan",
                          unit: "50g",
                          price_per_unit: 0.7
                            )
parmesan.photo.attach(io: URI.open(Rails.root.join('app', 'assets', 'images', 'ingredients', 'parmesan.jpg')), filename: 'parmesan.jpg')
parmesan.save!

pasta = Ingredient.new(name: "Pasta",
                        unit: "100g",
                        price_per_unit: 0.8
                          )
pasta.photo.attach(io: URI.open(Rails.root.join('app', 'assets', 'images', 'ingredients', 'pasta.png')), filename: 'pasta.png')
pasta.save!

oregano = Ingredient.new(name: "Oregano",
                          unit: "20g",
                          price_per_unit: 0.3
                            )
oregano.photo.attach(io: URI.open(Rails.root.join('app', 'assets', 'images', 'ingredients', 'oregano.jpg')), filename: 'oregano.jpg')
oregano.save!

olive_oil = Ingredient.new(name: "Olive Oil",
                          unit: "50ml",
                          price_per_unit: 0.3
                            )
olive_oil.photo.attach(io: URI.open(Rails.root.join('app', 'assets', 'images', 'ingredients', 'olive_oil.jpg')), filename: 'olive_oil.jpg')
olive_oil.save!
puts "ingredients created"

# 1 WEEKLY INGREDIENT LIST WITH DATE TODAY
wil = WeeklyIngredientList.create!(date: Date.today.beginning_of_week,
                                    published: true,
                                    price_per_portion: 12.99,
                                    menu_name: "Mediterranean")
Ingredient.all.each do |ingredient|
  WeeklyIngredient.create(ingredient: ingredient,
                          weekly_ingredient_list: wil,
                          amount: rand(1..3)
                          )
end
puts "weekly ingredient list created"

# USER
test_user = User.new(email: "tester@lewagon.com", first_name: "Chef", last_name: "Tester", password: "123456", address: "123 Le Wagon Avenue, 410 Shenzhen, CHINA", biography: "Master chef with experience working in restaurants across the world, passionate about creating and sharing the best recipes from different countries.")
file = URI.open('https://images.unsplash.com/photo-1588442085302-4b4536373a03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80')
test_user.photo.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
test_user.save!
puts "created new test user"

puts "Seed completed (if user and recipes commented out)"


# BELOW: SEED CODE USING FAKER GEM TO CREATE RECORDS - ATTN: DATA (e.g. Recipe name and image) NOT NECCESSARILY MATCHING
# ------------
# -------------
# SEED INGREDIENTS WITH FAKER:
# 5.times do
#   i = Ingredient.new(name: Faker::Food.ingredient,
#                       unit: Faker::Food.metric_measurement,
#                       price_per_unit: rand(1..2)
#                       )

#   file = URI.open('url(......)')
#   i.photo.attach(io: file, filename: 'ingredient.png', content_type: 'image/png')
#   i.save!
# end
#puts "ingredients created"

# USER
# ------------
puts "-> now creating new users incl. their own recipes"
# ------------

5.times do
  u = User.new(email: Faker::Internet.email,
                    password: "123456",
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    biography: Faker::Restaurant.description,
                    address: Faker::Address.full_address
                  )
  file = URI.open('https://images.unsplash.com/photo-1588442085302-4b4536373a03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80')
  u.photo.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
  u.save!
  puts "created new user"

  categories = ["Meat", "Veggie", "Pasta", "Salad", "Soup", "Seafood", "Snack", "Vegetables", "Sweet/Dessert", "Bread and Pastries"]
  levels = ["Easy", "Medium", "Difficult", "Expert"]

  #RECIPE CONNECTED TO USER ABOVE
  2.times do
    r = Recipe.new(name: Faker::Food.dish,
                    # category: Recipe::CATEGORIES.sample,
                    category_list: categories.sample,
                    description: Faker::Food.description,
                    serving_time: rand(10..90),
                    # level: Recipe::LEVELS.sample,
                    level_list: levels.sample,
                    published: true,
                    weekly_ingredient_list_id: wil.id,
                    user_id: u.id,
                    video: "https://www.youtube.com/embed/Z_GcsR7Q99s"
                  )
    file = URI.open('https://source.unsplash.com/featured/?recipe')
    r.photo.attach(io: file, filename: 'recipe.png', content_type: 'image/png')
    r.save!
  end
  puts "created recipe(s) connected to last created user"
end

puts "Finished creating all users that each have recipes --> SEED COMPLETED"
