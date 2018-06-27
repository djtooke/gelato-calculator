class Gelato

  attr_reader :ingredients

  def initialize
    @ingredients = {}
  end

  def add_ingredient(ingredient, grams)
    check_ingredient(ingredient)
    check_weight(grams)
    @ingredients.store(ingredient, grams)
  end

  def remove_ingredient(ingredient)
    check_ingredient(ingredient)
    @ingredients.delete(ingredient) { raise "Ingredient has not been added to the gelato yet" }
  end

  private

  def check_ingredient(ingredient)
    raise 'Ingredient must be an ingredient object.' unless ingredient.class == Ingredient
  end

  def check_weight(grams)
    raise 'Weight in grams must be an integer.' unless grams.class == Integer
  end

end
