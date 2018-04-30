class Gelato

  attr_reader :ingredients

  def initialize
    @ingredients = {}
  end

  def add_ingredient(ingredient, grams)
    raise 'Weight in grams must be an integer.' unless grams.instance_of?(Integer)
    @ingredients.store(ingredient, grams)
  end

end
