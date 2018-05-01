require_relative './lib/gelato.rb'
require_relative './lib/ingredient.rb'
require_relative './lib/calculator.rb'
require 'pry'

gorgonzola_and_honey = Gelato.new

milk = Ingredient.new(1.6, 0, 9, 0, 89.4)
gorgonzola = Ingredient.new(28, 0, 20, 2, 50)
honey = Ingredient.new(0, 80, 0, 0, 20)
sucrose = Ingredient.new(0, 100, 0, 0, 0)
dextrose = Ingredient.new(0, 92, 0, 0, 8)
lmp = Ingredient.new(0, 0, 97, 0, 3)
stabilisers = Ingredient.new(0, 0, 0, 100, 0)
cream = Ingredient.new(35, 0, 6, 0, 59)

gorgonzola_and_honey.add_ingredient(milk, 1000)
gorgonzola_and_honey.add_ingredient(gorgonzola, 280)
gorgonzola_and_honey.add_ingredient(honey, 100)
gorgonzola_and_honey.add_ingredient(sucrose, 190)
gorgonzola_and_honey.add_ingredient(dextrose, 50)
gorgonzola_and_honey.add_ingredient(lmp, 40)
gorgonzola_and_honey.add_ingredient(stabilisers, 4)
gorgonzola_and_honey.add_ingredient(cream, 220)

binding.pry
