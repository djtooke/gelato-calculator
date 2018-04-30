class Gelato

  attr_reader :ingredients

  def initialize
    @ingredients = {}
  end

  def add_ingredient(ingredient, grams)
    check_ingredients(ingredient, grams)
    @ingredients.store(ingredient, grams)
  end

  private

  def check_ingredients(ingredient, grams)
    raise 'Weight in grams must be an integer.' unless grams.class == Integer
    raise 'Ingredient must be an ingredient object.' unless ingredient.class == Ingredient
  end

end
