# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "now creating ingredients and one weekly_ingredients_list"

# INGREDIENTS
5.times do
  i = Ingredient.new(name: Faker::Food.ingredient,
                      unit: Faker::Food.metric_measurement,
                      price_per_unit: rand(1..2)
                      )


  file = URI.open('https://source.unsplash.com/featured/?ingredient')
  i.photo.attach(io: file, filename: 'ingredient.png', content_type: 'image/png')
  i.save!
end
puts "ingredients created"

# 1 WEEKLY INGREDIENT LIST WITH DATE TODAY
wil = WeeklyIngredientList.create!(date: Date.today.beginning_of_week,
                                    published: true,
                                    price_per_portion: 35,
                                    menu_name: "Extravaganza")
Ingredient.all.each do |ingredient|
  WeeklyIngredient.create(ingredient: ingredient,
                          weekly_ingredient_list: wil,
                          amount: 2)
end
puts "weekly ingredient list created ->"

puts "-> now creating new users incl. their own recipes"
# USER
test_user = User.new(email: "tester@lewagon.com", first_name: "Chef", last_name: "User", password: "123456", address: "123 Le Wagon Avenue, 410 Shenzhen, CHINA")
file = URI.open('https://images.unsplash.com/photo-1588442085302-4b4536373a03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80')
test_user.photo.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
test_user.save!
puts "created new test user"

5.times do
  u = User.new(email: Faker::Internet.email,
                    password: "123456",
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    address: Faker::Address.full_address
                  )
  file = URI.open('https://images.unsplash.com/photo-1588442085302-4b4536373a03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80')
  u.photo.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
  u.save!
  puts "created new user"

  #RECIPE CONNECTED TO USER ABOVE
  2.times do
    r = Recipe.new(name: Faker::Food.dish,
                    category: Recipe::CATEGORIES.sample,
                    description: Faker::Food.description,
                    serving_time: rand(10..90),
                    level: Recipe::LEVELS.sample,
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

puts "Finished creating all ingredients, one weekly_ingredient_list, and all users that each have recipes"
