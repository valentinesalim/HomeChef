# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# PENDING TASKS
# cloudnary / photo setup
# video setup and attachment implementation below


puts "now creating ingredients and one weekly_ingredients_list"

# INGREDIENTS
20.times do
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
wil = WeeklyIngredientList.new!(date: Date.today)
id = 1
20.times do
  wil.ingredient = Ingredient.find(id)
  id += 1
end
puts "weekly ingredient list created ->"

puts "-> now creating new users incl. their own recipes"
# USER
test_user = User.create(email: "tester@gmail.com", username: "Tester", first_name: "Test", last_name: "User", password: "123456", address: "123 Le Wagon Avenue, 410 Shenzhen, CHINA", profile_photo: Faker::Avatar.image)

5.times do
  u = User.create!(email: Faker::Internet.email,
                    username: Faker::Internet.username,
                    password: "123456",
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    profile_photo: Faker::Avatar.image,
                    address: Faker::Address.full_address
                  )
  puts "created new user"

  #RECIPE CONNECTED TO USER ABOVE
  2.times do
    r = Recipe.new(name: Faker::Food.dish,
                    category: Recipe::CATEGORIES.sample,
                    description: Faker::Food.description,
                    serving_time: rand(10..90),
                    level: Recipe::LEVELS.sample,
                    published: true,
                    total_price: rand(7..9),
                    weekly_ingredients_list_id: wil.id,
                    user_id: u.id

                  )
    file = URI.open('https://source.unsplash.com/featured/?recipe')
    r.photo.attach(io: file, filename: 'recipe.png', content_type: 'image/png')
    # attach a video
    r.save!
    puts "created recipe(s) connected to last created user"
  end
end
