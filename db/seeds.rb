require 'open-uri'
require 'json'

p "Deleting all..."
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

p "fetching and adding..."

cocktail = Cocktail.new(name: "Old Fashioned")
url =  "http://www.seriouseats.com/images/2014/11/20141104-cocktail-party-old-fashioneds-holiday-vicky-wasik-3.jpg"
cocktail.remote_photo_url = url
cocktail.save

cocktail = Cocktail.new(name: "Daiquiri")
url =  "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-daiquiri.jpg"
cocktail.remote_photo_url = url
cocktail.save

cocktail = Cocktail.new(name: "Margarita")
url =  "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-margarita.jpg"
cocktail.remote_photo_url = url
cocktail.save

cocktail = Cocktail.new(name: "Mojito")
url =  "http://www.seriouseats.com/recipes/assets_c/2011/10/20111019mojitoprim2-thumb-625xauto-194084.jpg"
cocktail.remote_photo_url = url
cocktail.save

cocktail = Cocktail.new(name: "Cuba Libre")
url =  "http://www.seriouseats.com/recipes/assets_c/2015/06/20150622-3-ingredient-cocktail-cuba-libre-vicky-wasik-thumb-1500xauto-424377.jpg"
cocktail.remote_photo_url = url
cocktail.save

cocktail = Cocktail.new(name: "Moscow Mule")
url =  "http://www.seriouseats.com/images/2017/06/20170607-summer-vodka-recipes-roundup-15.jpg"
cocktail.remote_photo_url = url
cocktail.save


url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
buffer = open(url).read
drinks = JSON.parse(buffer)

drinks.first[1].each do |drink|
  stuff = drink["strIngredient1"]
  Ingredient.create(name: stuff)
end



