class Gelato

  attr_reader :ingredients

  def initialize
    @ingredients = {}
  end

  def add_ingredient(ingredient, grams)
    @ingredients.store(ingredient, grams)
  end

end
