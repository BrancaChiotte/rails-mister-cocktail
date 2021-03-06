# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

require 'open-uri'
require 'json'

# Go fetch the contents of a URL & store them as a String
response = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients = JSON.parse(response)

# Loop through each of the elements in the 'result' Array & print some of their attributes.
ingredients['drinks'].each do |ingredient|
  list_ing = ingredient["strIngredient1"]
  Ingredient.create(name: list_ing)
end
