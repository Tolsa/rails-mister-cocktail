require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "Deleting all..."
Ingredient.destroy_all
Cocktail.destroy_all

p "fetching and adding..."

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
buffer = open(url).read
drinks = JSON.parse(buffer)

drinks.first[1].each do |drink|
  stuff = drink["strIngredient1"]
  Ingredient.create(name: stuff)
end

Cocktail.create(name: "The dude")
Cocktail.create(name: "Margarita")
Cocktail.create(name: "Pastis par temps bleu")
Cocktail.create(name: "Very long island")

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
