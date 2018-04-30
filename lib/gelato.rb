class Gelato

  attr_reader :ingredients

  def initialize
    @ingredients = {}
  end

  def add_ingredient(ingredient, grams)
    raise 'Weight in grams must be an integer.' unless grams.class == Integer
    raise 'Ingredient must be an ingredient object.' unless ingredient.class == Ingredient
    @ingredients.store(ingredient, grams)
  end

end
