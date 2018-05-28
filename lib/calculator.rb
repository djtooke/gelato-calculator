class Calculator

  attr_reader :gelato, :scalar, :ingredient_percentages, :constituent_grams
  CONSTITUENTS = [:fat, :sugar, :lean_milk_solids, :other_solids, :water]

  def initialize(gelato)
    raise "#{gelato} is not a Gelato object." unless gelato.class == Gelato
    @gelato = gelato
    @scalar = scale.round(3)
    @ingredient_percentages = {} #(Re)created in calculate_ingredient_percentages
    @constituent_grams = {} #(Re)created in calculate_constituent_grams
    @constituent_percentages = {} #(Re)created in calculate_constituent_percentages
    @assessments = {} #(Re)created in check_percentages
    evaluate
  end

  def calculate(gelato = @gelato)
    initialize(gelato)
  end

private

  def evaluate
    calculate_ingredient_percentages
    calculate_constituent_grams
    calculate_constituent_percentages
    compare_percentages
  end

  def scale
    total = 0
    @gelato.ingredients.each_value { |weight| total += weight }
    100.0 / total
  end

  def calculate_ingredient_percentages
    @ingredient_percentages = {}
    @gelato.ingredients.each do |ingredient, weight|
      @ingredient_percentages.store(ingredient, (weight.*(@scalar).round(1)))
    end
  end

  def calculate_constituent_grams
    @constituent_grams = {}
    CONSTITUENTS.each do |constituent|
       total = 0
       @gelato.ingredients.each do |ingredient, grams|
         total += (ingredient.constituent_percentages[constituent].*(0.01)).*(grams)
       end
       @constituent_grams.store(constituent, total.round(1))
    end
  end

  def calculate_constituent_percentages
    @constituent_percentages = {}
  end

  def compare_percentages
    @assessments = {}
  end

end
