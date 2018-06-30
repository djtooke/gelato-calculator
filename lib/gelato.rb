class Gelato

  attr_accessor :ingredients

  def initialize
    @ingredients = {}
  end

  def add_ingredient(ingredient, grams)
    check_ingredient_class(ingredient)
    check_weight(grams)
    @ingredients.store(ingredient, grams)
  end

  def remove_ingredient(ingredient)
    check_ingredient_class(ingredient)
    @ingredients.delete(ingredient) { raise "Ingredient has not been added to the gelato yet" }
  end

  def modify_grams(ingredient, grams)
    check_ingredient_added(ingredient)
    check_weight(grams)
    @ingredients[ingredient] = grams
  end

  private

  def check_ingredient_class(ingredient)
    raise 'Ingredient must be an ingredient object.' unless ingredient.class == Ingredient
  end

  def check_ingredient_added(ingredient)
    raise 'Ingredient has not been added to the gelato yet' if @ingredients[ingredient] == nil
  end

  def check_weight(grams)
    raise 'Weight in grams must be an integer.' unless grams.class == Integer
  end

end
