class Gelato

  attr_reader :ingredients

  def initialize
    @ingredients = {}
  end

  def add_ingredient(ingredient, grams)
    check_addition(ingredient, grams)
    @ingredients.store(ingredient, grams)
  end

  def remove_ingredient(ingredient)
    @ingredients.delete(ingredient)
  end

  private

  def check_addition(ingredient, grams)
    raise 'Weight in grams must be an integer.' unless grams.class == Integer
    raise 'Ingredient must be an ingredient object.' unless ingredient.class == Ingredient
  end

end
