# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "Cleaning Database"
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
open = open(url).read
json = JSON.parse(open)

puts ""
puts "Creating seeds"
json["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])
  puts "- created #{i.name}"
end

puts "Masterclass seeds"
Cocktail.create(name: "Mojito")
Cocktail.create(name: "Cuba Libre")
Cocktail.create(name: "Ruso Negro")


puts ""
puts "Finished seeding process!"
